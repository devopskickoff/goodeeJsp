package member;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import config.DB;

public class MemberDAO {
	public String loginCheck(String userid, String passwd) {
		String name = null; 
		Connection conn = null; //db접속
		PreparedStatement pstmt = null;//sql실행
 		ResultSet rs = null;//레코드셋 탐색
		try {
			conn = DB.dbConn(); //db커넥션 리턴
			String sql = "select name from member where userid=? and passwd=?";
			pstmt = conn.prepareStatement(sql); //sql준비
			pstmt.setString(1, userid); //sql 실행 레코드셋의 시작번지값을 rs전달
			pstmt.setString(2, passwd);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				name = rs.getString("name");
			}
			System.out.println(name);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (rs != null) {
					rs.close();
				}
			} catch (Exception e2) {
				e2.printStackTrace();
			}
			try {
				if (pstmt != null) {
					pstmt.close();
				}
			} catch (Exception e2) {
				e2.printStackTrace();
			}
			try {
				if (conn != null) {
					conn.close();
				}
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
		return name;
	}
}
