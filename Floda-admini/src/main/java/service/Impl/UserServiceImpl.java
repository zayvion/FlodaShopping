package service.Impl;

import com.google.gson.Gson;
import dao.UserDao;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import pojo.User;
import service.UserService;
import utils.ResponseResult;

import javax.annotation.Resource;
import java.util.List;

@Service
public class UserServiceImpl implements UserService {

    @Resource
    private UserDao userDao;

    /**
     * 查询用户列表
     * @return
     */
    @Override
    public String getUserList() {
        List<User> list = userDao.getUserList();
        return new Gson().toJson(list);
    }

    /**
     * 添加用户
     * @param user
     */
    @Transactional
    @Override
    public String addUser(User user) {
        try {
            userDao.addUser(user);
            return ResponseResult.build(200,"用户添加成功");
        } catch (Exception e) {
            e.printStackTrace();
        }
        return  ResponseResult.build(500,"用户添加失败");
    }
}
