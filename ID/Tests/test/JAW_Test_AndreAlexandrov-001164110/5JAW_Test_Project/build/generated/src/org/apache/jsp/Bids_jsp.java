package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.util.Iterator;
import java.util.List;
import model.Item;
import model.Member;

public final class Bids_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.List<String> _jspx_dependants;

  private org.glassfish.jsp.api.ResourceInjector _jspx_resourceInjector;

  public java.util.List<String> getDependants() {
    return _jspx_dependants;
  }

  public void _jspService(HttpServletRequest request, HttpServletResponse response)
        throws java.io.IOException, ServletException {

    PageContext pageContext = null;
    HttpSession session = null;
    ServletContext application = null;
    ServletConfig config = null;
    JspWriter out = null;
    Object page = this;
    JspWriter _jspx_out = null;
    PageContext _jspx_page_context = null;

    try {
      response.setContentType("text/html;charset=UTF-8");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;
      _jspx_resourceInjector = (org.glassfish.jsp.api.ResourceInjector) application.getAttribute("com.sun.appserv.jsp.resource.injector");

      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("<!DOCTYPE html>\r\n");
      out.write("<html>\r\n");
      out.write("    <head>\r\n");
      out.write("        <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\r\n");
      out.write("        <title>JSP Page</title>\r\n");
      out.write("    </head>\r\n");
      out.write("    ");

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
    
      out.write("\r\n");
      out.write("    <body>\r\n");
      out.write("        <img src=\"Images/AllBids_Logo.gif\" width=\"295\" height=\"42\">\r\n");
      out.write("        <form action=\"controller\" method=\"POST\">\r\n");
      out.write("            <table border=\"1\">\r\n");
      out.write("\r\n");
      out.write("                <tbody>\r\n");
      out.write("                    <tr>\r\n");
      out.write("                        <td> <select name=\"Bidders\">\r\n");
      out.write("                                <option value=\"NULL\" selected=\"true\">--Select Bidder--</option>\r\n");
      out.write("                                ");

                                    String memberID = null;
                                    String memberName = null;
                                    while (iterMembers.hasNext()) {
                                        Member member = (Member) iterMembers.next();
                                        memberID = member.getMemberID();
                                        memberName = member.getMemberName();
                                
      out.write("\r\n");
      out.write("\r\n");
      out.write("                                    <option value=\"");
      out.print( memberID);
      out.write('"');
      out.write('>');
      out.print( memberName);
      out.write("</option>\r\n");
      out.write("                                ");

                                    }// end while
                                
      out.write("\r\n");
      out.write("                            </select></td>\r\n");
      out.write("                        <td> <select name=\"Items\">\r\n");
      out.write("                                <option value=\"NULL\" selected=\"true\">--Select An Item to View Bids--</option>\r\n");
      out.write("                                ");

                                    String itemID = null;
                                    String itemName = null;
                                    while (iterItem.hasNext()) {
                                        Item item = (Item) iterItem.next();
                                        itemID = item.getItemID();
                                        itemName = item.getItemName();
                                
      out.write("\r\n");
      out.write("\r\n");
      out.write("                                <option value=\"");
      out.print( itemID);
      out.write('"');
      out.write('>');
      out.print( itemName);
      out.write("</option>\r\n");
      out.write("                                ");

                        }// end while

      out.write("\r\n");
      out.write("                            </select></td>\r\n");
      out.write("                    </tr>\r\n");
      out.write("                    <tr>\r\n");
      out.write("                        <td>\r\n");
      out.write("                            <input type=\"submit\" value=\"Submit Bid\"><input type=\"hidden\" name=\"action\" value=\"bid\">\r\n");
      out.write("                        </td>\r\n");
      out.write("                        <td>Enter Your Bid <input type=\"text\" name=\"bidValue\" size=\"10\"></td></tr>\r\n");
      out.write("                    </td>\r\n");
      out.write("                </tbody>\r\n");
      out.write("            </table>\r\n");
      out.write("        </form>\r\n");
      out.write("\r\n");
      out.write("    </body>\r\n");
      out.write("</html>\r\n");
    } catch (Throwable t) {
      if (!(t instanceof SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          out.clearBuffer();
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
