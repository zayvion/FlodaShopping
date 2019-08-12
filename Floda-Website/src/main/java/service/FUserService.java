package service;

import pojo.Address;
import pojo.User;
import pojo.UserAddr;
import pojo.UserInfo;

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

    /**
     * 添加用户地址
     * @param userAddr
     */
    String addAddress(UserAddr userAddr);
    /**
     * 删除用户地址
     * @param user_addr_id
     */
    String removeAddr(int user_addr_id);

    /**
     * 根据地址id获取地址
     * @param user_addr_id
     * @return
     */
    String getAddrById(int user_addr_id);

    /**
     * 修改用户地址
     * @param userAddr
     */
    String updateAddress(UserAddr userAddr);

    /**
     * 根据用户id查询用户详细信息
     * @param user_id
     * @return
     */
    String getUserInfo(int user_id);

    /**
     * 更新用户信息
     * @param userInfo
     * @return
     */
    String updateUserInfo(UserInfo userInfo);

    /**
     * 修改用户密码
     * @param current_pwd
     * @return
     */
    String changePwd(String current_pwd,int user_id);
}
