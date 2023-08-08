
package s3;

import java.io.*;
import java.io.IOException;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

@WebServlet(name = "HiddenFormFieldsServlet", urlPatterns = {"/shopping"})
public class HiddenFormFieldsServlet extends HttpServlet {
    
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
        
        out.println("<form method=\"POST\" action=\"cart\">");
        out.println("<select name=\"movies\" size =7 multiple>");
        out.println("<option selected>Ned Kelly</option>");
        out.println("<option>Chicago</option>");
        out.println("<option>Gangs of New York</option>");
        out.println("<option>Hours</option>");
        out.println("<option>Matrix</option>");
        out.println("<option>I Robot</option>");
        out.println("<option>Once upon a time in Mexico</option>");
        out.println("<option>Jeepers Creepers 2</option>");
        out.println("<option>American Pie 2</option>");
        out.println("<option>Spider Man 2</option>");
        out.println("</select><BR>");

        String items[] = request.getParameterValues("movies");
        if(items != null) {
            for(int i=0; i<items.length; i++) {
                 out.println("<INPUT TYPE=hidden name=\"movies\" VALUE=\"" +
                 items[i] + "\">");
            }
        }

        out.println("<p><input type=\"submit\" value=\"Add To Cart\" name=\"B1\"></p>");
        out.println("</form>");
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
