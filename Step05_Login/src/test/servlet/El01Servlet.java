package test.servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/el01")
public class El01Servlet extends HttpServlet{

	//request.setAttribute 는 응답을 하기전 까지 저장한 데이터가 살아있다.
	//request에 영역에 담고 forward로 응답한다. why? forward로 응답을 위임하면 자기가 응답을 한 것이 아니기 때문에 데이터는 살아있다.
	//el (expression language) : ${  } 안에서 사용할 수 있는 언어 (JSP 페이지에서만 사용 됨), 
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {		
		// request 영역에 "myName" 이라는 키값으로 "김구라" 저장하기
		req.setAttribute("myName", "김구라");
		// jsp 페이지로 forward 이동 (응답을 위임하기)
		RequestDispatcher rd=req.getRequestDispatcher("/el/test01.jsp");	//request 요청전달자 객체, 어디로 전달할 건지 경로를 표시. forward 메소드를 호출해서 위임하고 test01.jsp에서 필요한 데이터를 전달하기 위해 req,resp를 전달함.
		rd.forward(req, resp);
		
	}
}

// 일단 요청 처리는 서블릿으로 하고, requset에 응답에 대해 필요한 데이터(Dto...)를 담아둔다. 응답은 jsp로 위임한다.
// 응답에 필요한 데이터 => 모델(model)

// ex)위의 응답에 필요한 데이터는 "김구라"이고 "myName" 이라는 이름으로 request에 담겨있다.
// 	  Dispatcher를 이용해 특정 경로로 전달해주고 forward 메서드를 이용해 데이터(req,resp)를 넘겨준다.
