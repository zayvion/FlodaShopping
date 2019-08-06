package pojo;

import org.springframework.stereotype.Component;

/**
 * @Auther: zayvion
 * @Date: 2019-08-05 09:09
 * @Description:分类实体
 */
@Component
public class Categroy {
    private Integer cate_id;
    private String cate_name;
    private String cate_desc;

    public Integer getCate_id() {
        return cate_id;
    }

    public void setCate_id(Integer cate_id) {
        this.cate_id = cate_id;
    }

    public String getCate_name() {
        return cate_name;
    }

    public void setCate_name(String cate_name) {
        this.cate_name = cate_name;
    }

    public String getCate_desc() {
        return cate_desc;
    }

    public void setCate_desc(String cate_desc) {
        this.cate_desc = cate_desc;
    }

    @Override
    public String toString() {
        return "Categroy{" +
                "cate_id=" + cate_id +
                ", cate_name='" + cate_name + '\'' +
                ", cate_desc='" + cate_desc + '\'' +
                '}';
    }
}
