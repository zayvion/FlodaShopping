package dao;


import java.util.List;

/**
 * @Auther: zwf
 * @Date: 2019-08-10 10:20
 * @Description:收藏Dao接口
 */
public interface WishlistDao {
    /**
     * 添加收藏
     * @param pro_id        商品ID
     * @param user_id       用户ID
     */
    void addWishlist(int pro_id, int user_id);

    /**
     * 获取收藏所有商品信息
     * @param user_id
     * @return json
     */
    List getWishlistInfos(int user_id);

    /**
     * 删除购物车商品
     * @param wishlist_id 收藏ID
     */
    void delWishlist(int wishlist_id);

}
