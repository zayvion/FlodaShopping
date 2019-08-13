package service;

import pojo.Img;
import pojo.PageHelper;
import pojo.Product;

import java.util.List;

/**
 * @Auther: zayvion
 * @Date: 2019-08-05 14:50
 * @Description:商品service接口
 */
public interface ProductService {
    /**
     * 添加商品
     * @param product
     * @param img
     * @return
     */
    String addProduct(Product product, Img img);

    /**
     * 展示所有商品
     * @param startPage
     * @param item
     * @return
     */
    String getProducts(int startPage, int item);

    /**
     * 商品展示用于后台商品管理,包括下架商品
     * @param startPage
     * @param item
     * @return
     */
    String showProducts(int startPage, int item);

    /**
     * 商品展示用于后台商品管理,不包括下架商品
     * @param startPage
     * @param item
     * @return
     */
    String showvalidProducts(int startPage, int item);

    /**
     * 获取一个商品的信息
     * @param id
     * @return json
     */
    String getProduct(int id );

    /**
     * 更新商品
     *
     * @param product
     * @return json
     */
    String updateProduct(Product product);


    /**
     * 根据分类id查询当前分类下存在的商品数目
     */
    int proCount(int cate_id);

    /**
     * 根据分类id查询该分类下的所有商品:默认查询第一个分类的商品
     * @return
     */
    PageHelper getProByCate(int cate_id,int startPage);

    /**
     * 根据关键字查商品
     * @param keyword 关键字
     * @param startPage 开始页数
     * @return
     */
    PageHelper getProByKeyword(String keyword ,int startPage);


    /**
     * 热门商品
     * @return
     */
   String getHotProducts();

}
