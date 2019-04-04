<%-- 
    Document   : processSendSMS2
    Created on : 28 Mar, 2019, 12:25:49 PM
    Author     : administrator
--%>

<%@page contentType="text/html" pageEncoding="UTF-8" import="java.util.Random"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri = "http://java.sun.com/jsp/jstl/sql" prefix = "sql"%>



<%
    Random rand = new Random();
    int otp = rand.nextInt(900000) + 100000;
    session.setAttribute("otp", otp);
    
%>


<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        
        
         <c:import url="http://bulkpush.mytoday.com/BulkSms/SingleMsgApi" var="result">
            <c:param name="feedid" value="${feedid}" />
            <c:param name="senderid" value="${senderid}" />
            <c:param name="username" value="${username}" />
            <c:param name="password" value="${password}" />
            <c:param name="To" value="9429912818" />
            <c:param name="Text" value="${prependotp}${otp}${appendotp}" />
        </c:import>
        
        <form action="checkOTPandSendSMS.jsp">
            Enter the OTP : <input type="text" name="otp" placeholder="Enter OTP Here" />
            <input type="submit" name="submit" value="Check OTP and Send SMS" />
        </form>
        
    </body>
</html>