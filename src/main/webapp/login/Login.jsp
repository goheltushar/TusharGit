<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


<html>
<head>
<link
	href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
	rel="stylesheet" id="bootstrap-css">
<script
	src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
<script
	src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.0.8/css/all.css">
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=0">
<link href="../css/login.css" rel="stylesheet">
<meta charset="UTF-8">
<title>SendSMS-STJKMS Login</title>
</head>

<% 
session.invalidate(); 
session = null;
session = request.getSession(true);
%>
<body>
	<div class="container">
		<div class="row">
			<div class="col-sm-9 col-md-7 col-lg-5 mx-auto">
				<div class="card card-signin my-5">
					<div class="card-body">
						<h5 class="card-title text-center">Sign In</h5>
						<form class="form-signin" name="login" action="processLogin.jsp"
							method="post">
							<div class="form-label-group">
								<input type="email" name="email" id="inputEmail"
									class="form-control" placeholder="Email address" required
									autofocus> <label for="inputEmail">Email
									address</label>
							</div>

							<div class="form-label-group">
								<input type="password" name="password" id="inputPassword"
									class="form-control" placeholder="Password" required> <label
									for="inputPassword">Password</label>
							</div>

							<div class="custom-control custom-checkbox mb-3">
								<input type="checkbox" class="custom-control-input"
									id="customCheck1"> <label class="custom-control-label"
									for="customCheck1">Remember password</label>
							</div>
							<button class="btn btn-lg btn-primary btn-block text-uppercase"
								type="submit">Sign in</button>
							<hr class="my-4">
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>