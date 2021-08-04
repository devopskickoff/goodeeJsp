package member;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import config.DB;


public class MemberDAO {
	public List<MemberDTO> memberList() {
		List<MemberDTO> list = new ArrayList<MemberDTO>();
		Connection conn = null; // DB접속
		PreparedStatement pstmt = null; // SQL 실행
		ResultSet rs = null; // select의 결과 처리
		try {
			conn = DB.dbConn();
			String sql = "select userid,passwd,name," 
						+ "to_char(reg_date,'yyyy-mm-dd') reg_date," 
						+ " address,tel"
						+ " from member" + " order by name";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while (rs.next()) { // 1개의 레코드를 읽음
				String userid = rs.getString("userid");
				String passwd = rs.getString("passwd");
				String name = rs.getString("name");
				String reg_date = rs.getString("reg_date");
				String address = rs.getString("address");
				String tel = rs.getString("tel");
				MemberDTO dto = new MemberDTO(userid, passwd, name, reg_date, address, tel);
				list.add(dto);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
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
