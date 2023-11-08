<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="human.dao.MemberDao" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>아이디 중복확인</h2>
	<%
		String id = request.getParameter("memid");
		out.println(id+"<br>");
		
		MemberDao memdao = new MemberDao();
		int result = memdao.isExistId(id); // 사용가능
		out.println(result);
		if(result==0) {
			out.println("<script>opener.parent.useable_id();window.close(); </script>");	
		}else{
			out.println("<script>opener.parent.unuseable_id(); window.close();</script>");
		}
		
	%>
</body>
</html>