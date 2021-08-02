package ch01;

import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/ch01_servlet/while.do")
public class WhileController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		int number = Integer.parseInt(request.getParameter("number")); // 폼의 입력값을 숫자로 변환
		int num = Integer.parseInt(request.getParameter("num"));
		int result = 1;
		for (int i = 1; i <= num; i++) {
			result *= number;
		}
		System.out.println("결과:" + result);
// 저장
		request.setAttribute("result", result);
		RequestDispatcher rd = request.getRequestDispatcher("/ch01/while_result.jsp");
		System.out.println(response);
		rd.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}
}