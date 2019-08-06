package service;

import pojo.User;

/**
 * @Auther: Tree
 * @Date: 2019/8/5 14:45
 * @Description:
 */
public interface UserService {
    /**
     * 用户注册
     * @param user
     * @return json
     */
    String register(User user);

    /**
     *
     * @param user
     * @return json
     */
    String login(User user);
}
