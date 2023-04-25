/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package web;

import dao.VideoDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.annotation.WebInitParam;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import tafe.java.web.TableFormatter;



@WebServlet(name="Controller", urlPatterns={"/Controller"}, initParams={@WebInitParam(name="datasource", value="jdbc/JavaDB_VideoDB")})
public class Controller extends HttpServlet {
   
   
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();

        String action = request.getParameter("action");
        //GET datasource init parameter
        String ds = this.getInitParameter("datasource");
        String memberId = request.getParameter("member");
        String movieId = request.getParameter("movie");
       

      
        try {
                     //Create an instance of the DAO and pass the appropriate parameter
           VideoDAO vidDAO = new VideoDAO(ds);

           // if action is checkin movie use the appropriate method in the DAO
           if (action.equals("CheckIn")) {
           //that returns a message indicating the success or not of the operation
               if (vidDAO.checkIn(memberId, movieId)) 
               {
                   out.print("Successfully checked in movie");
               } 
               else 
               {
                   out.print("Movie check-in failed. There was an error checking-in the movie");
               }
            } 
           
          
           // if action is rentout movie use the appropriate method in the DAO and respond with an appropriate messge to the user
           if(action.equals("RentMovie")){
               String m_id = request.getParameter("member");
               String b_id = request.getParameter("movie");
               if(vidDAO.rentOut(m_id, b_id))
               {
                   out.println("Movie was rented Out Successfully");
               }
               else 
               {
                   out.println("Movie was not rented Out Successfully");
               }
           }

           
           // if action is view member rental history use the appropriate method in the DAO and Pass the result set to the TableFormatter class to display the output
            else if(action.equals("MemberHistory")){
               // get member id
               String m_id = request.getParameter("member");
               // call appropriate dao method to get books borrows by this member
               out.println(TableFormatter.getData(vidDAO.getMemberHistory(m_id)));
               // use the TableFormatter.getData() to display the results
              
           }

            // if action is view movie rental history use the appropriate methos in the DAO and Pass the result set to the TableFormatter class to display the output
              else if(action.equals("MovieHistory")){
                 // get the book id
                 String b_id = request.getParameter("movie");
                 // call appropriate dao method to get the details of the members who have borrowed this book
                //use the TableFormatter.getData() to display the results
                out.println(TableFormatter.getData(vidDAO.getMovieHistory(b_id)));
           }

        }

        catch(Exception ex) {
            out.println(ex.getMessage());
        }
        finally {
            out.close();
        }
    } 

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /** 
     * Handles the HTTP <code>GET</code> method.
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
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
