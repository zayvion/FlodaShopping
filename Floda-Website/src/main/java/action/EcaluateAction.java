package action;

/**
 * @Auther: zayvion
 * @Date: 2019-08-14 09:57
 * @Description:评论action
 */

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import pojo.Ecaluate;
import service.EcaluateService;

import java.io.IOException;

@Controller
@Scope("prototype")
public class EcaluateAction extends BaseAction {

    @Autowired
    private EcaluateService ecaluateService;
    private int orderId;
    private int productId;
    private Ecaluate ecaluate;

    public String getEcaluate() throws IOException {
        String ecaluate = ecaluateService.getEcaluateWithOrderAndUser(orderId, productId);
        response.setContentType("application/json;charset=utf-8");
        response.getWriter().write(ecaluate);
        return NONE;
    }

    public String addEcaluate() throws IOException {
        String result = ecaluateService.addEcaluate(ecaluate);
        response.setContentType("application/json;charset=utf-8");
        response.getWriter().write(result);
        return NONE;
    }

    public int getOrderId() {
        return orderId;
    }

    public void setOrderId(int orderId) {
        this.orderId = orderId;
    }

    public int getProductId() {
        return productId;
    }

    public void setProductId(int productId) {
        this.productId = productId;
    }

    public void setEcaluate(Ecaluate ecaluate) {
        this.ecaluate = ecaluate;
    }
}