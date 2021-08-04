package config;

import java.sql.Connection;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class DB {
	public static Connection dbConn() {
		DataSource ds = null;
		Connection conn = null;
		try {
			Context ctx = new InitialContext(); // context.xml 파일을 분석하는 객체 
			ds = (DataSource)ctx.lookup("java:comp/env/oraDB"); //resource 태그 조회
			conn = ds.getConnection();//커넥션을 얻음
		} catch (Exception e) {
			e.printStackTrace();
		}
		return conn; //커넥션 리턴
	}
}
