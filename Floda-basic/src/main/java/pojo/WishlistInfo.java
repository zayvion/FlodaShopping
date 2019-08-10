package pojo;

/**
 * @Auther: zwf97
 * @Date: 2019/8/10 10:17
 * @Description:
 */
public class WishlistInfo {
    private int wishlist_id;
    private int user_id;
    private int pro_id;
    private String url;
    private String pro_name;
    private double pro_price;


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

    public int getPro_id() {
        return pro_id;
    }

    public void setPro_id(int pro_id) {
        this.pro_id = pro_id;
    }

    public String getUrl() {
        return url;
    }

    public void setUrl(String url) {
        this.url = url;
    }

    public String getPro_name() {
        return pro_name;
    }

    public void setPro_name(String pro_name) {
        this.pro_name = pro_name;
    }

    public double getPro_price() {
        return pro_price;
    }

    public void setPro_price(double pro_price) {
        this.pro_price = pro_price;
    }

    @Override
    public String toString() {
        return "WishlistInfo{" +
                "wishlist_id=" + wishlist_id +
                ", user_id=" + user_id +
                ", url='" + url + '\'' +
                ", pro_name='" + pro_name + '\'' +
                ", pro_price=" + pro_price +
                '}';
    }
}
