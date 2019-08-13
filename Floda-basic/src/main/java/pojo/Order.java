package pojo;

import org.springframework.stereotype.Component;

import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

/**
 * @Auther: zayvion
 * @Date: 2019-08-12 14:48
 * @Description:订单实体类
 */
@Component
public class Order {

    private int order_id;
    private int user_id;
    private int addr_id;
    private double order_money;
    private Timestamp creattime;
    private int type;
    private List<OrderDetail> details = new ArrayList<>();
    private String address;

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

    public int getAddr_id() {
        return addr_id;
    }

    public void setAddr_id(int addr_id) {
        this.addr_id = addr_id;
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

    public int getType() {
        return type;
    }

    public void setType(int type) {
        this.type = type;
    }

    public List<OrderDetail> getDetails() {
        return details;
    }

    public void setDetails(List<OrderDetail> details) {
        this.details = details;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }
}
