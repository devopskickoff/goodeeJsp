package ch03;


import java.io.IOException;
import java.util.HashMap;
import java.util.Map;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/ch03_servlet/request.do")
public class RequestController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// 폼에서 사용자가 입력한 값
		request.setCharacterEncoding("utf-8");
		String name = request.getParameter("name");
		int age = Integer.parseInt(request.getParameter("age"));
		String gender = request.getParameter("gender");
		String hobby = request.getParameter("hobby");
		// 맵에 저장
		// Map<key자료형,value자료형>
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("name", name); // 변수명, 값
		map.put("age", age);
		gender = gender.equals("m") ? "남" : "여";
		map.put("gender", gender);
		map.put("hobby", hobby);
		System.out.println(map);
		// request 영역에 저장(요청페이지+응답페이지에서 공유)
		request.setAttribute("map", map);
		// 포워딩
		String page = "/ch03/request_result.jsp";
		RequestDispatcher rd = request.getRequestDispatcher(page);
		rd.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}
}
