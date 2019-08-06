package pojo;

/**
 * @Auther: zayvion
 * @Date: 2019-08-06 09:04
 * @Description:商品展示的封装，用于后台商品管理的展示
 */
public class ProductShow {
    private Integer pro_id;
    private String pro_name;
    private String pro_imgUrl;
    private Integer pro_cateId;
    private Double pro_price;
    private String pro_status;
    private Integer pro_numbers;

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

    public String getPro_imgUrl() {
        return pro_imgUrl;
    }

    public void setPro_imgUrl(String pro_imgUrl) {
        this.pro_imgUrl = pro_imgUrl;
    }

    public Integer getPro_cateId() {
        return pro_cateId;
    }

    public void setPro_cateId(Integer pro_cateId) {
        this.pro_cateId = pro_cateId;
    }

    public Double getPro_price() {
        return pro_price;
    }

    public void setPro_price(Double pro_price) {
        this.pro_price = pro_price;
    }

    public Integer getPro_numbers() {
        return pro_numbers;
    }

    public void setPro_numbers(Integer pro_numbers) {
        this.pro_numbers = pro_numbers;
    }

    public String getPro_status() {
        return pro_status;
    }

    public void setPro_status(String pro_status) {
        this.pro_status = pro_status;
    }
}
