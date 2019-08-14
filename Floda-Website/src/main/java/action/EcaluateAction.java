package action;

/**
 * @Auther: zayvion
 * @Date: 2019-08-14 09:57
 * @Description:评论action
 */

import com.opensymphony.xwork2.ModelDriven;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import pojo.Ecaluate;
import pojo.User;
import service.EcaluateService;
import utils.ResponseResult;

import java.io.IOException;

@Controller
@Scope("prototype")
public class EcaluateAction extends BaseAction implements ModelDriven<Ecaluate> {

    @Autowired
    private EcaluateService ecaluateService;
    private int orderId;
    private int productId;
    private Ecaluate ecaluate = new Ecaluate();

    public String getEcaluate() throws IOException {
        String ecaluate = ecaluateService.getEcaluateWithOrderAndUser(orderId, productId);
        response.setContentType("application/json;charset=utf-8");
        response.getWriter().write(ecaluate);
        return NONE;
    }

    public String addEcaluate() throws IOException {
        User user = (User) session.get("onliner");
        if (user == null){
            response.setContentType("application/json;charset=utf-8");
            response.getWriter().write(ResponseResult.build(500, "拿不到用户"));
            return NONE;
        }
        ecaluate.setUser_id(user.getUser_id());
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

    @Override
    public Ecaluate getModel() {
        return ecaluate;
    }
}
