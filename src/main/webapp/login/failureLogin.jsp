<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
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
<title>successLogin</title>

<script>
	window.onload = function() {
		setTimeout(loadAfterTime, 5000)
	};

	function loadAfterTime() {
		window.location.replace("Login.jsp");
	}
</script>

</head>
<body>
	<%
		if (session.isNew()) {
	%>
	<script>
		window.location.replace("../login/Login.jsp");
	</script>
	<%
		}
	%>
	<div class="alert alert-danger" role="alert">
		<button type="button" class="close" data-dismiss="alert"
			aria-label="Close">
			<span aria-hidden="true">&times;</span>
		</button>

		<strong>Failure!</strong> You have Entered Wrong Credentials !!! Soon,
		You will be redirected to Login Page.
	</div>


</body>
</html>