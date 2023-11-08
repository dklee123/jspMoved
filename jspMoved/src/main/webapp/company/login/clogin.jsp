<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en" >
<head>
  <meta charset="UTF-8">
  <title>login</title>
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
<!-- partial:index.partial.html -->
<a href="../../company/com_board.jsp"><h1>M<span style="color:skyblue; font-size:30px;">O</span>VED</h1></a>

<br>
<div class="container" id="container">
	<div class="form-container sign-up-container">
		<form action="../../company/login/cloginpro.jsp" method="POST">
			<i class="fa-solid fa-user" style="font-size:30px;"></i>
			<h1>Member </h1>
			<div class="social-container">
				<div class="socials">
				    <a class="social-btn" href="" id="g-btn"><p>Google</p></a>
				    <a class="social-btn" href="" id="a-btn"><p>Apple</p></a>
				    <a class="social-btn" href="" id="fb-btn"><p>Facebook</p></a>
				</div>
			</div>
			<span>or use your account</span>
			<input type="id" placeholder="id" name="memid" />
			<input type="password" placeholder="Password" name="mempw" />
			<a href="#">Forgot your password?</a>
			<button type="submit">LOGIN</input>
		</form>
	</div>
	<div class="form-container sign-in-container">
		<form action="../../company/login/cloginpro.jsp" method="POST">
			<i class="fa-solid fa-truck" style="font-size:30px;"></i>
			<h1>Company</h1>
			<div class="social-container">
				<a href="#" class="social"><i class="fab fa-facebook-f"></i></a>
				<a href="#" class="social"><i class="fab fa-google-plus-g"></i></a>
				<a href="#" class="social"><i class="fab fa-linkedin-in"></i></a>
			</div>
			<span>or use your email for registration</span>
			<input type="id" placeholder="id" name="memid" />
			<input type="password" placeholder="Password" name="mempw" />
			<a href="#">Forgot your password?</a>
			<button type="submit">Sign Up</button>
		</form>
	</div>


			
	<div class="overlay-container">
		<div class="overlay">
			<div class="overlay-panel overlay-left">
				<h1>Welcome Back!</h1>
				<p>To keep connected with us please login with your personal info</p>
				<button class="ghost" id="signIn">Sign In</button>
			</div>
			<div class="overlay-panel overlay-right">
				<h1>Hello, Friend!</h1>
				<p>Enter your personal details and start journey with us</p>
				<button class="ghost" id="signUp">Sign Up</button>
			</div>
		</div>
	</div>
</div>

<footer>
	<p>
		&copy; Moved since 2023. All rights reserved.
	</p>
</footer>
<!-- partial -->
  <script  src="../../assets/js/login.js"></script>

</body>
</html>