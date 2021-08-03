package ch03;

import java.io.IOException;
import java.net.URLEncoder;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import member.MemberDAO;

/**
 * Servlet implementation class LoginController
 */
@WebServlet("/ch03_servlet/*")
public class LoginController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */


	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String url = request.getRequestURL().toString();
		if(url.indexOf("login.do")!=-1) {
			String id = request.getParameter("id");
			String pass = request.getParameter("pass");
			MemberDAO dao = new MemberDAO();
			String name = dao.loginCheck(id, pass);
			String message = "";
			String page="";
			if(name!=null) {
				message = name+"님 환영합니다";
				page = "/ch03/login_success.jsp";
				HttpSession session = request.getSession();
				session.setAttribute("userid", id);
				session.setAttribute("message", message);
			} else {
				message = "아이디 또는 비밀번호가 일치하지 않습니다";
				page = "/ch03/login.jsp?message="+ URLEncoder.encode(message,"utf-8");
			}
			System.out.println(message);
			response.sendRedirect(request.getContextPath() + page);
		} else if (url.indexOf("logout.do") != -1) {
			// 세션 객체 생성
			HttpSession session = request.getSession();
			// 사용자의 세션을 초기화시킴
			session.invalidate();
			String message = "로그아웃되었습니다.";
			// 로그인 페이지로 이동
			response.sendRedirect( request.getContextPath() + "/ch03/login.jsp?message=" + URLEncoder.encode(message, "utf-8"));
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
