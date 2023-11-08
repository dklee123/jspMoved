<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.util.Enumeration"%>
<%@ page import="java.util.*"%>
<%@ page import="human.dao.MemberDao" %>
<%@ page import="human.vo.MemberVo" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>출발지/도착지 주소</title>
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
                        <a href="../../include/calendar/cal.jsp" class="nav-item nav-link">Moved 이사견적</a>
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
                    <h1 class="display-4 text-white mb-4 animated slideInRight">M<span style="color:skyblue;">O</span>VED 이사견적</h1>
                    <nav aria-label="breadcrumb">
                        <ol class="breadcrumb justify-content-center justify-content-lg-start mb-0">
                            <li class="breadcrumb-item"><a class="text-white" href="#">Home</a></li>
                            <li class="breadcrumb-item text-white active" aria-current="page">Estimation</li>
                        </ol>
                    </nav>
                </div>
                <div class="col-lg-6 align-self-end text-center text-lg-end">
<!--                    <img class="img-fluid" src="../../../assets/img/hero-img.png" alt="" style="max-height: 300px;">-->
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


    <!-- Case Start -->
    <div class="container-fluid bg-light py-5">
        <div class="container py-5">
            <div class="mx-auto text-center wow fadeIn" data-wow-delay="0.1s" style="max-width: 1000px; width:800px;">
                <div class="btn btn-sm border rounded-pill text-primary px-3 mb-3">거리 계산</div>
                <h1 class="mb-4"> 거리 계산 </h1>
                <img src="../../assets/img/logo.png" />
	<div style="margin-top: 20px;" id="imageContainer"></div>
	
	
	
	
	<p>출발주소와 도착주소의 거리를 계산중입니다.</p>



<form action="../../include/distance/distanceCost.jsp" type="POST">
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
request.setCharacterEncoding("UTF-8");
String origin_front = request.getParameter("origin_address");
String origin_back = request.getParameter("origin_detail");
String origin_address = origin_front + " " + origin_back;

String destination_front = request.getParameter("destination_address");
String destination_back = request.getParameter("destination_detail");
String destination_address = destination_front + " " + destination_back;

String url = "jdbc:oracle:thin:@localhost:1521:ORCL";
String user = "jsp";
String passwd = "123456";

try {
 // JDBC 드라이버 로드
 Class.forName("oracle.jdbc.driver.OracleDriver");

 // 데이터베이스에 연결
 Connection conn = DriverManager.getConnection(url, user, passwd);

 // 입력 쿼리
 String originSql = "UPDATE CLIENT SET ORIGIN = (?) WHERE NAME = (?)";

 PreparedStatement pstmtOrigin = conn.prepareStatement(originSql);
 pstmtOrigin.setString(1, origin_address);
 pstmtOrigin.setString(2, name);
 int rowsAffected = pstmtOrigin.executeUpdate();

 String destinSql = "UPDATE  CLIENT SET DESTIN = (?) WHERE NAME = (?)";
 PreparedStatement pstmtDestin = conn.prepareStatement(destinSql);
 pstmtDestin.setString(1, destination_address);
 pstmtDestin.setString(2, name);
 int rowsAffected2 = pstmtDestin.executeUpdate();

 pstmtOrigin.close();
 pstmtDestin.close();
 conn.close();

} catch (Exception e) {
 out.println("오류 발생: " + e.getMessage());
}

%>

<input type="hidden" name="distance_value" value="">
<script>
//스타일
const body = document.body;
//body
body.style.display = 'flex';
body.style.flexDirection = 'column';
body.style.alignItems = 'center';
body.style.justifyContent = 'center';

const originsAddress = '<%=origin_address%>';
const destinationsAddress = '<%=destination_address%>';
console.log(originsAddress);
console.log(destinationsAddress);

const geocodingApiKey = "AIzaSyAudjpTypPWJYwQeCpwwifiwJPWFpRmML8";
const distanceMatrixApiKey = "AIzaSyAudjpTypPWJYwQeCpwwifiwJPWFpRmML8";
const baseUrl = `https://maps.googleapis.com/maps/api/geocode/json?address=`;
const lastUrl = `&key=`;

async function getGeocode_origin(address) {
	const geocodingUrl_origin = baseUrl + originsAddress + lastUrl + geocodingApiKey;
	  const response = await fetch(geocodingUrl_origin);
	  const data = await response.json();
	  
	  if (data.status === "OK") {
	    const location = data.results[0].geometry.location;
	    return [location.lat, location.lng];
	  } else {
	    return null;
	  }
	}

async function getGeocode_destination(address) {
	const geocodingUrl_destinations = baseUrl + destinationsAddress + lastUrl + geocodingApiKey;
	  const response = await fetch(geocodingUrl_destinations);
	  const data = await response.json();
	  
	  if (data.status === "OK") {
	    const location = data.results[0].geometry.location;
	    return [location.lat, location.lng];
	  } else {
	    return null;
	  }
	}
	
	async function main() {
	  const origins = await getGeocode_origin(originsAddress);
	  const destinations = await getGeocode_destination(destinationsAddress);
	
	  if (origins && destinations) {
	    const mode = "transit";
	    const base = "https://corsproxy.io/?https://maps.googleapis.com/maps/api/distancematrix/json?";
	    
	    const url = base + 'origins=' + origins[0] +',' + origins[1] +'&destinations='+destinations[0] +',' + destinations[1] + '&mode=transit&key=' + distanceMatrixApiKey
	    
	    const response = await fetch(url);
	    const data = await response.json();
	    
	    if (data.status === "OK") {
	       	distance = data.rows[0].elements[0].distance.text;
	        const distanceValueInput = document.querySelector('input[name="distance_value"]');
	        if (distanceValueInput) {
	          distanceValueInput.value = distance;
	        }
	       	
	        const duration = data.rows[0].elements[0].duration.text;
	        console.log(`거리 : `+ distance);

	        const distanceResult = document.getElementById("distanceResult");
	        const durationResult = document.getElementById("durationResult");
	        
	      } else {
	        console.log("거리 및 시간 정보를 가져오지 못했습니다.");
	      }

	    }
	}
	main();
</script>
<button id="submit" type="submit" style="display: none;"></button>
<script>

setTimeout(() => {document.getElementById("submit").click()}, 2000);
</script>
</form>


<!-- <img src="../../assets/img/logo.png"/> -->
<p style="font-size: 24px; background-color:#f0f0f0; padding: 10px 20px;">출발지 : <%= origin_address %></p>
<p style="font-size: 30px; color:#5C5D5D;">↓</p>
<p style="font-size: 24px; background-color:#f0f0f0; padding: 10px 20px;">도착지 : <%= destination_address %></p>
<div id="distanceResult" style="font-size: 24px;"></div>
<div id="costResult"></div>






                
            </div>
        </div>
    </div>
    
    
    <!-- Case End -->





    <!-- Footer Start -->
    <div class="container-fluid bg-dark text-white-50 footer pt-5">
        <div class="container py-5">
            <div class="row g-5">
                <div class="col-md-6 col-lg-3 wow fadeIn" data-wow-delay="0.1s">
                    <a href="../index.jsp" class="d-inline-block mb-3">
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
