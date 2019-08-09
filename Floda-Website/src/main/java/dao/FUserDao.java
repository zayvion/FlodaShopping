package dao;

import pojo.Address;
import pojo.Product;
import pojo.User;
import pojo.UserAddr;

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
}
