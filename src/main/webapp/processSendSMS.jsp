<%-- 
    Document   : processSendSMS
    Created on : 28 Mar, 2019, 12:21:49 PM
    Author     : administrator
--%>

<%@ page import="java.util.*,java.io.*" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri = "http://java.sun.com/jsp/jstl/sql" prefix = "sql"%>


<c:set var="prepend" value="Radhey Radhey " scope="session"/>
<c:set var="prependotp" value="Radhey Radhey Your OTP is : " scope="session"/>
<c:set var="appendotp" value=" And is Valid for 10 Minutes.." scope="session"/>
<c:set var="feedid" value="364413" scope="session"/>
<c:set var="senderid" value="STJKMS" scope="session"/>
<c:set var="username" value="9869422666" scope="session"/>
<c:set var="password" value="rkt@1401" scope="session"/>
<c:set var="To" value="9429912818" scope="session"/>
<c:set var="Text" value="${param.message}" scope="session" />



<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
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
            	message = "Radhey Radhey " + name + " " + adj + " " + request.getParameter("message");
            	out.println(message + "<br>");
            	if(i>4)
            		break;
            }
  %>

        <br>
        <br>
	
        <form action="processSendSMS2.jsp" >
            Chekout the Preview of Few of the SMSes that will be send and if you are satisfied then 
            Click Below Button to Send OTP.
            <br>
            <br>
            Send OTP : <input type="Submit" name="Submit" value="Send OTP" />
            <br>
            <br>
            Or Click Here to Go Back to Edit the Message : <a href="sendSMS.jsp">Edit</a>

        </form> 

    </body>
</html>