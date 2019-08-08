package action;

import com.google.gson.Gson;
import com.google.gson.reflect.TypeToken;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.util.ValueStack;
import dao.ImgDao;
import dao.ProductDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import pojo.Categroy;
import pojo.PageHelper;
import pojo.Product;
import service.CategroyService;
import service.Impl.ProductServiceImpl;
import service.ProductService;

import javax.annotation.Resource;
import java.io.IOException;
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
    private int id;
    private int startPage;
    private int item;
    private int cate_id;

    public String productDetail(){
        Product product = productDao.getProduct(id);
        ValueStack valueStack = ActionContext.getContext().getValueStack();
        valueStack.set("pro_name",product.getPro_name());
        valueStack.set("pro_price",product.getPro_price());
        valueStack.set("pro_desc",product.getPro_desc());
        valueStack.set("pro_id",product.getPro_id());
        valueStack.set("proImgUrl",imgDao.getImgUrl(product.getPro_imgId()));
        return DETAIL;
    }

    /**
     * 更多商品：分类展示包括分类名称、该分类下的商品数
     * @return
     */
    public String moreProduct(){
        //默认按照第一个商品分类查询商品
        String categroies = categroyService.getCategroies();
        List<Categroy> list = new Gson().fromJson(categroies, new TypeToken<List<Categroy>>() {}.getType());
        for (Categroy c:list
             ) {
            int count = productService.proCount(c.getCate_id());
            c.setCate_pronums(count);
        }
        //根据分类id查询该分类下的所有商品:默认查询第一个分类的商品
        if (cate_id == 0){
            cate_id = list.get(0).getCate_id();
        }
        if (startPage == 0){
            startPage = 1;
        }
        PageHelper date = productService.getProByCate(cate_id,startPage);
        request.setAttribute("cate_list",list);
        request.setAttribute("pagelist",date);
        return SHOP;
    }

    public String getNewProducts() throws IOException {
        String result = productService.showvalidProducts(startPage , item);
        response.setContentType("application/json;charset=utf-8");
        response.getWriter().write(result);
        return NONE;
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
}
