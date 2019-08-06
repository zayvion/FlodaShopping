package action;

import com.google.gson.Gson;
import com.opensymphony.xwork2.ModelDriven;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import pojo.User;
import service.UserService;
import utils.MD5Util;

import javax.annotation.Resource;
import java.util.List;

@Controller
@Scope("prototype")
public class UserAction extends BaseAction implements ModelDriven<User> {

    private User user = new User();
    @Resource
    private UserService userService;

    /**
     * 查询用户列表
     * @return
     */
    public String list(){
//        List<User> list = userService.getUserList();
//        String jsonlist = new Gson().toJson(list);
        System.out.println(userService.getUserList());
        return NONE;
    }

    /**
     * 添加用户https://github.com/zayvion/dc-Floda.git
     * @return
     */
    public String add(){
        User u = new User();
        u.setUsername("admin");
        u.setPassword(MD5Util.getMD5("admin"));
        u.setTelphone("18229735193");
        u.setType(1);
        System.out.println(u);
        return NONE;
    }

    @Override
    public User getModel() {
        return user;
    }
}
