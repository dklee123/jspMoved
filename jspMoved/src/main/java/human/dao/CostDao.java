package human.dao;
import human.vo.*;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

public class CostDao {
	public static String user = "jsp";
	public static String passwd = "123456";
	public static String url = "jdbc:oracle:thin:@localhost:1521:orcl";
	
	public static Connection conn = null;
	public static Statement stmt = null;
	public static PreparedStatement pstmt = null;
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
		}catch(SQLException se) {
			System.out.println("오라클 접속 해제: " + se.getMessage());
		}
	}
	
	// 게시판 전체 목록 가져오기
	public ArrayList<CostVo> getCostListAll(String curPage) {
		
		System.out.println("게시판 전체 목록 가져오기");
		
		ArrayList<CostVo> costList = new ArrayList<CostVo>();
		
		getConnect();
		
		try {
			String sql = "SELECT * FROM Goods";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				CostVo tempvo = new CostVo();
				
				tempvo.setName(rs.getString("name"));
				tempvo.setPrice(rs.getInt("price"));
				
				costList.add(tempvo);
			}	
		}catch(SQLException se) {
			System.out.println("getBoardListAll 쿼리 에러:" + se.getMessage());		
		}
		
		closeConn();
		
		return costList;
	}
    
//	가격 업데이트
	
	public int updatePrice(CostVo costvo) {
		System.out.println("사용자 정보를 수정");
		int rst = 0;
		
		getConnect();
		
		try {
			String sql = "UPDATE goods SET price=? WHERE name=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, costvo.getPrice());
			pstmt.setString(2, costvo.getName());

			rst = pstmt.executeUpdate();
		}catch(SQLException se) {
			System.out.println("updatePrice 쿼리 에러:" + se.getMessage());
		}
		
		closeConn();
		return rst;
	}



    public int calTotPage() {
        return 0;
    }	
}
















