package survey;

import java.io.IOException;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import survey.dao.SurveyDAO;
import survey.dto.SurveyDTO;

@WebServlet("/survey_servlet/*")
public class SurveyController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String path = request.getContextPath();
		String url = request.getRequestURI();
		SurveyDAO dao = new SurveyDAO();
		if (url.indexOf("input.do") != -1) {
			SurveyDTO dto = dao.viewQuestion(1); // 1번 문제 불러오기
			System.out.println("dto:" + dto);
			request.setAttribute("dto", dto);
			RequestDispatcher rd = request.getRequestDispatcher("/survey/survey_input.jsp");
			rd.forward(request, response);
			
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}
}