package com.ysk.interceptor;

import org.springframework.web.servlet.HandlerInterceptor;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class MyInterceptor implements HandlerInterceptor {
    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        System.out.println("MyInterceptor.preHandle()-------------------------");
        HttpSession session = request.getSession();
        Object loginUser = session.getAttribute("userSession");
        if(loginUser == null) {
            request.getRequestDispatcher("/user/toLogin").forward(request, response);
            return false;
        }
        return true;
    }
}
