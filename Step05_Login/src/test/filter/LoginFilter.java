package test.filter;

import java.io.IOException;
import java.net.URLEncoder;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebFilter(value = {"/shop/*", "/users/private/*"})	// value 기능을 이용하여	shop하위의 모든 요청, private 하위 모든 요청에 대해서 필터링
public class LoginFilter implements Filter{

	@Override
	public void destroy() {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void doFilter(ServletRequest req, ServletResponse res, FilterChain chain)
			throws IOException, ServletException {
		/*
		 *  로그인 여부를 확인하려면 HttpSession 객체가 필요하다.
		 *  HttpSession 객체는 HttpServletRequest 객체의 메소드를 
		 *  이용해서 참조값을 얻어낼 수 있으므로 ServletRequest 객체를
		 *  원래 type 인 HttpServletRequest type 으로 캐스팅한다.
		 */
		//1. HttpServletRequest type 얻어내기
		HttpServletRequest request=(HttpServletRequest)req;	//req는 부모타입 이기때문에 getSession()이 없다. 따라서 캐스팅.
		//2. HttpSession type 얻어내기
		HttpSession session=request.getSession();		//session 으로 getAttribute 해봐야 로그인 되어있는지 아닌지를 알 수 있다.
		//3. 세션에 "id"라는 키값으로 저장된 문자열이 있는지 읽어와 본다.
		String id=(String)session.getAttribute("id");
		if(id !=null) {//로그인 된 상태
			//관여하지 않고 요청의 흐름 계속 진행 시키기.
			chain.doFilter(req, res);
		}else {//로그인 안 된 상태
			/*
			 * 	로그인 후에 원래 가려던 목적지로 다시 보내야 하고
			 *  전송되던 파라미터가 있다면 파라미터 정보도 같이 넘겨줘야 한다.
			 */
			// 원래 가려던 url 정보 읽어오기
			String url=request.getRequestURI();		//여기서는 /Step05_Login/shop/buy.jsp 이다.
			// GET 방식 파라미터 문자열 있으면 읽어오기 (num=1&name=coffee... 쿼리문자열) 쿼리문자열: 전달되는 파라미터 값
			String query=request.getQueryString();
			// 원래목적지?num=1&name=coffee 형식의 인코딩된 문자열 구성하기
			String encodedUrl=null;
			if(query==null) {
				encodedUrl=URLEncoder.encode(url);
			}else {
				encodedUrl=URLEncoder.encode(url+"?"+query);
			}
			
			HttpServletResponse response=(HttpServletResponse)res;
			String cPath=request.getContextPath();
			//로그인 폼으로 리다일렉트 시킨다.
			response.sendRedirect(cPath+"/users/loginform.jsp?url="+encodedUrl);	//파라미터로 url을 들고갈 때는 인코딩을 해서 가져간다! URL에는 여러가지 규칙이 있고 그 규칙에 사용되는 문자들이 정해져있기 때문에 특정한 값들은 규칙에 맞게 변환되어야 합니다.
		}
		
	}

	@Override
	public void init(FilterConfig filterConfig) throws ServletException {
		// TODO Auto-generated method stub
		
	}
	
}
