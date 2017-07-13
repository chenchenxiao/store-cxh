package com.store.interceptors;

import com.store.been.AjaxResult;
import com.store.model.User;
import com.store.util.FileUploadUtil;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.List;

/**
 * Created by 陈晓海 on 2017/6/6.
 */
public class LoginInteceptor implements HandlerInterceptor {

    private List<String> excludeUrls;

    public void setExcludeUrls(List<String> excludeUrls) {
        this.excludeUrls = excludeUrls;
    }

    public void postHandle(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, Object o, ModelAndView modelAndView) throws Exception {

    }

    public void afterCompletion(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, Object o, Exception e) throws Exception {

    }

    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object o) throws Exception {
        String requestUrl = request.getRequestURI();
        String contextPath = request.getContextPath();
        String url = requestUrl.substring(contextPath.length());
        String filePath = request.getSession().getServletContext()+ FileUploadUtil.USER_PATH;
        System.out.println(filePath);
        if(excludeUrls.contains(url)){
            System.out.println(url);
            System.out.println("通过了拦截器");
            return true;
        }else {
            User loginUser = (User) request.getSession().getAttribute("loginUser");
            System.out.println(url);
            System.out.println("user-->" + loginUser);
            if (loginUser != null && loginUser.getName() != null && !loginUser.getName().equals("")) {
                return true;
            } else {
                System.out.println("loginUser-->" + loginUser);
                System.out.println("未通过拦截器");
                request.setAttribute("result", new AjaxResult(false, "您还没有登录或登录超时，请重新登录"));
                request.getRequestDispatcher("/admin/user/loginUI.jsp").forward(request,response);
                return false;
            }
        }
    }
}
