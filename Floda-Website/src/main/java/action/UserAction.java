package action;


import com.opensymphony.xwork2.ModelDriven;
import org.apache.struts2.ServletActionContext;
import org.springframework.stereotype.Controller;
import pojo.User;
import service.FUserService;
import utils.MD5Util;

import javax.annotation.Resource;

/**
 * @Auther: Tree
 * @Date: 2019/8/5 15:11
 * @Description:
 */
@Controller
public class UserAction extends BaseAction implements ModelDriven<User> {

    @Resource
    private FUserService userService;
    private User user = new User();
    private String repeat_pwd;

    /**
     * 用户注册
     *
     * @return json
     * @throws Exception
     */
    public String register()throws Exception{
        try {
            request.setAttribute("newUser",user);
            userService.register(user);
            request.setAttribute("hint","注册成功");
            return "login";
        } catch (Exception e) {
            e.printStackTrace();
        }
        return ERROR;
    }

    /**
     * 用户登录
     * @return
     * @throws Exception
     */
    public String login() throws Exception {
        if(userService.login(user) != null){
            if(userService.login(user).getPassword().equals(MD5Util.getMD5(user.getPassword()))){
                ServletActionContext.getRequest().getSession().setAttribute("onliner",userService.login(user));
                return "index";
            }
        }
        request.setAttribute("hints","用户名或密码错误!");
        return "login";
    }

    /**
     * 用户退出
     * @return
     */
    public String exit(){
        session.remove("onliner");
        return "register";
    }

    @Override
    public User getModel() {
        return user;
    }

    public String getRepeat_pwd() {
        return repeat_pwd;
    }

    public void setRepeat_pwd(String repeat_pwd) {
        this.repeat_pwd = repeat_pwd;
    }
}
