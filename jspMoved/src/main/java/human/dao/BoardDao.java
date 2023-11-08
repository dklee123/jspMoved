package human.dao;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import human.vo.BoardVo;

public class BoardDao {
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
	
	// 게시판 전체 목록 가져오기
	public ArrayList<BoardVo> getBoardListAll(String curPage) {
		
		System.out.println("게시판 전체 목록 가져오기");
		
		ArrayList<BoardVo> boardList = new ArrayList<BoardVo>();
		
		getConnect();
		
		try {
			String sql = "SELECT no, category, subject, writer, TO_CHAR(regdate, 'yyyy-MM-DD') as regdate, hit FROM bo_notice ORDER BY no DESC OFFSET 10*(?-1) ROWS FETCH NEXT 10 ROWS ONLY";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, Integer.valueOf(curPage));
			rs = pstmt.executeQuery();
			while(rs.next()) {
				BoardVo tempvo = new BoardVo();
				tempvo.setNo(rs.getInt("no"));
				tempvo.setCategory(rs.getString("category"));
				tempvo.setSubject(rs.getString("subject"));
				tempvo.setWriter(rs.getString("writer"));
				tempvo.setRegdate(rs.getString("regdate"));
				tempvo.setHit( rs.getInt("hit"));
				
				boardList.add(tempvo);
			}	
		}catch(SQLException se) {
			System.out.println("getBoardListAll 쿼리에러:" + se.getMessage());		
		}
		
		closeConn();
		
		return boardList;
	}
	
	// 게시판 글을 등록하기
	public int regBoard(BoardVo tempvo) {
		
		System.out.println("게시판 전체 목록 가져오기");
		int rst = 0;
		int rst2 = 0;
		
		getConnect();
		
		try {
			String sql = "INSERT INTO BO_NOTICE (no, groupno, category, id, writer, subject, content) VALUES(BO_NOTICE_SEQ.NEXTVAL, BO_NOTICE_SEQ.CURRVAL,  ?,?,?,?,?)";
			conn.setAutoCommit(false);
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, tempvo.getCategory());
			pstmt.setString(2, tempvo.getId());
			pstmt.setString(3, tempvo.getWriter());
			pstmt.setString(4, tempvo.getSubject());
			pstmt.setString(5, tempvo.getContent());
			rst = pstmt.executeUpdate();
			
			if(tempvo.getFilename()!=null) {
				String sql2 = "INSERT INTO BO_NOTICE_FILE (no, filename, bno) VALUES (BO_NOTICE_FILE_SEQ.NEXTVAL, ?, BO_NOTICE_SEQ.CURRVAL)";
				pstmt2 = conn.prepareStatement(sql2);
				pstmt2.setString(1, tempvo.getFilename());
				rst2 = pstmt2.executeUpdate();
			}
			
			conn.commit();
			
			
		}catch(SQLException se) {
			System.out.println("regBoard 쿼리에러:" + se.getMessage());
			try {
				if(conn!=null) {
					conn.rollback();
				}
			}catch(Exception e) {
				System.out.println("regBoard 롤백에러:" + e.getMessage());	
			}
		}finally {
			closeConn();
		}
		

		return (rst+rst2);
	}
	
	// 글읽기 정보 가져오기
	public BoardVo readBoardByNo(String no) {
		System.out.println("글읽기 정보 가져오기");
		BoardVo rst = new BoardVo();
		
		getConnect();
		
		try {
			String sql = "SELECT no, writer, email, hp, category, subject, content, hit, TO_CHAR(regdate, 'yyyy-MM-DD') as regdate FROM BO_NOTICE WHERE no=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, Integer.valueOf(no));
			rs = pstmt.executeQuery();
			while(rs.next()) {
				rst.setNo(rs.getInt("no"));
				rst.setWriter(rs.getString("writer")); 
				rst.setEmail(rs.getString("email")); 
				rst.setHp(rs.getString("hp")); 
				rst.setCategory(rs.getString("category")); 
				rst.setSubject(rs.getString("subject")); 
				rst.setContent(rs.getString("content")); 
				rst.setWriter(rs.getString("writer")); 
				rst.setHit(rs.getInt("hit")); 
				rst.setRegdate(rs.getString("regdate")); 
			}
			
			// 조회수를 업데이트 하는 쿼리
			String sql2 = "UPDATE BO_NOTICE SET hit = hit+1 WHERE no=?";
			pstmt2 = conn.prepareStatement(sql2);
			pstmt2.setInt(1, Integer.valueOf(no));
			pstmt2.executeUpdate();
			
			
		}catch(SQLException se) {
			System.out.println("readBoardByNo 쿼리에러:" + se.getMessage());
		}finally {
			closeConn();
		}
		
		return rst;
	}
	
	// 게시글을 삭제하기
	public int delBoardByNo(String no) {
		System.out.println("게시글을 삭제하기");
		int rst = 0;
		int rst2 = 0;
		
		try {
			getConnect();
			
			conn.setAutoCommit(false); 
			String sql = "DELETE FROM BO_NOTICE WHERE no=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, Integer.valueOf(no)); 
			rst = pstmt.executeUpdate(); 
			
			String sql2 = "DELETE FROM BO_NOTICE_FILE WHERE no=?";
			pstmt2 = conn.prepareStatement(sql2);
			pstmt2.setInt(1, Integer.valueOf(no)); 
			rst2 = pstmt2.executeUpdate();			
			
			conn.commit();
		}catch(SQLException se) {
			System.out.println("delBoardByNo 쿼리에러:" + se.getMessage());
			try {
				conn.rollback();
			}catch(Exception e) {
				System.out.println("롤백 에러:" + e.getMessage());				
			}
		}finally {
			closeConn();
		}
		
		return rst+rst2; 
	}
	
	// 게시글 총 페이지 갯수 계산하기
	public int calTotPage() {
		System.out.println("게시글의 총 페이지 갯수 계산하기");
		int rst = 0;
		int tot = 0;
		
		getConnect();
		
		try {
			String sql = "SELECT COUNT(*) AS CNT FROM BO_NOTICE";			
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
			while(rs.next()) {
				tot = rs.getInt("CNT");
			}
			rst = tot / 10;
			if(tot%10 != 0) {
				rst = rst + 1;
			}
		}catch(SQLException se) {
			
		}finally {
			closeConn();
		}
		
		return rst;
	}
	
	// 게시판 검색 결과 출력하기
	public ArrayList<BoardVo> searchBoard(String keyword) {
		System.out.println("게시판 검색 결과 출력하기");
		
		ArrayList<BoardVo> boardList = new ArrayList<BoardVo>();
		
		getConnect();
		
		try {
			String sql = "SELECT no, category, subject, TO_CHAR(regdate, 'yyyy-MM-DD') as regdate, hit FROM bo_notice WHERE subject like '%'||?||'%' ORDER BY no DESC";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, keyword);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				BoardVo tempvo = new BoardVo();
				tempvo.setNo(rs.getInt("no"));
				tempvo.setCategory(rs.getString("category"));
				tempvo.setSubject(rs.getString("subject"));
				tempvo.setRegdate(rs.getString("regdate"));
				tempvo.setHit( rs.getInt("hit"));
				
				boardList.add(tempvo);
			}
		}catch(SQLException se) {
			
		}finally {
			closeConn();
		}
		
		return boardList;
	}
}
















