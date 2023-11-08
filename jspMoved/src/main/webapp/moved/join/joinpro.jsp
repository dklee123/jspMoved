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
	<%
		String id = request.getParameter("memid");
		String pw = request.getParameter("mempw");
		String name = request.getParameter("memname");
		String email = request.getParameter("mememail");
		String tel = request.getParameter("tel");
		
		/* 값 넘어가는지 확인용 */
		// out.println(id+"<br>");
		// out.println(pw+"<br>");
		
		MemberDao memdao = new MemberDao();
		
		int result = memdao.regMember(id,pw,name,email,tel);
		// 회원가입실패,다시등록.html
		out.println("가입에 실패하였습니다. " + result);
		
		
		if(result!=0) {
			// 회원가입완료.html
			response.sendRedirect("../../moved/login/login.jsp");
			
		}
		
	%>
</body>
</html>