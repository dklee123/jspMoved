<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>Login</title>
  <link rel='stylesheet' href='https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.14.0/css/all.min.css'>
  <link rel="stylesheet" href="../../assets/css/login.css">

  <!-- fontawesome -->
  <script src="https://kit.fontawesome.com/0743fc8aa3.js" crossorigin="anonymous"></script>

  <style>
    a {
      text-decoration: none;
    }

    .socials {
      display: flex;
      gap: 2rem;
    }

    .social-btn {
      height: 48px;
      width: 48px;
      background-size: cover;
      background-repeat: no-repeat;
      display: flex;
      justify-content: center;
      align-items: center;
      transition: all 120ms cubic-bezier(0.17, 0.67, 0.83, 0.67);
    }

    .social-btn p {
      display: none;
    }

    .social-btn:hover {
      width: 100px;
      border-radius: 100px;
      transition: all 120ms cubic-bezier(0.17, 0.67, 0.83, 0.67);
    }

    .social-btn:hover p {
      display: block;
      font-family: "Poppins";
      color: white;
      font-weight: 500;
    }

    #a-btn {
      background-image: url(https://www.svgrepo.com/download/494331/apple-round.svg);
    }

    #a-btn:hover {
      background-image: none;
      background-color: #000000;
    }

    #fb-btn {
      background-image: url(https://www.svgrepo.com/download/448224/facebook.svg);
    }

    #fb-btn:hover {
      background-image: none;
      background-color: #1877f2;
    }

    #g-btn {
      background-image: url(https://www.svgrepo.com/download/448227/google.svg);
    }

    #g-btn:hover {
      background-image: none;
      background-color: #ea4335;
    }
  </style>

</head>
<body>
<a href="../../index.jsp"><h1>M<span style="color:skyblue; font-size:30px;">O</span>VED</h1></a>

<br>
<div class="container" id="container">
  <div class="form-container sign-up-container">
    <form action="../../company/login/cloginpro.jsp" method="POST">
    <i class="fa-solid fa-truck" style="font-size:30px;"></i>
      
      <h1>업체 회원</h1>
      <div class="social-container">
        <div class="socials">
          <a class="social-btn" href="" id="g-btn"><p>Google</p></a>
          <a class="social-btn" href="" id="a-btn"><p>Apple</p></a>
          <a class="social-btn" href="" id="fb-btn"><p>Facebook</p></a>
        </div>
      </div>
      <input type="id" placeholder="이메일" name="memid" />
      <input type="password" placeholder="비밀번호" name="mempw" />
      <a href="#">비밀번호를 잊어버리셨나요?</a>
      <button type="submit">LOGIN</button>
    </form>
  </div>
  <div class="form-container sign-in-container">
    <form action="../login/loginpro.jsp" method="POST">
      <i class="fa-solid fa-user" style="font-size:30px;"></i>
      <h1>개인 회원</h1>
      <div class="social-container">
        <div class="socials">
          <a class="social-btn" href="" id="g-btn"><p>Google</p></a>
          <a class="social-btn" href="" id="a-btn"><p>Apple</p></a>
          <a class="social-btn" href="" id="fb-btn"><p>Facebook</p></a>
        </div>
      </div>
      <input type="email" placeholder="이메일" name="memid" />
      <input type="password" placeholder="비밀번호" name="mempw" />
      <a href="#">비밀번호를 잊어버리셨나요?</a>
      <button type="submit">LOGIN</button>
    </form>
  </div>

  <div class="overlay-container">
    <div class="overlay">
      <div class="overlay-panel overlay-left">
        <h1>개인 회원이신가요?</h1>
        <br>
        <button class="ghost" id="personal">전환</button>
      </div>
      <div class="overlay-panel overlay-right">
        <h1>업체 회원이신가요?</h1>
        <br>
        <button class="ghost" id="company">전환</button>
      </div>
    </div>
  </div>
</div>

<footer>
  <p>
    &copy; Moved since 2023. All rights reserved.
  </p>
</footer>
<script>
  const companyButton = document.getElementById('company');
  const personalButton = document.getElementById('personal');
  const container = document.getElementById('container');

  companyButton.addEventListener('click', () => {
    container.classList.add("right-panel-active");
  });

  personalButton.addEventListener('click', () => {
    container.classList.remove("right-panel-active");
  });
</script>
</body>
</html>