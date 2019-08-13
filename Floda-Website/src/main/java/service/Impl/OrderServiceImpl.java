package service.Impl;

import com.google.gson.Gson;
import dao.FUserDao;
import dao.OrderDao;
import dao.OrderDetailDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import pojo.Order;
import pojo.UserAddr;
import service.FUserService;
import service.OrderDetailService;
import service.OrderService;

import java.util.List;

/**
 * @Auther: zayvion
 * @Date: 2019-08-13 15:11
 * @Description:订单service实现类
 */
@Service
public class OrderServiceImpl implements OrderService {

    @Autowired
    private OrderDao orderDao;
    @Autowired
    private FUserService userService;

    @Override
    public Order getOrder(int id) {
        Order order = orderDao.getOrder(id);
        String addr = userService.getAddrById(order.getAddr_id());
        order.setAddress(addr);
        return order;
    }

    @Override
    public String getProByOrderId(int orderId) {
        return new Gson().toJson(orderDao.getProByOrderId(orderId));
    }
}
