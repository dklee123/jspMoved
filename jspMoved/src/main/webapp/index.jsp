<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="human.dao.MemberDao" %>
<%@ page import="human.vo.MemberVo" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <title>MOVED</title>
    <meta content="width=device-width, initial-scale=1.0" name="viewport">
    <meta content="" name="keywords">
    <meta content="" name="description">

    <!-- Favicon -->
    <link href="img/favicon.ico" rel="icon">

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
    <link href="assets/css/bootstrap.min.css" rel="stylesheet">

    <!-- Template Stylesheet -->
    <link href="assets/css/style.css" rel="stylesheet">

    <!-- fontawesome -->
	<script src="https://kit.fontawesome.com/0743fc8aa3.js" crossorigin="anonymous"></script>
</head>

<style>
header{
	background-color:#f4f7fe;
	text-align: center;
    font-size: 15px;
    color: white;    
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
	
	<!-- 로그인|로그아웃 / 회원가입 Start -->
	<header>
	<div class="login">
  <ul class="login">
    <!-- 로그인 & 회원가입 -->
    <li class="login">
      <a href="moved/login/login.jsp">
        <i class="fa-solid fa-lock"></i>
        로그인
      </a>
    </li>
    <li class="login">
      <a href="moved/join/join.jsp">
        <i class="fa-solid fa-right-to-bracket"></i>
        회원가입
      </a>
    </li>

    <!-- 로그아웃 & MYPAGE -->
    <li class="login">
      <a href="moved/login/logout.jsp">
        <i class="fa-solid fa-unlock"></i>
        로그아웃
      </a>
    </li>
    <li class="login">
      <a href="moved/mypage.jsp">
        <i class="fa-solid fa-house"></i>
        MYPAGE
      </a>
    </li>
  </ul>
</div>
</header>
<script>
  // 로그인 여부를 확인합니다.
  var isLoggedIn = sessionStorage.getItem("memid") != null;

  // 로그인 여부에 따라 로그아웃 링크를 보이거나 숨깁니다.
  var logoutLink = document.querySelector(".login a[href='moved/login/logout.jsp']");
  logoutLink.style.display = isLoggedIn ? "block" : "none";
  // 로그인 여부에 따라 MYPAGE 링크를 보이거나 숨깁니다.
  var mypageLink = document.querySelector(".login a[href='moved/mypage.jsp']");
  mypageLink.style.display = isLoggedIn ? "block" : "none";
</script>

<!-- 로그인|로그아웃 / 회원가입 End -->
	
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
                <a href="index.jsp" class="navbar-brand">
                    <h1 class="text-white">M<span style="color:skyblue;">O</span><span class="text-white">VED</span></h1>
                </a>
                <button type="button" class="navbar-toggler ms-auto me-0" data-bs-toggle="collapse"
                    data-bs-target="#navbarCollapse">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse" id="navbarCollapse">
                    <div class="navbar-nav ms-auto">
                        <a href="index.jsp" class="nav-item nav-link active">Home</a>
                        <a href="moved/movedint.jsp" class="nav-item nav-link">Moved 소개</a>
                        <a href="include/calendar/calendar.jsp" class="nav-item nav-link">Moved 이사견적</a>
                        <a href="moved/statusBoard.jsp" class="nav-item nav-link">신청현황</a>
                        <a href="moved/board/board.jsp" class="nav-item nav-link">고객센터</a>
                        <a href="moved/contact/contact.jsp" class="nav-item nav-link">문의</a>
                    </div>
                </div>
            </nav>
        </div>
    </div>
    <!-- Navbar End -->


    <!-- Hero Start -->
    <div class="container-fluid pt-5 bg-primary hero-header mb-5">
        <div class="container pt-5">
            <div class="row g-5 pt-5">
                <div class="col-lg-6 align-self-center text-center text-lg-start mb-lg-5">
                    <div class="btn btn-sm border rounded-pill text-white px-3 mb-3 animated slideInRight">AI.Tech</div>
                    <h1 class="display-4 text-white mb-4 animated slideInRight">Artificial Intelligence for M<span style="color:skyblue;">O</span>VED</h1>
                    <p class="text-white mb-4 animated slideInRight">"지금 로그인하시면 [이사 비용 견적]을 받으실 수 있습니다!"<br>"게스트 로그인으로 회원 가입 없이 바로 시작해 보세요!"</p>
                    <p class="text-white mb-4 animated slideInRight"> 회원 로그인으로 더 편리하고 풍성한 서비스를 경험하세요 </p>
                    <a href="moved/login/login.jsp" class="btn btn-light py-sm-3 px-sm-5 rounded-pill me-3 animated slideInRight"><i class="fa-solid fa-lock"></i> 로그인</a>
                    <a href="moved/join/join.jsp" class="btn btn-outline-light py-sm-3 px-sm-5 rounded-pill animated slideInRight"><i class="fa-solid fa-right-to-bracket"></i> 회원가입</a>
                </div>
                <div class="col-lg-6 align-self-end text-center text-lg-end">
                    <img class="img-fluid" src="assets/img/메인트럭4.png" alt="" style="padding-bottom: 30px;">
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


    <!-- About Start -->
    <div class="container-fluid py-5">
        <div class="container py-5">
            <div class="row g-5 align-items-center">
                <div class="col-lg-6 wow fadeIn" data-wow-delay="0.1s">
                    <div class="about-img">
                        <img class="img-fluid" src="assets/img/about-img.png">
                    </div>
                </div>
                <div class="col-lg-6 wow fadeIn" data-wow-delay="0.5s">
                    <div class="btn btn-sm border rounded-pill text-primary px-3 mb-3">About Us</div>
                    <h1 class="mb-4">간편하고 편리한 이사, <br> M<span style="color:skyblue;">O</span>VED가 도와드립니다.</h1>
                    <p class="mb-4"> - 알아서 견적, 포장, 운송까지 쉽고 빠르게 이사하세요.<br> - 더욱 안전하고 신속한 이사 서비스. <br> - AI가 알아서 견적을 내드립니다.</p>
                    <p class="mb-4">고객 맞춤형 이사서비스로, 안전하고 편리한 이사 경험을 선사합니다. <br> 이사 걱정은 이제 그만, [M<span style="color:skyblue;">O</span>VED]가 해결해드립니다.</p>
                    <div class="row g-3">
                        <div class="col-sm-6">
                            <h6 class="mb-3"><i class="fa fa-check text-primary me-2"></i>쉽고 빠른 이사</h6>
                            <h6 class="mb-0"><i class="fa fa-check text-primary me-2"></i>비용 절감</h6>
                        </div>
                        <div class="col-sm-6">
                            <h6 class="mb-3"><i class="fa fa-check text-primary me-2"></i>쉬운 사용방법</h6>
                            <h6 class="mb-0"><i class="fa fa-check text-primary me-2"></i>편리성</h6>
                        </div>
                    </div>
                    <div class="d-flex align-items-center mt-4">
                        <a class="btn btn-primary rounded-pill px-4 me-3" href="">Read More</a>
                        <a class="btn btn-outline-primary btn-square me-3" href=""><i class="fab fa-facebook-f"></i></a>
                        <a class="btn btn-outline-primary btn-square me-3" href=""><i class="fab fa-twitter"></i></a>
                        <a class="btn btn-outline-primary btn-square me-3" href=""><i class="fab fa-instagram"></i></a>
                        <a class="btn btn-outline-primary btn-square" href=""><i class="fab fa-linkedin-in"></i></a>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- About End -->


    


    <!-- Feature Start -->
    <div class="container-fluid bg-primary feature pt-5">
        <div class="container pt-5">
            <div class="row g-5">
                <div class="col-lg-6 align-self-center mb-md-5 pb-md-5 wow fadeIn" data-wow-delay="0.3s">
                    <div class="btn btn-sm border rounded-pill text-white px-3 mb-3">Why Choose Us</div>
                    <h1 class="text-white mb-4">1분 만에 무료견적, 3분 만에 이사 예약 가능!</h1>
                    <p class="text-light mb-4"> MOVED는 고객의 안전과 만족을 최우선으로 생각합니다. 고객님의 이사 계획을 세심하게 듣고, 최적의 서비스를 제공하기 위해 최선을 다하겠습니다.</p>
                    <div class="d-flex align-items-center text-white mb-3">
                        <div class="btn-sm-square bg-white text-primary rounded-circle me-3">
                            <i class="fa fa-check"></i>
                        </div>
                        <span>신뢰할 수 있는 MOVED, 빠르고 편리한 이사 서비스! <br> 지금 바로 이용하세요.</span>
                    </div>
                    <div class="d-flex align-items-center text-white mb-3">
                        <div class="btn-sm-square bg-white text-primary rounded-circle me-3">
                            <i class="fa fa-check"></i>
                        </div>
                        <span>당신의 이사, MOVED가 책임집니다! 지금 바로 로그인하세요.</span>
                    </div>
                    <div class="d-flex align-items-center text-white mb-3">
                        <div class="btn-sm-square bg-white text-primary rounded-circle me-3">
                            <i class="fa fa-check"></i>
                        </div>
                        <span>MOVED는 믿을 수 있는 업체와 빠르고 편리한 이사 서비스를 제공합니다.</span>
                    </div>
                    <div class="row g-4 pt-3">
                        <div class="col-sm-6">
                            <div class="d-flex rounded p-3" style="background: rgba(256, 256, 256, 0.1);">
                                <i class="fa fa-home fa-3x text-white"></i>
                                <div class="ms-3">
                                    <h2 class="text-white mb-0" data-toggle="counter-up">9999</h2>
                                    <p class="text-white mb-0">Happy Clients</p>
                                </div>
                            </div>
                        </div>
                        <div class="col-sm-6">
                            <div class="d-flex rounded p-3" style="background: rgba(256, 256, 256, 0.1);">
                                <i class="fa fa-home fa-3x text-white"></i>
                                <div class="ms-3">
                                    <h2 class="text-white mb-0" data-toggle="counter-up">9999</h2>
                                    <p class="text-white mb-0">Project Complete</p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-lg-6 align-self-end text-center text-md-end wow fadeIn" data-wow-delay="0.5s">
                    <img class="img-fluid" src="assets/img/feature_test.png" alt="">
                </div>
            </div>
        </div>
    </div>
    <!-- Feature End -->


    

    <!-- FAQs Start -->
    <div class="container-fluid py-5">
        <div class="container py-5">
            <div class="mx-auto text-center wow fadeIn" data-wow-delay="0.1s" style="max-width: 500px;">
                <div class="btn btn-sm border rounded-pill text-primary px-3 mb-3">FAQs</div>
                <h1 class="mb-4">자주 묻는 질문</h1>
            </div>
            <div class="row">
                <div class="col-lg-6">
                    <div class="accordion" id="accordionFAQ1">
                        <div class="accordion-item wow fadeIn" data-wow-delay="0.1s">
                            <h2 class="accordion-header" id="headingOne">
                                <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse"
                                    data-bs-target="#collapseOne" aria-expanded="false" aria-controls="collapseOne">
                                    어떻게 신청하나요?
                                </button>
                            </h2>
                            <div id="collapseOne" class="accordion-collapse collapse" aria-labelledby="headingOne"
                                data-bs-parent="#accordionFAQ1">
                                <div class="accordion-body">
                                    회원 가입 후 로그인을 하신 다음 이사 견적 페이지에서 순차적으로 진행하면 됩니다
                                </div>
                            </div>
                        </div>
                        <div class="accordion-item wow fadeIn" data-wow-delay="0.2s">
                            <h2 class="accordion-header" id="headingTwo">
                                <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse"
                                    data-bs-target="#collapseTwo" aria-expanded="false" aria-controls="collapseTwo">
                                    견적을 받는데 얼마나 걸리나요?
                                </button>
                            </h2>
                            <div id="collapseTwo" class="accordion-collapse collapse" aria-labelledby="headingTwo"
                                data-bs-parent="#accordionFAQ1">
                                <div class="accordion-body">
                                    예상 견적은 즉시 나오나 업체측 실견적은 1~3일 이내에 처리됩니다
                                </div>
                            </div>
                        </div>
                        <div class="accordion-item wow fadeIn" data-wow-delay="0.3s">
                            <h2 class="accordion-header" id="headingThree">
                                <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse"
                                    data-bs-target="#collapseThree" aria-expanded="false" aria-controls="collapseThree">
                                    사진으로 찍어서 올려도 되나요?
                                </button>
                            </h2>
                            <div id="collapseThree" class="accordion-collapse collapse" aria-labelledby="headingThree"
                                data-bs-parent="#accordionFAQ1">
                                <div class="accordion-body">
                                    사진 촬영시 해당 상품만 나오게 명확하게 찍어서 업로드 해주시면 처리됩니다
                                </div>
                            </div>
                        </div>
                        <div class="accordion-item wow fadeIn" data-wow-delay="0.4s">
                            <h2 class="accordion-header" id="headingFour">
                                <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse"
                                    data-bs-target="#collapseFour" aria-expanded="true" aria-controls="collapseFour">
                                    모바일로도 신청 가능한가요?
                                </button>
                            </h2>
                            <div id="collapseFour" class="accordion-collapse collapse" aria-labelledby="headingFour"
                                data-bs-parent="#accordionFAQ1">
                                <div class="accordion-body">
                                    모바일에서 즉시 촬영 후 업로드 해서 즉시 견적을 받아보실 수 있습니다.
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-lg-6">
                    <div class="accordion" id="accordionFAQ2">
                        <div class="accordion-item wow fadeIn" data-wow-delay="0.5s">
                            <h2 class="accordion-header" id="headingFive">
                                <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse"
                                    data-bs-target="#collapseFive" aria-expanded="false" aria-controls="collapseFive">
                                    진행 사항을 확인 할 수 있나요?
                                </button>
                            </h2>
                            <div id="collapseFive" class="accordion-collapse collapse" aria-labelledby="headingFive"
                                data-bs-parent="#accordionFAQ2">
                                <div class="accordion-body">
                                    마이페이지 혹은 신청 현황에서 확인 가능합니다.
                                </div>
                            </div>
                        </div>
                        <div class="accordion-item wow fadeIn" data-wow-delay="0.6s">
                            <h2 class="accordion-header" id="headingSix">
                                <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse"
                                    data-bs-target="#collapseSix" aria-expanded="false" aria-controls="collapseSix">
                                    전화 상담 가능시간은 어떻게 되나요?
                                </button>
                            </h2>
                            <div id="collapseSix" class="accordion-collapse collapse" aria-labelledby="headingSix"
                                data-bs-parent="#accordionFAQ2">
                                <div class="accordion-body">
                                    평일 오전 9:00 부터 오후 6:00까지 유선 상담 가능합니다.
                                </div>
                            </div>
                        </div>
                        <div class="accordion-item wow fadeIn" data-wow-delay="0.7s">
                            <h2 class="accordion-header" id="headingSeven">
                                <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse"
                                    data-bs-target="#collapseSeven" aria-expanded="false" aria-controls="collapseSeven">
                                    사용시 얻는 이점이 뭐가있나요?
                                </button>
                            </h2>
                            <div id="collapseSeven" class="accordion-collapse collapse" aria-labelledby="headingSeven"
                                data-bs-parent="#accordionFAQ2">
                                <div class="accordion-body">
                                    업체 견적에따라 고객님이 선택하여 합리적인 가격에 쉽고 빠르게 진행하실 수 있습니다.
                                </div>
                            </div>
                        </div>
                        <div class="accordion-item wow fadeIn" data-wow-delay="0.8s">
                            <h2 class="accordion-header" id="headingEight">
                                <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse"
                                    data-bs-target="#collapseEight" aria-expanded="false" aria-controls="collapseEight">
                                    이사 항목 이외의 물건들은 어떻게 되나요?
                                </button>
                            </h2>
                            <div id="collapseEight" class="accordion-collapse collapse" aria-labelledby="headingEight"
                                data-bs-parent="#accordionFAQ2">
                                <div class="accordion-body">
                                    운송시 비용발생이 큰 상품순으로 적용이 되며 일정 크기 이하의 상품은 기존과 동일하게 처리됩니다.
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- FAQs Start -->


    


    





    <!-- Footer Start -->
    <div class="container-fluid bg-dark text-white-50 footer pt-5">
        <div class="container py-5">
            <div class="row g-5">
                <div class="col-md-6 col-lg-3 wow fadeIn" data-wow-delay="0.1s">
                    <a href="index.jsp" class="d-inline-block mb-3">
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
    <script src="assets/js/main.js"></script>
</body>

</html>