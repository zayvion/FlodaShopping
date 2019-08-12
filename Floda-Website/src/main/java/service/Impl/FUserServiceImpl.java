package service.Impl;

import com.google.gson.Gson;
import dao.FUserDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import pojo.User;
import pojo.UserAddr;
import pojo.UserInfo;
import service.FUserService;
import utils.MD5Util;
import utils.ResponseResult;

/**
 * @Auther: Tree
 * @Date: 2019/8/5 14:47
 * @Description:
 */
@Service
public class FUserServiceImpl implements FUserService {
    @Autowired
    private FUserDao fuserDao;

    @Override
    @Transactional
    public void register(User user) {
        // 将用户的密码加密成MD5
        user.setPassword(MD5Util.getMD5(user.getPassword()));
        user.setStatus(0);
        user.setType(1);
        fuserDao.register(user);
    }

    @Override
    public User login(User user) {
        User exist = fuserDao.login(user);
        return exist;
    }

    @Override
    public String getAddress(int user_id) {
        return new Gson().toJson(fuserDao.getAddress(user_id));
    }

    @Override
    public String getArea(int parent_id) {
        return new Gson().toJson(fuserDao.getArea(parent_id));
    }

    @Override
    @Transactional
    public String addAddress(UserAddr userAddr) {
        try {
            fuserDao.addAddress(userAddr);
            return ResponseResult.build(200,"添加成功");
        } catch (Exception e) {
            e.printStackTrace();
        }
        return ResponseResult.build(500,"添加失败");
    }

    @Override
    @Transactional
    public String removeAddr(int user_addr_id) {
        try {
            fuserDao.removeAddr(user_addr_id);
            return ResponseResult.build(200,"删除成功");
        } catch (Exception e) {
            e.printStackTrace();
        }
        return ResponseResult.build(500,"删除失败");
    }

    @Override
    public String getAddrById(int user_addr_id) {
        UserAddr addrById = fuserDao.getAddrById(user_addr_id);
        return new Gson().toJson(addrById);
    }

    @Override
    @Transactional
    public String updateAddress(UserAddr userAddr) {
        try {
            fuserDao.updateAddress(userAddr);
            return ResponseResult.build(200,"修改成功");
        } catch (Exception e) {
            e.printStackTrace();
        }
        return ResponseResult.build(200,"修改失败");
    }

    @Override
    public String getUserInfo(int user_id) {
        return new Gson().toJson(fuserDao.getUserInfo(user_id));
    }

    @Override
    @Transactional
    public String updateUserInfo(UserInfo userInfo) {
        try {
            fuserDao.updateUserInfo(userInfo);
            return ResponseResult.build(200,"修改成功");
        } catch (Exception e) {
            e.printStackTrace();
        }
        return ResponseResult.build(500,"修改失败");
    }

    @Override
    @Transactional
    public String changePwd(String current_pwd,int user_id) {
        try {
            fuserDao.changePwd(current_pwd,user_id);
            return ResponseResult.build(200,"密码修改成功");
        } catch (Exception e) {
            e.printStackTrace();
        }
        return ResponseResult.build(500,"密码修改失败");
    }
}
