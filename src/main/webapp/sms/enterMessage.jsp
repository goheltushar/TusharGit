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
<link href="../css/main.css" rel="stylesheet">

<meta charset="UTF-8">

<style type="text/css">

.selectBox {
	position: relative;
}

.selectBox select {
	width: 100%;
	font-weight: bold;
}

.overSelect {
	position: absolute;
	left: 0;
	right: 0;
	top: 0;
	bottom: 0;
}

#checkboxes {
	display: none;
	border: 1px #dadada solid;
}

#checkboxes label {
	display: block;
}

#checkboxes label:hover {
	background-color: #1e90ff;
}
</style>


<script type="text/javascript">
	var expanded = false;

	function showCheckboxes() {
		var checkboxes = document.getElementById("checkboxes");
		if (!expanded) {
			checkboxes.style.display = "block";
			expanded = true;
		} else {
			checkboxes.style.display = "none";
			expanded = false;
		}
	}

	function previewandsendotp() {
		var message = document.getElementById('inputMessage').value;
		var r = confirm("Radhey Radhey " + message);
		
		if(r == true){
			var otp = Math.floor((Math.random() * 10000) + 1);
			var xhr = new XMLHttpRequest();
			xhr.open('GET', 'http://bulkpush.mytoday.com/BulkSms/SingleMsgApi?feedid=364413&username=9869422666&password=rkt@1401&To=9979485474&Text=Radhey Radhey '+otp, true);
			xhr.send();

			var i;
			var validOTP = false;
			for (i = 1; i <= 3; i++) { 
				var inputotp = prompt("Please enter OTP : Attempt ("+ i +")", "OTP");
				if(inputotp != otp){
					alert('OTP is Not Valid...')
				}else{
					validOTP=true;
					break;
				}  
			}
		}
		
		if(validOTP == true){
			return r;	
		}else
			{
			alert('You have Entered Invalid OTP For Three Times...')
			window.location.replace("../login/logout.jsp");
			return false;
			}
		
		
	}
	
	
	$(document).ready(function() {

		  $('#one').change(function() {
			  $("#inputMessage").val('Aaj Thursday Ka Regular Kirtan Hasmukhbhai Ke Ghar Sham 7pm se 9pm tak hoga.');
		  });
		
		  $('#two').change(function() {
			  $("#inputMessage").val('Kal Sunday Ka Regular Kirtan Meera Mandir Me Subah 9am se 12:15pm tak hoga.');
		  });
		  
		  $('#three').change(function() {
			  $("#inputMessage").val('Aaj Ekadashi Ka Kirtan Anuragbhai Ke Ghar Sham 7pm se 10pm tak hoga.');
		  });

		  
	});
	
	
</script>

<title>SendSMS-STJKMS Login</title>
</head>
<body>
<body>
	<div class="container">
		<div class="row">
			<div class="col-sm-9 col-md-7 col-lg-5 mx-auto">
				<div class="card card-signin my-5">
					<div class="card-body">
						<h5 class="card-title text-center">Enter Message</h5>
						<form class="form-signin" name="enterMessage"
							action="processMessage.jsp" method="post"
							onsubmit="return previewandsendotp();">


							<div class="form-label-group">
								<textarea type="text" name="inputmessage" id="inputMessage"
									class="form-control" required rows="5" autofocus="autofocus"></textarea>

							</div>

							<div class="form-label-group">
								<div class="multiselect">
									<div class="selectBox" onclick="showCheckboxes()">
										<select>
											<option>Select Message</option>
										</select>
										<div class="overSelect"></div>
									</div>
									<div id="checkboxes">
										<label for="one"> <input type="checkbox" id="one" />Thursday</label>
										<label for="two"> <input type="checkbox" id="two" />Sunday</label>
										<label for="three"> <input type="checkbox" id="three" />Ekadashi</label>
									</div>
								</div>
							</div>
							
							<button class="btn btn-lg btn-primary btn-block text-uppercase"
								type="submit">Preview & Send OTP</button>
							<hr class="my-4">

						</form>
					</div>
				</div>
			</div>
		</div>


	</div>



</body>




</body>
</html>