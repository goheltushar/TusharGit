<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.io.*,java.util.StringTokenizer"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Process Message</title>


<%
		
	    String previousPage = request.getHeader("referer");		
		if(previousPage != null) {
		InputStream is = new FileInputStream("sms/Contacts2.txt");
		BufferedReader br = new BufferedReader(new InputStreamReader(is));
		String str = "";
		StringTokenizer st = null;
		String number = "";
		String name = "";
		String adj = "";
		String inputMessage = request.getParameter("inputmessage");
		String message = "";
		int i = 0;
		while ((str = br.readLine()) != null) {
			i++;
			if (i == 1)
				continue;
			st = new StringTokenizer(str, ",");
			number = st.nextToken();
			name = st.nextToken();
			adj = st.nextToken();
			message = "Radhey Radhey " + name + " " + adj + " " + inputMessage;
%>
<c:import url="http://bulkpush.mytoday.com/BulkSms/SingleMsgApi"
	var="result">
	<c:param name="feedid" value="364413" />
	<c:param name="senderid" value="STJKMS" />
	<c:param name="username" value="9869422666" />
	<c:param name="password" value="rkt@1401" />
	<c:param name="To" value="<%=number%>" />
	<c:param name="Text" value="<%=message%>" />
</c:import>

<%
	}
%>
<jsp:forward page="successMessageSend.jsp" />
<%}
%>
<jsp:forward page="../login/logout.jsp" />
</head>
<body>







</body>
</html>