package pojo;

import org.springframework.stereotype.Component;

/**
 * @Auther: zayvion
 * @Date: 2019-08-04 20:44
 * @Description:用户的实体类
 */
@Component
public class User {
    private Integer user_id;
    private String username;
    private  String password;
    private Integer status;
    private String tel;
    private  Integer type;

    public Integer getUser_id() {
        return user_id;
    }

    public void setUser_id(Integer user_id) {
        this.user_id = user_id;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
    }

    public String getTel() {
        return tel;
    }

    public void setTel(String tel) {
        this.tel = tel;
    }

    public Integer getType() {
        return type;
    }

    public void setType(Integer type) {
        this.type = type;
    }

    @Override
    public String toString() {
        return "User{" +
                "user_id=" + user_id +
                ", username='" + username + '\'' +
                ", password='" + password + '\'' +
                ", status='" + status + '\'' +
                ", tel='" + tel + '\'' +
                ", type=" + type +
                '}';
    }
}
