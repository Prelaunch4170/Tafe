package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import model.Member;
import java.util.Iterator;
import java.util.List;
import model.Book;

public final class Checkout_jsp extends org.apache.jasper.runtime.HttpJspBase
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
      response.setHeader("X-Powered-By", "JSP/2.2");
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
      out.write("\r\n");
      out.write("<html>\r\n");
      out.write("    <head>\r\n");
      out.write("        <title></title>\r\n");
      out.write("        <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\r\n");
      out.write("    </head>\r\n");
      out.write("    <body>\r\n");
      out.write("        ");

            List books = (List) session.getAttribute("books");
            Iterator iter = books.iterator();

            List members = (List) session.getAttribute("members");
            Iterator iter2 = members.iterator();

        
      out.write("\r\n");
      out.write("    <center>\r\n");
      out.write("        <form action=\"Controller\" method=\"POST\">\r\n");
      out.write("            <table border=\"1\">\r\n");
      out.write("\r\n");
      out.write("                <tbody>\r\n");
      out.write("                    <tr>\r\n");
      out.write("                        <td> <select name=\"book\">\r\n");
      out.write("                                <option value=\"NULL\" selected=\"true\">-- Select A Book --</option>\r\n");
      out.write("                                ");
  String bookId = null;
                                    String title = null;
                                    while (iter.hasNext()) {
                                        Book book = (Book) iter.next();
                                        bookId = book.getId();
                                        title = book.getTitle();
                                
      out.write("\r\n");
      out.write("\r\n");
      out.write("                                <option value=\"");
      out.print( bookId);
      out.write('"');
      out.write('>');
      out.print( title);
      out.write("</option>\r\n");
      out.write("                                ");

                                    }// end while
                                
      out.write("\r\n");
      out.write("                            </select></td>\r\n");
      out.write("                        <td> <select name=\"member\">\r\n");
      out.write("                                <option value=\"NULL\" selected=\"true\">-- Select A Member --</option>\r\n");
      out.write("                                ");

                                    String memberId = null;
                                    String name = null;
                                    while (iter2.hasNext()) {
                                        Member member = (Member) iter2.next();
                                        memberId = member.getId();
                                        name = member.getName();
                                
      out.write("\r\n");
      out.write("                                <option value=\"");
      out.print( memberId);
      out.write('"');
      out.write('>');
      out.print( name);
      out.write("</option>\r\n");
      out.write("                                ");

                                    }// end while
                                
      out.write("\r\n");
      out.write("                            </select></td>\r\n");
      out.write("                    </tr>\r\n");
      out.write("                    <tr>\r\n");
      out.write("                        <td> <input type=\"submit\" value=\"Checkout Book\" /></td>\r\n");
      out.write("                        <td></td>\r\n");
      out.write("                    </tr>\r\n");
      out.write("                </tbody>\r\n");
      out.write("\r\n");
      out.write("            </table>\r\n");
      out.write("\r\n");
      out.write("            <input type=\"hidden\" name=\"action\" value=\"Checkout\" />\r\n");
      out.write("        </form>\r\n");
      out.write("    </center>\r\n");
      out.write("</body>\r\n");
      out.write("</html>");
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
