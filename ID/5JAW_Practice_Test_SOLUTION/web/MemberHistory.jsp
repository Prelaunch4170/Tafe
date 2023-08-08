<%-- 
    Document   : MemberHistory
    Created on : 10/04/2013, 2:06:22 PM
    Author     : dalevanh
--%>

<%@page import="model.Member"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <title>Member History</title>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    </head>
    <body>
        <%
                    List members = (List) session.getAttribute("members");
                    Iterator iter = members.iterator();
        %>
        <center>
            <form action="Controller" method="POST">

                <table border="1">

                    <tbody>
                        <tr>
                            <td> <select name="member">
                                    <option value="NULL" selected="true">-- Select A Member --</option>
                                    <%
                                        String memberId = null;
                                        String name = null;
                                        while (iter.hasNext()) {
                                            Member member = (Member) iter.next();
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
                            <td></td>
                        </tr>
                        <tr>
                            <td><input type="submit" value="Get Member History" />  </td>
                        </tr>
                    </tbody>
                </table>
                <input type="hidden" name="action" value="MemberHistory" />
            </form>
        </center>
    </body>

</html>
