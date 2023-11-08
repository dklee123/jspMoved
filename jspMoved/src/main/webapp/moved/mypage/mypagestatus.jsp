<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>    
<%@ page import="java.sql.*" %>
<%@ page import="human.dao.MemberDao" %>
<%@ page import="human.vo.MemberVo" %>

<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="../../assets/css/mypage.css">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
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
    String name = "";
    MemberVo resultvo = null;

    if(session.getAttribute("memid") == null){
        loginBtn = "로그인";
        loginLink = "../../moved/login/login.jsp";
        out.println("<script>alert('로그인 후 사용가능합니다');</script>");
        out.println("<script>location.href='../../moved/login/login.jsp'</script>");
    } else {
        id = (String)session.getAttribute("memid");
        loginBtn = "로그아웃";
        loginLink = "../../moved/login/logout.jsp";
        
        MemberDao memdao = new MemberDao();
        resultvo = memdao.getMemberById(id);
        name = resultvo.getName(); 
    }

    String url = "jdbc:oracle:thin:@localhost:1521:ORCL";
    String user = "jsp";
    String passwd = "123456";

    try {
        Class.forName("oracle.jdbc.driver.OracleDriver");
        Connection conn = DriverManager.getConnection(url, user, passwd);
        
        String orderNo = "";
        PreparedStatement pstmt = conn.prepareStatement("SELECT ORDER_NO, ID, NAME, TO_CHAR(M_DATE, 'YYYY-MM-DD') AS M_DATE, ORIGIN, DESTIN, MOVING_COST, COST, PROCESS FROM CLIENT WHERE ID = ?");
        pstmt.setString(1, id);
        ResultSet rs = pstmt.executeQuery();

%>
</head>
<body class="woocommerce-account logged-in" style="background-color:#f4f7fe;">
    <div class="master">
        <div class="master-inner">
            <div class="woocommerce">
                <nav class="woocommerce-MyAccount-navigation">
                    <ul>
                        <li class="woocommerce-MyAccount-navigation-link woocommerce-MyAccount-navigation-link--orders">
                            <a href="mypage.jsp"><i class="fa-solid fa-user"></i> 프로필</a>
                        </li>
                        <li class="woocommerce-MyAccount-navigation-link woocommerce-MyAccount-navigation-link--dashboard is-active">
                            <a href="mypagestatus.jsp"><i class="fa-solid fa-diagram-project"></i> 진행현황</a>
                        </li>
                        <li class="woocommerce-MyAccount-navigation-link woocommerce-MyAccount-navigation-link--orders">
                            <a href="mypagesetting.jsp"><i class="fa-solid fa-gear"></i> 설정</a>
                        </li>
                        <li class="woocommerce-MyAccount-navigation-link woocommerce-MyAccount-navigation-link--customer-logout">
                            <a href="../login/logout.jsp"><i class="fa-solid fa-right-from-bracket"></i> Logout</a>
                        </li>
                    </ul>
                </nav>
                <div class="woocommerce-MyAccount-content">
                    <p>MYPAGE <strong> 진행현황 </strong></p>
                    <p>진행현황을 확인하세요.</p>
                    <div>
                        <form class="woocommerce-EditAccountForm edit-account" action="" method="post" style="width:980px;">
                            <h3>신청 내역</h3>
                            <table class="table table-hover table-in-card">
                                <thead>
                                    <tr>
                                        <th>주문번호</th>
                                        <th>희망이사일</th>
                                        <th>출발지</th>
                                        <th>도착지</th>
                                        <th>예상견적</th>
                                        <th>처리상태</th>
                                    </tr>
                                </thead>
                                <tbody>
                                <%
                                    while (rs.next()) {
                                        orderNo = rs.getString("ORDER_NO");
                                        String mdate = rs.getString("M_DATE");
                                        String origin = rs.getString("ORIGIN");
                                        String destin = rs.getString("DESTIN");
                                        int cost = rs.getInt("COST");
                                        String process = rs.getString("PROCESS");
                                        boolean isComplete = "처리".equals(process);
                                        boolean isPrepared = "업체전달".equals(process);
                                %>
                                    <tr>
                                        <td><a href="orderDetailUser.jsp?orderNo=<%= orderNo %>" onclick="window.open(this.href, '_blank', 'width=800, height=600'); return false;"><i class="fa-regular fa-file-lines"></i>  <%= orderNo %></a></td>
                                        <td><%= mdate %></td>
                                        <td><%= origin %></td>
                                        <td><%= destin %></td>
                                        <td><%= cost %></td>
                                        <td <%= isComplete ? "style='color: lightgreen;'" : "" %><%= isPrepared ? "style='color: red;'" : "" %>> <%= process %></td>
                                    </tr>
                                <%
                                    }
                                %>
                                </tbody>
                            </table>
                            <br>
 <form action="orderConfirm.jsp" method="post" id="companySelectionForm">
    <h3>업체별 견적</h3>
    <table class="table table-hover table-in-card" id="companyTable">
        <thead>
            <tr>
                <th>업체명</th>
                <th>견적</th>
                <th>상태</th>
                <th>선정</th>
            </tr>
        </thead>
        <tbody>
            <%
                PreparedStatement pstmt2 = conn.prepareStatement("SELECT COMPANYNAME, TOTAL_PRICE, SELECTION FROM COMPANY_ESTIMATE WHERE ORDER_NO = ?");
                pstmt2.setString(1, orderNo);
                ResultSet rs2 = pstmt2.executeQuery();

                while (rs2.next()) {
                    String companyName = rs2.getString("COMPANYNAME");
                    int totalPrice = rs2.getInt("TOTAL_PRICE");
                    String selection = rs2.getString("SELECTION");
            %>
            <tr>
                <td <%= "선정".equals(selection) ? "style='background-color: lightgray;'" : "" %>><a href="orderDetailCompany.jsp?companyName=<%= companyName %>" onclick="window.open(this.href, '_blank', 'width=800, height=600'); return false;"><i class="fa-solid fa-file-lines"></i>  <%= companyName %></a></td>
                <td <%= "선정".equals(selection) ? "style='background-color: lightgray;'" : "" %>><%= totalPrice %></td>
                <td <%= "선정".equals(selection) ? "style='background-color: lightgray;'" : "" %>><%= selection %></td>
                <td <%= "선정".equals(selection) ? "style='background-color: lightgray;'" : "" %>>
                    <input type="radio" name="selectedcompany" value="<%= companyName %>|<%= orderNo %>" />
                </td>
            </tr>
            <%
                }
                pstmt2.close();
            %>
        </tbody>
    </table>
<p style="text-align:right;">
<button type="button" onclick="openPopup()" >업체 선정</button>
</p>
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
</form>


                            
                            <h2 style="text-align:center;padding-top: 20px;">M<span style="color:skyblue;">O</span>VED</h2>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>
</html>
<%
    } catch (Exception e) {
        out.println("오류 발생: " + e.getMessage());
    }
%>




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
                    <a class="btn btn-link" href="../../moved/movedint.jsp">Moved 소개</a>
                    <a class="btn btn-link" href="../../include/calendar/calendar.jsp">Moved 이사견적</a>
                </div>
                <div class="col-md-6 col-lg-3 wow fadeIn" data-wow-delay="0.7s">
                    <h5 class="text-white mb-4">Our Services</h5>
                    <a class="btn btn-link" href="../../moved/statusBoard.jsp">신청현황</a>
                    <a class="btn btn-link" href="../../moved/board/board.jsp">고객센터</a>
                    <a class="btn btn-link" href="../../moved/contact/contact.jsp">문의</a>
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

<script>
    
function openPopup() {
	var confirmSelection = confirm("업체를 선택한 후에는 수정할 수 없습니다.\n정말로 선정을 완료하시겠습니까?");
	if (confirmSelection) {
    var selectedCompany = document.querySelector('input[name="selectedcompany"]:checked');

    if (selectedCompany) {
        var selectedValue = selectedCompany.value.split('|');
        var companyName = selectedValue[0];
        var orderNo = selectedValue[1];
        
        var url = 'orderConfirm.jsp?companyName=' + encodeURIComponent(companyName) + '&orderNo=' + encodeURIComponent(orderNo);
        
        var popup = window.open(url, 'Popup', 'width=800, height=600');
        
        
        
        if (popup) {
	location.reload();
            popup.focus();
        } else {
            alert('팝업 창이 차단되었습니다. 팝업 차단을 해제하십시오.');
        }
    } else {
        alert('업체를 선택하세요.');
    }
	}
}
    $(document).ready(function() {
        var hasSelection = false;

        $('#companyTable tbody tr').each(function() {
            if ($(this).find('td:nth-child(3)').text() === '선정') {
                hasSelection = true;
                return false; 
            }
        });

        if (hasSelection) {
            $('input[name="selectedcompany"]').prop('disabled', true);
            $('#selectCompanyButton').prop('disabled', true);
        }
    });
    </script>
</html>