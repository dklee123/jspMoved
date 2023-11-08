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
<title>분석 결과</title>
    <meta content="width=device-width, initial-scale=1.0" name="viewport">
    <meta content="" name="keywords">
    <meta content="" name="description">

    <!-- Favicon -->
    <link href="../../../assets/img/favicon.ico" rel="icon">

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
    <link href="../../../assets/css/bootstrap.min.css" rel="stylesheet">

    <!-- Template Stylesheet -->
    <link href="../../../assets/css/style.css" rel="stylesheet">
    
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
                <a href="../../../include/index.jsp" class="navbar-brand">
                    <h1 class="text-white">M<span style="color:skyblue;">O</span><span class="text-white">VED</span></h1>
                </a>
                <button type="button" class="navbar-toggler ms-auto me-0" data-bs-toggle="collapse"
                    data-bs-target="#navbarCollapse">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse" id="navbarCollapse">
                    <div class="navbar-nav ms-auto">
                        <a href="../../../include/index.jsp" class="nav-item nav-link active">Home</a>
                        <a href="../../../moved/movedint.jsp" class="nav-item nav-link">Moved 소개</a>
                        <a href="../../../include/calendar/calendar.jsp" class="nav-item nav-link">Moved 이사견적</a>
                        <a href="../../../moved/statusBoard.jsp" class="nav-item nav-link">신청현황</a>
                        <a href="../../../moved/board/board.jsp" class="nav-item nav-link">고객센터</a>
                        <a href="../../../moved/contact/contact.jsp" class="nav-item nav-link">문의</a>
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
                <div class="btn btn-sm border rounded-pill text-primary px-3 mb-3">주소 확인</div>
                <h1 class="mb-4">견적 결과 </h1>
                <img src="../../../assets/img/logo.png" />
	<div style="margin-top: 20px;" id="imageContainer"></div>
	
	
	
	
	<p>금액을 확인하세요.</p>


	<%
	String loginBtn = "로그인";
	String loginLink = "../../../moved/login/login.jsp";
	String id = "";
	String name = "";
	MemberVo resultvo = new MemberVo();
	if(session.getAttribute("memid")==null){
	   loginBtn = "로그인";
	   loginLink = "../../../moved/login/login.jsp";
	   out.println("<script>alert('로그인 후 사용가능합니다');</script>");
	   out.println("<script>location.href='../../../moved/login/login.jsp'</script>");
	}else{
	   id = (String)session.getAttribute("memid");
	   loginBtn = "로그아웃";
	   loginLink = "../../../moved/login/logout.jsp";
	   
	   MemberDao memdao = new MemberDao();
	   resultvo = memdao.getMemberById(id);
	   
	   name = resultvo.getName();
	}
	
	String totalPriceStr = request.getParameter("totalPrice");
	int totalPrice = Integer.parseInt(totalPriceStr);
	String prod1str = request.getParameter("PROD1");
	String prod2str = request.getParameter("PROD2");
	String prod3str = request.getParameter("PROD3");
	String prod4str = request.getParameter("PROD4");
	String prod5str = request.getParameter("PROD5");
	String prod6str = request.getParameter("PROD6");
	
	String prod1PriceStr = request.getParameter("PROD1_PRICE");
	String prod2PriceStr = request.getParameter("PROD2_PRICE");
	String prod3PriceStr = request.getParameter("PROD3_PRICE");
	String prod4PriceStr = request.getParameter("PROD4_PRICE");
	String prod5PriceStr = request.getParameter("PROD5_PRICE");
	String prod6PriceStr = request.getParameter("PROD6_PRICE");
	
	int prod1Price = 0;
	int prod2Price = 0;
	int prod3Price = 0;
	int prod4Price = 0;
	int prod5Price = 0;
	int prod6Price = 0;
	

if (!"undefined".equals(prod1PriceStr)) {
    prod1Price = Integer.parseInt(prod1PriceStr);
}
if (!"undefined".equals(prod2PriceStr)) {
    prod2Price = Integer.parseInt(prod2PriceStr);
}
if (!"undefined".equals(prod3PriceStr)) {
    prod3Price = Integer.parseInt(prod3PriceStr);
}
if (!"undefined".equals(prod4PriceStr)) {
    prod4Price = Integer.parseInt(prod4PriceStr);
}
if (!"undefined".equals(prod5PriceStr)) {
    prod5Price = Integer.parseInt(prod5PriceStr);
}
if (!"undefined".equals(prod6PriceStr)) {
    prod6Price = Integer.parseInt(prod6PriceStr);
}
	
	String url = "jdbc:oracle:thin:@localhost:1521:ORCL";
	String user = "jsp";
	String passwd = "123456";
	ResultSet rs = null;

	try {
	    Class.forName("oracle.jdbc.driver.OracleDriver");

	    Connection conn = DriverManager.getConnection(url, user, passwd);

		PreparedStatement pstmt = conn.prepareStatement("UPDATE CLIENT SET COST = (?) WHERE NAME = (?)");
	    pstmt.setInt(1, totalPrice);
	    pstmt.setString(2, name);
	    int rowsAffected = pstmt.executeUpdate();
	    
		PreparedStatement pstmt2 = conn.prepareStatement("SELECT * FROM CLIENT WHERE NAME = (?)");
	    pstmt2.setString(1,name);
	    rs = pstmt2.executeQuery();
	    
	    rs.next();
	    
	    String orderNo = rs.getString("ORDER_NO");
	    
		PreparedStatement pstmt3 = conn.prepareStatement("SELECT * FROM GOODS");
	    ResultSet rs2 = pstmt3.executeQuery();
        int prod1quant = 0;
        int prod2quant = 0;
        int prod3quant = 0;
        int prod4quant = 0;
        int prod5quant = 0;
        int prod6quant = 0;
        
	    while (rs2.next()) {


            if (prod1str != null) {
                if (prod1str.equals("refrigerator")) {
                    prod1quant = prod1Price / 200000;
                } else if (prod1str.equals("chair")) {
                    prod1quant =  prod1Price / 40000;
                }
                else if (prod1str.equals("washing_machine")) {
                    prod1quant =  prod1Price / 120000;
                }
                else if (prod1str.equals("bed")) {
                    prod1quant =  prod1Price / 130000;
                }
                else if (prod1str.equals("table")) {
                    prod1quant = prod1Price / 80000;
                }
                else if (prod1str.equals("tv")) {
                    prod1quant =  prod1Price / 110000;
                }
            }
            
            if (prod2str != null) {
                if (prod2str.equals("refrigerator")) {
                    prod2quant = prod2Price / 200000;
                } else if (prod2str.equals("chair")) {
                    prod2quant =  prod2Price / 40000;
                }
                else if (prod2str.equals("washing_machine")) {
                    prod2quant =  prod2Price / 120000;
                }
                else if (prod2str.equals("bed")) {
                    prod2quant =  prod2Price / 130000;
                }
                else if (prod2str.equals("table")) {
                    prod2quant = prod2Price / 80000;
                }
                else if (prod2str.equals("tv")) {
                    prod2quant =  prod2Price / 110000;
                }
            }

            
            if (prod3str != null) {
                if (prod3str.equals("refrigerator")) {
                    prod3quant = prod3Price / 200000;
                } else if (prod3str.equals("chair")) {
                    prod3quant =  prod3Price / 40000;
                }
                else if (prod3str.equals("washing_machine")) {
                    prod3quant =  prod3Price / 120000;
                }
                else if (prod3str.equals("bed")) {
                    prod3quant =  prod3Price / 130000;
                }
                else if (prod3str.equals("table")) {
                    prod3quant = prod3Price / 80000;
                }
                else if (prod3str.equals("tv")) {
                    prod3quant =  prod3Price / 110000;
                }
            }

            
            if (prod4str != null) {
                if (prod4str.equals("refrigerator")) {
                    prod4quant = prod4Price / 200000;
                } else if (prod4str.equals("chair")) {
                    prod4quant =  prod4Price / 40000;
                }
                else if (prod4str.equals("washing_machine")) {
                    prod4quant =  prod4Price / 120000;
                }
                else if (prod4str.equals("bed")) {
                    prod4quant =  prod4Price / 130000;
                }
                else if (prod4str.equals("table")) {
                    prod4quant = prod4Price / 80000;
                }
                else if (prod4str.equals("tv")) {
                    prod4quant =  prod4Price / 110000;
                }
            }

            
            if (prod5str != null) {
                if (prod5str.equals("refrigerator")) {
                    prod5quant = prod5Price / 200000;
                } else if (prod5str.equals("chair")) {
                    prod5quant =  prod5Price / 40000;
                }
                else if (prod5str.equals("washing_machine")) {
                    prod5quant =  prod5Price / 120000;
                }
                else if (prod5str.equals("bed")) {
                    prod5quant =  prod5Price / 130000;
                }
                else if (prod5str.equals("table")) {
                    prod5quant = prod5Price / 80000;
                }
                else if (prod5str.equals("tv")) {
                    prod5quant =  prod5Price / 110000;
                }
            }

            
            if (prod6str != null) {
                if (prod6str.equals("refrigerator")) {
                    prod6quant = prod6Price / 200000;
                } else if (prod6str.equals("chair")) {
                    prod6quant =  prod6Price / 40000;
                }
                else if (prod6str.equals("washing_machine")) {
                    prod6quant =  prod6Price / 120000;
                }
                else if (prod6str.equals("bed")) {
                    prod6quant =  prod6Price / 130000;
                }
                else if (prod6str.equals("table")) {
                    prod6quant = prod6Price / 80000;
                }
                else if (prod6str.equals("tv")) {
                    prod6quant =  prod6Price / 110000;
                }
            }

        }
	    
		PreparedStatement pstmt4 = conn.prepareStatement("INSERT INTO SELECTED_GOODS (ORDER_NO, NAME,PROD,QUANT,PRICE) VALUES (?,?,?,?,?)");
	    pstmt4.setString(1, orderNo);
	    pstmt4.setString(2, name);
	    pstmt4.setString(3, prod1str);
	    pstmt4.setInt(4, prod1quant);
	    pstmt4.setInt(5, prod1Price);
	   	
		PreparedStatement pstmt5 = conn.prepareStatement("INSERT INTO SELECTED_GOODS (ORDER_NO, NAME,PROD,QUANT,PRICE) VALUES (?,?,?,?,?)");
	    pstmt5.setString(1, orderNo);
	    pstmt5.setString(2, name);
	    pstmt5.setString(3, prod2str);
	    pstmt5.setInt(4, prod2quant);
	    pstmt5.setInt(5, prod2Price);
	    
		PreparedStatement pstmt6 = conn.prepareStatement("INSERT INTO SELECTED_GOODS (ORDER_NO, NAME,PROD,QUANT,PRICE) VALUES (?,?,?,?,?)");
	    pstmt6.setString(1, orderNo);
	    pstmt6.setString(2, name);
	    pstmt6.setString(3, prod3str);
	    pstmt6.setInt(4, prod3quant);
	    pstmt6.setInt(5, prod3Price);
	    
		PreparedStatement pstmt7 = conn.prepareStatement("INSERT INTO SELECTED_GOODS (ORDER_NO, NAME,PROD,QUANT,PRICE) VALUES (?,?,?,?,?)");
	    pstmt7.setString(1, orderNo);
	    pstmt7.setString(2, name);
	    pstmt7.setString(3, prod4str);
	    pstmt7.setInt(4, prod4quant);
	    pstmt7.setInt(5, prod4Price);
	    
		PreparedStatement pstmt8 = conn.prepareStatement("INSERT INTO SELECTED_GOODS (ORDER_NO, NAME,PROD,QUANT,PRICE) VALUES (?,?,?,?,?)");
	    pstmt8.setString(1, orderNo);
	    pstmt8.setString(2, name);
	    pstmt8.setString(3, prod5str);
	    pstmt8.setInt(4, prod5quant);
	    pstmt8.setInt(5, prod5Price);
	    
		PreparedStatement pstmt9 = conn.prepareStatement("INSERT INTO SELECTED_GOODS (ORDER_NO, NAME,PROD,QUANT,PRICE) VALUES (?,?,?,?,?)");
	    pstmt9.setString(1, orderNo);
	    pstmt9.setString(2, name);
	    pstmt9.setString(3, prod6str);
	    pstmt9.setInt(4, prod6quant);
	    pstmt9.setInt(5, prod6Price);
	    
	    rowsAffected = pstmt4.executeUpdate();
	    rowsAffected = pstmt5.executeUpdate();
	    rowsAffected = pstmt6.executeUpdate();
	    rowsAffected = pstmt7.executeUpdate();
	    rowsAffected = pstmt8.executeUpdate();
	    rowsAffected = pstmt9.executeUpdate();
	    
	    PreparedStatement pstmt10 = conn.prepareStatement("DELETE FROM SELECTED_GOODS WHERE PROD = 'undefined'");
	    rowsAffected = pstmt10.executeUpdate();
	    
	} catch (Exception e) {
	    out.println("오류 발생: " + e.getMessage());
	}
%>


<p style="font-size: 24px; background-color:#f0f0f0; padding: 10px 20px;">금액 : <strong style="color:blue;"><%= totalPrice %></strong> 원</p>
<%-- <p><%= classCount %></p> --%>
<a href="../../../include/distance/distance.jsp"><button type="button" class="" style="background-color:skyblue; color:white; border:none;">거리 계산으로</button></a>













                
            </div>
        </div>
    </div>
    
    
    <!-- Case End -->


 


     <!-- Footer Start -->
    <div class="container-fluid bg-dark text-white-50 footer pt-5">
        <div class="container py-5">
            <div class="row g-5">
                <div class="col-md-6 col-lg-3 wow fadeIn" data-wow-delay="0.1s">
                    <a href="../../index.jsp" class="d-inline-block mb-3">
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
    <script src="../../../assets/js/main.js"></script>
</body>

</html>
