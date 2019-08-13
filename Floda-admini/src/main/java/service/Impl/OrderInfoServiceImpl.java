package service.Impl;

import com.google.gson.Gson;
import dao.OrderInfoDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import pojo.OrderInfo;
import service.OrderInfoService;

import java.util.List;

/**
 * @Auther: zwf97
 * @Date: 2019/8/13 10:53
 * @Description:订单Service实现类
 */
@Service
public class OrderInfoServiceImpl implements OrderInfoService {
    @Autowired
    private OrderInfoDao orderInfoDao;

    @Override
    public String getOrderInfos() {
        List<OrderInfo> orderInfos = orderInfoDao.getOrderInfos();
        String json = new Gson().toJson(orderInfos);
        return json;
    }
}
