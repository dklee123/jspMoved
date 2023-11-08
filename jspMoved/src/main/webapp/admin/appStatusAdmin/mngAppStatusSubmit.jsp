<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import= "java.sql.*" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
String orderNo = request.getParameter("orderNo");
String url = "jdbc:oracle:thin:@localhost:1521:orcl";
String user = "jsp";
String passwd = "123456";

try {
    Class.forName("oracle.jdbc.driver.OracleDriver");
    Connection conn = DriverManager.getConnection(url, user, passwd);
	String query = "UPDATE CLIENT SET PROCESS ='처리' WHERE ORDER_NO = (?)";
    PreparedStatement pstmt = conn.prepareStatement(query);
    pstmt.setString(1, orderNo);
    ResultSet rs = pstmt.executeQuery();
    out.println("<script>alert('완료 처리 되었습니다.');</script>");
    out.println("<script>close();</script>");
    out.println("<script>location.reload();</script>");
    
    rs.close();
    pstmt.close();
    conn.close();
    } catch (Exception e) {
    out.println("오류 발생: " + e.getMessage());
    }
%>
</body>
</html>