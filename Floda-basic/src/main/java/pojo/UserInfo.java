package pojo;

public class UserInfo {
    private int userInfo_id; //用户信息Id
    private int user_id; //用户Id
    private String name; //用户姓名（真实姓名）
    private String email; //NULL邮箱
    private int sex; //性别
    private int head; //头像地址id
    private String headAddr;//头像地址

    public int getUserInfo_id() {
        return userInfo_id;
    }

    public void setUserInfo_id(int userInfo_id) {
        this.userInfo_id = userInfo_id;
    }

    public int getUser_id() {
        return user_id;
    }

    public void setUser_id(int user_id) {
        this.user_id = user_id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public int getSex() {
        return sex;
    }

    public void setSex(int sex) {
        this.sex = sex;
    }

    public int getHead() {
        return head;
    }

    public void setHead(int head) {
        this.head = head;
    }

    public String getHeadAddr() {
        return headAddr;
    }

    public void setHeadAddr(String headAddr) {
        this.headAddr = headAddr;
    }

    @Override
    public String toString() {
        return "UserInfo{" +
                "userInfo_id=" + userInfo_id +
                ", user_id=" + user_id +
                ", name='" + name + '\'' +
                ", email='" + email + '\'' +
                ", sex=" + sex +
                ", head=" + head +
                ", headAddr='" + headAddr + '\'' +
                '}';
    }
}
