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

    @Resource
    private FUserService userService;
    private User user = new User();
    private String repeat_pwd;
    private int parent_id;
    private UserAddr userAddr;
    private int user_addr_id;
    private String code;

    /**
     * 添加用户地址
     * @return
     */
    public String addAddress(){
        User onliner = (User) session.get("onliner");
        userAddr.setUserId(onliner.getUser_id());
        userAddr.setReceiver_addr(userAddr.getPro()+","+userAddr.getCity()+","+userAddr.getArea()+","+userAddr.getStreet()+","+userAddr.getReceiver_addr());
        try {
            response.setContentType("application/json;charset=utf-8");
            response.getWriter().write(userService.addAddress(userAddr));
        } catch (IOException e) {
            e.printStackTrace();
        }
        return NONE;
    }

    /**
     * 添加用户地址
     * @return
     */
    public String updateAddress(){
        User onliner = (User) session.get("onliner");
        userAddr.setUserId(onliner.getUser_id());
        userAddr.setReceiver_addr(userAddr.getPro()+","+userAddr.getCity()+","+userAddr.getArea()+","+userAddr.getStreet()+","+userAddr.getReceiver_addr());
        try {
            response.setContentType("application/json;charset=utf-8");
            response.getWriter().write(userService.updateAddress(userAddr));
        } catch (IOException e) {
            e.printStackTrace();
        }
        return NONE;
    }

    /**
     * 删除用户地址
     * @return
     */
    public String removeAddr(){
        try {
            String addrJson = userService.removeAddr(user_addr_id);
            response.setContentType("application/json;charset=utf-8");
            response.getWriter().write(addrJson);
        } catch (IOException e) {
            e.printStackTrace();
        }
        return NONE;
    }

    /**
     * 根据地址id获取地址
     * @return
     */
    public String getAddrById(){
        try {
            String addrById = userService.getAddrById(user_addr_id);
            response.setContentType("application/json;charset=utf-8");
            response.getWriter().write(addrById);
        } catch (IOException e) {
            e.printStackTrace();
        }
        return NONE;
    }


    /**
     * 用户注册
     *
     * @return json
     * @throws Exception
     */
    public String register()throws Exception{
        if (!session.get("code").equals(code)){
            session.remove("code");
            request.setAttribute("hint","验证码错误，请重新输入！");
            return ERROR;
        }
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

    /**
     * 查询当前用户的所有地址
     * @return
     */
    public String getAddress(){
        try {
            response.setContentType("application/json;charset=utf-8");
            response.getWriter().write(userService.getAddress(user.getUser_id()));
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

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }

    public UserAddr getUserAddr() {
        return userAddr;
    }

    public void setUserAddr(UserAddr userAddr) {
        this.userAddr = userAddr;
    }

    public int getUser_addr_id() {
        return user_addr_id;
    }

    public void setUser_addr_id(int user_addr_id) {
        this.user_addr_id = user_addr_id;
    }
}

