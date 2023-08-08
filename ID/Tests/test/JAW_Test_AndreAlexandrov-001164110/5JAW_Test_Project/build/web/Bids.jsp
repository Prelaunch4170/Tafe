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
        Iterator iterItem = null;
        if (items != null) {
            iterItem = items.iterator();
        }
        List members = (List) session.getAttribute("members");
        Iterator iterMembers = null;
        if (members != null) {
            iterMembers = members.iterator();
        }
    %>
    <body>
        <img src="Images/AllBids_Logo.gif" width="295" height="42">
        <form action="controller" method="POST">
            <table border="1">

                <tbody>
                    <tr>
                        <td> <select name="Bidders">
                                <option value="NULL" selected="true">--Select Bidder--</option>
                                <%
                                    String memberID = null;
                                    String memberName = null;
                                    while (iterMembers.hasNext()) {
                                        Member member = (Member) iterMembers.next();
                                        memberID = member.getMemberID();
                                        memberName = member.getMemberName();
                                %>

                                    <option value="<%= memberID%>"><%= memberName%></option>
                                <%
                                    }// end while
                                %>
                            </select></td>
                        <td> <select name="Items">
                                <option value="NULL" selected="true">--Select An Item to View Bids--</option>
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
                        <td>
                            <input type="submit" value="Submit Bid"><input type="hidden" name="action" value="bid">
                        </td>
                        <td>Enter Your Bid <input type="text" name="bidValue" size="10"></td></tr>
                    </td>
                </tbody>
            </table>
        </form>

    </body>
</html>
