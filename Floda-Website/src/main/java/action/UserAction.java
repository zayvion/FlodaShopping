package action;


import com.google.gson.Gson;
import org.springframework.beans.factory.annotation.Autowired;
import pojo.User;
import service.UserService;
import utils.ResponseResult;

/**
 * @Auther: Tree
 * @Date: 2019/8/5 15:11
 * @Description:
 */
public class UserAction extends BaseAction {

    private String jsonSub;
    private int uid;
    private String username;
    private String jsonStr;

    @Autowired
    private UserService userService;
    public String getJsonSub() {
        return jsonSub;
    }

    public void setJsonSub(String jsonSub) {
        this.jsonSub = jsonSub;
    }

    public int getUid() {
        return uid;
    }

    public void setUid(int uid) {
        this.uid = uid;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getJsonStr() {
        return jsonStr;
    }

    public void setJsonStr(String jsonStr) {
        this.jsonStr = jsonStr;
    }
    /**
     * 用户注册
     *
     * @return json
     * @throws Exception
     */
    public String register()throws Exception{
        String result = userService.register(new Gson().fromJson(jsonSub,User.class));
        response.setContentType("application/json;charset=utf-8");
        this.response.getWriter().write(result);
        return NONE;
    }

    /**
     * 用户登录
     * @return
     * @throws Exception
     */
    public String login() throws Exception {
        User user = new Gson().fromJson(jsonSub, User.class);
        String result = userService.login(user);
        System.out.println(jsonSub);

        if (result != null) {
            session.put("users",user.getUsername());
            response.setContentType("application/json;charset=utf-8");
            this.response.getWriter().write(ResponseResult.build(200, "登陆成功", result));
            return NONE;
        }
        response.setContentType("application/json;charset=utf-8");
        this.response.getWriter().write(ResponseResult.build(500, "登陆失败"));
        return NONE;
    }
}
