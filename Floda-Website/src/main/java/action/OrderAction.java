package action;

import com.google.gson.Gson;
import dao.OrderDetailDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

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
    private int orderId;

    public String getOrderDetail() throws IOException {
        List details = orderDetailDao.getOrderDetail(orderId);
        response.setContentType("application/json;charset=utf-8");
        response.getWriter().write(new Gson().toJson(new Gson().toJson(details)));
        return NONE;
    }

    public int getOrderId() {
        return orderId;
    }

    public void setOrderId(int orderId) {
        this.orderId = orderId;
    }
}
