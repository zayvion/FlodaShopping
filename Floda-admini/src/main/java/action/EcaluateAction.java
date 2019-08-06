package action;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import service.EcaluateService;

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

    /**
     * 获取所有评论
     * @return json
     * @throws IOException
     */
    public String getEcaluates() throws IOException{
        String result = ecaluateService.getEcaluates();
        response.setContentType("application/json;charset=utf-8");
        response.getWriter().write(result);
        return NONE;
    }
}
