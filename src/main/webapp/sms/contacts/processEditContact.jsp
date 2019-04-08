<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
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
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.0.8/css/all.css">
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=0">
<link href="../../css/login.css" rel="stylesheet">
<meta charset="UTF-8">
<title>SendSMS-STJKMS processInsertContact</title>
</head>

<sql:setDataSource var="con" driver="com.mysql.jdbc.GoogleDriver"
	url="jdbc:google:mysql://sendsms-stjkms:us-central1:sendsms-stjkms-sql/stjkms"
	user="root" password="Radhey@2910" />


<c:catch var="catchException">
	<sql:update dataSource="${con}"
		sql="update contacts set Name = ?,Adjective = ?, Surname = ?, Number = ? where id = ?">
		<sql:param value="${param.name}" />
		<sql:param value="${param.adjective}" />
		<sql:param value="${param.surname}" />
		<sql:param value="${param.number}" />
		<sql:param value="${param.id}" />
	</sql:update>
</c:catch>

<c:if test="${catchException != null}">
	<p>
		The exception is : ${catchException} <br /> 
		There is an exception: ${catchException.message}
	</p>
</c:if>

<c:if test="${catchException == null}">
	<p>
		Record Edited Successfully.....
	</p>
</c:if>




</html>