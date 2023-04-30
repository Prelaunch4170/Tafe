package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import model.Book;
import java.util.Iterator;
import java.util.List;

public final class BookHistory_jsp extends org.apache.jasper.runtime.HttpJspBase
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

      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("<!DOCTYPE HTML PUBLIC \"-//W3C//DTD HTML 4.01 Transitional//EN\"\n");
      out.write("    \"http://www.w3.org/TR/html4/loose.dtd\">\n");
      out.write("\n");
      out.write("<html>\n");
      out.write("    <head>\n");
      out.write("        <title>Book History</title>\n");
      out.write("        <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\n");
      out.write("    </head>\n");
      out.write("    <body>\n");
      out.write("\n");
      out.write("        ");

                    List books = (List) session.getAttribute("books");
                    Iterator iter = books.iterator();
        
      out.write("\n");
      out.write("\n");
      out.write("        <center>\n");
      out.write("            <form action=\"Controller\" method=\"POST\">\n");
      out.write("\n");
      out.write("                <table border=\"1\">\n");
      out.write("\n");
      out.write("                    <tbody>\n");
      out.write("                        <tr>\n");
      out.write("                            <td> <select name=\"book\">\n");
      out.write("                                      <option value=\"NULL\" selected=\"true\">-- Select A Book --</option>\n");
      out.write("                                    ");

                                                String bookId = null;
                                                String title = null;
                                                while (iter.hasNext()) {
                                                    Book book = (Book) iter.next();
                                                    bookId = book.getId();
                                                    title = book.getTitle();
                                                
      out.write("\n");
      out.write("                                  \n");
      out.write("                                    <option value=\"");
      out.print( bookId);
      out.write('"');
      out.write('>');
      out.print( title);
      out.write("</option>\n");
      out.write("                                                ");

                                                  }// end while
                                                 
      out.write("\n");
      out.write("                                </select></td>\n");
      out.write("                        </tr>\n");
      out.write("                        <tr>\n");
      out.write("                            <td></td>\n");
      out.write("                        </tr>\n");
      out.write("                        <tr>\n");
      out.write("                            <td><input type=\"submit\" value=\"Get Book History\" /> </td>\n");
      out.write("                        </tr>\n");
      out.write("                    </tbody>\n");
      out.write("                </table>\n");
      out.write("                <input type=\"hidden\" name=\"action\" value=\"BookHistory\" />\n");
      out.write("            </form>\n");
      out.write("        </center>\n");
      out.write("    </body>\n");
      out.write("</html>\n");
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
