package practice;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/practice/AgeController.do")
public class AgeController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		String name = request.getParameter("name");
		int year = Integer.parseInt(request.getParameter("year"));
		request.setAttribute("name", name);
		request.setAttribute("year", 2021-year);
		
		RequestDispatcher rd = request.getRequestDispatcher("/practice/ageOutput.jsp");
		rd.forward(request, response);
				
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
