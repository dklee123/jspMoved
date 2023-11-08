<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="human.dao.MemberDao" %>
<%@ page import="human.vo.MemberVo" %>
<%@ page import="human.utils.*" %>

<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="../../assets/css/mypage.css">
<meta charset="UTF-8">
<title>마이페이지</title>
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
                <a href="../../include/index.jsp" class="navbar-brand">
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
                      
                        <a href="../../moved/contact/contact.jsp" class="nav-item nav-link">Contact</a>
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
                    <h1 class="display-4 text-white mb-4 animated slideInRight"><i class="fa-solid fa-house"></i> MYPAGE</h1>
                    <nav aria-label="breadcrumb">
                        <ol class="breadcrumb justify-content-center justify-content-lg-start mb-0">
<!--                             <li class="breadcrumb-item"><a class="text-white" href="#">Home</a></li> -->
<!--                             <li class="breadcrumb-item"><a class="text-white" href="#">Pages</a></li> -->
<!--                             <li class="breadcrumb-item text-white active" aria-current="page">Testimonial</li> -->
                        </ol>
                    </nav>
                </div>
                <div class="col-lg-6 align-self-end text-center text-lg-end">                    
<!--                     <img class="img-fluid" src="../../assets/img/hero-img.png" alt="" style="max-height: 300px;"> -->
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


<!-- mypage start-->

<%
	String loginBtn = "로그인";
	String loginLink = "../../moved/login/login.jsp";
	String id = "";
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
		
	}
%>


<body class="woocommerce-account logged-in" style="background-color:#f4f7fe;">
	  <div class="master">
    <div class="master-inner">
      <div class="woocommerce">
        <nav class="woocommerce-MyAccount-navigation">
          <ul>
            <li class="woocommerce-MyAccount-navigation-link woocommerce-MyAccount-navigation-link--orders">
              <a href="mypage.jsp"><i class="fa-solid fa-user"></i> 프로필</a>
            </li>
            <li class="woocommerce-MyAccount-navigation-link woocommerce-MyAccount-navigation-link--orders">
              <a href="mypagestatus.jsp"><i class="fa-solid fa-diagram-project"></i> 진행현황</a>
            </li>
            <li class="woocommerce-MyAccount-navigation-link woocommerce-MyAccount-navigation-link--dashboard is-active">
              <a href="mypagesetting.jsp"><i class="fa-solid fa-gear"></i> 설정</a>
            </li>
            <li class="woocommerce-MyAccount-navigation-link woocommerce-MyAccount-navigation-link--customer-logout">
              <a href="../login/logout.jsp"><i class="fa-solid fa-right-from-bracket"></i> Logout</a>
            </li>
          </ul>
        </nav>
        <div class="woocommerce-MyAccount-content">
          <p>
            MYPAGE <strong>설정</strong>
          </p>
          <p>
            개인정보 사항을 확인하고 계정 세부 정보를 편집할 수 있습니다.
          </p>

          <div>
            <form class="woocommerce-EditAccountForm edit-account" action="mypagemod.jsp" method="post">
          	<legend>개인정보 확인</legend>
            <p class="woocommerce-form-row woocommerce-form-row--first form-row form-row-first">
            <label for="account_first_name">Email(계정)&nbsp;<span class="required"></span></label>
            <input type="text" class="woocommerce-Input woocommerce-Input--text input-text" name="account_first_name" id="account_first_name" autocomplete="given-name" value="<%= id %>" readonly>
            </p>
            <p class="woocommerce-form-row woocommerce-form-row--last form-row form-row-last">
            <label for="account_last_name">Password&nbsp;<span class="required">*</span></label>
            <input type="password" class="woocommerce-Input woocommerce-Input--text input-text" name="mempw" id="account_last_name" autocomplete="family-name" value="">         
            <span><em>비밀번호 입력 후 개인정보 수정이 가능합니다.</em></span>
            </p>
            <fieldset>
            <hr>
            <legend>개인정보 수정</legend>
            <p class="woocommerce-form-row woocommerce-form-row--wide form-row form-row-wide">
            <label for="password_current">Name&nbsp;<span class="required">*</span></label>
            <input type="text" class="woocommerce-Input woocommerce-Input--password input-text" name="memname" id="password_current" autocomplete="off" value="<%= resultvo.getName() %>">
            
            </p>
            <p class="woocommerce-form-row woocommerce-form-row--wide form-row form-row-wide">
            <label for="password_1">Email&nbsp;<span class="required">*</span></label>
            <input type="text" class="woocommerce-Input woocommerce-Input--password input-text" name="mememail" id="password_1" autocomplete="off" value="<%= resultvo.getEmail() %>">
            
            </p>
            <p class="woocommerce-form-row woocommerce-form-row--wide form-row form-row-wide">
            <label for="password_2">Tel&nbsp;<span class="required">*</span></label>
            <input type="text" class="woocommerce-Input woocommerce-Input--password input-text" name="memtel" id="password_2" autocomplete="off" value="<%= resultvo.getPhone() %>">
            
            </p>
            </fieldset>
            <div class="clear"></div>
            <p>
            <button type="submit" class="woocommerce-Button button" name="save_account_details" value="Save changes">Save changes</button>
            <input type="hidden" name="action" value="save_account_details">
            </p>
            </form>
            </div>
        </div><!-- woocommerce-MyAccount-content -->
      </div><!-- woocommerce -->
    </div><!-- master-inner -->
  </div><!-- master -->
</body>
<!-- mypage end-->





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
</body>
</html>