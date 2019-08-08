package pojo;

import org.springframework.stereotype.Component;

/**
 * @Auther: zayvion
 * @Date: 2019-08-05 13:58
 * @Description:商品实体
 */
@Component
public class Product {
    private Integer pro_id;
    private String pro_name;
    private Integer pro_cateId;
    private String pro_desc;
    private Double pro_price;
    private Integer pro_status;
    private Integer pro_numbers;
    private Integer pro_imgId;
    private String pro_imgAddr;

    public Integer getPro_id() {
        return pro_id;
    }

    public void setPro_id(Integer pro_id) {
        this.pro_id = pro_id;
    }

    public String getPro_name() {
        return pro_name;
    }

    public void setPro_name(String pro_name) {
        this.pro_name = pro_name;
    }

    public Integer getPro_cateId() {
        return pro_cateId;
    }

    public void setPro_cateId(Integer pro_cateId) {
        this.pro_cateId = pro_cateId;
    }

    public String getPro_desc() {
        return pro_desc;
    }

    public void setPro_desc(String pro_desc) {
        this.pro_desc = pro_desc;
    }

    public Double getPro_price() {
        return pro_price;
    }

    public void setPro_price(Double pro_price) {
        this.pro_price = pro_price;
    }

    public Integer getPro_status() {
        return pro_status;
    }

    public void setPro_status(Integer pro_status) {
        this.pro_status = pro_status;
    }

    public Integer getPro_numbers() {
        return pro_numbers;
    }

    public void setPro_numbers(Integer pro_numbers) {
        this.pro_numbers = pro_numbers;
    }

    public Integer getPro_imgId() {
        return pro_imgId;
    }

    public void setPro_imgId(Integer pro_imgId) {
        this.pro_imgId = pro_imgId;
    }

    public String getPro_imgAddr() {
        return pro_imgAddr;
    }

    public void setPro_imgAddr(String pro_imgAddr) {
        this.pro_imgAddr = pro_imgAddr;
    }

    @Override
    public String toString() {
        return "Product{" +
                "pro_id=" + pro_id +
                ", pro_name='" + pro_name + '\'' +
                ", pro_cateId=" + pro_cateId +
                ", pro_desc='" + pro_desc + '\'' +
                ", pro_price=" + pro_price +
                ", pro_status=" + pro_status +
                ", pro_numbers=" + pro_numbers +
                ", pro_imgId=" + pro_imgId +
                ", pro_imgAddr='" + pro_imgAddr + '\'' +
                '}';
    }
}
