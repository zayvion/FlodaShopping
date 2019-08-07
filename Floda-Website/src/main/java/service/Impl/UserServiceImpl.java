package service.Impl;

import dao.UserDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import pojo.User;
import service.UserService;
import utils.MD5Util;
import utils.ResponseResult;

/**
 * @Auther: Tree
 * @Date: 2019/8/5 14:47
 * @Description:
 */
@Service
public class UserServiceImpl implements UserService {
    @Autowired
    private UserDao userDao;

    @Override
    public String register(User user) {
        try {
            // 将用户的密码加密成MD5
            user.setPassword(MD5Util.getMD5(user.getPassword()));
            user.setStatus("1");
            userDao.register(user);
        } catch (Exception e) {
            e.printStackTrace();
            ResponseResult.build(500, "注册失败");
        }
        return ResponseResult.ok("注册成功");
    }

    @Override
    public String login(User user) {
        boolean login = userDao.login(user);
        if (login == true){
            return ResponseResult.ok("登录成功");
        }else {
            return ResponseResult.build(500,"登录失败");
        }
    }
}
