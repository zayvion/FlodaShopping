package service;

/**
 * @Auther: zwf
 * @Date: 2019/8/10 10:28
 * @Description: 收藏Service接口
 */
public interface WishlistService {
    /**
     * 添加购物车
     * @param pro_id        商品ID
     * @param user_id       用户ID
     * @return json
     */
    String addWishlist(int pro_id, int user_id);

    /**
     * 获取购物车所有商品信息
     * @param user_id
     * @return json
     */
    String getWishlistInfos(int user_id);

    /**
     * 删除购物车商品
     * @param wishlist_id
     * @return json
     */
    String delWishlist(int wishlist_id);

}
