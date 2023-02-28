

package lab6;

import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;

/**
 *
 * @author Dale Van Heer
 * @version
 */
public class CounterRewrite extends HttpServlet {
    
    /** Processes requests for both HTTP <code>GET</code> and <code>POST</code> methods.
     * @param request servlet request
     * @param response servlet response
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        
        HttpSession session = request.getSession(true);
      
         // Is there a count yet?
        int count = 1;
        Integer i = (Integer) session.getAttribute("COUNTER");

        // If a previous count exists, set it
        if (i != null) {
            count = i.intValue() + 1;
        }

        // Put the count back into the session
        session.setAttribute("COUNTER", new Integer(count));
        
        out.println("<html>");
        out.println("<head>");
        out.println("<title>Session Counter</title>");
        out.println("</head>");
        out.println("<body>");
        out.println("Your session ID is <b>" +
        session.getId());
        out.println("</b> and you have hit this page <b>" +
                    count +
                    "</b> time(s) during this browser session");

        String url = request.getRequestURI();
        out.println("<form method=GET action=\"" +
                    response.encodeURL(url) + "\">");
                    out.println("<input type=submit " +
                    "value=\"Hit page again\">");
                    out.println("</form>");

        out.println("</body>");
        out.println("</html>");
   
        out.close();
    }
    
    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /** Handles the HTTP <code>GET</code> method.
     * @param request servlet request
     * @param response servlet response
     */
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        processRequest(request, response);
    }
    
    /** Handles the HTTP <code>POST</code> method.
     * @param request servlet request
     * @param response servlet response
     */
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        processRequest(request, response);
    }
    
    /** Returns a short description of the servlet.
     */
    public String getServletInfo() {
        return "Short description";
    }
    // </editor-fold>
}
