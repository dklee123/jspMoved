<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import= "java.util.ArrayList" %> 
<%@ page import= "human.dao.BoardDao" %>
<%@ page import= "human.vo.BoardVo" %>
<%@ page import= "human.dao.CompanyDao" %>
<%@ page import= "human.vo.CompanyVo" %>
<!doctype html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.4.1/css/all.css" integrity="sha384-5sAR7xN1Nv6T6+dT2mhtzEpVJvfS3NScPQTrOxhwjIuvcA67KV2R5Jz6kr4abQsz" crossorigin="anonymous">
    <link rel="stylesheet" href="../../css/bootstrap.min.css">
    <script src="../../js/jquery-3.7.0.min.js"></script>
    <!-- <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script> -->
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
                <a href="../adminHome.html" class="spur-logo"><i class="fas fa-bolt"></i> <span>관리자</span></a>
            </header>
            <nav class="dash-nav-list">
                <a href="../adminHome.html" class="dash-nav-item">
                    <i class="fas fa-home"></i> ADMIN HOME </a>
                                    
                <div class="dash-nav-dropdown ">
                    <a href="../boardAdmin/mngBoard.jsp" class="dash-nav-item dash-nav-dropdown-toggle">
                        <i class="fas fa-cube"></i> 게시판관리 </a>
                    <div class="dash-nav-dropdown-menu">                                            
                        <a href="board.html" class="dash-nav-dropdown-item">공지사항</a>
                    </div>
                </div>
                <div class="dash-nav-dropdown">
                    <a href="../memberAdmin/mngMember.jsp" class="dash-nav-item dash-nav-dropdown-toggle">
                        <i class="fas fa-file"></i> 회원관리 </a>
                    <div class="dash-nav-dropdown-menu">
                        <a href="blank.html" class="dash-nav-dropdown-item">회원목록</a>                        
                    </div>
                </div>
                <div class="dash-nav-dropdown">
                    <a href="../costAdmin/mngCost.jsp" class="dash-nav-item dash-nav-dropdown-toggle">
                        <i class="fas fa-file"></i> 가격관리 </a>
                    <div class="dash-nav-dropdown-menu">
                        <a href="blank.html" class="dash-nav-dropdown-item">가격관리</a>                        
                    </div>
                </div>
                 <div class="dash-nav-dropdown">
                    <a href="../companyAdmin/mngCompany.jsp" class="dash-nav-item dash-nav-dropdown-toggle">
                        <i class="fas fa-file"></i> 업체관리 </a>
                    <div class="dash-nav-dropdown-menu">
                        <a href="blank.html" class="dash-nav-dropdown-item">업체관리</a>                        
                    </div>
                </div>
                <div class="dash-nav-dropdown">
                    <a href="../appStatusAdmin/mngAppStatus.jsp" class="dash-nav-item dash-nav-dropdown-toggle">
                        <i class="fas fa-file"></i> 진행현황 </a>
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
                    <a href="#!" class="searchbox-toggle"> <i class="fas fa-arrow-left"></i> </a>
                    <button type="submit" class="searchbox-submit"> <i class="fas fa-search"></i> </button>
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
            <main class="dash-content">
                <div class="container-fluid">
                    <h1 class="dash-title">업체관리</h1>
                    <div class="row">
                        <div class="col-xl-12">
                            
                            <div class="card spur-card">
                                <div class="card-header">
                                    <div class="spur-card-icon">
                                        <i class="fas fa-table"></i>
                                    </div>
                                    <div class="spur-card-title">글목록</div>
                                </div>
                                <div class="card-body ">
                                    <table class="table table-hover table-in-card">
                                        <thead>
                                            <tr>
                                                <th scope="col">id</th>
                                                <th scope="col">이름</th>
                                                <th scope="col">회사명</th>
                                                <th scope="col">이메일</th>
                                            </tr>
                                        </thead>
                                         <tbody>
                                        	        <% 
                                        	        	String curPage = request.getParameter("page");
                    								if (curPage == null){
                    									curPage =  "1";
                    								}
                    									CompanyDao bbsdao = new CompanyDao();
												        ArrayList<CompanyVo> result = bbsdao.getBoardListAll(curPage);
												        //out.println(result.size());
												        for (int i=0; i<result.size(); i++){
												        	CompanyVo eachvo = result.get(i);
											         %>

                                            <tr>
                                                <th scope="row"><%= eachvo.getId() %></th>
                                                <td><a href="../admin/mngBbsRead.jsp?no=<%=eachvo.getId()%>"><%= eachvo.getName() %></td>
                                                <td><%= eachvo.getCompanyname() %></td>
                                                <td><%= eachvo.getEmail() %></td>
                                            </tr>
											<%
												        }
											%>
                                        </tbody>
                                    </table>
                
                                </div>
                                <div class ="d-flex justify-content-center">
                                <div class="mt-12">
                                <div class="btn-group ml-2 mb-1" role="group" aria-label="First group">
                                     <button type="button" class="btn btn-primary">&#10094;</button>
 
<%--                                     <%
	                                 int cntperpage = 10;
	                                 int totpage = bbsdao.calTotPage();
	                                 for(int i=1; i<=totpage; i++){
                            		  %>      
                                           <button type="button" class='btn btn-secondary'><a href='mngBoard.jsp?page=<%= i %>' class='active'><%=i %></a></button>
                                 
		                              <% 
		                                 }
		                              %> --%>
		                                     
                                     <button type="button" class="btn btn-primary">&#10095;</button>                                
                                 </div>
                               </div> 
                            </div>

                            <button type="button" class="btn btn-primary" onclick="location.href='mng_bbswrite.html'">글등록</button>
                            
                        </div> <!--  put your rows / columns here -->
                    </div>
                </div>
            </main>
        </div>
    </div>
    <script src="../../assets/js/admin.js"></script>
</body>

</html>