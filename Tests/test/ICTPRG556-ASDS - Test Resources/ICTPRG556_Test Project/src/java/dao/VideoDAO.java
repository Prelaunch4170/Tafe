package dao;

import java.sql.*;
import javax.sql.DataSource;
import javax.naming.*;
import java.util.Date;
import java.text.DateFormat;
import java.text.SimpleDateFormat;

public class VideoDAO {

    protected Connection connection;
    protected PreparedStatement rentOutPS;
    protected PreparedStatement getMovieHistoryPS;
    protected PreparedStatement getMemberHistoryPS;
    protected PreparedStatement UpdateCopiesPS;
    protected PreparedStatement checkInPS;
    protected DataSource ds = null;

    public VideoDAO(String datasource) throws Exception {
        try {
            InitialContext ctx = new InitialContext();
            DataSource ds = (DataSource) ctx.lookup(datasource);
            connection = ds.getConnection();
            rentOutPS = this.checkOutSQL();
            getMovieHistoryPS = this.getMovieHistorySQL();
            getMemberHistoryPS = this.getMemberHistorySQL();
            UpdateCopiesPS = this.updateCopiesSQL();
            //  checkInPS = this.checkInSQL(); // merit section
        } catch (Exception ex) {
            System.out.println(ex.getMessage());
        }

    }

    public ResultSet getMovieHistory(String movieId) throws Exception {
        ResultSet rs = null;
        getMovieHistoryPS.setString(1, movieId);
        rs = getMovieHistoryPS.executeQuery();
        return rs;
    }

    public ResultSet getMemberHistory(String memberId) throws Exception {
        ResultSet rs = null;
        getMemberHistoryPS.setString(1, memberId);
        rs = getMemberHistoryPS.executeQuery();
        return rs;
    }

    public boolean rentOut(String memId, String movieId) throws Exception {
        connection.setAutoCommit(false);
        boolean result = false;

        try {
            UpdateCopiesPS.setInt(1, -1);
            UpdateCopiesPS.setString(2, movieId);
            UpdateCopiesPS.executeUpdate();
            rentOutPS.setString(1, memId);
            rentOutPS.setString(2, movieId);
            rentOutPS.setString(3, this.getDateTime());
            if (rentOutPS.executeUpdate() > 0) {
                result = true;
            }
            connection.commit();
        } catch (SQLException ex) {
            connection.rollback();
        }
        connection.setAutoCommit(true);
        return result;
    }
    
    //merit method
    public boolean checkIn(String memId, String movieId)throws Exception{
        // merit section , your code here
        return false;
     }

    protected PreparedStatement getMemberHistorySQL() throws Exception {
        return connection.prepareStatement("SELECT USER1.TMovies.title,USER1.TRentals.dateBorrowed,USER1.TRentals.dateReturned "
                + "FROM USER1.TMovies, USER1.TRentals "
                + "WHERE USER1.TRentals.memberID =? AND USER1.TRentals.MovieID = USER1.TMovies.MovieID");
    }

    protected PreparedStatement getMovieHistorySQL() throws Exception {
        return connection.prepareStatement("SELECT USER1.TMEMBERS.\"NAME\", USER1.TRentals.dateBorrowed,USER1.TRentals.dateReturned "
                + "FROM USER1.TMembers,USER1.TRentals "
                + "WHERE USER1.TRentals.MovieID=? "
                + "AND USER1.TRentals.memberId = USER1.TMEMBERS.MEMBERID");
    }

    protected PreparedStatement checkOutSQL() throws Exception {
        return connection.prepareStatement("insert into USER1.TRentals values(?,?,?,null)");
    }

    protected PreparedStatement updateCopiesSQL() throws Exception {
        return connection.prepareStatement("update USER1.TMovies set copies = copies + ? WHERE USER1.TMovies.MovieId =?");
    }
    
    protected PreparedStatement checkInSQL() throws Exception {
        // Merit section, your code here
        return null;
    }

    private String getDateTime() {
        //DateFormat dateFormat = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
        DateFormat dateFormat = new SimpleDateFormat("dd/MM/yyyy");
        Date date = new Date();
        return dateFormat.format(date);
    }
}
