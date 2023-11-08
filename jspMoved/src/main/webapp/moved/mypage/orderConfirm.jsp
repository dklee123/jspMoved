<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
String url = "jdbc:oracle:thin:@localhost:1521:orcl";
String user = "jsp";
String passwd = "123456";
String companyName = request.getParameter("companyName");
String orderNo = request.getParameter("orderNo");

String query = "UPDATE COMPANY_ESTIMATE SET SELECTION = '선정' WHERE COMPANYNAME = (?)";
String query2 = "UPDATE CLIENT SET PROCESS = '업체전달' WHERE ORDER_NO = (?)";

try {
    Connection conn = DriverManager.getConnection(url, user, passwd);
    
    PreparedStatement pstmt = conn.prepareStatement(query);
    pstmt.setString(1, companyName);
    
    PreparedStatement pstmt2 = conn.prepareStatement(query2);
    pstmt2.setString(1, orderNo);
    
    ResultSet rs = pstmt.executeQuery();
    ResultSet rs2 = pstmt2.executeQuery();
    rs.close();
    rs2.close();
    pstmt.close();
    conn.close();
    %>
<script type="text/javascript">
    alert("업체 선정을 완료했습니다.");
    window.close();
</script>
    <% 
} catch (Exception e) {
    e.printStackTrace();
}

%>
</body>
</html>