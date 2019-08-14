package service.Impl;

import com.google.gson.Gson;
import dao.EcaluateDao;
import dao.UserDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import pojo.Ecaluate;
import pojo.User;
import service.EcaluateService;
import utils.ResponseResult;

import java.sql.Timestamp;
import java.util.Date;
import java.util.List;

/**
 * @Auther  : zwf
 * @Date: 2019-08-06 14:26
 * @Description:查看评论Service的实现类
 */
@Service
public class EcaluateServiceImpl implements EcaluateService {

    @Autowired
    private EcaluateDao ecaluateDao;
    @Autowired
    private UserDao userDao;

    @Override
    public String getEcaluates() {
        List<Ecaluate> ecaluates = ecaluateDao.getEcaluates();
        for (Ecaluate e:ecaluates) {
            User user = userDao.getUser(e.getUser_id());
            e.setUsername(user.getUsername());
        }
        String json = new Gson().toJson(ecaluates);
        return json;
    }

    @Override
    @Transactional
    public String addEcaluate(Ecaluate ecaluate) {
        try {
            ecaluate.setEcal_time(new Timestamp(new Date().getTime()));
            ecaluateDao.addEcaluate(ecaluate);
            return ResponseResult.ok();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return ResponseResult.build(500,"添加失败");
}

    @Override
    public List<Ecaluate> getProductEcaluate(int productId) {
        List<Ecaluate> ecaluates = ecaluateDao.getProductEcaluate(productId);
        for(Ecaluate e:ecaluates){
            User user = userDao.getUser(e.getUser_id());
            e.setUsername(user.getUsername());
        }

        return ecaluates;
    }

    @Override
    public String  getEcaluateWithOrderAndUser(int OrderId, int productId) {
        Ecaluate ecaluate = ecaluateDao.getEcaluateWithOrderAndUser(OrderId, productId);
        return new Gson().toJson(ecaluate);
    }

}
