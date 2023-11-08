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
 <style>
        #drop-area {
            border: 2px dashed #ccc;
            border-radius: 8px;
            padding: 20px;
            text-align: center;
            cursor: pointer;
        }
        
        .image-container {
            border: 2px solid #000; /* Add border styles as needed */
            padding: 10px; /* Add padding as needed */
            text-align: center;
        }
    </style>
<title>머신러닝-가구식별</title>
    <meta content="width=device-width, initial-scale=1.0" name="viewport">
    
    <meta content="" name="keywords">
    <meta content="" name="description">

    <!-- Favicon -->
    <link href="../../../assets/img/favicon.ico" rel="icon">

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
    <link href="../../../assets/css/bootstrap.min.css" rel="stylesheet">

    <!-- Template Stylesheet -->
    <link href="../../../assets/css/style.css" rel="stylesheet">
    
	<!-- upload -->
    <link rel="preconnect" href="https://fonts.gstatic.com">
  	<link rel="stylesheet" href='https://unpkg.com/boxicons@2.0.7/css/boxicons.min.css'>
  	<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500&display=swap">
	<link rel="stylesheet" href="./upload.css">
	
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
</head>

<body style="">
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
            <div class="mx-auto text-center wow fadeIn" data-wow-delay="0.1s" style="max-width: 500px;">
                <div class="btn btn-sm border rounded-pill text-primary px-3 mb-3">A.I </div>
                <h1 class="mb-4">AI 가구  식별 </h1>

   <div style="margin-top: 20px;" id="imageContainer"></div>
   <br>
  <script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>
<script>
    var goodsData = [];
    <%
        try {
            Class.forName("oracle.jdbc.driver.OracleDriver");
            Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:ORCL", "jsp", "123456");
            PreparedStatement pstmt = conn.prepareStatement("SELECT NAME, PRICE FROM GOODS");
            ResultSet rst = pstmt.executeQuery();
            while (rst.next()) {
                String name = rst.getString("NAME");
                double price = rst.getDouble("PRICE");
    %>
                goodsData.push({
                    name: '<%= name %>',
		price :
<%= price %>
	});
<%
            }
            rst.close();
            pstmt.close();
            conn.close();
        } catch (Exception e) {
            out.println("오류: " + e.getMessage());
        }
    %>
	
</script>
<script type="text/javascript" src="https://translate.google.com/translate_a/element.js?cb=googleTranslateElementInit"></script>
	<div id="imageContainer"></div>
	<h2></h2>
    <br>
<div id="drop-area">
    <p id="instructions">이미지를 드래그하거나 클릭하여 선택하세요.</p>
    <input type="file" id="fileInput" accept="image/*" style="display: none">
    <div id="image-preview"></div> <!-- 이미지를 표시할 엘리먼트 추가 -->
</div>

	<!-- 식별 버튼 -->
	  <button type="button" id="uploadButton" style="background-color: #007bff; color: #fff; border: none; padding: 10px 20px; border-radius: 5px; cursor: pointer;">식별</button>
	<div id="resultContainer" style='text-align: center;'></div>
	<form action="../../../include/select/aiSelect/solutionSubmit.jsp">
		<input type="hidden" name="totalPrice" value="">
		<input type="hidden" name="PROD1" value="">
		<input type="hidden" name="PROD1_PRICE" value="">
		<input type="hidden" name="PROD2" value="">
		<input type="hidden" name="PROD2_PRICE" value="">
		<input type="hidden" name="PROD3" value="">
		<input type="hidden" name="PROD3_PRICE" value="">
		<input type="hidden" name="PROD4" value="">
		<input type="hidden" name="PROD4_PRICE" value="">
		<input type="hidden" name="PROD5" value="">
		<input type="hidden" name="PROD5_PRICE" value="">
		<input type="hidden" name="PROD6" value="">
		<input type="hidden" name="PROD6_PRICE" value="">
		
    <script>
    const dropArea = document.getElementById("drop-area");
    const fileInput = document.getElementById("fileInput");
    const imagePreview = document.getElementById("image-preview");
    dropArea.addEventListener("click", () => {
        fileInput.click(); // 클릭하면 파일 입력 엘리먼트가 열림
    });

	  dropArea.addEventListener("dragover", (e) => {
	      e.preventDefault();
	      dropArea.style.backgroundColor = "#f0f0f0";
	  });

	  dropArea.addEventListener("dragleave", () => {
	      dropArea.style.backgroundColor = "";
	  });

	  dropArea.addEventListener("drop", (e) => {
	      e.preventDefault();
	      dropArea.style.backgroundColor = "";

	      const files = e.dataTransfer.files;
	      handleFiles(files);
	  });

	  fileInput.addEventListener("change", () => {
	      const files = fileInput.files;
	      handleFiles(files);
	  });
	
	  
	  function updateFileInput(files) {
		    fileInput.files = files;
		    handleFiles(files);
		}
	  
	  function handleFiles(files) {
	      if (files.length > 0) {
	          const file = files[0];
	          if (file.type.startsWith("image/")) {
	              displayImage(file);
	          } else {
	              alert("이미지 파일만 첨부할 수 있습니다.");
	          }
	      }
	  }

	  function displayImage(file) {
		    const reader = new FileReader();
		    reader.onload = (e) => {
		        imagePreview.innerHTML = ''; // 이미지를 표시할 엘리먼트 초기화

		        const img = document.createElement("img");
		        img.src = e.target.result;
		        img.alt = "Uploaded Image";

		        img.style.width = "50%";
		        img.style.height = "auto";

		        imagePreview.appendChild(img); // 이미지를 표시할 엘리먼트에 추가
		        
		        // 이미지가 표시되면 'instructions' 엘리먼트를 숨깁니다.
		        const instructions = document.getElementById("instructions");
		        instructions.style.display = "none";
		    };
		    reader.readAsDataURL(file);
		}

	  dropArea.addEventListener("drop", (e) => {
		    e.preventDefault();
		    dropArea.style.backgroundColor = "";

		    const files = e.dataTransfer.files;
		    updateFileInput(files);
		});


	  
    // 클래스 이름 번역 함수
    async function translateClassName(className) {
      try {
        const response = await fetch(`https://translation.googleapis.com/language/translate/v2?key=AIzaSyAudjpTypPWJYwQeCpwwifiwJPWFpRmML8`, {
          method: 'POST',
          headers: {
            'Content-Type': 'application/json',
          },
          body: JSON.stringify({
            q: className,
            target: 'ko',
          }),
        });

        const data = await response.json();
        if (data && data.data && data.data.translations && data.data.translations[0]) {
          return data.data.translations[0].translatedText;
        } else {
          return className;
        }
      } catch (error) {
        console.error('번역 오류:', error);
        return className;
      }
    }

    async function loadImageBase64(file) {
      return new Promise((resolve, reject) => {
        const reader = new FileReader();
        reader.readAsDataURL(file);
        reader.onload = () => resolve(reader.result);
        reader.onerror = (error) => reject(error);
      });
    }

    const classPrices = {};

    goodsData.forEach(item => {
      classPrices[item.name] = item.price;
    });

    document.getElementById("uploadButton").addEventListener("click", async () => {
        const fileInput = document.getElementById("fileInput");
        const file = fileInput.files[0];
        const resultContainer = document.getElementById("resultContainer");

        if (!file) {
            alert("이미지 파일을 선택해주세요.");
            return;
        }

        try {
            const image = await loadImageBase64(file);

        const response = await axios({
          method: "POST",
          url: "https://detect.roboflow.com/indoor-zrujv/1",
          params: {
            api_key: "xWix8kvq3rK2f2b3ljxR"
          },
          data: image,
          headers: {
            "Content-Type": "application/x-www-form-urlencoded"
          }
        });

        const classValues = response.data.predictions.map(prediction => prediction.class);

        const classCount = {};
        let totalPrice = 0;

        classValues.forEach(classValue => {
          if (classCount[classValue]) {
            classCount[classValue]++;
          } else {
            classCount[classValue] = 1;
          }
          totalPrice += classPrices[classValue] || 0;
                const totalValueInput = document.querySelector('input[name="totalPrice"]');
    	        if (totalValueInput) {
    	          totalValueInput.value = totalPrice;
    	        }
        });

        let resultHTML = "<p style='font-weight: bold; font-size: 24px; font-family: malgunGothic; color: #5C5D5D;'>분석 결과</p><ul>";
        const classNameArray = []; // 클래스 이름을 저장할 배열
        const classTotalPriceArray = []; // 클래스 총 가격을 저장할 배열
        for (const className in classCount) {
          const translatedClassName = await translateClassName(className);
          const classPrice = classPrices[className] || 0;
          const classTotalPrice = classPrice * classCount[className];
          
          // 배열에 값을 추가
          classNameArray.push(className);
          classTotalPriceArray.push(classTotalPrice);
          
          resultHTML += "<p>" + translatedClassName + ": " + classCount[className] + "개, " + classTotalPrice + "원&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</p>";
        }
        resultHTML += "</ul>";
        resultHTML += "<p style='font-family: malgunGothic;'>합계 : " + totalPrice + "원</p>";
        console.log(classNameArray);
        console.log(classTotalPriceArray);
        
        const classNameInput1 = document.querySelector('input[name="PROD1"]');
        const classNameInput2 = document.querySelector('input[name="PROD2"]');
        const classNameInput3 = document.querySelector('input[name="PROD3"]');
        const classNameInput4 = document.querySelector('input[name="PROD4"]');
        const classNameInput5 = document.querySelector('input[name="PROD5"]');
        const classNameInput6 = document.querySelector('input[name="PROD6"]');
        
        classNameInput1.value = classNameArray[0];
        classNameInput2.value = classNameArray[1];
        classNameInput3.value = classNameArray[2];
        classNameInput4.value = classNameArray[3];
        classNameInput5.value = classNameArray[4];
        classNameInput6.value = classNameArray[5];
        
        const classTotalPriceInput1 = document.querySelector('input[name="PROD1_PRICE"]');
        const classTotalPriceInput2 = document.querySelector('input[name="PROD2_PRICE"]');
        const classTotalPriceInput3 = document.querySelector('input[name="PROD3_PRICE"]');
        const classTotalPriceInput4 = document.querySelector('input[name="PROD4_PRICE"]');
        const classTotalPriceInput5 = document.querySelector('input[name="PROD5_PRICE"]');
        const classTotalPriceInput6 = document.querySelector('input[name="PROD6_PRICE"]');
        
        classTotalPriceInput1.value = classTotalPriceArray[0];
        classTotalPriceInput2.value = classTotalPriceArray[1];
        classTotalPriceInput3.value = classTotalPriceArray[2];
        classTotalPriceInput4.value = classTotalPriceArray[3];
        classTotalPriceInput5.value = classTotalPriceArray[4];
        classTotalPriceInput6.value = classTotalPriceArray[5];
        
        resultContainer.innerHTML = resultHTML;
      } catch (error) {
        console.error(error.message);
      }
    });
    </script>
    </div>
</div>
    <br>
  	<button type="submit" id="submit" style="height:40px; background-color:#1363c6; color:white; border:0;">다음 화면으로</button>
	</form>  
  	
	               
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