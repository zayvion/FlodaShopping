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
    private String status;
    private String telphone;
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

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getTelphone() {
        return telphone;
    }

    public void setTelphone(String telephone) {
        this.telphone = telphone;
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
                ", telphone='" + telphone + '\'' +
                ", type=" + type +
                '}';
    }
}
