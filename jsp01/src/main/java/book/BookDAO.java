package book;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;
import config.DB;

public class BookDAO {
// single ton(싱글톤)
	public static BookDAO dao;

// private 생성자
	private BookDAO() {
	}

	public static BookDAO getDao() {
		if (dao == null) {
			dao = new BookDAO();
		}
		return dao;
	}

	public ArrayList<BookDTO> bookList() {
		ArrayList<BookDTO>list = new ArrayList<BookDTO>(); 
		Connection conn = null; // DB접속 객체
		PreparedStatement pstmt = null; // SQL실행객체
		ResultSet rs = null; // 결과셋 처리 객체
		try {
			conn = DB.dbConn();
			String sql = "select * from book";
			// SQL실행객체 생성
			pstmt = conn.prepareStatement(sql);
			// SQL 실행 후 결과셋이 rs에 리턴됨
			rs = pstmt.executeQuery();
			// 결과셋.next() 다음 레코드가 있으면 true
			while (rs.next()) {
				BookDTO dto = new BookDTO();
				// 결과셋.get자료형("컬럼")
				dto.setId(rs.getInt("id"));
				dto.setTitle(rs.getString("title"));
				dto.setAuthor(rs.getString("author"));
				dto.setPrice(rs.getInt("price"));
				dto.setQty(rs.getInt("qty"));
				// ArrayList에 추가
				list.add(dto);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally { // 오픈한 역순으로 닫기
			// ResultSet => Statement => Connection
			try {
				if (rs != null)
					rs.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
			try {
				if (pstmt != null)
					pstmt.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
			try {
				if (conn != null)
					conn.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
	return list;
	}
}