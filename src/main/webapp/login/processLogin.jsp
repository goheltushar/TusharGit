<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>

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



<title>processLogin</title>
</head>




<body bgcolor="white">

	<c:if
		test="${param.email == 'goheltushar1401@gmail.com' && param.password == 'stjkms' }">
		
		<jsp:forward page="successLogin.jsp" />
	</c:if>

	<%
		if (!session.isNew()) {
	%>
	<jsp:forward page="failureLogin.jsp" />
	<%
		}
	%>

</body>
</html>