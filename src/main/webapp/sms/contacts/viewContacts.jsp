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
<title>SendSMS-STJKMS Login</title>
</head>

<sql:setDataSource var="con" driver="com.mysql.jdbc.GoogleDriver"
	url="jdbc:google:mysql://sendsms-stjkms:us-central1:sendsms-stjkms-sql/stjkms"
	user="root" password="Radhey@2910" />

<sql:query var="result" dataSource="${con}"
	sql="select * from contacts order by Name" />

<c:set var="i" value="1" />

<div class="container">
	<div class="row">
		<div class="col-sm-9 col-md-7 col-lg-5 mx-auto">
			<div class="card card-signin my-5">
				<div class="card-body">
					<table class="table">
						<thead>
							<tr>
								<th scope="col">#</th>
								<th scope="col">Name</th>
								<th scope="col">Mobile</th>
							</tr>
						</thead>

						<tbody>

							<c:forEach items="${result.rows}" var="row">

								<tr>
									<th scope="row"><a href="editContact.jsp?name=${row.Name}&adjective=${row.Adjective}&surname=${row.Surname}&number=${row.Number}&id=${row.id}">${i}</a></th>
									<td>${row.Name} ${row.Surname}</td>
									<td>${row.Number}</td>
								</tr>
								<c:set var="i" value="${i + 1 }" />
							</c:forEach>
							
							<tr>
								<td colspan="3"> <button class="btn btn-lg btn-info btn-block text-uppercase"
								onclick="window.location.replace('../../login/main.jsp')">Home</button> </td>
							</tr>
						</tbody>
					</table>
				</div>
			</div>
		</div>
	</div>
</div>
</html>