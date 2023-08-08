
package session3;

import java.io.*;
import java.util.*;
import javax.servlet.*;
import javax.servlet.http.*;

@WebServlet(name = "CookieServlet2", urlPatterns = {"/cookies2"})
public class CookieServlet2 extends HttpServlet {
    
   private final Map books = new HashMap();

   // initialize Map books
   public void init()
   {
      books.put( "C", "0130895725" );
      books.put( "C++", "0130895717" );
      books.put( "Java", "0130125075" );
      books.put( "VB6", "0134569555" );
   }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        
        Cookie cookies[] = request.getCookies();  // get cookies

        response.setContentType( "text/html" ); 
        PrintWriter out = response.getWriter();

        // start XHTML document
        out.println( "<head>" );
        out.println( "<title>Recommendations</title>" );
        out.println( "</head>" );

        // body section of document
        out.println( "<body>" );

        // if there are any cookies, recommend a book for each ISBN
        if ( cookies != null && cookies.length != 0 ) {
            out.println( "<h1>Recommendations</h1>" );
            out.println( "<p>" );

            // get the name of each cookie
            for ( int i = 0; i < cookies.length; i++ ) {
                out.println( cookies[ i ].getName() + 
                " Unleashed. ISBN#: " + 
                cookies[ i ].getValue() + "<br />" );
            }

            out.println( "</p>" );
        }
        else {   // there were no cookies
            out.println( "<h1>No Recommendations</h1>" );
            out.println( "<p>You did not select a language.</p>" );
        }

        out.println( "</body>" );
        out.println( "</html>" );
        
    }
    
    /** Handles the HTTP <code>POST</code> method.
     * @param request servlet request
     * @param response servlet response
     */
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
      
        // receive language selection and send cookie containing
        // recommended book to the client
 
      String language = request.getParameter( "language" );
      String isbn = books.get( language ).toString();
      Cookie cookie = new Cookie( language, isbn );
	  cookie.setMaxAge(100);
      response.addCookie( cookie );  // must precede getWriter 
      response.setContentType( "text/html" );
      PrintWriter out = response.getWriter();         

      // send HTML page to client
      
      // head section of document
      out.println( "<head>" );
      out.println( "<title>Welcome to Cookies</title>" );      
      out.println( "</head>" );

      // body section of document
      out.println( "<body>" );
      out.println( "<p>Welcome to Cookies! You selected " +
         language + "</p>" );

      out.println( "<p><a href = " +
         "\"./Cookie.html\">" +
         "Click here to choose another language</a></p>" );

      out.println( "<p><a href = \"cookies2\">" + 
         "Click here to get book recommendations</a></p>" );
      out.println( "</body>" );

      // end XHTML document
      out.println( "</html>" );
      out.close();    // close stream
   }
    
    
    /** Returns a short description of the servlet.
     */
    public String getServletInfo() {
        return "Short description";
    }
    // </editor-fold>
}
