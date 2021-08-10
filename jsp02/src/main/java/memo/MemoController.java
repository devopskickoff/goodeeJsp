package memo;

import java.io.IOException;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import memo.dao.MemoDAO;
import memo.dto.MemoDTO;

@WebServlet("/memo_servlet/*")
public class MemoController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		MemoDAO dao = new MemoDAO();
		String url = request.getRequestURL().toString();
		if (url.indexOf("insert.do") != -1) {
			String writer = request.getParameter("writer");
			String memo = request.getParameter("memo");
			dao.insertMemo(new MemoDTO(writer, memo));
		} else if (url.indexOf("list.do") != -1) {
			String searchkey = request.getParameter("searchkey");
			if (searchkey == null || searchkey.equals(""))
				searchkey = "writer";
			String search = request.getParameter("search");
			if (search == null)
				search = "";
			List<MemoDTO> list = dao.listMemo(searchkey, search);
			request.setAttribute("list", list);
			request.setAttribute("searchkey", searchkey);
			request.setAttribute("search", search);
			String page = "/memo/memo_list.jsp";
			RequestDispatcher rd = request.getRequestDispatcher(page);
			rd.forward(request, response);
		} else if (url.indexOf("view.do") != -1) {
// request parameter 받아오기
			int idx = Integer.parseInt(request.getParameter("idx"));
// dao method 호출
			MemoDTO dto = dao.viewMemo(idx);
// forwarding
			request.setAttribute("dto", dto);
			String page = "/memo/memo_view.jsp";
			RequestDispatcher rd = request.getRequestDispatcher(page);
			rd.forward(request, response);
		} else if (url.indexOf("del.do") != -1) {
			int idx = Integer.parseInt(request.getParameter("idx"));
			dao.deleteMemo(idx);
// ajax 페이지로 이동
			response.sendRedirect(request.getContextPath() + "/memo/memo.jsp");
		} else if (url.indexOf("delete_all.do") != -1) {
// 체크한 체크박스값만 넘어옴
			String[] idx = request.getParameterValues("idx");
			if (idx != null) {
				for (int i = 0; i < idx.length; i++) {
// System.out.println(idx[i]);
					dao.deleteMemo(Integer.parseInt(idx[i]));
				}
			}
// ajax 페이지로 이동
			response.sendRedirect(request.getContextPath() + "/memo/memo.jsp");
		} else if (url.indexOf("update.do") != -1) {
// 폼 데이터 받아오기
			int idx = Integer.parseInt(request.getParameter("idx"));
			String writer = request.getParameter("writer");
			String memo = request.getParameter("memo");
// dao 호출
			MemoDTO dto = new MemoDTO();
			dto.setIdx(idx);
			dto.setWriter(writer);
			dto.setMemo(memo);
			dao.updateMemo(dto);
// ajax 페이지로 이동
			response.sendRedirect(request.getContextPath() + "/memo/memo.jsp");
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}
}