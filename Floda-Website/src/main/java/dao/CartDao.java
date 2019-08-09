package dao;


import pojo.CartInfo;

import java.util.List;

/**
 * @Auther: zwf
 * @Date: 2019-08-08 9:22
 * @Description:购物车Dao接口
 */
public interface CartDao {
    /**
     * 添加购物车
     * @param pro_id        商品ID
     * @param user_id       用户ID
     * @param pro_number    商品数量
     */
    void addCart(int pro_id,int user_id, int pro_number);

    /**
     * 获取购物车所有商品信息
     * @param user_id
     * @return json
     */
    List getCartInfos(int user_id);

    /**
     * 删除购物车商品
     * @param cart_id 购物车ID
     */
    void delCart(int cart_id);

}
