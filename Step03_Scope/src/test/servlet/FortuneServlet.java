package test.servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

//웹브라우저가 요청하는 경로를 context 경로를 빼고 적는다.
@WebServlet("/*")
public class FortuneServlet extends HttpServlet{
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String fortuneToday="학업에 전념하십시오.";
		/*
		 * 오늘의 운세를 클라이언트에게 응답해야 한다. 
		 * html 형식으로 응답하려고 하니, 서블릿이라서 불편하다. 
		 * html 형식의 문자열을 전문적으로 응답하는 애를 쓰자. 
		 * jsp 페이지한테 대신 html형식의 문자열을 응답 (응답을 위임)해달라고 해야겠다. 
		 * 
		 * ... 요청완료...
		 * 아 오늘의 운세는 안 전달했네... 
		 * request 영역에 foretuneToday라는 키값으로 넣어둘테니 잘 빼다 쓰렴
		 */
		//request영역에 foretuneToday 라는 키값으로 String type 저장하기
		req.setAttribute("fortuneToday", fortuneToday);
		//응답을 위임할 jsp 페이지의 위치를 전달하면서 RequestDispatcher 객체의 참조값을 얻어온다. 
		RequestDispatcher rd=req.getRequestDispatcher("/test/fortune.jsp");
		//.forward(요청객체,응답객체)를 호출해서 대신 응답해 달라고 부탁한다. 
		rd.forward(req, resp);
	}
}
