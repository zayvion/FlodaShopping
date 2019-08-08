package dao;


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
}
