package config;

import java.io.IOException;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;

/**
 * Servlet Filter implementation class Encodingfilter
 */
@WebFilter("/*")
public class Encodingfilter implements Filter {
//	필터: 선처리 작업을 하고싶을 때 들리는 클래스 / 어떤 요청이 있을때 가장 먼저 지나가는 클래스  
	private String charset="utf-8";
    /**
     * Default constructor. 
     */
    public Encodingfilter() {
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see Filter#destroy()
	 */
    //필터제거
	public void destroy() {
		System.out.println("필터종료");
	}

	/**
	 * @see Filter#doFilter(ServletRequest, ServletResponse, FilterChain)
	 */
	
	//필터실행
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
		// TODO Auto-generated method stub
		// place your code here
		request.setCharacterEncoding(charset);
		
		// pass the request along the filter chain
		// 필터가 끝나고 실제 액션으로 넘어간다
		chain.doFilter(request, response);
	}

	/**
	 * @see Filter#init(FilterConfig)
	 */
	//필터초기화
	public void init(FilterConfig fConfig) throws ServletException {
		// TODO Auto-generated method stub
		System.out.println("필터초기화");
	}

}
