package com.caibaobao.filter;

import java.io.IOException;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;


public class EncodingFilter implements Filter {

	String encoding="";
	public void destroy() {
		// TODO �Զ����ɷ������

	}

	public void doFilter(ServletRequest request, ServletResponse response,
			FilterChain chain) throws IOException, ServletException {
		// TODO �Զ����ɷ������
		request.setCharacterEncoding(encoding);
		chain.doFilter(request, response);
	}

	public void init(FilterConfig config) throws ServletException {
		// TODO �Զ����ɷ������
		encoding=config.getInitParameter("encoding");
	}

}
