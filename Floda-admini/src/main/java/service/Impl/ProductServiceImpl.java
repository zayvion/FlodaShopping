package service.Impl;

import com.google.gson.Gson;
import dao.ImgDao;
import dao.JedisClient;
import dao.ProductDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import pojo.Img;
import pojo.PageHelper;
import pojo.Product;
import pojo.ProductShow;
import service.ProductService;
import utils.PageUtils;
import utils.ResponseResult;

import javax.annotation.Resource;
import java.lang.reflect.Type;
import java.util.ArrayList;
import java.util.List;

/**
 * @Auther: zayvion
 * @Date: 2019-08-05 14:51
 * @Description:商品service接口的实现类
 */
@Service
public class ProductServiceImpl implements ProductService {
    private static String KEY_GETPROBYCATE = "getProByCate";
    @Autowired
    private ProductDao productDao;
    @Autowired
    private ImgDao imgDao;
    @Autowired
    private PageUtils pageUtils;
    @Autowired
    private JedisClient jedisClient;

    @Transactional
    @Override
    public String addProduct(Product product, Img img) {
        try {
            int imgId = imgDao.addImg(img);
            product.setPro_imgId(imgId);
            product.setPro_status(0);
            System.out.println("img的id："+imgId);
            productDao.addProduct(product);
            return ResponseResult.ok("商品添加成功");

        } catch (Exception e) {
            e.printStackTrace();
        }
        return ResponseResult.build(500,"商品添加失败");
    }

    @Override
    public String getProducts(int startPage, int item) {
        List products = productDao.getProducts();
        PageHelper data = pageUtils.getData(startPage, item, products);
        return new Gson().toJson(data);
    }

    @Override
    public String showProducts(int startPage, int item) {
        List<Product> products = productDao.getAllProducts();
        List<ProductShow> infos = new ArrayList<>();

        for (Product p:products) {
            ProductShow ps = new ProductShow();
            if (p.getPro_imgId() != null){
                String imgUrl = imgDao.getImgUrl(p.getPro_imgId());
                ps.setPro_imgUrl(imgUrl);
            }
            ps.setPro_cateId(p.getPro_cateId());

            ps.setPro_name(p.getPro_name());
            ps.setPro_price(p.getPro_price());
            switch (p.getPro_status()){
                case 0: ps.setPro_status("上架");
                break;
                case 1:ps.setPro_status("<p style='color: red'>下架</p>");
                break;
                default:
                    break;
            }
            ps.setPro_numbers(p.getPro_numbers());
            ps.setPro_id(p.getPro_id());
            infos.add(ps);
        }
        PageHelper data = pageUtils.getData(startPage, item, infos);

        return new Gson().toJson(data);
    }

    @Override
    public String showvalidProducts(int startPage, int item) {
        List<Product> products = productDao.getProducts();
        List<ProductShow> infos = new ArrayList<>();

        for (Product p:products) {
            ProductShow ps = new ProductShow();
            if (p.getPro_imgId() != null){
                String imgUrl = imgDao.getImgUrl(p.getPro_imgId());
                ps.setPro_imgUrl(imgUrl);
            }
            ps.setPro_cateId(p.getPro_cateId());

            ps.setPro_name(p.getPro_name());
            ps.setPro_price(p.getPro_price());
            switch (p.getPro_status()){
                case 0: ps.setPro_status("上架");
                    break;
                case 1:ps.setPro_status("下架");
                    break;
                default:
                    break;
            }
            ps.setPro_numbers(p.getPro_numbers());
            ps.setPro_id(p.getPro_id());
            infos.add(ps);
        }
        PageHelper data = pageUtils.getData(startPage, item, infos);

        return new Gson().toJson(data);
    }

    @Override
    public String getProduct(int id) {
        Product product = productDao.getProduct(id);
        return new Gson().toJson(product);
    }

    @Transactional
    @Override
    public String updateProduct(Product product) {
        productDao.updateProduct(product);
        return ResponseResult.ok();
    }

    @Override
    public int proCount(int cate_id) {
        List<Product> products = productDao.getProByCate(cate_id);
        return products.size();
    }

    @Override
    public PageHelper getProByCate(int cate_id,int startPage) {
          try {
            String json = jedisClient.hget(KEY_GETPROBYCATE, "cate_id:"+cate_id+",startPage="+startPage);
            if (json != null){
                List<Product> products = new Gson().fromJson(json, (Type) Product.class);
                PageHelper data = pageUtils.getData(startPage, 9,products );
                return data;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        List<Product> products = productDao.getProByCate(cate_id);
        jedisClient.hset(KEY_GETPROBYCATE,"cate_id:"+cate_id+",startPage="+startPage,new Gson().toJson(products));
        PageHelper data = pageUtils.getData(startPage, 9, products);
        return data;
    }

    @Override
    public PageHelper getProByKeyword(String keyword, int startPage) {
        List<Product> searchResult = productDao.getSearchResult(keyword);
        PageHelper data = pageUtils.getData(startPage, 9, searchResult);
        return data;
    }

}
