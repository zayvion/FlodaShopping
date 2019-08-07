package action;

import com.google.gson.Gson;
import com.opensymphony.xwork2.ModelDriven;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import pojo.User;
import service.UserService;

import javax.annotation.Resource;
import java.io.IOException;

@Controller
@Scope("prototype")
public class UserAction extends BaseAction implements ModelDriven<User> {
    private User user = new User();
    private int userId;
    @Resource
    private UserService userService;

    /**
     * 用户登录
     * @return
     */
    public String loginUser() throws IOException {
        Boolean isLogin = userService.LoginUser(user.getUsername(), user.getPassword());
        if (isLogin){
            session.put("userFlag",user.getUsername());
            return  MAIN;
        }
        request.setAttribute("msg","用户名和密码错误，请重试!");
        return INDEX;
    }

    /**
     * 查询用户列表
     * @return
     */
    public String list(){
        try {
            String list = userService.getUserList();
            response.setContentType("application/json;charset=utf-8");
            response.getWriter().write(list);
        } catch (IOException e) {
            e.printStackTrace();
        }
        return NONE;
    }

    /**
     * 查询用户详细信息
     * @return
     */
    public String info(){
        try {
            String info = userService.info(userId);
            response.setContentType("application/json;charset=utf-8");
            response.getWriter().write(info);
        } catch (IOException e) {
            e.printStackTrace();
        }
        return NONE;
    }

    /**
     * 封号处理`
     */
    public String stop(){
        try {
            String stopUser = userService.stopUser(userId);
            response.setContentType("application/json;charset=utf-8");
            response.getWriter().write(stopUser);
        } catch (IOException e) {
            e.printStackTrace();
        }
        return NONE;
    }

    /**
     * 解封处理`
     */
    public String start(){
        try {
            String startUser = userService.startUser(userId);
            response.setContentType("application/json;charset=utf-8");
            response.getWriter().write(startUser);
        } catch (IOException e) {
            e.printStackTrace();
        }
        return NONE;
    }

    @Override
    public User getModel() {
        return user;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }
}
