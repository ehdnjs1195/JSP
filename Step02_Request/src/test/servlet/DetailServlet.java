package test.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
/*
 *  /detail?num=1
 *  /detail?num=2
 *  /detail?num=3
 *  
 *  - 위와 같은 요청을 해 올때 아래의 서블릿에 있는 service() 메소드가 호출된다. 
 *  - ?num=x 형식으로 전달되는 것을  GET 방식 요청 파라미터 라고 한다.
 *  - 요청 파라미터는 HttpServletRequest 객체를 이용해서 추출할 수 있다.
 */

@WebServlet("/detail")	
public class DetailServlet extends HttpServlet{//index.html 에서 링크를 누르면 실행순서가 일로 들어온다.(경로를 /detail 로 지정해주었기 때문에)
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// "num" 이라는 파라미터 명으로  전달된 문자열 읽어오기
		String strNum=req.getParameter("num");	//num 가져오기.
		// 문자열을 만일 정수로 바꾸고 싶으면?
		int num=Integer.parseInt(strNum);
		
		//응답 한글 인코딩 설정 
		resp.setCharacterEncoding("utf-8");
		//응답 content type 설정 (html 페이지를 응답 하겠다고 알리기)
		resp.setContentType("text/html;charset=utf-8");
		//요청한 클라이언트에게 문자열을 출력할수 있는 객체
		PrintWriter pw=resp.getWriter();
		pw.println("<!doctype html>");
		pw.println("<html>");
		pw.println("<head>");
		pw.println("<meta charset='utf-8'/>");
		pw.println("<title>자세히 보기 페이지</title>");
		pw.println("</head>");
		pw.println("<body>");
		pw.println("<p>"+num+" 번 자세히 보기 Ok!"+"</p>");
		pw.println("</body>");
		pw.println("</html>");
		pw.close();

	}
}
/*
 * 		지마켓에서 ipad를 검색했을 때 주소창에
 *. 	/search?keyword=ipad 이런식으로 나오게 된다.
 *. 	/search?keyword=xxxx => keyword값은 xxx(value)  이때 keyword가 요청 파라미터 변수.
 * 
 * 		검색뒤 상품을 선택하면
 *. 	/Item?goodscode=xxxxxxxxx 이런식으로 나오게 된다.
 *
 *	=>어떤 파라미터이냐에 따라 다르게 하기
 */