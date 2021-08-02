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
// single ton(�̱���)
	public static BookDAO dao;

// private ������
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
		Connection conn = null; // DB���� ��ü
		PreparedStatement pstmt = null; // SQL���ఴü
		ResultSet rs = null; // ����� ó�� ��ü
		try {
			conn = DB.dbConn();
			String sql = "select * from book";
			// SQL���ఴü ����
			pstmt = conn.prepareStatement(sql);
			// SQL ���� �� ������� rs�� ���ϵ�
			rs = pstmt.executeQuery();
			// �����.next() ���� ���ڵ尡 ������ true
			while (rs.next()) {
				BookDTO dto = new BookDTO();
				// �����.get�ڷ���("�÷�")
				dto.setId(rs.getInt("id"));
				dto.setTitle(rs.getString("title"));
				dto.setAuthor(rs.getString("author"));
				dto.setPrice(rs.getInt("price"));
				dto.setQty(rs.getInt("qty"));
				// ArrayList�� �߰�
				list.add(dto);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally { // ������ �������� �ݱ�
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