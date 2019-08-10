package pojo;

/**
 * @Auther: dc
 * @Date: 2019/8/9 16:36
 * @Description:
 */
public class UserAddr {
    private int user_addr_id;
    private int userId;
    private String receiver_name;
    private String receiver_tel;
    private String pro;
    private String city;
    private String area;
    private String street;
    private String receiver_addr;
    private String zip;

    public int getUser_addr_id() {
        return user_addr_id;
    }

    public void setUser_addr_id(int user_addr_id) {
        this.user_addr_id = user_addr_id;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public String getReceiver_name() {
        return receiver_name;
    }

    public void setReceiver_name(String receiver_name) {
        this.receiver_name = receiver_name;
    }

    public String getReceiver_tel() {
        return receiver_tel;
    }

    public void setReceiver_tel(String receiver_tel) {
        this.receiver_tel = receiver_tel;
    }

    public String getReceiver_addr() {
        return receiver_addr;
    }

    public void setReceiver_addr(String receiver_addr) {
        this.receiver_addr = receiver_addr;
    }

    public String getPro() {
        return pro;
    }

    public void setPro(String pro) {
        this.pro = pro;
    }

    public String getCity() {
        return city;
    }

    public void setCity(String city) {
        this.city = city;
    }

    public String getArea() {
        return area;
    }

    public void setArea(String area) {
        this.area = area;
    }

    public String getStreet() {
        return street;
    }

    public void setStreet(String street) {
        this.street = street;
    }

    public String getZip() {
        return zip;
    }

    public void setZip(String zip) {
        this.zip = zip;
    }

    @Override
    public String toString() {
        return "UserAddr{" +
                "user_addr_id=" + user_addr_id +
                ", userId=" + userId +
                ", receiver_name='" + receiver_name + '\'' +
                ", receiver_tel='" + receiver_tel + '\'' +
                ", pro='" + pro + '\'' +
                ", city='" + city + '\'' +
                ", area='" + area + '\'' +
                ", street='" + street + '\'' +
                ", receiver_addr='" + receiver_addr + '\'' +
                ", zip='" + zip + '\'' +
                '}';
    }
}
