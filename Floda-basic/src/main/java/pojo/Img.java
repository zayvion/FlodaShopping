package pojo;

import org.springframework.stereotype.Component;

/**
 * @Auther: zayvion
 * @Date: 2019-08-05 14:40
 * @Description:图片实体类
 */
@Component
public class Img {
    private Integer img_id;
    private String img_addr;
    private String img_desc;

    public Integer getImg_id() {
        return img_id;
    }

    public void setImg_id(Integer img_id) {
        this.img_id = img_id;
    }

    public String getImg_addr() {
        return img_addr;
    }

    public void setImg_addr(String img_addr) {
        this.img_addr = img_addr;
    }

    public String getImg_desc() {
        return img_desc;
    }

    public void setImg_desc(String img_desc) {
        this.img_desc = img_desc;
    }

    @Override
    public String toString() {
        return "Img{" +
                "img_id=" + img_id +
                ", img_addr='" + img_addr + '\'' +
                ", img_desc='" + img_desc + '\'' +
                '}';
    }
}
