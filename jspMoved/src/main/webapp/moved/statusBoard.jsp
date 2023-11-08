<%@ page import="java.util.ArrayList" %>
<%@ page import="human.dao.BoardDao" %>
<%@ page import="human.vo.BoardVo" %>
<%@ page import="human.dao.MemberDao" %>
<%@ page import="human.vo.MemberVo" %>
<%@ page import="human.dao.ClientDao" %>
<%@ page import="human.vo.ClientVo" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MOVED 신청현황</title>
    <meta charset="utf-8">
    <meta content="width=device-width, initial-scale=1.0" name="viewport">
    <meta content="" name="keywords">
    <meta content="" name="description">

    <!-- Favicon -->
    <link href="../assets/img/favicon.ico" rel="icon">

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
    <link href="../assets/css/bootstrap.min.css" rel="stylesheet">

    <!-- Template Stylesheet -->
    <link href="../assets/css/style.css" rel="stylesheet">

    <!-- fontawesome -->
	<script src="https://kit.fontawesome.com/0743fc8aa3.js" crossorigin="anonymous"></script>
</head>
<style>
header{
	background-color:#eee;
	text-align: center;
    font-size: 15px;
    color: white;
    background-color: #eee;
    padding: 30px 0;
    padding-top:10px;
    
}

ul.login{
	list-style:none;
	float: right;
	padding-right:15px;
	margin-top:0px;
    margin-bottom: 0px;

}

li.login{
	float:left;
	margin-left:15px;
}

a {
	text-decoration: none;
}
</style>

<%
	String loginBtn = "로그인";
	String loginLink = "../moved/login/login.jsp";
	if(session.getAttribute("memid")==null) {
		loginBtn = "로그인";
		loginLink = "../moved/login/login.jsp";
	}else {
		loginBtn = "로그아웃";
		loginLink = "../moved/login/logout.jsp";
	}
%>
<body>
<!-- 로그인|로그아웃 / 회원가입 -->
	<header>
	<div class="login">
		<ul class="login">
	    	
			<!-- 로그인 & 회원가입 -->
			<% if(session.getAttribute("memid") == null) { %>
			<li class="login"><a href="<%=loginLink%>"><i class="fa-solid fa-lock"></i> <%=loginBtn%></a></li>
			<li class="login"><a href="join/join.jsp"><i class="fa-solid fa-right-to-bracket"></i> 회원가입</a></li>
			<% } %>		
			<!-- 로그아웃 & MYPAGE -->
			<% if(session.getAttribute("memid") != null) { %>
			<li class="login"><a href="<%=loginLink%>"><i class="fa-solid fa-unlock"></i> <%=loginBtn%></a></li>
			<li class="login"><a href="mypage/mypage.jsp"><i class="fa-solid fa-house"></i> MYPAGE</a></li>
			<% } %>
			
		</ul>
	</div>
	</header>




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
                        <a href="../include/index.jsp" class="nav-item nav-link active">Home</a>
                        <a href="../moved/movedint.jsp" class="nav-item nav-link">Moved 소개</a>
                        <a href="../include/calendar/calendar.jsp" class="nav-item nav-link">Moved 이사견적</a>
                        <a href="../moved/statusBoard.jsp" class="nav-item nav-link">신청현황</a>
                        <a href="../moved/board/board.jsp" class="nav-item nav-link">고객센터</a>                      
                           
                        <a href="../moved/contact/contact.jsp" class="nav-item nav-link">Contact</a>
                    </div>
                    <butaton type="button" class="btn text-white p-0 d-none d-lg-block" data-bs-toggle="modal"
                        data-bs-target="#searchModal"><i class="fa fa-search"></i></butaton>
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
                    <h1 class="display-4 text-white mb-4 animated slideInRight">M<span style="color:skyblue;">O</span>VED 신청현황</h1>
                    <nav aria-label="breadcrumb">
                        <ol class="breadcrumb justify-content-center justify-content-lg-start mb-0">
                            <li class="breadcrumb-item"><a class="text-white" href="#">Home</a></li>
                            <li class="breadcrumb-item"><a class="text-white" href="#">Pages</a></li>
                            <li class="breadcrumb-item text-white active" aria-current="page">About Us</li>
                        </ol>
                    </nav>
                </div>
                <div class="col-lg-6 align-self-end text-center text-lg-end">
<!--                    <img class="img-fluid" src="../assets/img/hero-img.png" alt="" style="max-height: 300px;">-->
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
    <div class="row" style="padding-top:50px; padding-bottom:50px;">
        <div class="col-xl-3 col-md-6">
            <div class="card bg-pattern">
                <div class="card-body">
                    <div class="float-right">
                        <i class="fa fa-archive text-primary h4 ml-3"></i>
                    </div>
                    <%
						ClientDao cltdao = new ClientDao();
					
						int total = cltdao.getClientCount();

					%>
                    <h5 class="font-size-20 mt-0 pt-1"><%= total %> </h5>

                    <p class="text-muted mb-0">총 신청</p>
                </div>
            </div>
        </div>
        <div class="col-xl-3 col-md-6">
            <div class="card bg-pattern">
                <div class="card-body">
                    <div class="float-right">
                        <i class="fa fa-th text-primary h4 ml-3"></i>
                    </div>
                    <%
						ClientDao cltingdao = new ClientDao();
					
						int ing = cltingdao.getClientingCount();
					%>
                    <h5 class="font-size-20 mt-0 pt-1"><%= ing %></h5>
                    <p class="text-muted mb-0">진행중</p>
                </div>
            </div>
        </div>
        <div class="col-xl-3 col-md-6">
            <div class="card bg-pattern">
                <div class="card-body">
                    <div class="float-right">
                        <i class="fa fa-file text-primary h4 ml-3"></i>
                    </div>
                    <%
						ClientDao cltprodao = new ClientDao();
					
						int pro = cltprodao.getClientproCount();
					%>
                    <h5 class="font-size-20 mt-0 pt-1"><%= pro %></h5>
                    <p class="text-muted mb-0">완료</p>
                </div>
            </div>
        </div>
<!--         <div class="col-xl-3 col-md-6"> -->
<!--             <div class="card"> -->
<!--                 <div class="card-body"> -->
<!--                     <form> -->
<!--                         <div class="form-group mb-0"> -->
<!--                             <label>Search</label> -->
<!--                             <div class="input-group mb-0"> -->
<!--                                 <input type="text" class="form-control" placeholder="Search..." aria-describedby="project-search-addon" /> -->
<!--                                 <div class="input-group-append"> -->
<!--                                     <button class="btn btn-danger" type="button" id="project-search-addon"><i class="fa-solid fa-magnifying-glass"></i></button> -->
<!--                                 </div> -->
<!--                             </div> -->
<!--                         </div> -->
<!--                     </form> -->
<!--                 </div> -->
<!--             </div> -->
<!--         </div> -->
    </div>
    <!-- end row -->

    <div class="row">
        <div class="col-lg-12" style="padding-bottom:50px;">
            <div class="card">
                <div class="card-body">
                    <div class="table-responsive project-list">
                        <table class="table project-table table-centered table-nowrap">
                            <thead>
                                <tr>
                                    <th scope="col">신청번호</th>
                                    <th scope="col">신청자</th>
                                    <th scope="col">출발위치</th>
                                    <th scope="col">도착위치</th>
									<th scope="col">일자</th>
									<th scope="col">금액</th>
									<th scope="col">처리분류</th>
<!--                                    <th scope="col">Progress</th>-->
<!--                                    <th scope="col">Action</th>-->
                                </tr>
                            </thead>
                            <tbody>
                            
                            <%
								String curPage = request.getParameter("page");
								if (curPage == null){
									curPage =  "1";
								}
								ClientDao bbsdao = new ClientDao();
								ArrayList<ClientVo> result = bbsdao.getBoardListAll(curPage);
								// out.println(result.size());
								for(int i=0; i<result.size(); i++) {
									ClientVo eachvo = result.get(i);
							%>		
									
								<tr class="post">
								<!-- 신청번호 -->
									<td class="post_num"><%= eachvo.getOderno() %></td>
								<!-- 신청자 -->
									<td><%-- <a href="../company/com_bbsread.jsp?page=<%=curPage%>&no=<%= eachvo.getOderno() %>"> --%><%= eachvo.getName() %></a></td>
<%-- 									<td class="post_date"><%= eachvo.getMdate() %></td> --%>
								<!-- 출발위치 -->
									<td class="post_date"><%= eachvo.getOrigin() %></td>
								<!-- 도착위치 -->
									<td class="post_date"><%= eachvo.getDestin() %></td>
								<!-- 일자 -->									
									<td class="post_date"> <%= eachvo.getM_date() %></td>
								<!-- 금액 -->
									<td class="post_view"><%= eachvo.getCost() %></td>
								<!-- 처리분류 -->
									<td class="post_view"><%= eachvo.getProcess() %></td>
								</tr>
							<% 	
								}
							%>	
<!--                                 <tr> -->
<!--                                     <th scope="row">1</th> -->
<!--                                     <td>New admin Design</td> -->
<!--                                     <td>2023/09/01</td> -->
<!--                                     <td> -->
<!--                                         <span class="text-success font-12"><i class="mdi mdi-checkbox-blank-circle mr-1"></i> 완료</span> -->
<!--                                     </td> -->
<!--                                     <td>100</td>  -->
<!--                                 </tr> -->

<!--                                 <tr> -->
<!--                                     <th scope="row">2</th> -->
<!--                                     <td>Landing page Design</td> -->
<!--                                     <td>2023/09/01</td> -->
<!--                                     <td> -->
<!--                                         <span class="text-primary font-12"><i class="mdi mdi-checkbox-blank-circle mr-1"></i> 처리중</span> -->
<!--                                     </td> -->
<!--                                     <td>123</td> -->
<!--                                 </tr> -->
                                
<!--                                 <tr> -->
<!--                                     <th scope="row">3</th> -->
<!--                                     <td>Landing page Design</td> -->
<!--                                     <td>2023/09/01</td> -->
<!--                                     <td> -->
<!--                                         <span class="text-red font-12" style="color:red;"><i class="mdi mdi-checkbox-blank-circle mr-1"></i> 미처리</span> -->
<!--                                     </td> -->
<!--                                     <td>456</td> -->
<!--                                 </tr> -->

                                
                               
                            </tbody>
                        </table>
                    </div>
                    <!-- end project-list -->

                    <div class="pt-3">
                        <ul class="pagination justify-content-end mb-0">
                            <li class="page-item disabled">
                                <a class="page-link" href="#" tabindex="-1" aria-disabled="true">Previous</a>
                            </li>
                            
<!--                             <li class="page-item"><a class="page-link" href="#">1</a></li> -->
<!--                             <li class="page-item active"><a class="page-link" href="#">2</a></li> -->
<!--                             <li class="page-item"><a class="page-link" href="#">3</a></li> -->

                            
                            <li class="page-item">
                                <a class="page-link" href="#">Next</a>
                            </li>
                        </ul>
                    </div>
                    
                </div>
            </div>
        </div>
    </div>
    <!-- end row -->
</div>
</section>
    <!-- board End -->


    <!-- Newsletter Start -->
<!--     <div class="container-fluid bg-primary newsletter py-5">
        <div class="container">
            <div class="row g-5 align-items-center">
                <div class="col-md-5 ps-lg-0 pt-5 pt-md-0 text-start wow fadeIn" data-wow-delay="0.3s">
                    <img class="img-fluid" src="img/newsletter.png" alt="">
                </div>
                <div class="col-md-7 py-5 newsletter-text wow fadeIn" data-wow-delay="0.5s">
                    <div class="btn btn-sm border rounded-pill text-white px-3 mb-3">Newsletter</div>
                    <h1 class="text-white mb-4">Let's subscribe the newsletter</h1>
                    <div class="position-relative w-100 mt-3 mb-2">
                        <input class="form-control border-0 rounded-pill w-100 ps-4 pe-5" type="text"
                            placeholder="Enter Your Email" style="height: 48px;">
                        <button type="button" class="btn shadow-none position-absolute top-0 end-0 mt-1 me-2"><i
                                class="fa fa-paper-plane text-primary fs-4"></i></button>
                    </div>
                    <small class="text-white-50">Diam sed sed dolor stet amet eirmod</small>
                </div>
            </div>
        </div>
    </div> -->
    <!-- Newsletter End -->


    <!-- Footer Start -->
    <div class="container-fluid bg-dark text-white-50 footer pt-5">
        <div class="container py-5">
            <div class="row g-5">
                <div class="col-md-6 col-lg-3 wow fadeIn" data-wow-delay="0.1s">
                    <a href="../include/index.jsp" class="d-inline-block mb-3">
                        <h1 class="text-white">M<span style="color:skyblue;">O</span><span class="text-white">VED</span></h1>
                    </a>
                    <p class="mb-0">MOVED는 이사 서비스의 중개만 하고, 계약과 관련된 책임은 운송사업자와 고객 간에 있습니다. 계약 후 의뢰자에게 배정되면, 고객에게 의뢰자 정보를 알려드립니다. 의뢰자는 운송 전날까지 연락 가능합니다.</p>
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
                    <a class="btn btn-link" href="">Moved 소개</a>
                    <a class="btn btn-link" href="">Moved 이사견적</a>
                </div>
                <div class="col-md-6 col-lg-3 wow fadeIn" data-wow-delay="0.7s">
                    <h5 class="text-white mb-4">Board</h5>
                    <a class="btn btn-link" href="">신청현황</a>
                    <a class="btn btn-link" href="">고객센터</a>
                </div>
            </div>
        </div>
        <div class="container wow fadeIn" data-wow-delay="0.1s">
            <div class="copyright">
                <div class="row">
                    <div class="col-md-6 text-center text-md-start mb-3 mb-md-0">
                        &copy; Moved since 2023. All rights reserved.
            
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
    <script src="../assets/js/main.js"></script>
</body>
</html>