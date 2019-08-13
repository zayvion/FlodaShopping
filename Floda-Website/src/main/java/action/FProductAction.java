package action;

import com.google.gson.Gson;
import com.google.gson.JsonSyntaxException;
import com.google.gson.reflect.TypeToken;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.util.ValueStack;
import dao.ImgDao;
import dao.JedisClient;
import dao.ProductDao;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import pojo.*;
import service.CategroyService;
import service.EcaluateService;
import service.ProductService;

import javax.annotation.Resource;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

/**
 * @Auther: zayvion
 * @Date: 2019-08-07 14:07
 * @Description:前台商品相关action
 */
@Controller
@Scope("prototype")
public class FProductAction extends BaseAction {

    @Autowired
    private ProductService productService;
    @Resource
    private CategroyService categroyService;
    @Autowired
    private ProductDao productDao;
    @Autowired
    private ImgDao imgDao;
    @Autowired
    private EcaluateService ecaluateService;
    @Autowired
    private JedisClient jedisClient;
    private static String KEY_GETNEWPRODUCTS = "getNewProducts";
    private static String KEY_PRODUCTDETAIL = "productDetail";
    private int id;
    private int startPage;
    private int item;
    private int cate_id;
    private String keyword;//搜索关键字

    public String productDetail() {
        try {
            String json = jedisClient.hget(KEY_PRODUCTDETAIL, "pro_id=" + id);
            if (json != null){
                Product redisProduct = new Gson().fromJson(json, Product.class);
                ValueStack valueStack = ActionContext.getContext().getValueStack();
                valueStack.set("pro_name", redisProduct.getPro_name());
                valueStack.set("pro_price", redisProduct.getPro_price());
                valueStack.set("pro_desc", redisProduct.getPro_desc());
                valueStack.set("pro_id", redisProduct.getPro_id());
                valueStack.set("proImgUrl", imgDao.getImgUrl(redisProduct.getPro_imgId()));
                 /*
                     相关产品
                */
                List<Product> proByCate = productDao.getProByCate(redisProduct.getPro_cateId());
                //前台只需要6个商品
                List<ProductShow> reusultList = new ArrayList<ProductShow>();
                for (int i = 0; i < 6; i++) {
                    if (i <= proByCate.size() - 1) {
                        ProductShow productShow = new ProductShow();
                        productShow.setPro_id(proByCate.get(i).getPro_id());
                        productShow.setPro_name(proByCate.get(i).getPro_name());
                        productShow.setPro_imgUrl(imgDao.getImgUrl(proByCate.get(i).getPro_imgId()));
                        productShow.setPro_price(proByCate.get(i).getPro_price());
                        reusultList.add(productShow);
                    } else {
                        continue;
                    }
                }
                List<Ecaluate> productEcaluate = ecaluateService.getProductEcaluate(redisProduct.getPro_id());
                request.setAttribute("productEcaluate", productEcaluate);
                request.setAttribute("relatedPro", reusultList);
                return DETAIL;
            }
        } catch (JsonSyntaxException e) {
            e.printStackTrace();
        }
        Product product = productDao.getProduct(id);
        jedisClient.hset(KEY_PRODUCTDETAIL,"pro_id="+id,new Gson().toJson(product));
        if (id == 0) {
            return INDEX;

        }
        ValueStack valueStack = ActionContext.getContext().getValueStack();
        valueStack.set("pro_name", product.getPro_name());
        valueStack.set("pro_price", product.getPro_price());
        valueStack.set("pro_desc", product.getPro_desc());
        valueStack.set("pro_id", product.getPro_id());
        valueStack.set("proImgUrl", imgDao.getImgUrl(product.getPro_imgId()));
        List<Ecaluate> productEcaluate = ecaluateService.getProductEcaluate(product.getPro_id());
        request.setAttribute("productEcaluate", productEcaluate);
        /*
            相关产品
         */
        List<Product> proByCate = productDao.getProByCate(product.getPro_cateId());
        //前台只需要6个商品
        List<ProductShow> reusultList = new ArrayList<ProductShow>();
        for (int i = 0; i < 6; i++) {
            if (i <= proByCate.size() - 1) {
                ProductShow productShow = new ProductShow();
                productShow.setPro_id(proByCate.get(i).getPro_id());
                productShow.setPro_name(proByCate.get(i).getPro_name());
                productShow.setPro_imgUrl(imgDao.getImgUrl(proByCate.get(i).getPro_imgId()));
                productShow.setPro_price(proByCate.get(i).getPro_price());
                reusultList.add(productShow);
            } else {
                continue;
            }
        }
        request.setAttribute("ecaluateNum", productEcaluate.size());
        System.out.println("size++++"+productEcaluate.size());
        request.setAttribute("relatedPro", reusultList);
        return DETAIL;
    }

    /**
     * 热门商品
     * @return
     */
    public String getHotProducts() throws IOException {
        String hotProducts = productService.getHotProducts();
        response.setContentType("application/json;charset=utf-8");
        response.getWriter().write(hotProducts);
        return NONE;
    }

    /**
     * 更多商品：分类展示包括分类名称、该分类下的商品数
     *
     * @return
     */
    public String moreProduct() {
        //默认按照第一个商品分类查询商品
        String categroies = categroyService.getCategroies();
        List<Categroy> list = new Gson().fromJson(categroies, new TypeToken<List<Categroy>>() {
        }.getType());
        for (Categroy c : list
        ) {
            int count = productService.proCount(c.getCate_id());
            c.setCate_pronums(count);
        }
        //根据分类id查询该分类下的所有商品:默认查询第一个分类的商品
        if (cate_id == 0) {
            cate_id = list.get(0).getCate_id();
        }
        if (startPage == 0) {
            startPage = 1;
        }
        PageHelper date = productService.getProByCate(cate_id, startPage);
        request.setAttribute("cate_list", list);
        request.setAttribute("pagelist", date);
        return SHOP;
    }

    /**
     * 新品上市
     *
     * @return
     * @throws IOException
     */
    public String getNewProducts() throws IOException {
        try {
            String redisResult = jedisClient.get(KEY_GETNEWPRODUCTS);
            if (redisResult != null) {
                response.setContentType("application/json;charset=utf-8");
                response.getWriter().write(redisResult);
                return NONE;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        String result = productService.showvalidProducts(startPage, item);
        jedisClient.set(KEY_GETNEWPRODUCTS, result);
        response.setContentType("application/json;charset=utf-8");
        response.getWriter().write(result);
        return NONE;
    }

    public String searchProduct() {
        //默认按照第一个商品分类查询商品
        String categroies = categroyService.getCategroies();
        List<Categroy> list = new Gson().fromJson(categroies, new TypeToken<List<Categroy>>() {
        }.getType());
        for (Categroy c : list
        ) {
            int count = productService.proCount(c.getCate_id());
            c.setCate_pronums(count);
        }
        System.out.println("proByKeyword：" + keyword);
        if (startPage <= 0) {
            startPage = 1;
        }
        PageHelper proByKeyword = productService.getProByKeyword(keyword, startPage);
        if (proByKeyword.getData().size() == 0) {
            request.setAttribute("msg", "无商品结果");
        }
        request.setAttribute("cate_list", list);
        request.setAttribute("keyword", keyword);
        request.setAttribute("searchResult", proByKeyword);
        return SREACH;
    }


    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getStartPage() {
        return startPage;
    }

    public void setStartPage(int startPage) {
        this.startPage = startPage;
    }

    public int getItem() {
        return item;
    }

    public void setItem(int item) {
        this.item = item;
    }

    public int getCate_id() {
        return cate_id;
    }

    public void setCate_id(int cate_id) {
        this.cate_id = cate_id;
    }

    public String getKeyword() {
        return keyword;
    }

    public void setKeyword(String keyword) {
        this.keyword = keyword;
    }
}
