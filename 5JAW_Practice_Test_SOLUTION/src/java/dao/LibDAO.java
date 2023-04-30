package dao;

import model.Book;
import model.Member;
import java.sql.*;
import javax.sql.DataSource;
import javax.naming.*;
import java.util.Date;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

public class LibDAO {

    protected Connection connection;
    protected PreparedStatement checkOutPS;
    protected PreparedStatement checkInPS;
    protected PreparedStatement getBookHistoryPS;
    protected PreparedStatement getMemberHistoryPS;
    protected PreparedStatement UpdateCopiesPS;
    protected PreparedStatement getAllBooksPS;
    protected PreparedStatement getAllMembersPS;

    public LibDAO(String datasource) throws Exception {
        try {
            InitialContext ctx = new InitialContext();
            DataSource ds = (DataSource) ctx.lookup(datasource);
            connection = ds.getConnection();

            checkOutPS = this.checkOutSQL();
            checkInPS = this.checkInSQL();
            getBookHistoryPS = this.getBookHistorySQL();
            getMemberHistoryPS = this.getMemberHistorySQL();
            UpdateCopiesPS = this.updateCopiesSQL();
            getAllBooksPS = this.getAllBooksSQL();
            getAllMembersPS = this.getAllMembersSQL();

        } catch (Exception ex) {
            System.out.println(ex.getMessage());
        }


    }
    public List getAllBooks() throws Exception {
        ResultSet rs = null;
        List books = new ArrayList();
        rs = getAllBooksPS.executeQuery();
        String id = null;
        String title = null;
        while(rs.next()){
         id = rs.getString("BookID");
         title = rs.getString("Title");
         books.add(new Book(id,title));
        }
        return books;

    }
    public List getAllMembers() throws Exception {
        ResultSet rs = null;
        List members = new ArrayList();
        rs = getAllMembersPS.executeQuery();
        String id = null;
        String name = null;
        while(rs.next()){
         id = rs.getString("MemberID");
         name = rs.getString("Name");
         members.add(new Member(id,name));
        }
        return members;

    }

    public ResultSet getBookHistory(String bookId) throws Exception {
        ResultSet rs = null;

        getBookHistoryPS.setString(1, bookId);
        rs = getBookHistoryPS.executeQuery();
        return rs;
    }

    public ResultSet getMemberHistory(String memberId) throws Exception {
        ResultSet rs = null;

        getMemberHistoryPS.setString(1, memberId);
        rs = getMemberHistoryPS.executeQuery();
        return rs;
    }

    public boolean checkIn(String memId, String bookId)throws Exception{
        connection.setAutoCommit(false);
        boolean result = false;
        try{
            UpdateCopiesPS.setInt(1, 1);
            UpdateCopiesPS.setString(2, bookId);

            UpdateCopiesPS.executeUpdate();
            checkInPS.setString(1, this.getDateTime());
             checkInPS.setString(2, memId);
            checkInPS.setString(3, bookId);
          
            if(checkInPS.executeUpdate() > 0){
                result = true;
            }
            connection.commit();
        }
        catch(SQLException ex) {
            connection.rollback();
        }
           connection.setAutoCommit(true);
           return result;
     }

     public boolean checkOut(String memId, String bookId)throws Exception{
        connection.setAutoCommit(false);
        boolean result = false;

        try{
            UpdateCopiesPS.setInt(1, -1);
            UpdateCopiesPS.setString(2, bookId);
            UpdateCopiesPS.executeUpdate();

            checkOutPS.setString(1, memId);
            checkOutPS.setString(2, bookId);
            checkOutPS.setString(3, this.getDateTime());
            if(checkOutPS.executeUpdate() > 0){
                result = true;
            }
            connection.commit();
        }
        catch(SQLException ex) {
            connection.rollback();
        }
           connection.setAutoCommit(true);
           return result;
     }



    protected PreparedStatement getMemberHistorySQL() throws Exception {
        return connection.prepareStatement("SELECT USER1.TBooks.title,"
                + "USER1.TBorrowings.dateBorrowed,USER1.TBorrowings.dateReturned " +
                  "FROM USER1.TBooks, USER1.TBorrowings " +
                  "WHERE USER1.TBORROWINGS.memberID =? "
                  + "AND USER1.TBorrowings.BookID = USER1.TBooks.BookID");
    }

   protected PreparedStatement getBookHistorySQL() throws Exception {
        return connection.prepareStatement("SELECT USER1.TMEMBERS.\"NAME\", "
                + "USER1.TBorrowings.dateBorrowed,USER1.TBorrowings.dateReturned " +
                  "FROM USER1.TMembers,USER1.TBorrowings " +
                  "WHERE USER1.TBORROWINGS.bookID=? " +
                  "AND USER1.TBorrowings.memberId = USER1.TMEMBERS.MEMBERID");
   }

    protected PreparedStatement checkOutSQL() throws Exception {
        return connection.prepareStatement("insert into USER1.TBorrowings "
                + "values(?,?,?,null)");
    }

    protected PreparedStatement checkInSQL() throws Exception {
        return connection.prepareStatement("UPDATE USER1.TBorrowings "
                + "SET dateReturned =? " +
                  " WHERE memberID =? AND bookID =? AND dateReturned IS NULL");
    }

     protected PreparedStatement updateCopiesSQL() throws Exception {
        return connection.prepareStatement("update USER1.Tbooks "
                + "set copies = copies + ? WHERE USER1.TBooks.bookId =?");
    }

    private String getDateTime() {
        //DateFormat dateFormat = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
        DateFormat dateFormat = new SimpleDateFormat("dd/MM/yyyy");
        Date date = new Date();
        return dateFormat.format(date);
    }
    private PreparedStatement getAllBooksSQL()throws Exception {
        return connection.prepareStatement("SELECT * FROM USER1.TBooks");

    }
     private PreparedStatement getAllMembersSQL()throws Exception {
        return connection.prepareStatement("SELECT * FROM USER1.TMembers");

    }
}
