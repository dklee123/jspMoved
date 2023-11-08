<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="human.dao.BoardDao" %>
<%@ page import="human.vo.BoardVo" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		String no = request.getParameter("no");
	
		BoardDao bbsdao = new BoardDao();
		int result = bbsdao.delBoardByNo(no);
		
		out.println("삭제결과:" + result);
		
		if(result==2 || result==1){
			out.println("<script>alert('게시글 삭제가 완료되었습니다.');</script>");
			out.println("<script>location.href='mng_board.jsp'</script>");
		}else{
			out.println("<script>alert('게시글 삭제에 실패했습니다.');</script>");
			out.println("<script>location.href='mng_board.jsp?no='"+ no +"</script>");
		}
	%>
</body>
</html>