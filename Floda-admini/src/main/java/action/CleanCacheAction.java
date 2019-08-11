package action;

import com.google.gson.Gson;
import dao.JedisClient;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import utils.ResponseResult;

import java.io.IOException;

/**
 * @Auther: zayvion
 * @Date: 2019-08-11 20:57
 * @Description:清除redis缓存
 */
@Controller
@Scope("prototype")
public class CleanCacheAction extends BaseAction {

    @Autowired
    private JedisClient jedisClient;

    public String cleanCache() throws IOException {
        jedisClient.cleanCache();
        response.setContentType("application/json;charset=utf-8");
        response.getWriter().write(new Gson().toJson(ResponseResult.ok()));
        return NONE;
    }
}
