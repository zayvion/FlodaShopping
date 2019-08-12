package action;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import pojo.User;
import service.WishlistService;

import java.io.IOException;

/**
 * @Auther: zwf
 * @Date: 2019-08-08 10:03
 * @Description:收藏action
 */
@Controller("wishlistAction")
@Scope("prototype")
public class WishlistAction extends BaseAction {
    @Autowired
    private WishlistService wishlistService;

    private int wishlist_id;
    private int pro_id;

    public String addWishlist() throws IOException {
        User user = (User) session.get("onliner");
        Integer user_id = user.getUser_id();

        System.out.println(user_id + "-----" + pro_id);
        String result = wishlistService.addWishlist(pro_id, user_id);
        response.setContentType("application/json;charset=utf-8");
        response.getWriter().write(result);
        return NONE;
    }

    public String getWishlistInfos() throws IOException {
        User user = (User) session.get("onliner");
        //若用户没登录直接返回null
        if (user == null) {
            return NONE;
        }
        Integer user_id = user.getUser_id();
        String result = wishlistService.getWishlistInfos(user_id);
        response.setContentType("application/json;charset=utf-8");
        response.getWriter().write(result);
        return NONE;
    }

    public String delWishlist() throws IOException {
        String result = wishlistService.delWishlist(wishlist_id);
        response.setContentType("application/json;charset=utf-8");
        response.getWriter().write(result);
        return NONE;
    }

    public int getWishlist_id() {
        return wishlist_id;
    }

    public void setWishlist_id(int wishlist_id) {
        this.wishlist_id = wishlist_id;
    }

    public int getPro_id() {
        return pro_id;
    }

    public void setPro_id(int pro_id) {
        this.pro_id = pro_id;
    }

}
