<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.net.*,java.io.*"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

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




						
							
							
						<c:set var="dtxnid" value="EB1woiOKxk9H9waL8gp" />


						<%
							String txnid = (String) pageContext.getAttribute("dtxnid");
							int count = 1;
							if (txnid.length() > 2) {
								String report_status = "FETCHING";
								while (report_status.equals("FETCHING")) {
									if (count++ > 50)
										break;
									out.println("<br>" + count + " " + report_status);
						%>
						<c:import url="http://stats.mytoday.com/dlr_api"
							var="result_status">
							<c:param name="feedid" value="364413" />
							<c:param name="dtxnid" value="${dtxnid}" />
						</c:import>

						<c:set var="result_status"
							value="${fn:substringAfter(result_status,'<RESULT>')}" />
						<c:set var="status"
							value="${fn:substringBefore(result_status,'</RESULT>')}" />

						<%
							report_status = (String) pageContext.getAttribute("status");
								}

								if (report_status.equals("DONE")) {
						%>
						<c:import url="http://stats.mytoday.com/dlr_api" var="result_file">
							<c:param name="feedid" value="364413" />
							<c:param name="dtxnid" value="${dtxnid}" />
							<c:param name="ack" value="1" />
						</c:import>

						<c:out value="${result_file}" />

						<c:set var="result_file"
							value="${fn:substringAfter(result_file,'?')}" />
						<c:set var="file" value="${fn:substringBefore(result_file,'&')}" />
						<c:out value="${file}" />

						<%
							}
							}
						%>






					</div>
				</div>
			</div>
		</div>


	</div>







</body>




</body>
</html>