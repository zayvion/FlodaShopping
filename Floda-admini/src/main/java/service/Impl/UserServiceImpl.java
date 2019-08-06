package service.Impl;

import com.google.gson.Gson;
import dao.UserDao;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import pojo.User;
import pojo.UserInfo;
import service.UserService;
import utils.ResponseResult;

import javax.annotation.Resource;
import java.util.List;

@Service
public class UserServiceImpl implements UserService {

    @Resource
    private UserDao userDao;
    @Value("${IMG_BASE_PATH}")
    private String IMG_BASE_PATH;

    /**
     * 查询用户列表
     * @return
     */
    @Override
    public String getUserList() {
        List<User> list = userDao.getUserList();
        return new Gson().toJson(list);
    }

    @Override
    public String info(int user_id) {
        UserInfo userInfo = userDao.info(user_id);
        userInfo.setHead(this.IMG_BASE_PATH+userInfo.getHead());
        return new Gson().toJson(userInfo);
    }

    @Transactional
    @Override
    public String stopUser(int user_id) {
        try {
            userDao.stopUser(user_id);
            return ResponseResult.build(200,"封号成功");
        } catch (Exception e) {
            e.printStackTrace();
        }
        return ResponseResult.build(500,"封号失败");
    }

    @Transactional
    @Override
    public String startUser(int user_id) {
        try {
            userDao.startUser(user_id);
            return ResponseResult.build(200,"解封成功");
        } catch (Exception e) {
            e.printStackTrace();
        }
        return ResponseResult.build(500,"解封失败");
    }
}
