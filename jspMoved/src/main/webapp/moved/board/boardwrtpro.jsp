<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="human.dao.*" %>
<%@ page import="human.vo.*" %>
<%@ page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
    <%
    	
    String loginBtn = "로그인";
	String loginLink = "../../moved/login/login.jsp";
	String id = "";
	String name = "";
	MemberVo resultvo = new MemberVo();
	if(session.getAttribute("memid")==null){
		loginBtn = "로그인";
		loginLink = "../../moved/login/login.jsp";
		out.println("<script>alert('로그인 후 사용가능합니다');</script>");
		out.println("<script>location.href='../../moved/login/login.jsp'</script>");
	}else{
		id = (String)session.getAttribute("memid");
		loginBtn = "로그아웃";
		loginLink = "../../moved/login/logout.jsp";
		
		MemberDao memdao = new MemberDao();
		resultvo = memdao.getMemberById(id);

		name = resultvo.getName(); 
		
	}
			
	
        String writer = request.getParameter("writer");
        String subject = request.getParameter("subject");
        String content = request.getParameter("content");
        String filename = request.getParameter("filename");
        String category = "문의";
        
        MultipartRequest multi = null;
        String savePath = request.getServletContext().getRealPath("/upload");
        int maxsize = 1024 * 1024 * 10;
        
        try{
            multi = new MultipartRequest(request, savePath, maxsize, "utf-8", new DefaultFileRenamePolicy());
            writer = name;
            subject = multi.getParameter("subject");
            content = multi.getParameter("content");
            filename = multi.getFilesystemName("filename");
                    
            out.println(writer+"<br>");
            out.println(id +"<br>");
            out.println(category+"<br>");
            out.println(subject+"<br>");
            out.println(content+"<br>");
            out.println(filename+"<br>"); 
        } catch(Exception e){
            out.println("에러: " + e.getMessage());
            e.printStackTrace();
        }
        
        BoardVo tempvo = new BoardVo();
        tempvo.setWriter(writer);
        tempvo.setId(id);
        tempvo.setCategory(category);
        tempvo.setSubject(subject);
        tempvo.setContent(content);
        tempvo.setFilename(filename);        
        BoardDao bbsdao = new BoardDao();
        int result = bbsdao.regBoard(tempvo);
        
        out.println("등록결과 : " + result);
        
        if(result == 2){
            out.println("<script>alert('게시글 등록 및 첨부 등록 완료');</script>");
            out.println("<script>location.href='board.jsp';</script>");
        } else if(result == 1){
            out.println("<script>alert('게시글 등록 완료');</script>");
            out.println("<script>location.href='board.jsp';</script>");            
        }
    %>
</body>
</html>
