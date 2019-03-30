<%-- 
    Document   : checkOTPandsendSMS
    Created on : 28 Mar, 2019, 3:06:24 PM
    Author     : administrator
--%>

<%@ page import="java.util.*,java.io.*,java.net.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8" import="java.util.Random"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri = "http://java.sun.com/jsp/jstl/sql" prefix = "sql"%>


<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>

       <c:if test="${param.otp == otp}">
            
            <%
            InputStream is = new FileInputStream("Contacts.txt");
            BufferedReader br = new BufferedReader(new InputStreamReader(is));
            String str = "";
            StringTokenizer st = null;
            String number = "";
            String name = "";
            String adj = "";
            String message = "";
            int i=0;
            while((str=br.readLine())!= null){
            	i++;
            	if(i == 1)
            		continue;
            	st = new StringTokenizer(str,",");
            	number = st.nextToken();
            	name = st.nextToken();
            	adj = st.nextToken();
            	message = "Radhey Radhey " + name + " " + adj + " " + session.getAttribute("Text");
            	%>
            	 <c:import url="http://bulkpush.mytoday.com/BulkSms/SingleMsgApi" var="result">
                    <c:param name="feedid" value="${feedid}" />
                    <c:param name="senderid" value="${senderid}" />
                    <c:param name="username" value="${username}" />
                    <c:param name="password" value="${password}" />
                    <c:param name="To" value="<%=number%>" />
                    <c:param name="Text" value="<%=message%>" />
                </c:import>

<%}%>
	<jsp:forward page="success.jsp" />
</c:if>
OTP Did Not Match...
              
        

    </body>
</html>