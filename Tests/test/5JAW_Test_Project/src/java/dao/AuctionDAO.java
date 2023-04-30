
package dao;

import java.sql.*;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import javax.naming.*;
import javax.sql.DataSource;
import model.Item;
import model.Member;


public class AuctionDAO {

    protected Connection con;
    PreparedStatement regBidPS = null;
    PreparedStatement getBidsPS = null;
    PreparedStatement getItemsForBidderPS = null;
    PreparedStatement getMembersPS = null;
    PreparedStatement getItemsPS = null;
    


    public AuctionDAO(String datasource){
        try{
          InitialContext ctx = new InitialContext();
            DataSource ds = (DataSource) ctx.lookup(datasource);
            con = ds.getConnection();
        }
        catch(Exception ex){
            ex.printStackTrace();
        }
    }

    public boolean regBid(String itemId, String bidderId, double amount)throws SQLException{
       int recsInserted = 0;
           regBidQuery();
           regBidPS.setString(1, bidderId);
           regBidPS.setString(2,itemId );
           regBidPS.setDouble(3, amount);
           recsInserted = regBidPS.executeUpdate();
  
       if(recsInserted == 1){
           return true;
       }
       else {
           return false;
       }

    }

     public ResultSet viewBids(String itemId)throws SQLException{
        getBidsQuery();
        getBidsPS.setString(1,itemId);
        ResultSet rs = getBidsPS.executeQuery();
        return rs;
    }

     public ResultSet displayItemsForBidder(String BidderId)throws SQLException{
        getItemsForBidderQuery();
        getItemsForBidderPS.setString(1,BidderId);
        ResultSet rs = getItemsForBidderPS.executeQuery();
        return rs;
    }

     // create a method to return a list of Members
     public List<Member> getMembers()throws SQLException
     {
         getMembersQuery();
         ResultSet rs = getMembersPS.executeQuery();
         List<Member> members = new ArrayList<Member>();
         while(rs.next())
         {
             members.add(new Member(rs.getString("MemberID"), rs.getString("Name")));
         }
         return members;
         
     }
      public List<Item> getItems()throws SQLException
     {
         getItemsQuery();
         ResultSet rs = getItemsPS.executeQuery();
         List<Item> items = new ArrayList<Item>();
         while(rs.next())
         {
             items.add(new Item(rs.getString("ItemId"), rs.getString("ItemName")));
         }
         return items;
     }

     //create a method to return a list of Items



    private void regBidQuery()throws SQLException{
        regBidPS = con.prepareStatement("INSERT INTO USER1.TBids " +
                                         "VALUES(?,?,?)");
    }
    private void getBidsQuery() throws SQLException{
        getBidsPS = con.prepareStatement("SELECT USER1.TMembers.Name, USER1.TBids.Amount FROM USER1.TMembers, USER1.TBids " +
                                         "WHERE USER1.TMembers.MemberID = USER1.TBids.MembersID " +
                                         "AND USER1.TBids.ItemId =?");

    }

    private void getItemsForBidderQuery() throws SQLException{
        getItemsForBidderPS = con.prepareStatement("SELECT USER1.TItems.ItemName,USER1.TBids.Amount FROM USER1.TItems, USER1.TBids " +
                                          "WHERE TItems.ItemID = TBids.ItemID " +
                                          "AND USER1.TBids.MembersID = ?");
    }
    
    private void getItemsQuery() throws SQLException
    {
        getItemsPS = con.prepareStatement("SELECT * FROM USER1.TItems");
    }
    
    private void getMembersQuery() throws SQLException
    {
        getMembersPS = con.prepareStatement("SELECT * FROM USER1.TMembers");
    }

    

}
