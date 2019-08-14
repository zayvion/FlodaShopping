package Filter;

import javax.servlet.*;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * @Auther: zayvion
 * @Date: 2019-08-13 14:20
 * @Description:登录过滤器
 */

public class LoginFilter implements Filter {


    @Override
    public void init(FilterConfig filterConfig) throws ServletException {

    }

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
        HttpServletRequest httpRequest = (HttpServletRequest)request;
        HttpServletResponse httpResponse = (HttpServletResponse)response;
        Object flag = httpRequest.getSession().getAttribute("onliner");
        if (flag != null){
            chain.doFilter(request,response);
        }else {
            httpResponse.sendRedirect("http://localhost:8080/login.jsp");
        }

    }

    @Override
    public void destroy() {

    }
}
