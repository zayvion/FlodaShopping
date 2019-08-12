package dao;

import pojo.*;

import java.util.List;

/**
 * @Auther: zayvion
 * @Date: 2019-08-04 20:48
 * @Description:用户Dao接口
 */
public interface FUserDao {
    /**
     * 用户注册
     * @param user
     */
    void register(User user);

    /**
     * 用户登陆
     * @param user
     * @return
     */
    User login(User user);

    /**
     * 查询用户地址
     * @param user_id
     * @return
     */
    List<UserAddr> getAddress(int user_id);

    /**
     * 省市区联动
     */
    List<Address> getArea(int parent_id);

    /**
     * 添加用户地址
     * @param userAddr
     */
    void addAddress(UserAddr userAddr);

    /**
     * 删除用户地址
     * @param user_addr_id
     */
    void removeAddr(int user_addr_id);

    /**
     * 根据地址id获取地址
     * @param user_addr_id
     * @return
     */
    UserAddr getAddrById(int user_addr_id);

    /**
     * 修改用户地址
     * @param userAddr
     */
    void updateAddress(UserAddr userAddr);

    /**
     * 根据用户id查询用户详细信息
     * @param user_id
     * @return
     */
    UserInfo getUserInfo(int user_id);

    /**
     * 更新用户信息
     * @param userInfo
     */
    void updateUserInfo(UserInfo userInfo);

    /**
     * 修改用户密码
     * @param current_pwd
     * @return
     */
    void changePwd(String current_pwd,int user_id);
}
