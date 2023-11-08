<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="human.dao.MemberDao" %>
<%@ page import="human.vo.MemberVo" %>
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
		
		MemberVo tempvo = new MemberVo();
		tempvo.setId(id);
		tempvo.setPwd(pw);
		
		MemberDao memdao = new MemberDao();
		
		int result = memdao.loginCheck(tempvo);
		
		if(result==1) {
			session.setAttribute("memid", id);
			out.println("<script>location.href='../../include/index.jsp'</script>");
		}else{
			out.println("<script>alert('아이디 또는 비밀번호를 확인해주세요.')</script>");
			out.println("<script>location.href='../../moved/login/login.jsp'</script>");
		}
	%>

</body>
</html>