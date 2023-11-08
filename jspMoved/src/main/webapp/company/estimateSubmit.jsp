<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="human.dao.CompanyDao" %>
<%@ page import="human.vo.CompanyVo" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
    <title>신청현황</title>
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
    <link href="../lib/animate/animate.min.css" rel="stylesheet">
    <link href="../lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">

    <!-- Customized Bootstrap Stylesheet -->
    <link href="../assets/css/bootstrap.min.css" rel="stylesheet">

    <!-- Template Stylesheet -->
    <link href="../assets/css/style.css" rel="stylesheet">
    
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
<!--     <div class="container-fluid sticky-top">
        <div class="container">
            <nav class="navbar navbar-expand-lg navbar-dark p-0">
                <a href="index.html" class="navbar-brand">
                    <h1 class="text-white">M<span style="color:skyblue;">O</span><span class="text-white">VED</span></h1>
                </a>
                <button type="button" class="navbar-toggler ms-auto me-0" data-bs-toggle="collapse"
                    data-bs-target="#navbarCollapse">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse" id="navbarCollapse">
                    <div class="navbar-nav ms-auto">
                        <a href="index.html" class="nav-item nav-link active">Home</a>
                        <a href="movedint.html" class="nav-item nav-link">Moved 소개</a>
                        <a href="select.html" class="nav-item nav-link">Moved 이사견적</a>
                        <a href="board.html" class="nav-item nav-link">신청현황</a>
                        <a href="board.html" class="nav-item nav-link">고객센터</a>
                        <div class="nav-item dropdown">
                            <a href="#" class="nav-link dropdown-toggle" data-bs-toggle="dropdown">Pages</a>
                            <div class="dropdown-menu bg-light mt-2">
                                <a href="feature.html" class="dropdown-item">Features</a>
                                <a href="team.html" class="dropdown-item">Our Team</a>
                                <a href="faq.html" class="dropdown-item">FAQs</a>
                                <a href="testimonial.html" class="dropdown-item">Testimonial</a>
                                <a href="404.html" class="dropdown-item">404 Page</a>
                            </div>
                        </div>
                        <a href="contact.html" class="nav-item nav-link">Contact</a>
                    </div>
                    <butaton type="button" class="btn text-white p-0 d-none d-lg-block" data-bs-toggle="modal"
                        data-bs-target="#searchModal"><i class="fa fa-search"></i></butaton>
                </div>
            </nav>
        </div>
    </div> -->
    <!-- Navbar End -->


    <!-- Hero Start -->
    <div class="container-fluid pt-5 hero-header" style="background-color:black;">
        <div class="container pt-5">
            <div class="row g-5 pt-5">
                <div class="col-lg-6 align-self-center text-center text-lg-start mb-lg-5">
                    <a href="comBoard.jsp"><h1 class="display-4 text-white mb-4 animated slideInRight">M<span style="color:skyblue;">O</span>VED 업체페이지</h1></a>
                    <nav aria-label="breadcrumb">
                        <ol class="breadcrumb justify-content-center justify-content-lg-start mb-0">
                            <li class="breadcrumb-item"><a class="text-white" href="#">Home</a></li>
                            <li class="breadcrumb-item text-white active" aria-current="page">Comapny services</li>
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
    <div class="row" style=padding-bottom:50px;">
        
        
        
    
    </div>
    <!-- end row -->
<%
String loginBtn = "로그인";
String loginLink = "clogin.jsp";
String id = "";
String companyName = "";
String cemail = "";
String cphone = "";

if (session.getAttribute("memid") == null) { 
    loginBtn = "로그인";
    loginLink = "clogin.jsp";
    out.println("<script>alert('로그인 후 사용가능합니다');</script>");
    out.println("<script>location.href='../company/login/clogin.jsp'</script>");
} else {
    id = (String) session.getAttribute("memid");
    loginBtn = "로그아웃";
    loginLink = "logout.jsp";

    CompanyDao comdao = new CompanyDao();
    CompanyVo resultvo = comdao.getMemberById(id);

    companyName = resultvo.getCompanyname();

}	

String orderNo = request.getParameter("order_number");

String rfg_quant  = request.getParameter("refrigerator");
int rfgQuant = Integer.parseInt(rfg_quant);

String rfg_price  = request.getParameter("refrigerator_price");
int rfgPrice = Integer.parseInt(rfg_price);

String wsm_quant  = request.getParameter("washing_machine");
int wsmQuant = Integer.parseInt(wsm_quant);

String wsm_price  = request.getParameter("washing_machine_price");
int wsmPrice = Integer.parseInt(wsm_price);

String chr_quant  = request.getParameter("chair");
int chrQuant = Integer.parseInt(chr_quant);

String chr_price  = request.getParameter("chair_price");
int chrPrice = Integer.parseInt(chr_price);

String bed_quant  = request.getParameter("bed");
int bedQuant = Integer.parseInt(bed_quant);

String bed_price  = request.getParameter("bed_price");
int bedPrice = Integer.parseInt(bed_price);

String tab_quant  = request.getParameter("table");
int tabQuant = Integer.parseInt(tab_quant);

String tab_price  = request.getParameter("table_price");
int tabPrice = Integer.parseInt(tab_price);

String tv_quant  = request.getParameter("tv");
int tvQuant = Integer.parseInt(tv_quant);

String tv_price  = request.getParameter("tv_price");
int tvPrice = Integer.parseInt(tv_price);

String dist_price = request.getParameter("distance_price");
int distPrice = Integer.parseInt(dist_price);

int totalPrice = rfgPrice + wsmPrice + chrPrice + bedPrice + tabPrice + tvPrice + distPrice;

// 오라클 데이터베이스 연결 설정
String url = "jdbc:oracle:thin:@localhost:1521:ORCL";
String user = "jsp";
String passwd = "123456";

try {
    Class.forName("oracle.jdbc.driver.OracleDriver");

    Connection conn = DriverManager.getConnection(url, user, passwd);

	PreparedStatement pstmt = conn.prepareStatement("MERGE INTO COMPANY_ESTIMATE dest USING (SELECT ? AS order_no, ? AS companyname, ? AS rfg_quant, ? AS rfg_price, ? AS wsm_quant, ? AS wsm_price, ? AS chr_quant, ? AS chr_price, ? AS bed_quant, ? AS bed_price, ? AS tab_quant, ? AS tab_price, ? AS tv_quant, ? AS tv_price, ? AS dist_price, ? AS total_price FROM dual) src ON (dest.order_no = src.order_no AND dest.companyname = src.companyname) WHEN MATCHED THEN UPDATE SET dest.rfg_quant = src.rfg_quant, dest.rfg_price = src.rfg_price, dest.wsm_quant = src.wsm_quant, dest.wsm_price = src.wsm_price, dest.chr_quant = src.chr_quant, dest.chr_price = src.chr_price, dest.bed_quant = src.bed_quant, dest.bed_price = src.bed_price, dest.tab_quant = src.tab_quant, dest.tab_price = src.tab_price, dest.tv_quant = src.tv_quant, dest.tv_price = src.tv_price, dest.dist_price = src.dist_price, dest.total_price = src.total_price WHEN NOT MATCHED THEN INSERT (order_no, companyname, rfg_quant, rfg_price, wsm_quant, wsm_price, chr_quant, chr_price, bed_quant, bed_price, tab_quant, tab_price, tv_quant, tv_price, dist_price, total_price) VALUES (src.order_no, src.companyname, src.rfg_quant, src.rfg_price, src.wsm_quant, src.wsm_price, src.chr_quant, src.chr_price, src.bed_quant, src.bed_price, src.tab_quant, src.tab_price, src.tv_quant, src.tv_price, src.dist_price, src.total_price)");
    pstmt.setString(1, orderNo);
    pstmt.setString(2, companyName);
    pstmt.setInt(3, rfgQuant);
    pstmt.setInt(4, rfgPrice);
    pstmt.setInt(5, wsmQuant);
    pstmt.setInt(6, wsmPrice);
    pstmt.setInt(7, chrQuant);
    pstmt.setInt(8, chrPrice);
    pstmt.setInt(9, bedQuant);
    pstmt.setInt(10, bedPrice);
    pstmt.setInt(11, tabQuant);
    pstmt.setInt(12, tabPrice);
    pstmt.setInt(13, tvQuant);
    pstmt.setInt(14, tvPrice);
    pstmt.setInt(15, distPrice);
    pstmt.setInt(16, totalPrice);
    int rowsAffected = pstmt.executeUpdate();
    
    PreparedStatement pstmt2 = conn.prepareStatement("UPDATE CLIENT SET PROCESS = (?) WHERE ORDER_NO = (?)");
    pstmt2.setString(1, "고객전달");
    pstmt2.setString(2, orderNo); 
    pstmt2.executeUpdate();
    
} catch (Exception e) {
    out.println("오류 발생: " + e.getMessage());
}
%>



<h1 style="text-align:center; padding-bottom:50px;">견적이 성공적으로 전달되었습니다.</h1>
    <div class="row">
    <div class="col-lg-12">
        <div class="card">
            <div class="card-body">
                <div class="table-responsive project-list">
                    <table class="table project-table table-centered table-nowrap">
                        <thead>
                            <tr>
                                <th scope="col">주문번호</th>
                                <th scope="col">이름</th>
                                <th scope="col">이사희망일</th>                                 
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
	        <td>업체명</td>
	        <td colspan="2"><%= companyName %></td>
	    </tr>
	    <tr>
	        <td>냉장고</td>
	        <td><%= rfgQuant %></td>
	        <td><%= rfgPrice %></td>
	    </tr>
	    <tr>
	        <td>세탁기</td>
	        <td><%= wsmQuant %></td>
	        <td><%= wsmPrice %></td>
	    </tr>
	    <tr>
	        <td>의자</td>
	        <td><%= chrQuant %></td>
	        <td><%= chrPrice %></td>
	    </tr>
	    <tr>
	        <td>침대</td>
	        <td><%= bedQuant %></td>
	        <td><%= bedPrice %></td>
	    </tr>
	    <tr>
	        <td>테이블</td>
	        <td><%=tabQuant %></td>
	        <td><%= tabPrice %></td>
	    </tr>
	    <tr>
	        <td>텔레비전</td>
	        <td><%= tvQuant %></td>
	        <td><%= tvPrice %></td>
	    </tr>
	    	    <tr>
	        <td>운송요금</td>
	        <td colspan="2"><%= distPrice %></td>
	    </tr>
	    <tr>
	        <td>합계</td>
	        <td colspan="2"><%= totalPrice %></td>
	    </tr>
                        </tbody>
                    </table>
<!--    	<h2 style="text-align:center;padding-top: 10px;">M<span style="color:skyblue;">O</span>VED</h2>	 -->
	<h2 style="text-align:center;"><a href="comBoard.jsp"><button>확인</button></a></h2>
	<style>
	button {
	  background-color: skyblue;
	  color: white;
	  border: 0;
	  width: 100px;
	  height: 40px;
	
	  /* hover 적용 */
	  &:hover {
	    background-color: #5882FA;
	  }
	}
	</style>
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
                    <a href="comBoard.jsp" class="d-inline-block mb-3">
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
                    <a class="btn btn-link" href="">Moved 소개</a>
                    <a class="btn btn-link" href="">Moved 이사견적</a>                    
                </div>
                <div class="col-md-6 col-lg-3 wow fadeIn" data-wow-delay="0.7s">
                    <h5 class="text-white mb-4">Board</h5>
                    <a class="btn btn-link" href="">신청현황</a>
                    <a class="btn btn-link" href="">고객센터</a>                    
                    <a class="btn btn-link" href="">문의</a>                    
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
    <script src="../lib/wow/wow.min.js"></script>
    <script src="../lib/easing/easing.min.js"></script>
    <script src="../lib/waypoints/waypoints.min.js"></script>
    <script src="../lib/counterup/counterup.min.js"></script>
    <script src="../lib/owlcarousel/owl.carousel.min.js"></script>

    <!-- Template Javascript -->
    <script src="../assets/js/main.js"></script>
</body>
</html>