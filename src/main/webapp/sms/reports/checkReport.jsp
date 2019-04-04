<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
<link href="../../css/main.css" rel="stylesheet">

<meta charset="UTF-8">





<title>SendSMS-STJKMS checkReport</title>
</head>
<body>
<body>
	<div class="container">
		<div class="row">
			<div class="col-sm-9 col-md-7 col-lg-5 mx-auto">
				<div class="card card-signin my-5">
					<div class="card-body">
						<h5 class="card-title text-center">Enter Message</h5>


						<c:import url="http://stats.mytoday.com/dlr_api" var="dtxnid">
							<c:param name="feedid" value="364413" />
						</c:import>

						

						<div class="form-label-group">
							<textarea type="text" name="inputmessage" id="inputMessage"
								class="form-control" required rows="5" autofocus="autofocus">${dtxnid}</textarea>
						</div>



						<button class="btn btn-lg btn-primary btn-block text-uppercase"
							type="submit">Preview & Send OTP</button>
						<hr class="my-4">


					</div>
				</div>
			</div>
		</div>


	</div>



</body>




</body>
</html>