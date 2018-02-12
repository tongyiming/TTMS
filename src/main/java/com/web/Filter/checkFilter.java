package com.web.Filter;

import javax.servlet.*;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * Created by Administrator on 2016/12/8 0008.
 */
public class checkFilter implements Filter {
    public void destroy() {
    }

    public void doFilter(ServletRequest req, ServletResponse resp, FilterChain chain) throws ServletException, IOException {
        String pass=(String) ((HttpServletRequest)req).getParameter("pass");
        String repass=(String) ((HttpServletRequest)req).getParameter("repass");
        if(pass!=null&&repass!=null)
        {
            if(pass.equals(repass)){
                chain.doFilter(req, resp);
            }
        }
        ((HttpServletRequest)req).getRequestDispatcher("home").forward(req,resp);
        ((HttpServletRequest)req).setAttribute("errormessage","两次密码不一致");
    }

    public void init(FilterConfig config) throws ServletException {

    }

}
