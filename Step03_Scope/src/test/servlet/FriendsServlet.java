package test.servlet;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/friends")
public class FriendsServlet extends HttpServlet{
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		//친구 목록을 db에서 불러오는 비즈니스 로직을 수행한다.
		List<String> names=new ArrayList<>();
		names.add("온유");
		names.add("민호");
		names.add("키");
		names.add("태민");
		//위의 데이터를 DB에서 불러온 데이터라고 가정한다. 
		
		//"names"라는 키값으로 List<String> type 담기
		req.setAttribute("names", names);
		
		// /test/friends.jsp 페이지로 응답을 위임하기 (forward 이동)
		RequestDispatcher rd=req.getRequestDispatcher("/test/friends.jsp");
		rd.forward(req, resp);
		
	}
}
