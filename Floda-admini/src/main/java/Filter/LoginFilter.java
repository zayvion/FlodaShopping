package Filter;

import com.opensymphony.xwork2.ActionInvocation;
import com.opensymphony.xwork2.interceptor.MethodFilterInterceptor;
import org.apache.struts2.ServletActionContext;
import org.springframework.stereotype.Component;
import pojo.User;

/**
 * @Auther: zayvion
 * @Date: 2019-08-13 14:20
 * @Description:登录拦截器
 */

public class LoginFilter extends MethodFilterInterceptor {
    @Override
    protected String doIntercept(ActionInvocation invocation) throws Exception {
        User online = (User) ServletActionContext.getRequest().getSession().getAttribute("onliner");
        if (online != null){
            return invocation.invoke();
        }
        ServletActionContext.getRequest().setAttribute("msg","请登录后操作");
        System.out.println("登录拦截器！");
        return "index";
    }
}
