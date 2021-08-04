package member;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/member_servlet/*")
public class MemberController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String url=request.getRequestURI();
		// 컨텍스트 패스
		String context = request.getContextPath(); 
		MemberDAO dao = new MemberDAO();
		if (url.indexOf("list.do") != -1) {
		Map<String, Object> map = new HashMap<String, Object>(); 
		List<MemberDTO> list = dao.memberList();
		// 맵에 저장
		map.put("list", list); // key,value
		map.put("count", list.size());
		request.setAttribute("map", map);
		String page = "/ch06/member_list.jsp";
		RequestDispatcher rd = request.getRequestDispatcher(page);
		rd.forward(request, response);
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
