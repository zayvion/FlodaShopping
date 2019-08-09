package service;

import pojo.Address;
import pojo.User;

import java.util.List;

/**
 * @Auther: Tree
 * @Date: 2019/8/5 14:45
 * @Description:
 */
public interface FUserService {
    /**
     * 用户注册
     * @param user
     * @return json
     */
    void register(User user);

    /**
     *
     * @param user
     * @return json
     */
    User login(User user);

    /**
     * 查询用户地址
     */
    String getAddress(int user_id);

    /**
     * 省市区联动
     */
    String getArea(int parent_id);
}
