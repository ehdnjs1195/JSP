package test.servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/test2/fortune")
public class FortuneServlet extends HttpServlet{
	
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		//응답을 jsp 페이지 혹은 다른 서블릿으로 위임할 수 있다.
		
		//1. 응답을 위임할 이동 경로 (context path 는 넣지 않는다. why? 같은 프로젝트 내에서만(같은 context path내에서만) forward 이동이 가능하기 때문이다. 이미 context path를 포함한 것이다.)
		String path="/test2/person.jsp";
		//2. RequestDispatcher 객체의 참조값
		RequestDispatcher rd=req.getRequestDispatcher(path);	// RequestDispatcher: request 전달자 객체
		//3. 포워드 이동해서 응답한다.
		rd.forward(req, resp); 	//servlet으로 전달받었던 request나 response를 위임하는 jsp나 servlet으로 전달해준다.
		
		//최초 요청은 servlet 응답은 jsp =>응답을 위임한다. 클라이언트는 jsp 페이지의 존재를 모른다. 
		// 경로: /test2/fortune 으로 표기되있지만 /test2/person.jsp 로 응답되었다.
		
		//forward를 사용하는 이유: servlet에서는 html의 복잡한 마크업을 하기 힘들기 때문에 나머지 복잡한 기능 처리는 servlet에서 하고 응답은 jsp에 맡기겠다 그런 모습.
		//servlet은 응답을 위한 작업, jsp는 클라이언트에게 보여질 작업에 집중.(분업)
	}
}
