package test.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/users/logout")
public class LogoutServlet extends HttpServlet{
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		/*
		 * 특정 영역에 저장된 값을 삭제하려면 .removeAttribute(키값) 메소드를 사용하면 된다.
		 * session 영역에서 "id" 라는 키값으로 저장된 값을 삭제하려면
		 * HttpSession 객체의 참조값을 얻어와서 작업하면 된다. 
		 */
		HttpSession hs = req.getSession();
		hs.removeAttribute("id");
		
		/*
		 * 클라이언트에게 새로운 요청 경로를 주고, 요청을 다시 하라고 강요하는 것이 리다일렉트 이동이다. 
		 * 리다일렉트 이동하라고 강요하는 것 자체가 응답이 된다. 
		 */
		// /Step03_Scope/index.jsp 절대경로로 요청을 다시 하라고 클라이언트에게 응답(리다일렉트 이동)
		String cPath=req.getContextPath();
		resp.sendRedirect(cPath+"/index.jsp");
	}
}
