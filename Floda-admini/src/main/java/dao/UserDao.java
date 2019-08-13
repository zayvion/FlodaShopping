package dao;

import pojo.User;
import pojo.UserInfo;

import java.util.List;

public interface UserDao {
    List<User> getUserList();

    UserInfo info(int user_id);

    void stopUser(int user_id);

    void startUser(int user_id);

    User LoginUser(String username);

    /**
     * 获取用户
     * @param id
     * @return
     */
    User getUser(int id);

    /**
     * 获取用户头像地址
     * @param id
     * @return
     */
    String getUserImg(int id);
}
