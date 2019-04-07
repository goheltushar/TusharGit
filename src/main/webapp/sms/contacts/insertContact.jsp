
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>


<%
	if (session.isNew()) {
%>
<script>
	window.location.replace("../../login/Login.jsp");
</script>
<%
	}
%>

<html>
<head>
<title>Insert Contact Operation</title>
</head>

<body>
	<sql:setDataSource var="snapshot" driver="com.mysql.jdbc.Driver"
		url="jdbc:mysql://phpmyadmin-dot-sendsms-stjkms.appspot.com/stjkms"
		user="root" password="Radhey@2910" />


	<%
		
			InputStream is = new FileInputStream("sms/Contacts.txt");
			BufferedReader br = new BufferedReader(new InputStreamReader(is));
			String str = "";
			StringTokenizer st = null;
			String number = "";
			String name = "";
			String adj = "";
			String surname = "";
			String sql="";
			int i = 0;
			while ((str = br.readLine()) != null) {
				i++;
				if (i == 1)
					continue;
				st = new StringTokenizer(str, ",");
				number = st.nextToken();
				name = st.nextToken();
				adj = st.nextToken();
				surname = st.nextToken();
				//sql = "insert into contacts values('"+ name +"','"+ adj +"','"+ surname +"',"+ number +")";
				out.println(name);
				
	
		}
	%>
	
</head>
<body>







</body>
</html>





</body>





</html>