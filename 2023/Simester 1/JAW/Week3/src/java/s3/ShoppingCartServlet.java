
package s3;

import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;

@WebServlet(name = "ShoppingCartServlet", urlPatterns = {"/cart"})

public class ShoppingCartServlet extends HttpServlet {
    
    /** Processes requests for both HTTP <code>GET</code> and <code>POST</code> methods.
     * @param request servlet request
     * @param response servlet response
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        
        out.println("<html>");
        out.println("<head><title>HiddenFormFieldsServlet</title></head>");
        out.println("<body>");
        String[] items = request.getParameterValues("movies");
        // Print the current cart items.
        out.println("You currently have the following items in your cart:<BR>");
        if (items == null) {
            out.println("<B>None</B>");
        }
        else {
            out.println("<UL>");
            for(int i=0; i<items.length; i++) {
                out.println("<LI>" + items[i]);
            }

            out.println("</UL>");
        }

        // Ask if the user wants to add more items or check out.
        // Include the current items as hidden fields so they'll be passed on.
        out.println("<FORM ACTION=\"shopping\" METHOD=GET>");
        if (items != null) {
            for(int i=0; i< items.length; i++) {
                   out.println("<INPUT TYPE=hidden name=\"movies\" VALUE=\"" +
                   items[i] + "\">");
            }
         }
        out.println("Would you like to<BR>");
        out.println("<INPUT TYPE=SUBMIT VALUE=\" Add More Items \">");
        out.println("</FORM>");

        out.println("<FORM ACTION=\"checkout\" METHOD=GET>");
        if (items != null) {
            for(int i=0; i< items.length; i++) {
                out.println("<INPUT TYPE=hidden name=\"movies\" VALUE=\"" +
                  items[i] + "\">");
            }
        }

        out.println("<INPUT TYPE=SUBMIT VALUE=\"Check out \">");
        out.println("</FORM>");
        out.println("</body></html>");

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
