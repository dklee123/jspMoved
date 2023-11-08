<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.sql.*" %>
<%@ page import="human.dao.BoardDao" %>
<%@ page import="human.vo.BoardVo" %>
<%@ page import="human.dao.MemberDao" %>
<%@ page import="human.vo.MemberVo" %>
<%@ page import="human.dao.ClientDao" %>
<%@ page import="human.vo.ClientVo" %>
<%@ page import="human.dao.FilesDao" %>
<%@ page import="human.vo.FilesVo" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
    <title>상세정보/견적입력</title>
    <meta content="width=device-width, initial-scale=1.0" name="viewport">
    <meta content="" name="keywords">
    <meta content="" name="description">

    <!-- Favicon -->
    <link href="../assets/img/favicon.ico" rel="icon">

    <!-- Google Web Fonts -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" >
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
	<script src="https://kit.fontawesome.com/0743fc8aa3.js"></script>
</head>

<body>

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
 

    <!-- end row -->


		
		<%
			String curPage = request.getParameter("page");
			String no = request.getParameter("no");
			
		%>
		
		
	<!-- 메인영역 -->
<!-- 	<div class="main_wrap">
		
		<div class="content_wrap">
			<br> -->
			<!-- <h5>고객 상세</h5> -->
  <%
    String url = "jdbc:oracle:thin:@localhost:1521:orcl";
    String user = "jsp";
    String passwd = "123456";
    String orderNo = request.getParameter("orderNo");
    
    String query = "SELECT " +
            "NVL(SUM(CASE WHEN PROD = 'refrigerator' THEN QUANT ELSE 0 END), 0) AS refrigerator_quant, " +
            "NVL(SUM(CASE WHEN PROD = 'refrigerator' THEN PRICE ELSE 0 END), 0) AS refrigerator_price, " +
            "NVL(SUM(CASE WHEN PROD = 'washing_machine' THEN QUANT ELSE 0 END), 0) AS washing_machine_quant, " +
            "NVL(SUM(CASE WHEN PROD = 'washing_machine' THEN PRICE ELSE 0 END), 0) AS washing_machine_price, " +
            "NVL(SUM(CASE WHEN PROD = 'chair' THEN QUANT ELSE 0 END), 0) AS chair_quant, " +
            "NVL(SUM(CASE WHEN PROD = 'chair' THEN PRICE ELSE 0 END), 0) AS chair_price, " +
            "NVL(SUM(CASE WHEN PROD = 'bed' THEN QUANT ELSE 0 END), 0) AS bed_quant, " +
            "NVL(SUM(CASE WHEN PROD = 'bed' THEN PRICE ELSE 0 END), 0) AS bed_price, " +
            "NVL(SUM(CASE WHEN PROD = 'table' THEN QUANT ELSE 0 END), 0) AS table_quant, " +
            "NVL(SUM(CASE WHEN PROD = 'table' THEN PRICE ELSE 0 END), 0) AS table_price, " +
            "NVL(SUM(CASE WHEN PROD = 'tv' THEN QUANT ELSE 0 END), 0) AS tv_quant, " +
            "NVL(SUM(CASE WHEN PROD = 'tv' THEN PRICE ELSE 0 END), 0) AS tv_price " +
            "FROM SELECTED_GOODS " +
            "WHERE ORDER_NO = ?";
    String query2 = "SELECT * FROM CLIENT WHERE ORDER_NO = ?";
    
    try {
        Connection conn = DriverManager.getConnection(url, user, passwd);
        PreparedStatement pstmt = conn.prepareStatement(query);
        pstmt.setString(1, orderNo);
        
        PreparedStatement pstmt2 = conn.prepareStatement(query2);
        pstmt2.setString(1, orderNo);
        
        ResultSet rs = pstmt.executeQuery();
        ResultSet rs2 = pstmt2.executeQuery();
        
        rs.next();
        rs2.next();
        
        int refrigerator_quant = rs.getInt("refrigerator_quant");
        int refrigerator_price = rs.getInt("refrigerator_price");
        int washing_machine_quant = rs.getInt("washing_machine_quant");
        int washing_machine_price = rs.getInt("washing_machine_price");
        int chair_quant = rs.getInt("chair_quant");
        int chair_price = rs.getInt("chair_price");
        int bed_quant = rs.getInt("bed_quant");
        int bed_price = rs.getInt("bed_price");
        int table_quant = rs.getInt("table_quant");
        int table_price = rs.getInt("table_price");
        int tv_quant = rs.getInt("tv_quant");
        int tv_price = rs.getInt("tv_price");
        String name = rs2.getString("NAME");
        String origin = rs2.getString("ORIGIN");
        String destin = rs2.getString("DESTIN");
        int moving_cost = rs2.getInt("moving_cost");
        
        
        int total_price = refrigerator_price + washing_machine_price + chair_price + bed_price + table_price + tv_price + moving_cost;
    %>
    
        <h2 style="padding-top:10px; text-align:center;">상세 정보</h2>
        <style>
		  table {
		    
		    border-collapse: collapse;
		  }
		  th{
		  	border-bottom: 1px solid black;
		  	
		  } 
		  td {
		    border-bottom: 1px solid #dee2e6;
		    padding-top:10px;		    
		    padding-bottom:10px;		    
		    
		  }
		  tr.hover2{
		  border:1px solid black;
		  background-color:#f3f3f3;
		  
		  }
		  
		  tr.hover:hover{
		  	background-color:#f3f3f3;
		  	
		  }
		</style>
	    <div class="card" style="background-color:white; width:50%; margin:auto;">
	       <table style="width: 95%; margin: 0 auto;">
		<tr class="hover">
	        <td style="padding-top: 10px; border:none;"><strong>신청자명</strong>  : <%= name %></td>
	        <td colspan="2" style="border:none;"></td>
	    </tr>
	    <tr>
	        <td ><strong>출발지</strong>  : <br><%= origin %> </td>
	    	<td></td>
	    	<td></td>
	    </tr>
	        <td style=" padding-bottom: 10px; border-bottom: 1px solid black;"><strong>도착지</strong>  : <br><%= destin %></td>
	  		<td colspan="2" style="border-bottom: 1px solid black;"></td>
	    <tr>
	        <th style="width: 182px;">항목</th>
	        <th style="width: 212px;">수량</th>
	        <th>가격</th>
	    </tr>
	    
	    <tr class="hover">
	        <td>냉장고</td>
	        <td><%= refrigerator_quant %> EA</td>
	        <td>₩<%= refrigerator_price %></td>
	    </tr>
	    <tr class="hover">
	        <td>세탁기</td>
	        <td><%= washing_machine_quant %> EA</td>
	        <td>₩ <%= washing_machine_price %></td>
	    </tr>
	    <tr class="hover">
	        <td>의자</td>
	        <td><%= chair_quant %> EA</td>
	        <td>₩ <%= chair_price %></td>
	    </tr>
	    <tr class="hover">
	        <td>침대</td>
	        <td><%= bed_quant %> EA</td>
	        <td>₩ <%= bed_price %></td>
	    </tr>
	    <tr class="hover">
	        <td>테이블</td>
	        <td><%= table_quant %> EA</td>
	        <td>₩ <%= table_price %></td>
	    </tr>
	    <tr class="hover">
	        <td style=" border-bottom: 1px solid black;">텔레비전</td>
	        <td style=" border-bottom: 1px solid black;"><%= tv_quant %> EA</td>
	        <td style=" border-bottom: 1px solid black;">₩ <%= tv_price %></td>
	    </tr>
	    
	     <tr class="hover">
	        <td style="padding-top:10px;">운송료</td>
	        <td style="padding-top:10px;"></td>
	        <td colspan="2" style="padding-top:10px;">₩ <%= moving_cost %></td>
	    </tr> 
	    <tr class="hover">
	        <td style=" border-bottom: 1px solid black;"><strong>합계</strong></td>
	        <td style=" border-bottom: 1px solid black;"></td>
	        <td colspan="2" style=" border-bottom: 1px solid black;"><strong>₩ <%= total_price %></strong></td>
	    </tr>
	</table>
	<h2 style="text-align:center;">M<span style="color:skyblue;">O</span>VED</h2>
		</div>	
			<div class="board_btns">
				<form class="control" action="../company/com_board.jsp" method="GET">
					<input type="hidden" name="page" value="<%=curPage%>">
<!-- 					<p style="text-align:right;"><input class="control_btn" type="submit" value="목록"></p> -->
						<br>
				</form>
			</div>
					</div>
				</div>
			</div>
		</div>
	</div>
    <div class="row">
        <div class="col-lg-12">
            <div class="card">
                <div class="card-body">
                    <div class="table-responsive project-list">

<div class="container">				
<h2 style="text-align:center;">업체용 견적 입력창</h2>
<form action="estimateSubmit.jsp" method="POST">
  
  <table style="width: 50%; margin: 0 auto;">
    <tr style="background-color:#E0ECF8; border:1px solid black">
      <th>항목</th>
      <th>수량</th>
      <th>가격</th>
    </tr>
    <tr class="hover2">
      <td>냉장고</td>
      <td><input type="text" name="refrigerator" id="refrigerator" value="<%= refrigerator_quant %>" style="border:none;border-right:0px; border-top:0px; boder-left:0px; boder-bottom:0px;" readonly/></td>
      <td><input type="text" id="refrigerator_price" name="refrigerator_price" placeholder="<%= refrigerator_price %>" onKeyup="this.value=this.value.replace(/[^0-9]/g,'');" required></td>
    </tr>
    <tr class="hover2">
      <td>세탁기</td>
      <td><input type="text" id="washing_machine" name="washing_machine" value="<%= washing_machine_quant %>" style="border:none;border-right:0px; border-top:0px; boder-left:0px; boder-bottom:0px;" readonly/></td>
      <td><input type="text" id="washing_machine_price" name="washing_machine_price" placeholder="<%= washing_machine_price %>" onKeyup="this.value=this.value.replace(/[^0-9]/g,'');" required></td>
    </tr>
    <tr class="hover2">
      <td>의자</td>
      <td><input type="text" id="chair" name="chair" value="<%= chair_quant %>" style="border:none;border-right:0px; border-top:0px; boder-left:0px; boder-bottom:0px;" readonly/></td>
      <td><input type="text" id="chair_price" name="chair_price" placeholder="<%= chair_price %>" onKeyup="this.value=this.value.replace(/[^0-9]/g,'');" required></td>
    </tr>
    <tr class="hover2">
      <td>침대</td>
      <td><input type="text" id="bed" name="bed" value="<%= bed_quant %>" style="border:none;border-right:0px; border-top:0px; boder-left:0px; boder-bottom:0px;" readonly/></td>
      <td><input type="text" id="bed_price" name="bed_price" placeholder="<%= bed_price %>" onKeyup="this.value=this.value.replace(/[^0-9]/g,'');" required></td>
    </tr>
    <tr class="hover2">
      <td>테이블</td>
      <td><input type="text" id="table" name="table" value="<%= table_quant %>" style="border:none;border-right:0px; border-top:0px; boder-left:0px; boder-bottom:0px;" readonly/></td>
      <td><input type="text" id="table_price" name="table_price" placeholder="<%= table_price %>" onKeyup="this.value=this.value.replace(/[^0-9]/g,'');" required></td>
    </tr>
    <tr class="hover2">
      <td style="border-bottom:1px solid black">텔레비전</td>
      <td style="border-bottom:1px solid black"><input type="text" id="tv" name="tv" value="<%= tv_quant %>" style="border:none;border-right:0px; border-top:0px; boder-left:0px; boder-bottom:0px;" readonly/></td>
      <td style="border-bottom:1px solid black"><input type="text" id="tv_price" name="tv_price" placeholder="<%= tv_price %>" onKeyup="this.value=this.value.replace(/[^0-9]/g,'');" required></td>
    </tr>
    <tr style="border:1px solid black; background-color:#f3f3f3;">
      <th style="border-bottom:1px solid #dee2e6;">출발지</th>
      <th style="border-bottom:1px solid #dee2e6;">도착지</th>
      <th style="border-bottom:1px solid #dee2e6;">운송료</th>
    </tr>
    <tr style="border:1px solid black; background-color:#f3f3f3;">
      <td style="border-bottom:1px solid black"><%=origin %></td>
      <td style="border-bottom:1px solid black"><%=destin %></td>
      <td style="border-bottom:1px solid black"><input type="text" id="distance_price" name="distance_price" onKeyup="this.value=this.value.replace(/[^0-9]/g,'');" required></td>
    </tr>
    
  </table>
   <input type="hidden" name="order_number" value ="<%=orderNo%>">
  <br>
  <h3 style="text-align:center;"><input type="submit" value="견적 제출"></h3>
</form>
    <%
        rs.close();
        pstmt.close();
        conn.close();
    } catch (Exception e) {
        e.printStackTrace();
    }
    %>

					</div>
				</div>
			</div>
		</div>
	</div>
	</div>
	</div>

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
		
		






