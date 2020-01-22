package test.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import test.cafe.dao.CafeDao;
import test.cafe.dto.CafeDto;
import test.controller.CafeListController;

//.nhn 으로 끝나는 모든 요청을 처리할 서블릿 정의하기
@WebServlet("*.nhn")  // .do .gura 등등 원하는 이름으로 요청을 받고 service()메서드에서 분기를 하고 기능을 적는다. => 프레임워크는 구조가 짜여져 있기 때문에 MVC 사용에 용이하다.
public class GateServlet extends HttpServlet{
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String uri=request.getRequestURI();
		//컨텍스트 경로의 길이
		String cPath=request.getContextPath();
		int cLength=cPath.length(); 
		// . 의 인덱스
		int lastIndex=uri.indexOf(".");
		//순수 요청 경로(컨텍스트 경로 제외, .nhn 제외) /cafe/list 만 얻어오겠다는 뜻
		String path=uri.substring(cLength, lastIndex);		//cLength 이상 lastIndex 미만까지 잘라와서 쓰겠다.
		
		//어디로 가고싶은지 원하는 곳으로 가도록 분기함.
		if(path.equals("/cafe/list")) {	//카페 글 목록보기 요청이라면		
			new CafeListController().execute(request, response);
			
		}else if(path.equals("/cafe/inserform")) {
			
		}
	}
}
//이게 전형적인 MVC 패턴이다. => jsp페이지를 간단하게

//이제 요청 처리마다 컨트롤러 인터페이스를 구현해서 각각의 클래스를 만든다.