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
<title>MOVED 주소입력</title>
    <meta content="width=device-width, initial-scale=1.0" name="viewport">
    <meta content="" name="keywords">
    <meta content="" name="description">

    <!-- Favicon -->
    <link href="../../assets/img/favicon.ico" rel="icon">

    <!-- Google Web Fonts -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com">
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
	<script src="https://kit.fontawesome.com/0743fc8aa3.js"></script>
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
                <div class="btn btn-sm border rounded-pill text-primary px-3 mb-3">주소 선택</div>
                <h1 class="mb-4"> 주소 입력 </h1>
                <img src="../../assets/img/logo.png" />
	<div style="margin-top: 20px;" id="imageContainer"></div>
	
	
	
	
	<p>출발주소와 도착주소를 선택하세요.</p>



<form action="../../include/distance/distanceResult.jsp" type="POST">
<div style=" float: left; width: 40%; height:300px;">
	<label for="searchO" id="searchLabelO" onmouseover="changeSearch('mouseover')" onmouseout="changeSearch('mouseout')" onclick="changeSearch('click')">우편번호검색</label>
	<input type="button" id="searchO" onclick="execDaumPostcode('origin')" value="검색" style="display: none;" ><br>
	
	<input type="text" id="origin_postcode" placeholder="출발지 우편번호" style="border: 0;">
	
	<input type="text" id="origin_address"  name="origin_address" placeholder="출발지 주소" style="border: 0;"><br>
	<input type="text" id="origin_extraAddress" placeholder="출발지 주소2" style="border: 0;"><br>
	<input type="text" id="origin_detailAddress" name="origin_detail" placeholder="출발지 상세주소" style="border: 0;">
</div>

<div style="float: left; width: 20%; height:250px; display:flex; justify-content: center; align-items: center;"><i class="fa-solid fa-arrow-right" style="font-size:30px;"></i></div>

<div style=" float: left; width: 40%; height:300px;">
	<label for="searchD" id="searchLabelD" onmouseover="changeSearch2('mouseover')" onmouseout="changeSearch2('mouseout')" onclick="changeSearch2('click')">우편번호검색</label>
	<input type="button" id ="searchD" onclick="execDaumPostcode('destination')" value="검색" style="display: none;"><br>
	<input type="text" id="destination_postcode" placeholder="도착지 우편번호" style="border: 0;">
	<input type="text" id="destination_address" name="destination_address" placeholder="도착지 주소" style="border: 0;"><br>
	<input type="text" id="destination_extraAddress" placeholder="도착지 주소2" style="border: 0;"><br>
	<input type="text" id="destination_detailAddress" name="destination_detail" placeholder="도착지 상세주소" style="border: 0;">
</div>


<br>
<label for="submit" id="submitLabel" onmouseover="changeSubmit('mouseover')" onmouseout="changeSubmit('mouseout')" onclick="changeSubmit('click')">확정</label>
<button id="submit" type="submit"style=" display: none;">확정</button>

</form>


<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>

const body = document.body;
const submit = document.getElementById("submit");
const submitLabel = document.getElementById("submitLabel");

// 새로 생성한 검색 버튼
const searchLabelO = document.getElementById("searchLabelO");
const searchLabelD = document.getElementById("searchLabelD");
// 우편번호 입력창
const origin_postcode = document.getElementById("origin_postcode");
const destination_postcode = document.getElementById("destination_postcode");
// 출발지/도착지 주소
const origin_address = document.getElementById("origin_address");
const destination_address = document.getElementById("destination_address");
// 출발지/도착지 주소2
const origin_extraAddress = document.getElementById("origin_extraAddress");
const destination_extraAddress = document.getElementById("destination_extraAddress");
// 출발지/도착지 상세주소
const origin_detailAddress = document.getElementById("origin_detailAddress");
const destination_detailAddress = document.getElementById("destination_detailAddress");

const imageContainer = document.getElementById('imageContainer');
const imageElement = document.createElement('img');
// imageElement.src = '../../assets/img/logo.png';

// 이미지를 imageContainer에 추가
imageContainer.appendChild(imageElement);
imageElement.style.marginTop ='20px';
imageElement.style.marginBottom ='20px';

//body
body.style.display = 'flex';
body.style.flexDirection = 'column';
body.style.alignItems = 'center';
body.style.justifyContent = 'center';

//출발지 검색 버튼
searchLabelO.style.backgroundColor = "#7ABDE9";
searchLabelO.style.color = "white";
searchLabelO.style.height = "40px";
searchLabelO.style.padding = "8px 20px";
searchLabelO.style.marginLeft = "5px";
searchLabelO.style.marginBottom = "20px";

// 도착지 검색 버튼
searchLabelD.style.backgroundColor = "#7ABDE9";
searchLabelD.style.color = "white";
searchLabelD.style.height = "40px";
searchLabelD.style.padding = "8px 20px";
searchLabelD.style.marginLeft = "5px";
searchLabelD.style.marginBottom = "20px";

//출발지 입력창
origin_postcode.style.backgroundColor = '#f0f0f0';
origin_postcode.style.height = "30px";
origin_postcode.style.width = "300px";
origin_postcode.style.marginLeft = "10px";
origin_postcode.style.padding = "10px 20px";
origin_postcode.style.marginBottom ="5px";

origin_address.style.backgroundColor = '#f0f0f0';
origin_address.style.height = "30px";
origin_address.style.width = "300px";
origin_address.style.marginLeft = "10px";
origin_address.style.padding = "10px 20px";
origin_address.style.marginBottom ="5px";

origin_extraAddress.style.backgroundColor = '#f0f0f0';
origin_extraAddress.style.height = "30px";
origin_extraAddress.style.width = "300px";
origin_extraAddress.style.marginLeft = "10px";
origin_extraAddress.style.padding = "10px 20px";
origin_extraAddress.style.marginBottom ="5px";

origin_detailAddress.style.backgroundColor = '#f0f0f0';
origin_detailAddress.style.height = "30px";
origin_detailAddress.style.width = "300px";
origin_detailAddress.style.marginLeft = "10px";
origin_detailAddress.style.padding = "10px 20px";
origin_detailAddress.style.marginBottom ="5px";

// 도착지 입력창
destination_postcode.style.backgroundColor = '#f0f0f0';
destination_postcode.style.height = "30px";
destination_postcode.style.width = "300px";
destination_postcode.style.marginLeft = "10px";
destination_postcode.style.padding = "10px 20px";
destination_postcode.style.marginBottom ="5px";

destination_address.style.backgroundColor = '#f0f0f0';
destination_address.style.height = "30px";
destination_address.style.width = "300px";
destination_address.style.marginLeft = "10px";
destination_address.style.padding = "10px 20px";
destination_address.style.marginBottom ="5px";

destination_extraAddress.style.backgroundColor = '#f0f0f0';
destination_extraAddress.style.height = "30px";
destination_extraAddress.style.width = "300px";
destination_extraAddress.style.marginLeft = "10px";
destination_extraAddress.style.padding = "10px 20px";
destination_extraAddress.style.marginBottom ="5px";

destination_detailAddress.style.backgroundColor = '#f0f0f0';
destination_detailAddress.style.height = "30px";
destination_detailAddress.style.width = "300px";
destination_detailAddress.style.marginLeft = "10px";
destination_detailAddress.style.padding = "10px 20px";
destination_detailAddress.style.marginBottom ="5px";

// 확정
submitLabel.style.backgroundColor = '#1363c6';
submitLabel.style.color = 'white';
submitLabel.style.height = "30px";
submitLabel.style.padding ="10px 20px";
submitLabel.style.display = 'flex';
submitLabel.style.marginTop = '10px';
submitLabel.style.flexDirection = 'column';
submitLabel.style.alignItems = 'center';
submitLabel.style.justifyContent = 'center';

// 호버/클릭시 색변경 함수
function changeSearch(eventType) {
	  if (eventType === 'mouseover') {
	    searchLabelO.style.backgroundColor = '#A4D1F0';
	  } else if (eventType === 'mouseout') {
	    searchLabelO.style.backgroundColor = '#7ABDE9';
	  } else if (eventType === 'click') {
	    searchLabelO.style.backgroundColor = '#A4D1F0';
	  }
	}

function changeSearch2(eventType) {
	  if (eventType === 'mouseover') {
	    searchLabelD.style.backgroundColor = '#A4D1F0';
	  } else if (eventType === 'mouseout') {
	    searchLabelD.style.backgroundColor = '#7ABDE9';
	  } else if (eventType === 'click') {
	    searchLabelD.style.backgroundColor = '#A4D1F0';
	  }
	}

//호버, 클릭 시 색 변경 함수
function changeSubmit(eventType) {
  if (eventType === 'mouseover') {
    submitLabel.style.backgroundColor = '#7ABDE9';
  } else if (eventType === 'mouseout') {
    submitLabel.style.backgroundColor = '#1363c6';
  } else if (eventType === 'click') {
    submitLabel.style.backgroundColor = 'd0d0d0';
  }
}

function execDaumPostcode(type) {
    new daum.Postcode({
        oncomplete: function (data) {
            var addr = ''; // 주소 변수
            var extraAddr = ''; // 참고항목 변수

            if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                addr = data.roadAddress;
            } else { // 사용자가 지번 주소를 선택했을 경우(J)
                addr = data.jibunAddress;
            }

            if (data.userSelectedType === 'R') {
                if (data.bname !== '' && /[동|로|가]$/g.test(data.bname)) {
                    extraAddr += data.bname;
                }
                if (data.buildingName !== '' && data.apartment === 'Y') {
                    extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
                if (extraAddr !== '') {
                    extraAddr = ' (' + extraAddr + ')';
                }
                document.getElementById(type + "_extraAddress").value = extraAddr;
            } else {
                document.getElementById(type + "_extraAddress").value = '';
            }

            document.getElementById(type + '_postcode').value = data.zonecode;
            document.getElementById(type + "_address").value = addr;
            document.getElementById(type + "_detailAddress").focus();
        }
    }).open();
}

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
