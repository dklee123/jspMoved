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
<title>상품 목록 및 결제 정보</title>
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
                        <a href="../../../include/calendar/cal.jsp" class="nav-item nav-link">Moved 이사견적</a>
                        <a href="../../../moved/statusBoard.jsp" class="nav-item nav-link">신청현황</a>
                        <a href="../../../moved/board.jsp" class="nav-item nav-link">고객센터</a>
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
            <div class="mx-auto text-center wow fadeIn" data-wow-delay="0.1s" style="max-width: 500px;">
                <div class="btn btn-sm border rounded-pill text-primary px-3 mb-3">직접 선택</div>
                <h1 class="mb-4"> 가구 목록 </h1>
                <img src="../../../assets/img/logo.png" />
	<div style="margin-top: 20px;" id="imageContainer"></div>
	
	
	
	<br>
	<p>가구종류와 수량을 선택하세요.</p>
	
<%

int totalAmount = 0;
String orderNumber = "";

Enumeration<String> parameterNames = request.getParameterNames();

while (parameterNames.hasMoreElements()) {
    String paramName = parameterNames.nextElement();
    if (paramName.startsWith("quantity_")) {
        String productName = paramName.substring("quantity_".length());
        int quantity = Integer.parseInt(request.getParameter(paramName));
        
        Connection conn = null;
        PreparedStatement pstmt = null;
        PreparedStatement pstmt4 = null;
        ResultSet rs = null;
        ResultSet rs2 = null;
        
 	   String loginBtn = "로그인";
 	   String loginLink = "../../../moved/login/login.jsp";
 	   String id = "";
 	   String name ="";
 	   MemberVo resultvo = new MemberVo();
 	   // 세션정보를 확인해서 페이지를 보여줄지 여부를 판단
 	   if(session.getAttribute("memid")==null){
 	      loginBtn = "로그인";
 	      loginLink = "../../../moved/login/login.jsp";
 	      out.println("<script>alert('로그인 후 사용가능합니다');</script>");
 	      out.println("<script>location.href='../../../moved/login/login.jsp'</script>");
 	   }else{
 	      id = (String)session.getAttribute("memid");
 	      loginBtn = "로그아웃";
 	      loginLink = "../../../moved/login/logout.jsp";
 	      
 	      // 세션이 생성 확인 후 
 	      // 지역변수 자리
 	      MemberDao memdao = new MemberDao();
 	      resultvo = memdao.getMemberById(id);
 	      
 	      //이름 가져오기
 	      name = resultvo.getName();     
 	   }    
 	   
       Class.forName("oracle.jdbc.driver.OracleDriver");
       conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:ORCL", "jsp", "123456");
       pstmt4 = conn.prepareStatement("SELECT ORDER_NO FROM CLIENT WHERE NAME = (?)");
       pstmt4.setString(1, name);
       rs2 = pstmt4.executeQuery();
       
       while(rs2.next()){
 	   orderNumber = rs2.getString("ORDER_NO");
       }
        
        try {
            Class.forName("oracle.jdbc.driver.OracleDriver");
            conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:ORCL", "jsp", "123456");
            pstmt = conn.prepareStatement("SELECT PRICE FROM GOODS WHERE NAME = ?");
            pstmt.setString(1, productName);
            rs = pstmt.executeQuery();
    
            if (rs.next()) {
                double price = rs.getDouble("PRICE");
                int productPrice = (int) Math.floor(price);
                double subtotal = quantity * productPrice;
                int subtotalPrice = (int) Math.floor(subtotal);
                totalAmount += subtotalPrice;
                
				// 결과 DB에 저장
    			PreparedStatement pstmt2 = conn.prepareStatement("UPDATE CLIENT SET COST = (?) WHERE NAME = (?)");
    		    pstmt2.setInt(1, totalAmount);
    		    pstmt2.setString(2, name); 		    
    		    
                PreparedStatement pstmt3 = conn.prepareStatement("INSERT INTO SELECTED_GOODS (ORDER_NO, NAME,PROD,QUANT,PRICE) VALUES (?, ?,?,?,?)");
                pstmt3.setString(1, orderNumber);
                pstmt3.setString(2, name);
                pstmt3.setString(3, productName);            
                pstmt3.setInt(4, quantity);            
                pstmt3.setInt(5, subtotalPrice);
    		    
    		    int rowsAffected = pstmt2.executeUpdate();
    		    rowsAffected = pstmt3.executeUpdate();
    		    
    		    String translatedName = "";
    		    
  	switch(productName){
  	case "refrigerator":
  		translatedName = "냉장고";
  		break;
  	case "washing_machine":
  		translatedName = "세탁기";
  	case "chair":
  		translatedName = "의자";
  		break;
  	case "bed":
  		translatedName = "침대";
  		break;
  	case "table":
  		translatedName = "테이블";
  		break;
  	case "tv":
  		translatedName = "TV";
  		break;
  	default:
  		translatedName = productName;
  	}
    		    
    %>

    <p style="text-align:left; font-weight:bold; color:black;"><%= translatedName %> - <%= quantity %>개, <%= subtotalPrice %>원</p>

    <%
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (rs != null) rs.close();
            if (pstmt != null) pstmt.close();
            if (conn != null) conn.close();
        }
    }
}
%>




<form action="" method="post" style="text-align:left;">
    <%
    Connection conn = null;
    PreparedStatement pstmt = null;
    ResultSet rs = null;
    
    try {
        Class.forName("oracle.jdbc.driver.OracleDriver");
        conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:ORCL", "jsp", "123456");
        pstmt = conn.prepareStatement("SELECT NAME, PRICE FROM GOODS");
        rs = pstmt.executeQuery();
    
        while (rs.next()) {
            String productName = rs.getString("NAME");
            double price = rs.getDouble("PRICE");
            int productPrice = (int) Math.floor(price);
            
		    String translatedName = "";
		    
	switch(productName){
	case "refrigerator":
		translatedName = "냉장고";
		break;
	case "washing_machine":
		translatedName = "세탁기";
		break;
		
	case "chair":
		translatedName = "의자";
		break;
	case "bed":
		translatedName = "침대";
		break;
	case "table":
		translatedName = "테이블";
		break;
	case "tv":
		translatedName = "TV";
		break;
	default:
		translatedName = productName;
	}
	
    %>
    
    <hr>
<label>
  <input type="checkbox" name="selectedProducts" id="<%=productName%>" value="<%=price%>" data-product-name="<%=productName%>">
  <%=translatedName%> - <%=productPrice%>원
  <input type="number" size="2" style="width: 35px;" name="quantity_<%=productName%>" value="0" disabled>
</label><br>
    
    <%
        }
    } catch (Exception e) {
        e.printStackTrace();
    } finally {
        if (rs != null) rs.close();
        if (pstmt != null) pstmt.close();
        if (conn != null) conn.close();
    }
    %>
    <hr>
    <!-- 계산하기 버튼 -->
    <br> <input id="calculate" type="submit" value="계산하기">
    <hr>
    <!-- 총 원 -->
    <p style="font-weight:bold; color:blue;">총 <%= totalAmount %>원</p>
    <hr>
    <!-- 다음 버튼 -->
    <p style="text-align:left;">다음 내용으로 넘어 가려면 아래 → 를 누르세요.</p>
    <a href="../../../include/distance/distance.jsp"><span class="btn btn-square btn-primary"><i class="fa fa-arrow-right"></i></span></a>
	</form>
<script>
    const calculate = document.getElementById("calculate");
    // 업로드 버튼
    calculate.style.backgroundColor = "#7ABDE9";
    calculate.style.color = "white";
    calculate.style.fontSize = "16px";
    calculate.style.fontFamily = "malgunGothic";
    calculate.style.border = "none";
    calculate.style.margin = '10px 0';
    calculate.style.padding = "10px 20px";

    // 체크박스 작동 스크립트
var checkboxes = document.querySelectorAll('input[type="checkbox"][name="selectedProducts"]');
checkboxes.forEach(function(checkbox) {
    checkbox.addEventListener('change', function() {
        // productName 값을 데이터 속성을 통해 가져오기
        var productName = this.getAttribute('data-product-name');
        var quantityInput = document.querySelector('input[type="number"][name="quantity_' + productName + '"]');
        var imageContainer = document.getElementById('imageContainer');
        var image = new Image();
        // 이미지 경로 지정
        var imagePath = '../../../assets/img/' + productName + ".png";
        image.src = imagePath;
        image.alt = productName;

        // 현재 이미지가 없을 경우
        if (this.checked) {
            imageContainer.appendChild(image);
        } else {
            // 현재 이미지가 존재할 경우
            var existingImage = document.querySelector('img[alt="' + productName + '"]');
            if (existingImage) {
                imageContainer.removeChild(existingImage);
            }
        }
        quantityInput.disabled = !this.checked;
    });
});

    
    
</script>
      
                
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
