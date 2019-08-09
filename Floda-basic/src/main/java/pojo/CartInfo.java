package pojo;

/**
 * @Auther: zwf97
 * @Date: 2019/8/8 16:27
 * @Description:
 */
public class CartInfo {
    private int cart_id;
    private int pro_id;
    private String url;
    private String pro_name;
    private double pro_price;
    private int pro_number;
    private double cart_price;

    public int getCart_id() {
        return cart_id;
    }

    public void setCart_id(int cart_id) {
        this.cart_id = cart_id;
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

    public int getPro_number() {
        return pro_number;
    }

    public void setPro_number(int pro_number) {
        this.pro_number = pro_number;
    }

    public double getCart_price() {
        return cart_price;
    }

    public void setCart_price(double cart_price) {
        this.cart_price = cart_price;
    }

    @Override
    public String toString() {
        return "CartInfo{" +
                "cart_id=" + cart_id +
                ", pro_id=" + pro_id +
                ", url='" + url + '\'' +
                ", pro_name='" + pro_name + '\'' +
                ", pro_price=" + pro_price +
                ", pro_number=" + pro_number +
                ", cart_price=" + cart_price +
                '}';
    }
}
