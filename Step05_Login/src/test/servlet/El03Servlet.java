package test.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/el03")
public class El03Servlet extends HttpServlet{

	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		//세션 영역에 String type 담기
		HttpSession session=req.getSession();	//세션 객체 얻어오기
		session.setAttribute("myNick", "호빵맨");
		//jsp 페이지로 리다일렉트 이동하기(포워드도 살아있고 리다일렉트도 살아있다)
		String cPath=req.getContextPath();
		resp.sendRedirect(cPath+"/el/test03.jsp"); //절대경로로 적어준다.
	}
}
