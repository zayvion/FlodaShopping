package service.Impl;

import dao.FUserDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import pojo.User;
import service.FUserService;
import utils.MD5Util;

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
}
