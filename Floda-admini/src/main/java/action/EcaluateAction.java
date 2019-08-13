package action;

import com.google.gson.Gson;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import pojo.Ecaluate;
import service.EcaluateService;
import utils.ResponseResult;

import java.io.IOException;

/**
 * @Auther: zwf97
 * @Date: 2019/8/6 14:11
 * @Description:查看评论
 */
@Controller
@Scope("prototype")
public class EcaluateAction extends BaseAction {

    @Autowired
    private EcaluateService ecaluateService;
    private Ecaluate ecaluate;

    /**
     * 获取所有评论
     *
     * @return json
     * @throws IOException
     */
    public String getEcaluates() throws IOException {
        String result = ecaluateService.getEcaluates();
        response.setContentType("application/json;charset=utf-8");
        response.getWriter().write(result);
        return NONE;
    }

    public String addEcaluate() throws IOException {
        try {
            ecaluateService.addEcaluate(ecaluate);
            response.setContentType("application/json;charset=utf-8");
            response.getWriter().write(new Gson().toJson(new ResponseResult().ok()));
        } catch (Exception e) {
            e.printStackTrace();
        }
        response.setContentType("application/json;charset=utf-8");
        response.getWriter().write(new Gson().toJson(new ResponseResult().build(500,"添加失败")));
        return NONE;
    }

    public Ecaluate getEcaluate() {
        return ecaluate;
    }

    public void setEcaluate(Ecaluate ecaluate) {
        this.ecaluate = ecaluate;
    }
}
