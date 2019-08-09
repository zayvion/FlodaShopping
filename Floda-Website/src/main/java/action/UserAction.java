package action;


import com.opensymphony.xwork2.ModelDriven;
import dao.JedisClient;
import org.apache.struts2.ServletActionContext;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import pojo.User;
import pojo.UserAddr;
import service.FUserService;
import utils.MD5Util;

import javax.annotation.Resource;
import java.io.IOException;

/**
 * @Auther: Tree
 * @Date: 2019/8/5 15:11
 * @Description:
 */
@Controller
public class UserAction extends BaseAction implements ModelDriven<User> {

    @Autowired
    private JedisClient jedisClient;
    @Resource
    private FUserService userService;
    private User user = new User();
    private String repeat_pwd;
    private int parent_id;

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
        return "login";
    }
    public String jd(){
        jedisClient.set("12","123");
        return "login";
    }

    /**
     * 查询当前用户的所有地址
     * @return
     */
    public String getAddress(){
        try {
            response.setContentType("application/json;charset=utf-8");
            response.getWriter().write(userService.getAddress(user.getUser_id()));
            System.out.println(userService.getAddress(user.getUser_id()));
        } catch (IOException e) {
            e.printStackTrace();
        }
        return NONE;
    }

    /**
     * 省市区联动
     * @return
     */
    public String getArea(){
        try {
            response.setContentType("application/json;charset=utf-8");
            response.getWriter().write(userService.getArea(parent_id));
        } catch (IOException e) {
            e.printStackTrace();
        }
        return NONE;
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

    public int getParent_id() {
        return parent_id;
    }

    public void setParent_id(int parent_id) {
        this.parent_id = parent_id;
    }
}
