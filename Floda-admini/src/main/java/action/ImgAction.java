package action;


import com.google.gson.Gson;
import dao.ImgDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import utils.ResponseResult;

import java.io.IOException;

/**
 * @Auther: zayvion
 * @Date: 2019-08-06 14:18
 * @Description:图片Action
 */
@Controller
@Scope("prototype")
public class ImgAction extends BaseAction {
    @Autowired
    private ImgDao imgDao;
    private int id;

    public String getImgUrl() throws IOException {
        if (id == 0){
            String result = ResponseResult.build(500, "id为0");
            response.setContentType("application/json;charset=utf-8");
            response.getWriter().write(result);
            return NONE;
        }
        String imgUrl = imgDao.getImgUrl(id);
        response.setContentType("application/json;charset=utf-8");
        response.getWriter().write(new Gson().toJson(imgUrl));
        return NONE;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }
}
