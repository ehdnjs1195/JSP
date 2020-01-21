package test.servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import test.users.dto.UsersDto;

@WebServlet("/el02")
public class El02Servlet extends HttpServlet{

	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		UsersDto dto=new UsersDto();
		dto.setId("kimgura");
		dto.setEmail("aaa@naver.com");
		//request 영역에 dto 담기
		req.setAttribute("dto", dto);
		//jsp 페이지로 forward 이동
		RequestDispatcher rd=req.getRequestDispatcher("/el/test02.jsp");	//주의) forward 이동은 context 경로를 쓰지 않는다. why? 동일한 context 내에서만 forward 이동이 가능하다. 즉, 동일한 프로젝트 내에서만 사용이 가능하다.
		rd.forward(req, resp);
	}
}
