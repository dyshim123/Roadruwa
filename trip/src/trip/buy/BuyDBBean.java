package trip.buy;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;
import trip.board.BoardDataBean;

public class BuyDBBean {
private static BuyDBBean instance = new BuyDBBean();
   
   public static BuyDBBean getInstance() {
       return instance;
    }
   
    private BuyDBBean() {}
   
    private Connection getConnection() throws Exception {
        Context initCtx = new InitialContext();
        Context envCtx = (Context) initCtx.lookup("java:comp/env");
        DataSource ds = (DataSource)envCtx.lookup("jdbc/trip");
        return ds.getConnection();
    }
    
/*    // bank테이블에 있는 전체 레코드를 얻어내는 메소드
    public List<String> getAccount(){
       Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        List<String> accountList = null;
        try {
            conn = getConnection();
                        
            pstmt = conn.prepareStatement("select * from bank");
            rs = pstmt.executeQuery();
            
            accountList = new ArrayList<String>();
            
            while (rs.next()) {
                String account = new String(rs.getString("account")+" "
                     + rs.getString("bank")+" "+rs.getString("name"));
                accountList.add(account);
          }
        }catch(Exception ex) {
           ex.printStackTrace();
        } finally {
            if (pstmt != null) 
               try { pstmt.close(); } catch(SQLException ex) {}
            if (conn != null) 
               try { conn.close(); } catch(SQLException ex) {}
        }
        return accountList;
    }
*/   
    //구매 테이블인 buy에 구매목록 등록 
    public void insertBuy(BoardDataBean board, int b_num, String buyer, int nowpoint, int Snowpoint) throws Exception {
       Connection conn = null;
        PreparedStatement pstmt = null;
        PreparedStatement pstmt2 = null;
        PreparedStatement pstmt3 = null;
        Timestamp reg=new Timestamp(System.currentTimeMillis());
        String sql=""; 
        try {
            conn = getConnection();
               
               sql = "insert into buy (buyer,buy_price,b_num,b_title,b_pic1) "
                     + "values (?,?,?,?,?)";
                pstmt = conn.prepareStatement(sql);

                pstmt.setString(1, buyer);
                pstmt.setInt(2, board.getB_price());
                pstmt.setInt(3, b_num);
                pstmt.setString(4, board.getB_title());
                pstmt.setString(5, board.getB_pic1());
                pstmt.executeUpdate();
                
                pstmt2 = conn.prepareStatement("INSERT INTO point(reg_date, content, tpoint, rpoint, u_id) "
                   + "values(?,?,?,?,?)");
             pstmt2.setTimestamp(1, reg);
             pstmt2.setString(2, "상품구매("+board.getB_title()+")");
             pstmt2.setString(3, "-"+board.getB_price());//거래포인트
             pstmt2.setInt(4, nowpoint-(int)board.getB_price());//잔여포인트
             pstmt2.setString(5, buyer);
             pstmt2.executeUpdate();
             
             pstmt3 = conn.prepareStatement("INSERT INTO point(reg_date, content, tpoint, rpoint, u_id) "
                   + "values(?,?,?,?,?)");
             pstmt3.setTimestamp(1, reg);
             pstmt3.setString(2, "상품판매("+board.getB_title()+")");
             pstmt3.setString(3, "+"+board.getB_price());//거래포인트
             pstmt3.setInt(4, Snowpoint+(int)board.getB_price());//잔여포인트
             pstmt3.setString(5, board.getU_id());
             pstmt3.executeUpdate();

        }catch(Exception ex) {
           ex.printStackTrace();
        } finally {
            if (pstmt != null) 
               try { pstmt.close(); } catch(SQLException ex) {}
            if (pstmt2 != null) 
               try { pstmt2.close(); } catch(SQLException ex) {}
            if (pstmt3 != null) 
               try { pstmt3.close(); } catch(SQLException ex) {}
            if (conn != null) 
               try { conn.close(); } catch(SQLException ex) {}
        }
    }
    
    //id에 해당하는 buy테이블의 레코드수를 얻어내는 메소드
    public int getmyBuy(String u_id)
    throws Exception {
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        int x=0;

        try {
            conn = getConnection();
            
            pstmt = conn.prepareStatement(
               "select count(*) from buy where buyer=?");
            pstmt.setString(1, u_id);
            rs = pstmt.executeQuery();

            if (rs.next()) {
               x= rs.getInt(1);
         }
        } catch(Exception ex) {
            ex.printStackTrace();
        } finally {
            if (rs != null) 
               try { rs.close(); } catch(SQLException ex) {}
            if (pstmt != null) 
               try { pstmt.close(); } catch(SQLException ex) {}
            if (conn != null) 
               try { conn.close(); } catch(SQLException ex) {}
        }
      return x;
    }
    
 /*   //buy테이블의 전체 레코드수를 얻어내는 메소드
    public int getListCount()
    throws Exception {
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        int x=0;

        try {
            conn = getConnection();
            
            pstmt = conn.prepareStatement(
                  "select count(*) from buy");
            rs = pstmt.executeQuery();

            if (rs.next()) {
               x= rs.getInt(1);
         }
        } catch(Exception ex) {
            ex.printStackTrace();
        } finally {
            if (rs != null) 
               try { rs.close(); } catch(SQLException ex) {}
            if (pstmt != null) 
               try { pstmt.close(); } catch(SQLException ex) {}
            if (conn != null) 
               try { conn.close(); } catch(SQLException ex) {}
        }
      return x;
    }
*/    
    //id에 해당하는 buy테이블의 구매목록을 얻어내는 메소드
    public List<BuyDataBean> getBuys(String u_id) 
    throws Exception {
          Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        BuyDataBean buy=null;
        String sql = "";
        List<BuyDataBean> lists = null;
        
        try {
              conn = getConnection();
           
              sql = "select * from buy where buyer=? order by buy_date desc";
            pstmt = conn.prepareStatement(sql);
            
            pstmt.setString(1, u_id);
            rs = pstmt.executeQuery();
            
            lists = new ArrayList<BuyDataBean>();

            while (rs.next()) {
              buy = new BuyDataBean();
              
              buy.setBuy_num(rs.getInt("buy_num"));
              buy.setBuyer(rs.getString("buyer"));
              buy.setBuy_price(rs.getInt("buy_price"));
                buy.setB_num(rs.getInt("b_num"));
                buy.setB_title(rs.getString("b_title"));
                buy.setB_pic1(rs.getString("b_pic1"));

                lists.add(buy);
         }
        }catch(Exception ex) {
            ex.printStackTrace();
        }finally {
            if (rs != null) 
               try { rs.close(); } catch(SQLException ex) {}
            if (pstmt != null) 
               try { pstmt.close(); } catch(SQLException ex) {}
            if (conn != null) 
               try { conn.close(); } catch(SQLException ex) {}
        }
      return lists;
    }
 /*   
    //buy테이블의 전체 목록을 얻어내는 메소드
    public List<BuyDataBean> getBuyList() 
    throws Exception {
          Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        BuyDataBean buy=null;
        String sql = "";
        List<BuyDataBean> lists = null;
        
        try {
           conn = getConnection();
           
           sql = "select * from buy";
            pstmt = conn.prepareStatement(sql);
            rs = pstmt.executeQuery();
            
            lists = new ArrayList<BuyDataBean>();

            while (rs.next()) {
              buy = new BuyDataBean();
               
                buy.setBuy_id(rs.getLong("buy_id"));
                buy.setBuyer(rs.getString("buyer"));
                buy.setBook_id(rs.getInt("book_id"));
                buy.setBook_title(rs.getString("book_title"));
                buy.setBuy_price(rs.getInt("buy_price"));
                buy.setBuy_count(rs.getByte("buy_count")); 
                buy.setBook_image(rs.getString("book_image"));
                buy.setBuy_date(rs.getTimestamp("buy_date"));
                buy.setAccount(rs.getString("account"));
                buy.setDeliveryName(rs.getString("deliveryName"));
                buy.setDeliveryTel(rs.getString("deliveryTel"));
                buy.setDeliveryAddress(rs.getString("deliveryAddress"));
                buy.setSanction(rs.getString("sanction"));
               
                lists.add(buy);
          }
        }catch(Exception ex) {
            ex.printStackTrace();
        }finally {
            if (rs != null) 
               try { rs.close(); } catch(SQLException ex) {}
            if (pstmt != null) 
               try { pstmt.close(); } catch(SQLException ex) {}
            if (conn != null) 
               try { conn.close(); } catch(SQLException ex) {}
        }
      return lists;
    }
*/
}