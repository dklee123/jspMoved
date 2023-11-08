<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
    <title>주문 상세</title>
</head>
<body>
  <%
    String url = "jdbc:oracle:thin:@localhost:1521:orcl";
    String user = "jsp";
    String passwd = "123456";
    String companyName = request.getParameter("companyName");
    
    String query = "SELECT * FROM COMPANY_ESTIMATE WHERE COMPANYNAME = (?)";
    
    try {
        Connection conn = DriverManager.getConnection(url, user, passwd);
        
        PreparedStatement pstmt = conn.prepareStatement(query);
        pstmt.setString(1, companyName);
        
        ResultSet rs = pstmt.executeQuery();
        
        rs.next();
        
        int rfg_quant = rs.getInt("rfg_quant");
        int rfg_price = rs.getInt("rfg_price");
        int wsm_quant = rs.getInt("wsm_quant");
        int wsm_price = rs.getInt("wsm_price");
        int chr_quant = rs.getInt("chr_quant");
        int chr_price = rs.getInt("chr_price");
        int bed_quant = rs.getInt("bed_quant");
        int bed_price = rs.getInt("bed_price");
        int tab_quant = rs.getInt("tab_quant");
        int tab_price = rs.getInt("tab_price");
        int tv_quant = rs.getInt("tv_quant");
        int tv_price = rs.getInt("tv_price");
        int dist_price = rs.getInt("dist_price");
        
        int total_price = rfg_price + wsm_price + chr_price + bed_price + tab_price + tv_price + dist_price;
    %>
        <h2 style="text-align:center;">상세 정보</h2>
	       <table border="1" style="width: 50%; margin: 0 auto;">
	    <tr>
	        <th>항목</th>
	        <th>수량</th>
	        <th>가격</th>
	    </tr>
	    <tr>
	        <td>회사명</td>
	        <td colspan="2"><%= companyName %></td>
	    </tr>
	    <tr>
	        <td>냉장고</td>
	        <td><%= rfg_quant %></td>
	        <td><%= rfg_price %></td>
	    </tr>
	    <tr>
	        <td>세탁기</td>
	        <td><%= wsm_quant %></td>
	        <td><%= wsm_price %></td>
	    </tr>
	    <tr>
	        <td>의자</td>
	        <td><%= chr_quant %></td>
	        <td><%= chr_price %></td>
	    </tr>
	    <tr>
	        <td>침대</td>
	        <td><%= bed_quant %></td>
	        <td><%= bed_price %></td>
	    </tr>
	    <tr>
	        <td>테이블</td>
	        <td><%= tab_quant %></td>
	        <td><%= tab_price %></td>
	    </tr>
	    <tr>
	        <td>텔레비전</td>
	        <td><%= tv_quant %></td>
	        <td><%= tv_price %></td>
	    </tr>
	     <tr>
	        <td>운송료</td>
	        <td colspan="2"><%= dist_price %></td>
	    </tr>
	    <tr>
	        <td>합계</td>
	        <td colspan="2"><%= total_price %></td>
	    </tr>
	</table>
	    <%
        rs.close();
        pstmt.close();
        conn.close();
    } catch (Exception e) {
        e.printStackTrace();
    }
    %>
    <h2 style="text-align:center;padding-top: 10px;">M<span style="color:skyblue;">O</span>VED</h2>
</body>
</html>