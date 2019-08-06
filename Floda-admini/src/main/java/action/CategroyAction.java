package action;

import com.opensymphony.xwork2.ModelDriven;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import pojo.Categroy;
import service.CategroyService;

import java.io.IOException;

/**
 * @Auther: zayvion
 * @Date: 2019-08-05 10:15
 * @Description:商品分类action
 */
@Controller
@Scope("prototype")
public class CategroyAction extends BaseAction {
    private int id;
    private Categroy cate ;
    @Autowired
    private CategroyService categroyService;

    /**
     * 增加商品类别
     * @return json
     * @throws IOException
     */
    public String addCategroy() throws IOException {
        String result = categroyService.addCategroy(cate);
        response.setContentType("application/json;charset=utf-8");
        response.getWriter().write(result);
        return CLASSIFY;
    }

    /**
     * 获取所有类别
     * @return json
     * @throws IOException
     */
    public String getCategroies() throws IOException{
        String result = categroyService.getCategroies();
        response.setContentType("application/json;charset=utf-8");
        response.getWriter().write(result);
        return NONE;
    }

    /**
     * 修改商品类别
     * @return json
     * @throws IOException
     */
    public String updateCategroy() throws IOException{
        String result = categroyService.updateCategroy(cate);
        response.setContentType("application/json;charset=utf-8");
        response.getWriter().write(result);
        return CLASSIFY;
    }

    /**
     * 获取一个分类下的信息
     * @return json
     */
    public String getCategroy() throws IOException{
        String result = categroyService.getCategroyInfo(id);
        response.setContentType("application/json;charset=utf-8");
        response.getWriter().write(result);
        return NONE;
    }

    /**
     * 删除一个分类下的信息
     * @return json
     */
    public String delCategroy() throws IOException{
        System.out.println("传过来的id是："+id);
        String result = categroyService.delCategroy(id);
        response.setContentType("application/json;charset=utf-8");
        response.getWriter().write(result);
        return NONE;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }


    public Categroy getCate() {
        return cate;
    }

    public void setCate(Categroy cate) {
        this.cate = cate;
    }
}
