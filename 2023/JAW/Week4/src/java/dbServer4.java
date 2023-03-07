/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Andre
 */
@WebServlet(urlPatterns = {"/dbServer4"})
public class dbServer4 extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
       protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        Connection con = null;
        PrintWriter out= null;
        try{
            out = response.getWriter();
            

            // Load the Driver class file
            Class.forName("org.apache.derby.jdbc.ClientDriver");

            // Make a connection to the ODBC datasource Movie Catalog
            // In this example we are opening a connection to the
            // database with every request.
            con = DriverManager.getConnection("jdbc:derby://localhost:1527/movies", "user1", "password");

            if (con != null) {
                out.println("<html>\n<body>\n<table border=\"1\" width=\"100%\">");
                // Create the statement
                Statement statement = con.createStatement();
                ResultSet rs = statement.executeQuery("SELECT * FROM USER1.TMovie");
                ResultSetMetaData rsmd = rs.getMetaData();
                int columnCount = rsmd.getColumnCount();
                out.println("<tr>");

                for (int i = 1; i <= columnCount; i++) {
                    out.println("<td><h3>" + rsmd.getColumnName(i) + "</td>");
                }
                out.println("</tr>");

                while (rs.next()) {
                    out.println("<tr>");
                    // get the id, which is an int
                    out.println("<td>" + rs.getInt("id") + "</td>");
                    // get the name, which is a String
                    out.println("<td>" + rs.getString("title") + "</td>");
                    // get the rating, which is a String
                    out.println("<td>" + rs.getString("rating") + "</td>");
                    // get the price, which is a Float
                    out.println("<td>" + rs.getFloat("price") + "</td>");
                    // get the Quantity, which is a Integer
                    out.println("<td>" + rs.getInt("quantity") + "</td>");
                    // get the Category, which is a Integer
                    out.println("<td>" + rs.getString("category") + "</td>");
                    out.println("</tr>");
                }// end while
                // Close the ResultSet
                rs.close();
                out.println("</table>");
            }// end if
            else {
                out.println("Data Not Found");
            }

        } catch (Exception e) {
            System.err.println(e.getMessage());
        }// end try-catch
        finally {
            try {
                if (con != null) {
                    // Close the connection no matter what
                    con.close();
                }// end if
            } catch (SQLException sqle) {
                System.err.println(sqle.getMessage());
            }// end try-catch
        }// end finally
        out.close();
} // end of procesRequest()

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
