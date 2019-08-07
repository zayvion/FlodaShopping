package service;

import pojo.Img;
import pojo.Product;

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

}
