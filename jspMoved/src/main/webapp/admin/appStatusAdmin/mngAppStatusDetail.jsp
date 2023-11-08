<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.sql.*" %>
<%@ page import="human.dao.ClientDao" %>
<%@ page import="human.dao.BoardDao" %>
<%@ page import="human.vo.ClientVo" %>
<%@ page import="human.vo.BoardVo" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.4.1/css/all.css" integrity="sha384-5sAR7xN1Nv6T6+dT2mhtzEpVJvfS3NScPQTrOxhwjIuvcA67KV2R5Jz6kr4abQsz" crossorigin="anonymous">
    <link rel="stylesheet" href="../../css/bootstrap.min.css">
    <script src="../../js/jquery-3.7.0.min.js"></script>
    <script src="../../js/bootstrap.bundle.min.js"></script>
    <link rel="stylesheet" href="../../assets/css/admin.css">
    <title>admin Document</title>
</head>
<body>
    <div class="dash">
        <div class="dash-nav dash-nav-dark">
            <header>
                <a href="#!" class="menu-toggle">
                    <i class="fas fa-bars"></i>
                </a>
                <a href="adminHome.html" class="spur-logo"><i class="fas fa-bolt"></i> <span>관리자</span></a>
            </header>
            <nav class="dash-nav-list">
                <a href="../adminHome.html" class="dash-nav-item">
                    <i class="fas fa-home"></i> ADMIN HOME
                </a>
                <div class="dash-nav-dropdown">
                    <a href="../boardAdmin/mngBoard.jsp" class="dash-nav-item dash-nav-dropdown-toggle">
                        <i class="fas fa-cube"></i> 게시판관리
                    </a>
                    <div class="dash-nav-dropdown-menu">
                        <a href="board.html" class="dash-nav-dropdown-item">공지사항</a>
                    </div>
                </div>
                <div class="dash-nav-dropdown">
                    <a href="../memberAdmin/mngMember.jsp" class="dash-nav-item dash-nav-dropdown-toggle">
                        <i class="fas fa-file"></i> 회원관리
                    </a>
                    <div class="dash-nav-dropdown-menu">
                        <a href="blank.html" class="dash-nav-dropdown-item">회원목록</a>
                    </div>
                </div>
                <div class "dash-nav-dropdown">
                    <a href="../costAdmin/mngCost.jsp" class="dash-nav-item dash-nav-dropdown-toggle">
                        <i class="fas fa-file"></i> 가격관리
                    </a>
                    <div class="dash-nav-dropdown-menu">
                        <a href="blank.html" class="dash-nav-dropdown-item">가격관리</a>
                    </div>
                </div>
                <div class="dash-nav-dropdown">
                    <a href="../companyAdmin/mngCompany.jsp" class="dash-nav-item dash-nav-dropdown-toggle">
                        <i class="fas fa-file"></i> 업체관리
                    </a>
                    <div class="dash-nav-dropdown-menu">
                        <a href="blank.html" class="dash-nav-dropdown-item">업체관리</a>
                    </div>
                </div>
                <div class="dash-nav-dropdown">
                    <a href="../appStatusAdmin/mngAppStatus.jsp" class="dash-nav-item dash-nav-dropdown-toggle">
                        <i class="fas fa-file"></i> 진행현황
                    </a>
                    <div class="dash-nav-dropdown-menu">
                        <a href="blank.html" class="dash-nav-dropdown-item">진행현황</a>
                    </div>
                </div>
            </nav>
        </div>
        <div class="dash-app">
            <header class="dash-toolbar">
                <a href="#!" class="menu-toggle">
                    <i class="fas fa-bars"></i>
                </a>
                <a href="#!" class="searchbox-toggle">
                    <i class="fas fa-search"></i>
                </a>
                <form class="searchbox" action="#!">
                    <a href="#!" class="searchbox-toggle">
                        <i class="fas fa-arrow-left"></i>
                    </a>
                    <button type="submit" class="searchbox-submit">
                        <i class="fas fa-search"></i>
                    </button>
                    <input type="text" class="searchbox-input" placeholder="type to search">
                </form>
                <div class="tools">
                    <a href="#" target="_blank" class="tools-item">
                        <i class="fab fa-github"></i>
                    </a>
                    <a href="#!" class="tools-item">
                        <i class="fas fa-bell"></i>
                        <i class="tools-item-count">4</i>
                    </a>
                    <div class="dropdown tools-item">
                        <a href="#" class="" id="dropdownMenu1" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            <i class="fas fa-user"></i>
                        </a>
                        <div class="dropdown-menu dropdown-menu-right" aria-labelledby="dropdownMenu1">
                            <a class="dropdown-item" href="#">관리자정보</a>
                            <a class="dropdown-item" href="mng_login.html">로그아웃</a>
                        </div>
                    </div>
                </div>
            </header>
            <%
            String url = "jdbc:oracle:thin:@localhost:1521:orcl";
            String user = "jsp";
            String passwd = "123456";
            String orderNo = request.getParameter("orderNo");

            String query = "SELECT * FROM COMPANY_ESTIMATE WHERE ORDER_NO = ?";
            String query2 = "SELECT ORDER_NO, NAME, TO_CHAR(M_DATE, 'YYYY-MM-DD') AS M_DATE, ORIGIN, DESTIN, MOVING_COST, COST, PROCESS FROM CLIENT WHERE ORDER_NO = (?)";
            String process = "";

            try {
                Connection conn = DriverManager.getConnection(url, user, passwd);

                PreparedStatement pstmt = conn.prepareStatement(query);
                pstmt.setString(1, orderNo);

                PreparedStatement pstmt2 = conn.prepareStatement(query2);
                pstmt2.setString(1, orderNo);

                ResultSet rs = pstmt.executeQuery();
                ResultSet rs2 = pstmt2.executeQuery();
            %>
            <div class="container-fluid">
                <div class="row">
                    <div class="col-xl-12">
                        <div class="card spur-card">
                                <div class="card-header">
                                    <div class="spur-card-icon">
                                        <i class="fas fa-table"></i>
                                    </div>
                                    <div class="spur-card-title">상세현황</div>
                                </div>
                                <div class="card-body">
                                    <table class="table table-hover table-in-card">
                                        <thead>
                                            <tr>
                                                <th>고객명</th>
                                                <th>희망이사일</th>
                                                <th>출발지</th>
                                                <th>도착지</th>
                                                <th>처리상태</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                        <%
                                        while (rs2.next()) {
                                            String name = rs2.getString("NAME");
                                            String mdate = rs2.getString("M_DATE");
                                            String origin = rs2.getString("ORIGIN");
                                            String destin = rs2.getString("DESTIN");
                                            process = rs2.getString("PROCESS");
                                            boolean isComplete = "처리".equals(process);
                                            boolean isPrepared = "업체전달".equals(process);
                                        %>
                                            <tr>
                                                <td><%= name %></td>
                                                <td><%= mdate %></td>
                                                <td><%= origin %></td>
                                                <td><%= destin %></td>
                                                <td <%= isComplete ? "style='color: lightgreen;'" : "" %><%= isPrepared ? "style='color: red;'" : "" %>><%= process %></td>
                                            </tr>
                                        <%
                                        }
                                        %>
                                        </tbody>
                                    </table>
                                    <br>
                                    <div class="container-fluid">
                                        <div class="row">
                                            <div class="col-xl-12">
                                                <div class="card-body">
                                                    <table class="table table-hover table-in-card">
                                                        <thead>
                                                            <tr>
                                                                <th>업체명</th>
                                                                <th>가격</th>
                                                                <th>선정여부</th>
                                                            </tr>
                                                        </thead>
                                                        <tbody>
                                                        <%
                                                        while (rs.next()) {
                                                            String companyName = rs.getString("COMPANYNAME");
                                                            int totalPrice = rs.getInt("TOTAL_PRICE");
                                                            String selection = rs.getString("SELECTION");
                                                        %>
                                                            <tr>
                                                                <td <%= "선정".equals(selection) ? "style='background-color: lightgray;'" : "" %>><%= companyName %></td>
                                                                <td <%= "선정".equals(selection) ? "style='background-color: lightgray;'" : "" %>><%= totalPrice %></td>
                                                                <td <%= "선정".equals(selection) ? "style='background-color: lightgray;'" : "" %>><%= selection %></td>
                                                            </tr>
                                                        <%
                                                        }
                                                        %>
                                                        </tbody>
                                                    </table>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            <%
                            if ("업체전달".equals(process)) {
                            %>
                                <button class="btn-3d green" onclick="openPopupWithOrderNo('<%= orderNo %>');">완료 처리</button>
                            <%
                            }
                            %>
                        </div>
                    </div>
                </div>
            </div>
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
</body>
<script>
function openPopupWithOrderNo(orderNo) {
    var confirmMessage = '정말 완료 처리하시겠습니까?';
    if (window.confirm(confirmMessage)) {
        var popupUrl = '../appStatusAdmin/mngAppStatusSubmit.jsp?orderNo=' + orderNo;
        window.open(popupUrl, 'window_name', 'width=430, height=500, location=no, status=no, scrollbars=yes');
        location.reload();
    }
}

</script>

</html>
