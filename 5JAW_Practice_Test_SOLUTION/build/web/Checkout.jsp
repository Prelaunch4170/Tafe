

<%@page import="model.Member"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
<%@page import="model.Book"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html>
    <head>
        <title></title>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    </head>
    <body>
        <%
            List books = (List) session.getAttribute("books");
            Iterator iter = books.iterator();

            List members = (List) session.getAttribute("members");
            Iterator iter2 = members.iterator();

        %>
    <center>
        <form action="Controller" method="POST">
            <table border="1">

                <tbody>
                    <tr>
                        <td> <select name="book">
                                <option value="NULL" selected="true">-- Select A Book --</option>
                                <%  String bookId = null;
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
                        <td> <select name="member">
                                <option value="NULL" selected="true">-- Select A Member --</option>
                                <%
                                    String memberId = null;
                                    String name = null;
                                    while (iter2.hasNext()) {
                                        Member member = (Member) iter2.next();
                                        memberId = member.getId();
                                        name = member.getName();
                                %>
                                <option value="<%= memberId%>"><%= name%></option>
                                <%
                                    }// end while
                                %>
                            </select></td>
                    </tr>
                    <tr>
                        <td> <input type="submit" value="Checkout Book" /></td>
                        <td></td>
                    </tr>
                </tbody>

            </table>

            <input type="hidden" name="action" value="Checkout" />
        </form>
    </center>
</body>
</html>