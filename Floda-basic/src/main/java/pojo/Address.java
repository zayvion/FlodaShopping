package pojo;

/**
 * @Auther: dc
 * @Date: 2019/8/9 17:46
 * @Description:
 */
public class Address {
    private int address_id;
    private String area_name;
    private int parent_id;
    private int is_parent;

    public int getAddress_id() {
        return address_id;
    }

    public void setAddress_id(int address_id) {
        this.address_id = address_id;
    }

    public String getArea_name() {
        return area_name;
    }

    public void setArea_name(String area_name) {
        this.area_name = area_name;
    }

    public int getParent_id() {
        return parent_id;
    }

    public void setParent_id(int parent_id) {
        this.parent_id = parent_id;
    }

    public int getIs_parent() {
        return is_parent;
    }

    public void setIs_parent(int is_parent) {
        this.is_parent = is_parent;
    }

    @Override
    public String toString() {
        return "Address{" +
                "address_id=" + address_id +
                ", area_name='" + area_name + '\'' +
                ", parent_id=" + parent_id +
                ", is_parent=" + is_parent +
                '}';
    }
}
