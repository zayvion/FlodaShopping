package action;


import com.google.gson.Gson;
import com.opensymphony.xwork2.ModelDriven;
import dao.ImgDao;
import dao.JedisClient;
import org.apache.commons.lang3.StringUtils;
import org.apache.struts2.ServletActionContext;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import pojo.Img;
import pojo.User;
import pojo.UserAddr;
import pojo.UserInfo;
import service.FUserService;
import service.ImgService;
import utils.FtpUtil;
import utils.MD5Util;
import utils.ResponseResult;

import javax.annotation.Resource;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.UUID;

/**
 * @Auther: Tree
 * @Date: 2019/8/5 15:11
 * @Description:
 */
@Controller
public class UserAction extends BaseAction implements ModelDriven<User> {

    @Value("${FTP_ADDRESS}")
    private String FTP_ADDRESS;
    @Value("${FTP_PORT}")
    private Integer FTP_PORT;
    @Value("${FTP_USERNAME}")
    private String FTP_USERNAME;
    @Value("${FTP_PASSWORD}")
    private String FTP_PASSWORD;
    @Value("${FTP_BASE_PATH}")
    private String FTP_BASE_PATH;
    @Value("${IMG_BASE_PATH}")
    private String IMG_BASE_PATH;
    @Autowired
    private JedisClient jedisClient;
    @Autowired
    private FUserService userService;
    @Resource
    private ImgService imgService;
    private User user = new User();
    private String repeat_pwd;
    private int parent_id;
    private UserAddr userAddr;
    private UserInfo info;
    private int user_addr_id;
    private String code;
    private int user_id;
    private Img img;
    private File imgFile;
    private String imgFileContentType;
    private String imgFileFileName;
    private String new_pwd;
    private static String KEY_USERLIST = "userList";
    private String current_pwd;



    /**
     * 添加用户地址
     *
     * @return
     */
    public String addAddress() {
        User onliner = (User) session.get("onliner");
        userAddr.setUserId(onliner.getUser_id());
        userAddr.setReceiver_addr(userAddr.getPro() + "," + userAddr.getCity() + "," + userAddr.getArea() + "," + userAddr.getStreet() + "," + userAddr.getReceiver_addr());
        try {
            response.setContentType("application/json;charset=utf-8");
            response.getWriter().write(userService.addAddress(userAddr));
        } catch (IOException e) {
            e.printStackTrace();
        }
        return NONE;
    }

    /**
     * 更新用户地址
     *
     * @return
     */
    public String updateAddress() {
        User onliner = (User) session.get("onliner");
        userAddr.setUserId(onliner.getUser_id());
        userAddr.setReceiver_addr(userAddr.getPro() + "," + userAddr.getCity() + "," + userAddr.getArea() + "," + userAddr.getStreet() + "," + userAddr.getReceiver_addr());
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
     *
     * @return
     */
    public String removeAddr() {
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
     *
     * @return
     */
    public String getAddrById() {
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

    public String register() throws Exception {
        if (!session.get("code").equals(code)) {
            session.remove("code");
            request.setAttribute("hint", "验证码错误，请重新输入！");
            return ERROR;
        }
        try {
            request.setAttribute("newUser", user);
            userService.register(user);
            jedisClient.del(KEY_USERLIST);
            request.setAttribute("hint", "注册成功");
            return "login";
        } catch (Exception e) {
            e.printStackTrace();
        }
        return ERROR;
    }

    /**
     * 用户登录
     *
     * @return
     * @throws Exception
     */
    public String login() throws Exception {
        if (userService.login(user) != null) {
            if (userService.login(user).getPassword().equals(MD5Util.getMD5(user.getPassword()))) {
                session.put("onliner", userService.login(user));
                return "index";
            }
        }
        request.setAttribute("hints", "用户名或密码错误!");
        return "login";
    }

    /**
     * 用户退出
     *
     * @return
     */
    public String exit() {
        session.remove("onliner");
        return "index";
    }

    /**
     * 根据用户id查询详细信息
     *
     * @return
     */
    public String getUserInfo() {
        try {
            User onliner = (User) session.get("onliner");
            response.setContentType("application/json;charset=utf-8");
            response.getWriter().write(userService.getUserInfo(onliner.getUser_id()));
            System.out.println(userService.getUserInfo(onliner.getUser_id()));
        } catch (IOException e) {
            e.printStackTrace();
        }
        return NONE;
    }

    /**
     * 更新用户信息
     *
     * @return
     */
    public String updateUserInfo() {

        User onliner = (User) session.get("onliner");
        info.setUser_id(onliner.getUser_id());

        //如果用户上传了头像，就更新头像，否则只更新基本信息
        if (imgFile != null){
            System.out.println(imgFileFileName);
            String oldFileName = imgFileFileName;
            String extension = oldFileName.substring(oldFileName.indexOf("."));
            String newName = oldFileName.substring(0, oldFileName.indexOf(".")) + UUID.randomUUID().toString().substring(0, 5) + extension;
            String imgPath = getDate();
            try {
                Img img = new Img();
                img.setImg_addr(IMG_BASE_PATH+imgPath+"/"+newName);
                if(info.getHead() == 0){
                    int i = imgService.addImg(img);
                    info.setHead(i);
                }else {
                    img.setImg_id(info.getHead());
                    imgService.updateImg(img);
                }
                FtpUtil.uploadFile(FTP_ADDRESS, FTP_PORT, FTP_USERNAME, FTP_PASSWORD, FTP_BASE_PATH, imgPath, newName, new FileInputStream(imgFile.getAbsoluteFile()));
            } catch (Exception e) {
                e.printStackTrace();
            }
            try {
                response.setContentType("application/json;charset=utf-8");
                response.getWriter().write(userService.updateUserInfo(info));
            } catch (IOException e) {
                e.printStackTrace();
            }

            return NONE;
        }else {
            try {
                response.setContentType("application/json;charset=utf-8");
                response.getWriter().write(userService.updateUserInfo(info));
            } catch (IOException e) {
                e.printStackTrace();
            }

            return NONE;
        }


    }

    public String getDate() {
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        String format = sdf.format(new Date());
        return format;
    }

    /**
     * 查询当前用户的所有地址
     *
     * @return
     */
    public String getAddress() {
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
     *
     * @return
     */
    public String getArea() {
        try {
            response.setContentType("application/json;charset=utf-8");
            response.getWriter().write(userService.getArea(parent_id));
        } catch (IOException e) {
            e.printStackTrace();
        }
        return NONE;
    }

    public String changePsw() throws IOException {
        User user = (User) session.get("onliner");
        if (user.getPassword().equals(MD5Util.getMD5(current_pwd)) && code.equals(session.get("mailcode"))){
            String result = userService.changePwd(new_pwd, user.getUser_id());
            session.remove("mailcode");
            response.setContentType("application/json;charset=utf-8");
            response.getWriter().write(result);
            return NONE;
        }
        response.setContentType("application/json;charset=utf-8");
        response.getWriter().write(new Gson().toJson(ResponseResult.build(501,"原密码不正确")));
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

    public int getUser_id() {
        return user_id;
    }

    public void setUser_id(int user_id) {
        this.user_id = user_id;
    }

    public UserInfo getInfo() {
        return info;
    }

    public void setInfo(UserInfo info) {
        this.info = info;
    }

    public String getNew_pwd() {
        return new_pwd;
    }

    public void setNew_pwd(String new_pwd) {
        this.new_pwd = new_pwd;
    }

    public File getImgFile() {
        return imgFile;
    }

    public void setImgFile(File imgFile) {
        this.imgFile = imgFile;
    }

    public String getImgFileContentType() {
        return imgFileContentType;
    }

    public void setImgFileContentType(String imgFileContentType) {
        this.imgFileContentType = imgFileContentType;
    }

    public String getImgFileFileName() {
        return imgFileFileName;
    }

    public void setImgFileFileName(String imgFileFileName) {
        this.imgFileFileName = imgFileFileName;
    }

    public String getCurrent_pwd() {
        return current_pwd;
    }

    public void setCurrent_pwd(String current_pwd) {
        this.current_pwd = current_pwd;
    }
}

