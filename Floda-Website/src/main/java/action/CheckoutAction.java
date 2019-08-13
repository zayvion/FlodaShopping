package action;

import dao.FUserDao;
import dao.UserDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import pojo.User;
import pojo.UserAddr;

import java.util.List;

/**
 * @Auther: zayvion
 * @Date: 2019-08-12 11:22
 * @Description:订单action
 */
@Controller
@Scope("prototype")
public class CheckoutAction extends BaseAction {

    @Autowired
    private FUserDao userDao;

    public String checkout() {
        User user = (User) session.get("onliner");
        List<UserAddr> address = userDao.getAddress(user.getUser_id());
        request.setAttribute("address",address);
        return CHECKOUT;
    }
}
