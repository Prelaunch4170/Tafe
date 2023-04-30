<html>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=windows-1252">
<meta name="GENERATOR" content="Microsoft FrontPage 4.0">
<meta name="ProgId" content="FrontPage.Editor.Document">
<title>What Days of the week are you available</title>
</head>

<body>

<form method="POST" action="form2.jsp">
 
  	<h2>What Days of the week are you available?</h2>
 
  	<p><input type="checkbox" name="day" value="mon">Mon</p>
  	<p><input type="checkbox" name="day" value="tue">Tue</p>
	<p><input type="checkbox" name="day" value="wed">Wed</p>
	<p><input type="checkbox" name="day" value="thu">Thu</p>
	<p><input type="checkbox" name="day" value="fri">Fri</p>
	<p><input type="checkbox" name="day" value="sat">Sat</p>
    <p><input type="checkbox" name="day" value="sun">Sun</p>

  <p><input type="submit" value="Submit" name="B1"><input type="reset" value="Reset" name="B2"></p>
</form>

<%-- Create the bean only when the form is posted--%>
<%
	if(request.getMethod().equals("POST")) {
%>
		<jsp:useBean id="frm2" class="FormBean2" scope="request"/>
		<jsp:setProperty name="frm2" property="*"/>

		
<%
	String[] days = frm2.getDay();
	  if(days!=null) {
	     out.println("<ul>");
	     for(int i=0;i<days.length; i++)
		out.println("<li>" + days[i]);
	     out.println("</ul>");
	  }
	     else out.println("Nothing was selected<br>");
	}
%>

</body>

</html>
