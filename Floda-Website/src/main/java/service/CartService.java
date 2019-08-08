package service;

/**
 * @Auther: zwf
 * @Date: 2019/8/8 9:45
 * @Description: 购物车Service接口
 */
public interface CartService {
    /**
     * 添加购物车
     * @param pro_id        商品ID
     * @param user_id       用户ID
     * @param pro_number    商品数量
     * @return json
     */
    String addCart(int pro_id, int user_id, int pro_number);
}
