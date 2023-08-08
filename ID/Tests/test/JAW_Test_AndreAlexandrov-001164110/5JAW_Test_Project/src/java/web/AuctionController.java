/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package web;

import dao.AuctionDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebInitParam;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.Item;
import model.Member;
import tafe.java.web.TableFormatter;
/**
 *
 * @author dalevanh
 */

@WebServlet(name = "Controller", urlPatterns = {"/controller"}, initParams = {
    @WebInitParam(name = "datasource", value ="jdbc/AuctionDB")})
public class AuctionController extends HttpServlet {

   
  
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        HttpSession session = request.getSession();
       //GET datasource init parameter
        String ds = this.getInitParameter("datasource");
        String action = request.getParameter("action");    

        if(action.equals("bid")){
            AuctionDAO dao = new AuctionDAO(ds);
            String itemID = request.getParameter("Items");
            String bidderID = request.getParameter("Bidders");
            double bidAmount =0;
            
            
            //double bidAmount = Double.parseDouble(request.getParameter("bidValue"));            
            /** if above request parameters are null, call the appropriate dao method to get a List<Item> objects
             * put the list into the session object and send it to the Bids.jsp
             * call the appropriate dao method to get a List<Customer> objects
             * put the list into the session object and send it to the Bids.jsp 
             */
            if ((itemID == null) && (bidderID == null)){
                try {
                    List<Item> item = dao.getItems();
                    List<Member> member = dao.getMembers();
                    session = request.getSession();
                    session.setAttribute("items", item);
                    session.setAttribute("members", member);
                    response.sendRedirect("Bids.jsp");
                } catch (SQLException ex) {
                    Logger.getLogger(AuctionController.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
            // else statement here
            else {
                try{
                    bidAmount = Double.parseDouble(request.getParameter("bidValue"));
                }catch(Exception ex){
                    out.println(ex.getMessage());
                }// end catch
            }
            try{
                boolean bidRecorded = dao.regBid(itemID,bidderID,bidAmount);
                if(bidRecorded){
                    out.println(formatPage(bidderID + " Your Bid for " + bidAmount + " was recorded"));
                }
                else {
                    out.println(formatPage("Your Bid could not be registered"));
                }

            }catch(Exception ex){
                out.println(ex.getMessage());
            }// end catch
        }// end if
        else if(action.equals("viewBids")){
             AuctionDAO dao = new AuctionDAO(ds);
             String itemID = request.getParameter("Items");
              /** if above request parameter is null, call the appropriate dao method to get a List<Item> objects
                * put the list into the session object and send it to the ItemBids.jsp
             */
              if (itemID == null)
              {
                  
              }
            // else statement here
             try{
                
             }catch(Exception ex){
                 out.print(ex.getMessage());
             }// end catch
        }// end if
        else if(action.equals("viewItems")){
            AuctionDAO dao = new AuctionDAO(ds);
            String bidderID = request.getParameter("Bidders");
             /** if above request parameter is null, call the appropriate dao method to get a List<Member> objects
                * put the list into the session object and send it to the CustomerBids.jsp
             */
            /*if (bidderID == null) {
                try {
                   
            }*/
            try{
                 ResultSet rs = dao.displayItemsForBidder(bidderID);
                 out.print(TableFormatter.getData(rs));
             }catch(Exception ex){
                 out.print(ex.getMessage());
             }// end catch
        }// end if
        else {
            formatPage("No Valid Service Requested");
        }

        out.close();
    }

    private String formatPage(String message){
        StringBuffer output = new StringBuffer();
        output.append("<html><head><title>Auction Admin</title></head><body>");
        output.append("<h1>" + message + "</h1>");
        output.append("</body>");
        output.append("</body></html>");
        return output.toString();
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /** 
     * Handles the HTTP <code>GET</code> method.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
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
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        processRequest(request, response);
    }

    /** 
     * Returns a short description of the servlet.
     * @return a String containing servlet description
     */
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
