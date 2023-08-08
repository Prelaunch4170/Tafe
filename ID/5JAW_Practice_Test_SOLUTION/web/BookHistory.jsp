<%-- 
    Document   : BookHistory
    Created on : 10/04/2013, 1:00:26 PM
    Author     : dalevanh
--%>

<%@page import="model.Book"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <title>Book History</title>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    </head>
    <body>

        <%
                    List books = (List) session.getAttribute("books");
                    Iterator iter = books.iterator();
        %>

        <center>
            <form action="Controller" method="POST">

                <table border="1">

                    <tbody>
                        <tr>
                            <td> <select name="book">
                                      <option value="NULL" selected="true">-- Select A Book --</option>
                                    <%
                                                String bookId = null;
                                                String title = null;
                                                while (iter.hasNext()) {
                                                    Book book = (Book) iter.next();
                                                    bookId = book.getId();
                                                    title = book.getTitle();
                                                %>
                                  
                                    <option value="<%= bookId%>"><%= title%></option>
                                                <%
                                                  }// end while
                                                 %>
                                </select></td>
                        </tr>
                        <tr>
                            <td></td>
                        </tr>
                        <tr>
                            <td><input type="submit" value="Get Book History" /> </td>
                        </tr>
                    </tbody>
                </table>
                <input type="hidden" name="action" value="BookHistory" />
            </form>
        </center>
    </body>
</html>
