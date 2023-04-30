<html>

<head>
<meta http-equiv="Content-Language" content="en-us">
<meta http-equiv="Content-Type" content="text/html; charset=windows-1252">
<meta name="GENERATOR" content="Microsoft FrontPage 4.0">
<meta name="ProgId" content="FrontPage.Editor.Document">
<title>New Page 1</title>
</head>

<body>

<p>&nbsp;</p>
<form method="POST" action="form1.jsp">
  <p>Name&nbsp; <input type="text" name="name" size="20"></p>
  <p>Address <input type="text" name="address" size="20"></p>
  <p>Phone <input type="text" name="phone" size="20">&nbsp; </p>
  <p><input type="submit" value="Submit" name="B1"><input type="reset" value="Reset" name="B2"></p>
</form>

<%-- Create the bean only when the form is posted--%>
<%
	if(request.getMethod().equals("POST")) {
%>
	       <% if(request.getParameter("name").equals("") || request.getParameter("address").equals("") || 								request.getParameter("phone").equals("") )
		 	out.println("<h2>You must enter all fields");
 	          else {  
		%> 
	        

	<jsp:useBean id="frm1" class="FormBean1" scope="session"/>
		<jsp:setProperty name="frm1" property="*"/>

		<p>
		<hr>
		<h2>You submitted:<P>		
		<br><h3>Name:</br>
		<jsp:getProperty name="frm1" property="name"/>
		<p>
		<br><b>Address:</b>
		<jsp:getProperty name="frm1" property="address"/>
		<p>
		<br><b>Phone: </b>
		<jsp:getProperty name="frm1" property="phone"/> </h3> 
<% 	}
	
      } // end if 
%>
</body>

</html>
