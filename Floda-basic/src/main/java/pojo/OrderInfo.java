package pojo;

import java.sql.Timestamp;

/**
 * @Auther: zwf97
 * @Date: 2019/8/13 09:24
 * @Description:
 */
public class OrderInfo {
    private int order_id;
    private String user_name;
    private double order_money;
    private Timestamp creattime;
    private String  type;

    public int getOrder_id() {
        return order_id;
    }

    public void setOrder_id(int order_id) {
        this.order_id = order_id;
    }

    public String getUser_name() {
        return user_name;
    }

    public void setUser_name(String user_name) {
        this.user_name = user_name;
    }

    public double getOrder_money() {
        return order_money;
    }

    public void setOrder_money(double order_money) {
        this.order_money = order_money;
    }

    public Timestamp getCreattime() {
        return creattime;
    }

    public void setCreattime(Timestamp creattime) {
        this.creattime = creattime;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    @Override
    public String toString() {
        return "OrderInfo{" +
                "order_id=" + order_id +
                ", user_name='" + user_name + '\'' +
                ", order_money=" + order_money +
                ", creattime=" + creattime +
                ", type='" + type + '\'' +
                '}';
    }
}
