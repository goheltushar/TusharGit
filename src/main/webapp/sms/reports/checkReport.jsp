<%@page import="java.util.StringTokenizer"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"
	import="java.net.*,java.io.*,java.util.zip.*,java.util.Enumeration"%>

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


<%!void copyInputStream(InputStream in, OutputStream out) throws IOException {
		byte[] buffer = new byte[1024];
		int len = in.read(buffer);
		while (len >= 0) {
			out.write(buffer, 0, len);
			len = in.read(buffer);
		}
		in.close();
		out.close();
	}%>


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

						<c:import url="http://stats.mytoday.com/dlr_api"
							var="result_dtxnid">
							<c:param name="feedid" value="364413" />
						</c:import>
						<c:set var="result_dtxnid"
							value="${fn:substringAfter(result_dtxnid,'<RESULT>')}" />
						<c:set var="dtxnid"
							value="${fn:substringBefore(result_dtxnid,'</RESULT>')}" />
						<c:out value="${dtxnid }" />

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

						<%
							try {
								URL url = new URL("http://stats.mytoday.com/estatsbin/dlr_download?"
										+ (String) pageContext.getAttribute("file") + "&feedid=364413");
								InputStream in = new BufferedInputStream(url.openStream(), 1024);
								// make sure we get the actual file
								File zip = File.createTempFile("arc", ".zip");
								OutputStream fout = new BufferedOutputStream(new FileOutputStream(zip));

								copyInputStream(in, fout);

								ZipFile zipFile = new ZipFile(zip);
								File file = null;
								for (Enumeration entries = zipFile.entries(); entries.hasMoreElements();) {
									ZipEntry entry = (ZipEntry) entries.nextElement();
									file = new File(entry.getName());
									copyInputStream(zipFile.getInputStream(entry),
											new BufferedOutputStream(new FileOutputStream(file)));
								}
								zipFile.close();

								BufferedReader br = new BufferedReader(new InputStreamReader(new FileInputStream(file)));
								String str = "";
								int i = 1;
								int j = 1;
								count = 1;
								StringTokenizer st = null;
								StringBuffer sb = null;
								String token = "";
								while ((str = br.readLine()) != null) {
									if (i++ == 1)
										continue;
									if (str.contains("Delivered"))
										continue;

									st = new StringTokenizer(str, ",");

									j = 0;
									while (st.hasMoreTokens()) {
										j++;
										token = st.nextToken();
										if (j == 2 || j == 3)
											out.print(token + " " + j + "<br>" + (count));

									}
									count++;
									out.print("<br> <br>");

								}
								br.close();

								/*URL url = new URL(
										"http://stats.mytoday.com/estatsbin/dlr_download?file=/STATS/API_FILE/20190410/EB1woiOKxk9H9waL8gp_1-1.csv.zip&feedid=364413");
								//URL url = new URL("http://stats.mytoday.com/estatsbin/dlr_download?"
								//				+ (String) pageContext.getAttribute("file") + "&feedid=364413");
								URLConnection uc = url.openConnection();
								InputStream in = uc.getInputStream();*/
								//FileOutputStream fout = new FileOutputStream(new File("tmp.zip"));
								//int ch;
								/* while((ch=in.read()) != -1){
									out.println(ch);
									fout.write(ch);
								}
								fout.close();*/
							} catch (Exception e) {
								out.println(e.toString());
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