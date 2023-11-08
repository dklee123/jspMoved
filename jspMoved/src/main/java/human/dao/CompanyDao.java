package human.dao;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import human.vo.CompanyVo;



// 회원테이블에 접속하는 기능
public class CompanyDao {
		
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
			System.out.println("오라클접속에러: " + e.getMessage());
		}
	}
	
	public void closeConn() {
		try {
			if(conn!=null) conn.close();
			if(stmt!=null) conn.close();
			if(rs!=null) conn.close();
			if(pstmt!=null) conn.close();
		}catch(SQLException se) {
			System.out.println("오라클닫기에게: " + se.getMessage());
		}
	}
	
	// 게시판 전체 목록 가져오기
	public ArrayList<CompanyVo> getBoardListAll(String curPage) {
		
		System.out.println("게시판 전체 목록 가져오기");
		
		ArrayList<CompanyVo> companyList = new ArrayList<CompanyVo>();
		
		getConnect();
		
		try {
			String sql = "SELECT * FROM company";
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
			while(rs.next()) {
				CompanyVo tempvo = new CompanyVo();
				
				tempvo.setId(rs.getString("id"));		
				tempvo.setPwd(rs.getString("pwd"));
				tempvo.setName( rs.getString("name"));
				tempvo.setCompanyname(rs.getString("companyname"));
				tempvo.setEmail( rs.getString("email"));
				tempvo.setPhone( rs.getString("phone"));
				
				companyList.add(tempvo);
			}	
		}catch(SQLException se) {
			System.out.println("getBoardListAll 쿼리에러:" + se.getMessage());		
		}
		
		closeConn();
		
		return companyList;
	}
	
	
	
	public void listCompanyAll() {
		
		System.out.println("회원목록을 가져옴");
		
		getConnect();
		
		closeConn();
	}
	
	public int getCompanyCount() {
		
		System.out.println("회원 목록 수를 가져옴");
		int rst = 0;
		
		getConnect();
		try {
			String sql = "SELECT COUNT(*) AS CNT FROM company";
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
			while(rs.next()) {
				rst = rs.getInt("CNT");
			}
		}catch(SQLException se) {
			System.out.println("getCompanyCount 쿼리에러: " + se.getMessage());
		}
		
		closeConn();
		return rst;
	}
	
	// 회원정보를 저장하는 함수
	public int regCompany(String id, String pw, String name, String companyname, String email, String tel) {
		
		System.out.println("회원 정보를 저장함");
		int rst = 0;
		
		getConnect();
		
		try {
			String sql = "INSERT INTO company(id, pwd, name, companyname, email, phone) VALUES(?,?,?,?,?,?)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setString(2, pw);
			pstmt.setString(3, name);
			pstmt.setString(4, companyname);
			pstmt.setString(5, email);
			pstmt.setString(6, tel);
			rst = pstmt.executeUpdate();
			
		}catch(SQLException se) {
			System.out.println("regCompany 쿼리에러" + se.getMessage());
		}
		
		closeConn();
		
		return rst;
		
	}
	public int loginCheck(String id, String pw) {
		
		System.out.println("회원 정보 인증함");
		int rst = 0; // 1이면 로그인성공, 0이면 로그인 실패
		
		getConnect();
		
		try {
			String sql = "SELECT COUNT(*) CNT FROM company WHERE id=? AND pwd=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setString(2, pw);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				rst = rs.getInt("CNT");
			}
		}catch(SQLException se) {
			System.out.println("loginCheck 쿼리에러:" + se.getMessage());
		}
		
		closeConn();
		return rst;	
	}
	
	// loginCheck 오버로딩 함수
	public int loginCheck(CompanyVo tempvo) {
		
		System.out.println("회원 정보 인증함");
		int rst = 0;
		
		getConnect();
		
		try {
			String sql = "SELECT COUNT(*) CNT FROM company WHERE id=? AND pwd=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, tempvo.getId());
			pstmt.setString(2, tempvo.getPwd());
			rs = pstmt.executeQuery();
			while(rs.next()) {
				rst = rs.getInt("CNT");
			}
		}catch(SQLException se) {
			System.out.println("loginCheck 쿼리에러:" + se.getMessage());
		}
		
		closeConn();
		return rst;	
	}
	
	
	// 아이디 중복체크
	public int isExistId(String id) {
		System.out.println("아이디 중복체크");
		int rst = 0;
		getConnect();
		
		try {
			String sql = "SELECT COUNT(*) AS CNT FROM company WHERE id=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				rst = rs.getInt("CNT");
			}
		}catch(SQLException se) {
			System.out.println("isExistId 쿼리에러:" + se.getMessage());
		}
		
		closeConn();
		return rst;
	}
	
	// 아이디로 사용자 정보 검색
	public CompanyVo getMemberById(String id) {
		System.out.println("아이디로 사용자 정보 검색");
		CompanyVo rstvo = new CompanyVo();
		
		getConnect();
		
		try {
			String sql = "SELECT * FROM company WHERE id=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				rstvo.setName(rs.getString("name"));
				rstvo.setCompanyname(rs.getString("companyname"));
				
				System.out.println(rstvo.getCompanyname());
				
				rstvo.setEmail(rs.getString("email"));
				rstvo.setPhone(rs.getString("phone"));
			}
		}catch(SQLException se) {
			System.out.println("isExistId 쿼리에러:" + se.getMessage());
		}
		
		closeConn();
		return rstvo;
	}
	
	// 사용자 정보를 수정
	public int modifyCompany(CompanyVo tempvo) {
		System.out.println("사용자 정보를 수정");
		int rst = 0;
		
		getConnect();
		
		try {
			String sql = "UPDATE company SET name=?, email=?, phone=? WHERE id=? AND pwd=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, tempvo.getName());
			pstmt.setString(2, tempvo.getEmail());
			pstmt.setString(3, tempvo.getPhone());
			pstmt.setString(4, tempvo.getId());
			pstmt.setString(5, tempvo.getPwd());
			rst = pstmt.executeUpdate();
		}catch(SQLException se) {
			System.out.println("modifyCompany 쿼리에러:" + se.getMessage());
		}
		
		closeConn();
		return rst;
	}
}






