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

<script type="text/javascript">
	function clickInsertContact() {
		window.location.replace("../sms/contacts/insertContact.jsp");
	}

	function clickViewContacts() {
		window.location.replace("../sms/contacts/viewContacts.jsp");
	}

	function clickSendMessage() {
		window.location.replace("../sms/enterMessage.jsp");
	}
	
	
</script>

<body>
	<div class="container">
		<div class="row">
			<div class="col-sm-9 col-md-7 col-lg-5 mx-auto">
				<div class="card card-signin my-5">
					<div class="card-body">
						<h5 class="card-title text-center">SendSMS - STJKMS</h5>

						<button class="btn btn-lg btn-primary btn-block text-uppercase"
							type="submit" onclick="clickInsertContact()">Insert
							Contact</button>
						<hr class="my-4">

						<button class="btn btn-lg btn-primary btn-block text-uppercase"
							type="submit" onclick="clickViewContacts()">View
							Contacts</button>
						<hr class="my-4">

						<button class="btn btn-lg btn-primary btn-block text-uppercase"
							type="submit" onclick="clickSendMessage()">Send Message</button>
						<hr class="my-4">

						<a class="btn btn-info" href="logout.jsp" role="button">LogOut</a>

						<hr class="my-4">
						
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>