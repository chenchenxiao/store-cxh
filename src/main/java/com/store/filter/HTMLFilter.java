package com.store.filter;

import org.beetl.core.GroupTemplate;
import org.beetl.ext.servlet.ServletGroupTemplate;
import org.beetl.ext.web.SimpleCrossFilter;

import javax.servlet.*;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * Created by 黄柏樟 on 2016/7/6.
 * @Explain: beetl 静态化filter
 */
public class HTMLFilter extends SimpleCrossFilter implements Filter {

	public void init(FilterConfig arg0) throws ServletException {


	}

	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException,
	ServletException{
		response.setContentType("text/html;charset=utf-8");
		super.doFilter(request, response, chain);
	}

	protected String getRenderPath(String path, HttpServletRequest request, HttpServletResponse response){
		String ajaxCmd = request.getParameter("ajaxCmd");
		if(ajaxCmd==null){
			return path;
		}else{
			return path+"#"+ajaxCmd;
		}

	}

	@Override
	protected GroupTemplate getGroupTemplate() {
		return ServletGroupTemplate.instance().getGroupTemplate();
	}



}