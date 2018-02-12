package com.web.Filter;

import javax.servlet.*;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * Created by 塞上江南果 on 2016/11/9.
 */
public class homeFilter implements Filter {

    public void init(FilterConfig filterConfig) throws ServletException {

    }

    public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse, FilterChain filterChain) throws IOException, ServletException {
        HttpServletRequest req = (HttpServletRequest) servletRequest;
        String username = (String) req.getSession().getAttribute("name");
        System.out.println(username);
        if (username == null)
            ((HttpServletResponse) servletResponse).sendRedirect("/Home/home");
        filterChain.doFilter(servletRequest, servletResponse);
    }

    public void destroy() {

    }
}
