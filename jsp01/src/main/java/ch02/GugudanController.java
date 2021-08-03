package ch02;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/ch02_servlet/gugudan.do")
public class GugudanController extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) 
	throws ServletException, IOException{
		int number = Integer.parseInt(request.getParameter("number"));
		System.out.println(number);
		request.setAttribute("result", number);
		RequestDispatcher rd = request.getRequestDispatcher("/ch02/gugudan_result.jsp");
		rd.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) 
	throws ServletException, IOException{
		doGet(request, response);

	}
}
