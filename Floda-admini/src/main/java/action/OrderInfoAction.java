package action;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import service.OrderInfoService;

import java.io.IOException;

/**
 * @Auther: zwf97
 * @Date: 2019/8/13 10:57
 * @Description:订单Action
 */
@Controller
@Scope("prototype")
public class OrderInfoAction extends BaseAction{

    @Autowired
    private OrderInfoService orderInfoService;

    /**
     * 获取所有订单
     * @return
     * @throws IOException
     */
    public String getOrderInfos() throws IOException {
        String result = orderInfoService.getOrderInfos();
        response.setContentType("application/json;charset=utf-8");
        response.getWriter().write(result);
        return NONE;
    }
}
