/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package web;

import dao.LibDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebInitParam;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.Book;
import model.Member;
import tafe.java.web.TableFormatter;

@WebServlet(name = "Controller", urlPatterns = {"/Controller"}, initParams = {
    @WebInitParam(name = "datasource", value = "jdbc/JavaDB_libDB")})
public class Controller extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        HttpSession session = request.getSession();

        // GET THE action parameter to determine what action is required
        String action = request.getParameter("action");

        //GET datasource init parameter
        String ds = this.getInitParameter("datasource");

        try {
            //Create an instance of the DAO and pass the appropriate parameter
            LibDAO dao = new LibDAO(ds);

            // if action is checkin use the appropriate method in the DAO
            //that returns a message indicating the success or not of the operation
            if (action.equals("Checkout")) {
                String memId = request.getParameter("member");
                String bookId = request.getParameter("book");
                if ((memId == null) && (bookId == null)) {
                    List<Book> books = dao.getAllBooks();
                    List<Member> memebers = dao.getAllMembers();
                    session = request.getSession();
                    session.setAttribute("books", books);
                    session.setAttribute("members", memebers);
                    response.sendRedirect("Checkout.jsp");
                } else {
                    boolean ok = dao.checkOut(memId, bookId);
                    if (ok) {
                        out.println("Book was Checked in");
                    } else {
                        out.println("Book NOT Checked in");

                    }
                }
            } else if (action.equals("MemberHistory")) {
                String memId = request.getParameter("member");
                if (memId == null) {
                    List<Member> members = dao.getAllMembers();
                    if (members != null) {
                        session.setAttribute("members", members);
                        response.sendRedirect("MemberHistory.jsp");
                    } else {
                        out.println("No Members available");

                    }
                } else {
                    ResultSet rs = dao.getMemberHistory(memId);
                    out.println(TableFormatter.getData(rs));
                }

            } else if (action.equals("BookHistory")) {
                String bookId = request.getParameter("book");
                if (bookId == null) {
                    List books = dao.getAllBooks();
                    if (books != null) {
                        session.setAttribute("books", books);
                        response.sendRedirect("BookHistory.jsp");
                    } else {
                        out.println("No Books available");

                    }

                } else {
                    ResultSet rs = dao.getBookHistory(bookId);
                    out.println(TableFormatter.getData(rs));
                }
            }

        } catch (Exception ex) {
            out.println(ex.getMessage());
        } finally {
            out.close();
        }
    }

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
