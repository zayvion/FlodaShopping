package pojo;

import java.sql.Timestamp;
import java.util.Date;

/**
 * @Auther: zwf97
 * @Date: 2019/8/6 14:40
 * @Description: 评论实体
 */
public class Ecaluate {
    private int ecal_id;
    private int product_id;
    private int order_id;
    private int user_id;
    private String ecal_content;
    private Timestamp ecal_time;
    private String username;

    public int getEcal_id() {
        return ecal_id;
    }

    public void setEcal_id(int ecal_id) {
        this.ecal_id = ecal_id;
    }

    public int getProduct_id() {
        return product_id;
    }

    public void setProduct_id(int product_id) {
        this.product_id = product_id;
    }

    public int getOrder_id() {
        return order_id;
    }

    public void setOrder_id(int order_id) {
        this.order_id = order_id;
    }

    public int getUser_id() {
        return user_id;
    }

    public void setUser_id(int user_id) {
        this.user_id = user_id;
    }

    public String getEcal_content() {
        return ecal_content;
    }

    public void setEcal_content(String ecal_content) {
        this.ecal_content = ecal_content;
    }

    public Timestamp getEcal_time() {
        return ecal_time;
    }

    public void setEcal_time(Timestamp ecal_time) {
        this.ecal_time = ecal_time;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    @Override
    public String toString() {
        return "Ecaluate{" +
                "ecal_id=" + ecal_id +
                ", product_id=" + product_id +
                ", order_id=" + order_id +
                ", user_id=" + user_id +
                ", ecal_content='" + ecal_content + '\'' +
                ", ecal_time=" + ecal_time +
                '}';
    }
}
