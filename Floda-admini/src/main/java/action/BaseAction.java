package action;


import com.opensymphony.xwork2.ActionSupport;
import org.apache.struts2.interceptor.ServletRequestAware;
import org.apache.struts2.interceptor.ServletResponseAware;
import org.apache.struts2.interceptor.SessionAware;
import org.apache.struts2.util.ServletContextAware;
import org.springframework.stereotype.Controller;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.Map;

/**
 * @Auther: zayvion
 * @Date: 2019-08-03 11:30
 * @Description:所有action的基类
 */
@Controller
public class BaseAction extends ActionSupport implements ServletRequestAware, ServletResponseAware, SessionAware, ServletContextAware {

    public HttpServletRequest request;
    public HttpServletResponse response;
    public Map<String, Object> session;
    public ServletContext context;
    public final String INDEX = "index";
    public final String MAIN = "main";
    public final String CLASSIFY = "classify";
    public final String PRODUCT = "prod";
    public final String DETAIL = "detail";
    public final String SHOP = "shop";
    public final String SREACH = "search";
    public final String PAY ="pay";
    public final String CHECKOUT ="checkout";
    public final String PAYSUCCESS = "paysuccess";

    @Override
    public void setServletRequest(HttpServletRequest httpServletRequest) {
        this.request = httpServletRequest;
    }

    @Override
    public void setServletResponse(HttpServletResponse httpServletResponse) {
        this.response = httpServletResponse;
    }

    @Override
    public void setSession(Map<String, Object> map) {
        this.session = map;
    }

    @Override
    public void setServletContext(ServletContext context) {
        this.context = context;
    }

}
