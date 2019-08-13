package action;

import com.google.gson.Gson;
import dao.OrderDao;
import dao.OrderDetailDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import pojo.Order;

import java.io.IOException;
import java.util.List;

/**
 * @Auther: zayvion
 * @Date: 2019-08-13 09:47
 * @Description:订单相关action
 */
@Controller
@Scope("prototype")
public class OrderAction extends BaseAction {

    @Autowired
    private OrderDetailDao orderDetailDao;
    @Autowired
    private OrderDao orderDao;
    private int orderId;

    public String getOrderDetail() throws IOException {
        System.out.println("orderId::"+orderId);
        Order order = orderDao.getOrder(orderId);
        List details = orderDetailDao.getOrderDetail(orderId);
        order.setDetails(details);
        response.setContentType("application/json;charset=utf-8");
        response.getWriter().write(new Gson().toJson(order));
        return NONE;
    }

    public int getOrderId() {
        return orderId;
    }

    public void setOrderId(int orderId) {
        this.orderId = orderId;
    }
}
