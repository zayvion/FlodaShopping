package action;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

/**
 * @Auther: zayvion
 * @Date: 2019-08-07 14:07
 * @Description:前台商品相关action
 */
@Controller
@Scope("prototype")
public class ProductAction extends BaseAction {

    public String productDetail(){
        return DETAIL;
    }
}
