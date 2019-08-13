package action;

import dao.JedisClient;
import dao.UserDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import pojo.User;
import service.CartService;

import java.io.IOException;

/**
 * @Auther: zwf
 * @Date: 2019-08-08 10:03
 * @Description:购物车action
 */
@Controller
@Scope("prototype")
public class CartAction extends BaseAction {
    @Autowired
    private CartService cartService;

    private int cart_id;
    private int pro_id;
    private int pro_number;

    public String addCart() throws IOException {
        User onliner = (User) this.request.getSession().getAttribute("onliner");
        System.out.println("usersssss"+onliner);
        String result = cartService.addCart(pro_id, onliner.getUser_id(), pro_number);
        response.setContentType("application/json;charset=utf-8");
        response.getWriter().write(result);
        return NONE;
    }

    public String getCartInfos() throws IOException {
        User user = (User) session.get("onliner");
        //若用户没登录直接返回null
        if (user == null){
            return NONE;
        }
        Integer user_id = user.getUser_id();
        String result = cartService.getCartInfos(user_id);
        response.setContentType("application/json;charset=utf-8");
        response.getWriter().write(result);
        return NONE;
    }

    public String delCart() throws IOException {
        String result = cartService.delCart(cart_id);
        response.setContentType("application/json;charset=utf-8");
        response.getWriter().write(result);
        return NONE;
    }

    public int getCart_id() {
        return cart_id;
    }

    public void setCart_id(int cart_id) {
        this.cart_id = cart_id;
    }

    public int getPro_id() {
        return pro_id;
    }

    public void setPro_id(int pro_id) {
        this.pro_id = pro_id;
    }

    public int getPro_number() {
        return pro_number;
    }

    public void setPro_number(int pro_number) {
        this.pro_number = pro_number;
    }
}
