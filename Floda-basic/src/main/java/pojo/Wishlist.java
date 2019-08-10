package pojo;

/**
 * @Auther: zwf97
 * @Date: 2019/8/10 10:17
 * @Description:
 */
public class Wishlist {
    private int wishlist_id;
    private int user_id;
    private int product_id;

    public int getWishlist_id() {
        return wishlist_id;
    }

    public void setWishlist_id(int wishlist_id) {
        this.wishlist_id = wishlist_id;
    }

    public int getUser_id() {
        return user_id;
    }

    public void setUser_id(int user_id) {
        this.user_id = user_id;
    }

    public int getProduct_id() {
        return product_id;
    }

    public void setProduct_id(int product_id) {
        this.product_id = product_id;
    }

    @Override
    public String toString() {
        return "Wishlist{" +
                "wishlist_id=" + wishlist_id +
                ", user_id=" + user_id +
                ", product_id=" + product_id +
                '}';
    }
}
