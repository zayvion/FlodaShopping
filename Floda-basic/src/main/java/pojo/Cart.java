package pojo;

/**
 * @Auther: zwf97
 * @Date: 2019/8/8 09:08
 * @Description:
 */
public class Cart {
    private int cart_id;
    private int user_id;
    private int product_id;
    private int pro_number;
    private double cart_price;

    public int getCart_id() {
        return cart_id;
    }

    public void setCart_id(int cart_id) {
        this.cart_id = cart_id;
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
        return "Cart{" +
                "cart_id=" + cart_id +
                ", user_id=" + user_id +
                ", product_id=" + product_id +
                ", pro_number=" + pro_number +
                ", cart_price=" + cart_price +
                '}';
    }
}
