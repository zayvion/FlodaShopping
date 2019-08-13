package pojo;

import org.springframework.stereotype.Component;

/**
 * @Auther: zayvion
 * @Date: 2019-08-12 14:35
 * @Description:订单详情
 */

@Component
public class OrderDetail {
    private int detail_id;
    private int order_id;
    private int pro_order_id;
    private String pro_name;
    private int pro_number;
    private double pro_price;
    private int isEvaluate;
    private String imgAddr;

    public int getDetail_id() {
        return detail_id;
    }

    public void setDetail_id(int detail_id) {
        this.detail_id = detail_id;
    }

    public int getOrder_id() {
        return order_id;
    }

    public void setOrder_id(int order_id) {
        this.order_id = order_id;
    }

    public int getPro_order_id() {
        return pro_order_id;
    }

    public void setPro_order_id(int pro_order_id) {
        this.pro_order_id = pro_order_id;
    }

    public String getPro_name() {
        return pro_name;
    }

    public void setPro_name(String pro_name) {
        this.pro_name = pro_name;
    }

    public int getPro_number() {
        return pro_number;
    }

    public void setPro_number(int pro_number) {
        this.pro_number = pro_number;
    }

    public double getPro_price() {
        return pro_price;
    }

    public void setPro_price(double pro_price) {
        this.pro_price = pro_price;
    }

    public String getImgAddr() {
        return imgAddr;
    }

    public void setImgAddr(String imgAddr) {
        this.imgAddr = imgAddr;
    }

    public int getIsEvaluate() {
        return isEvaluate;
    }

    public void setIsEvaluate(int isEvaluate) {
        this.isEvaluate = isEvaluate;
    }

    @Override
    public String toString() {
        return "OrderDetail{" +
                "detail_id=" + detail_id +
                ", order_id=" + order_id +
                ", pro_order_id=" + pro_order_id +
                ", pro_name='" + pro_name + '\'' +
                ", pro_number=" + pro_number +
                ", pro_price=" + pro_price +
                ", isEvaluate=" + isEvaluate +
                ", imgAddr='" + imgAddr + '\'' +
                '}';
    }
}
