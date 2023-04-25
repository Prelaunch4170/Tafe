<%-- 
    Document   : Bids
    Created on : 23/04/2023, 10:30:05 PM
    Author     : Andre
--%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
<%@page import="model.Item" %>
<%@page import="model.Member" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <%
                    List items = (List) session.getAttribute("items");
                    Iterator iterItem = items.iterator();
                    List members = (List) session.getAttribute("members");
                    Iterator iterMembers = items.iterator();
        %>
    <body>
        <h1>Hello World!</h1>
         <table border="1">

                    <tbody>
                        <tr>
                            <td> <select name="item">
                                      <option value="NULL" selected="true">-- Select A Book --</option>
                                    <%
                                                String itemID = null;
                                                String itemName = null;
                                                while (iterItem.hasNext()) {
                                                    Item item = (Item) iterItem.next();
                                                    itemID = item.getItemID();
                                                    itemName = item.getItemName();
                                                %>
                                  
                                    <option value="<%= itemID%>"><%= itemName%></option>
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

    </body>
</html>
