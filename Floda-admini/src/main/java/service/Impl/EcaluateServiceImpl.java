package service.Impl;

import com.google.gson.Gson;
import dao.EcaluateDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import pojo.Ecaluate;
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

    @Override
    public String getEcaluates() {
        List ecaluates = ecaluateDao.getEcaluates();
        String json = new Gson().toJson(ecaluates);
        return json;
    }

    @Override
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

}
