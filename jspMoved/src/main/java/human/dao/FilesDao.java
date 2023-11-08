package human.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import human.vo.FilesVo;

public class FilesDao {
	public static String user = "jsp";
	public static String passwd = "123456";
	public static String url = "jdbc:oracle:thin:@localhost:1521:orcl";
	
	public static Connection conn = null;
	public static Statement stmt = null;
	public static PreparedStatement pstmt = null;
	public static PreparedStatement pstmt2 = null;
	public static ResultSet rs = null;
	
	public void getConnect() {
		
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			conn = DriverManager.getConnection(url, user, passwd);			
		}catch(Exception e) {
			System.out.println("오라클 접속 에러: " + e.getMessage());
		}
	}
	
	public void closeConn() {
		try {
			if(conn!=null) conn.close();
			if(stmt!=null) stmt.close();
			if(rs!=null) rs.close();
			if(pstmt!=null) pstmt.close();
			if(pstmt2!=null) pstmt2.close();
		}catch(SQLException se) {
			System.out.println("오라클 접속 해제: " + se.getMessage());
		}
	}
	
	// 첨부파일 정보 가져오기
		public FilesVo readFilesByNo(String no) {
			System.out.println("첨부파일 정보 가져오기");
			FilesVo fvo = new FilesVo();
			
			
			getConnect();
			
			try {
				String sql = "SELECT no, filename, bno FROM BO_NOTICE_FILE WHERE bno=?";
				pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, Integer.valueOf(no));
				rs = pstmt.executeQuery();
				while(rs.next()) {
					fvo.setNo( rs.getInt("no"));
					fvo.setFilename(rs.getString("filename")); 
					fvo.setBno(rs.getInt("bno")); 
				}
				
			}catch(SQLException se) {
				System.out.println("readFilesByNo 쿼리에러:" + se.getMessage());
			}finally {
				closeConn();
			}
			
			return fvo;
		}
}
