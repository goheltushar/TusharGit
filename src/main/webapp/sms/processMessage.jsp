<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.io.*,java.util.StringTokenizer"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Process Message</title>

<c:if test="${checked != 'Yes' }">
	<jsp:forward page="../login/login.html" />
</c:if>

<%
	String previousPage = request.getHeader("referer");
	if (previousPage != null) {
%>



<sql:query var="result" dataSource="${con}"
	sql="select * from contacts_test order by Name" />

<c:forEach items="${result.rows}" var="row">
	<c:import url="http://bulkpush.mytoday.com/BulkSms/SingleMsgApi"
		var="result">
		<c:param name="feedid" value="364413" />
		<c:param name="senderid" value="STJKMS" />
		<c:param name="username" value="9869422666" />
		<c:param name="password" value="rkt@1401" />
		<c:param name="To" value="${row.Number}" />
		<c:param name="Text" value="Radhey Radhey ${row.Name} ${row.Adjective} ${param.inputmessage}" />
	</c:import>
</c:forEach>

<jsp:forward page="successMessageSend.jsp" />
<%
	}
%>
<jsp:forward page="../login/logout.jsp" />
</head>
<body>







</body>
</html>