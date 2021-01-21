package com.kh.vef.common.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;

import com.kh.vef.common.wrapper.EncryptWrapper;

@WebFilter(filterName = "EncryptFilter", servletNames = { "login", "enroll", "updatePwd", "delete" })
public class EncyptFilter implements Filter {

    public EncyptFilter() {
    }

	public void destroy() {
	}

	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
		// request의 파라미터 값을 변경할 수 없기 때문에 RequestWrapper를 생성한다.
		System.out.println((ServletRequest)request);
		EncryptWrapper wrapper = new EncryptWrapper((HttpServletRequest)request);
		
		// request 대신에 생성한 wrapper 객체를 넘겨준다.
		chain.doFilter(wrapper, response);
	}

	public void init(FilterConfig fConfig) throws ServletException {
	}

}
