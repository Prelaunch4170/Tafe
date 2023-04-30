<%@ page errorPage="errorpage.jsp" %>

<html>
  <head>
    <title>Session Example</title>
  </head>
  <body>
    <%
      // get a reference to the current count from the session
      Integer count = (Integer)session.getAttribute("COUNT");
      
      if ( count == null ) {
      
        // If the count was not found create one
        count = new Integer(1);
        // and add it to the HttpSession
        session.setAttribute("COUNT", count);
      }
      else {
 
        // Otherwise increment the value
        count = new Integer(count.intValue() + 1);
        session.setAttribute("COUNT", count);
      }  
      out.println("<b>This page has been accessed: "
        + count + " times.</b>");
    %>
  </body>
</html>
