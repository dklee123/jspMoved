<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="human.dao.MemberDao" %>
<%@ page import="human.vo.MemberVo" %>
<%@ page import= "java.util.ArrayList" %>
<%@ page import="human.dao.BoardDao" %>
<%@ page import="human.vo.BoardVo" %>
<%@ page import="human.dao.FilesDao" %>
<%@ page import="human.vo.FilesVo" %>       
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>고객센터</title>
<meta content="width=device-width, initial-scale=1.0" name="viewport">
    <meta content="" name="keywords">
    <meta content="" name="description">

    <!-- Favicon -->
    <link href="../../assets/img/favicon.ico" rel="icon">

    <!-- Google Web Fonts -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Open+Sans:wght@400;600&family=Ubuntu:wght@500;700&display=swap"
        rel="stylesheet">

    <!-- Icon Font Stylesheet -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css" rel="stylesheet">

    <!-- Libraries Stylesheet -->
    <link href="lib/animate/animate.min.css" rel="stylesheet">
    <link href="lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">

    <!-- Customized Bootstrap Stylesheet -->
    <link href="../../assets/css/bootstrap.min.css" rel="stylesheet">

    <!-- Template Stylesheet -->
    <link href="../../assets/css/style.css" rel="stylesheet">

    <!-- fontawesome -->
	<script src="https://kit.fontawesome.com/0743fc8aa3.js" crossorigin="anonymous"></script>
</head>
<style>
section{
    background:#f3f3f3;
    
    color: #616f80;
}
.card {
    border: none;
    margin-bottom: 24px;
    -webkit-box-shadow: 0 0 13px 0 rgba(236,236,241,.44);
    box-shadow: 0 0 13px 0 rgba(236,236,241,.44);
}

.avatar-xs {
    height: 2.3rem;
    width: 2.3rem;
}
</style>
<body>
    <!-- Spinner Start -->
    <div id="spinner"
        class="show bg-white position-fixed translate-middle w-100 vh-100 top-50 start-50 d-flex align-items-center justify-content-center">
        <div class="spinner-grow text-primary" style="width: 3rem; height: 3rem;" role="status">
            <span class="sr-only">Loading...</span>
        </div>
    </div>
    <!-- Spinner End -->


    <!-- Navbar Start -->
    <div class="container-fluid sticky-top">
        <div class="container">
            <nav class="navbar navbar-expand-lg navbar-dark p-0">
                <a href="../include/index.jsp" class="navbar-brand">
                    <h1 class="text-white">M<span style="color:skyblue;">O</span><span class="text-white">VED</span></h1>
                </a>
                <button type="button" class="navbar-toggler ms-auto me-0" data-bs-toggle="collapse"
                    data-bs-target="#navbarCollapse">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse" id="navbarCollapse">
                    <div class="navbar-nav ms-auto">
                        <a href="../../include/index.jsp" class="nav-item nav-link active">Home</a>
                        <a href="../../moved/movedint.jsp" class="nav-item nav-link">Moved 소개</a>
                        <a href="../../include/calendar/calendar.jsp" class="nav-item nav-link">Moved 이사견적</a>
                        <a href="../../moved/statusBoard.jsp" class="nav-item nav-link">신청현황</a>
                        <a href="../../moved/board/board.jsp" class="nav-item nav-link">고객센터</a>
                        <a href="../../moved/contact/contact.jsp" class="nav-item nav-link">문의</a>
                    </div>
                </div>
            </nav>
        </div>
    </div>
    <!-- Navbar End -->


    <!-- Hero Start -->
    <div class="container-fluid pt-5 bg-primary hero-header">
        <div class="container pt-5">
            <div class="row g-5 pt-5">
                <div class="col-lg-6 align-self-center text-center text-lg-start mb-lg-5">
                    <h1 class="display-4 text-white mb-4 animated slideInRight">M<span style="color:skyblue;">O</span>VED 고객센터</h1>
                    <nav aria-label="breadcrumb">
                        <ol class="breadcrumb justify-content-center justify-content-lg-start mb-0">
                            <li class="breadcrumb-item"><a class="text-white" href="#">Home</a></li>
                            <li class="breadcrumb-item text-white active" aria-current="page">Customer Service</li>
                        </ol>
                    </nav>
                </div>
                <div class="col-lg-6 align-self-end text-center text-lg-end">
<!--                    <img class="img-fluid" src="img/hero-img.png" alt="" style="max-height: 300px;">-->
                </div>
            </div>
        </div>
    </div>
    <!-- Hero End -->


    <!-- Full Screen Search Start -->
    <div class="modal fade" id="searchModal" tabindex="-1">
        <div class="modal-dialog modal-fullscreen">
            <div class="modal-content" style="background: rgba(20, 24, 62, 0.7);">
                <div class="modal-header border-0">
                    <button type="button" class="btn btn-square bg-white btn-close" data-bs-dismiss="modal"
                        aria-label="Close"></button>
                </div>
                <div class="modal-body d-flex align-items-center justify-content-center">
                    <div class="input-group" style="max-width: 600px;">
                        <input type="text" class="form-control bg-transparent border-light p-3"
                            placeholder="Type search keyword">
                        <button class="btn btn-light px-4"><i class="bi bi-search"></i></button>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Full Screen Search End -->


    <!-- board Start -->
    <section>
    <div class="container">
    <div class="row" style="padding-top:50px; padding-bottom:50px;"></div>


	<!-- end row -->
	
	 
            <%
            String no = request.getParameter("no");
         
            BoardVo tempvo = new BoardVo();
            BoardDao bbsdao = new BoardDao();      
            tempvo = bbsdao.readBoardByNo(no);
            
            FilesVo filesvo = new FilesVo();
            FilesDao filedao = new FilesDao();
            filesvo = filedao.readFilesByNo(no);
            
         %>
		
		<div class="row">
        <div class="col-lg-12" style="margin-bottom: 50px;">
            <div class="card">
                <div class="card-body">
                    <div class="table-responsive project-list">
                        <table class="table project-table table-centered table-nowrap">
                        <tbody>
                            <div class="card-header">
                                <div class="spur-card-icon">
                                    <i class="fas fa-chart-bar">상세 페이지</i>
                                </div>
                                
                            </div>
                            <div class="card-body">
                                <form action="boardwrtpro.jsp" method="POST" enctype="multipart/form-data">
                                    <div class="form-row">
                                        <div class="form-group col-md-4">
                                            <label for="exampleFormControlInput1">작성자</label>
                                            <input type="text" class="form-control" id="exampleFormControlInput1" name="writer" value="<%= tempvo.getWriter() %>" readonly>
                                        </div>
                                        <div class="form-group col-md-4">
                                            <label for="exampleFormControlInput1">작성일</label>
                                            <input type="text" class="form-control" id="exampleFormControlInput1" name="regdate" value="<%= tempvo.getRegdate() %>" readonly>
                                        </div>
                                        <div class="form-group col-md-4">
                                            <label for="exampleFormControlInput1">조회수</label>
                                            <input type="text" class="form-control" id="exampleFormControlInput1" name="hit" value="<%= tempvo.getHit() %>" readonly>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label for="exampleFormControlInput1">제목</label>
                                        <input type="text" class="form-control" id="exampleFormControlInput1" name="subject" value="<%= tempvo.getSubject() %>">
                                    </div>

                                    <div class="form-group">
                                        <label for="exampleFormControlTextarea1">글내용</label>
                                        <textarea class="form-control" id="exampleFormControlTextarea1" rows="3" name="content"><%= tempvo.getContent() %></textarea>
                                    </div>

                                    <div class="form-group">
                                        <label for="exampleFormControlInput1">첨부파일</label>
                                        <br><%= filesvo.getFilename() %>
                                        <input type="file" class="form-control" id="exampleFormControlInput1" name="filename">
                                    </div>
									<br>
                                    <button type="submit" class="btn btn-primary">글수정</button>
                                    <button type="button" class="btn btn-primary" onclick="del_bbs(<%= tempvo.getNo() %>);">글삭제</button>
                                    <button type="button" class="btn btn-primary" onclick="location.href='board.jsp'">목록</button>
                                </form>
                            </div>
                        </div>
                        </tbody>
                    </table>
                </div>
                <!-- end project-list -->
            </div>
        </div>
    </div>
</div>
    </div>
	</section>

    <!-- end row -->

    <!-- board End -->
	
	
	



    <!-- Footer Start -->
    <div class="container-fluid bg-dark text-white-50 footer pt-5">
        <div class="container py-5">
            <div class="row g-5">
                <div class="col-md-6 col-lg-3 wow fadeIn" data-wow-delay="0.1s">
                    <a href="../../include/index.jsp" class="d-inline-block mb-3">
                        <h1 class="text-white">M<span style="color:skyblue;">O</span><span class="text-white">VED</span></h1>
                    </a>
                    <p class="mb-0">MOVED는 중개자로서 계약 당사자가 아니며 회원과 업체간의 거래에 관여하지 않으며 어떠한 의무와 책임도 부담하지 않습니다.</p>
                </div>
                <div class="col-md-6 col-lg-3 wow fadeIn" data-wow-delay="0.3s">
                    <h5 class="text-white mb-4">MOVED</h5>
                    <p><i class="fa fa-map-marker-alt me-3"></i>123 Street, Seoul, ROK</p>
                    <p><i class="fa fa-phone-alt me-3"></i>대표번호 : 1544-0000</p>
                    <p><i class="fa fa-envelope me-3"></i>Moved@example.com</p>
                    <div class="d-flex pt-2">
                        <a class="btn btn-outline-light btn-social" href=""><i class="fab fa-twitter"></i></a>
                        <a class="btn btn-outline-light btn-social" href=""><i class="fab fa-facebook-f"></i></a>
                        <a class="btn btn-outline-light btn-social" href=""><i class="fab fa-youtube"></i></a>
                        <a class="btn btn-outline-light btn-social" href=""><i class="fab fa-instagram"></i></a>
                        <a class="btn btn-outline-light btn-social" href=""><i class="fab fa-linkedin-in"></i></a>
                    </div>
                </div>
                              <div class="col-md-6 col-lg-3 wow fadeIn" data-wow-delay="0.5s">
                    <h5 class="text-white mb-4">Home</h5>
                    <a class="btn btn-link">Moved 소개</a>
                    <a class="btn btn-link">Moved 이사견적</a>
                </div>
                <div class="col-md-6 col-lg-3 wow fadeIn" data-wow-delay="0.7s">
                    <h5 class="text-white mb-4">Our Services</h5>
                    <a class="btn btn-link">신청현황</a>
                    <a class="btn btn-link">고객센터</a>
                    <a class="btn btn-link">문의</a>
                </div>
            </div>
        </div>
        <div class="container wow fadeIn" data-wow-delay="0.1s">
            <div class="copyright">
                <div class="row">
                    <div class="col-md-6 text-center text-md-start mb-3 mb-md-0">
                        &copy; Moved since 2023. All rights reserved.

                        <!--/*** This template is free as long as you keep the footer author’s credit link/attribution link/backlink. If you'd like to use the template without the footer author’s credit link/attribution link/backlink, you can purchase the Credit Removal License from "https://htmlcodex.com/credit-removal". Thank you for your support. ***/-->
                        <!-- Designed By <a class="border-bottom" href="https://htmlcodex.com">HTML Codex</a> Distributed By <a class="border-bottom" href="https://themewagon.com">ThemeWagon</a>>
                    </div>
                    <div class="col-md-6 text-center text-md-end">
                        <div class="footer-menu">
                            <a href="">Home</a>
                            <a href="">Cookies</a>
                            <a href="">Help</a>
                            <a href="">FAQs</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Footer End -->


    <!-- Back to Top -->
    <a href="#" class="btn btn-lg btn-primary btn-lg-square back-to-top pt-2"><i class="bi bi-arrow-up"></i></a>


    <!-- JavaScript Libraries -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
    <script src="lib/wow/wow.min.js"></script>
    <script src="lib/easing/easing.min.js"></script>
    <script src="lib/waypoints/waypoints.min.js"></script>
    <script src="lib/counterup/counterup.min.js"></script>
    <script src="lib/owlcarousel/owl.carousel.min.js"></script>

    <!-- Template Javascript -->
    <script src="../../assets/js/main.js"></script>
    <script>
    	function del_bbs(tempno){
    		ok = confirm("해당글을 삭제하시겠습니까?"); //확인 - true, 취소- false
    		if(ok==true){
    			alert(tempno);
//     			location.href = '../../boardAdmin/mng_bbsdel.jsp?no='+tempno;
    		}else{
    			alert('삭제 취소 되었습니다.');
    		}
    	}
    </script>
</body>
</html>