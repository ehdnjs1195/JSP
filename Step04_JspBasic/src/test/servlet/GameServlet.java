package test.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/test1/game")
public class GameServlet extends HttpServlet{	//1.상속 
	//2.service() 오버라이드
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		//context 경로 읽어오기
		String cPath=req.getContextPath();
		//원하는 경로로 리다일렉트 이동 시키기
		resp.sendRedirect(cPath+"/test1/study.jsp");	// 경로 리다일렉트! /test1/game -> /test1/study.jsp
	}
}
