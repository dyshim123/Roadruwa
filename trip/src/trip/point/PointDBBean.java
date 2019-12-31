package trip.point;

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

public class PointDBBean {

   private static PointDBBean instance = new PointDBBean();

   public static PointDBBean getInstance() {
      return instance;
   }

   private PointDBBean() {
   }

   private Connection getConnection() throws Exception {
      Context initCtx = new InitialContext();
      Context envCtx = (Context) initCtx.lookup("java:comp/env");
      DataSource ds = (DataSource) envCtx.lookup("jdbc/trip");
      return ds.getConnection();
   }

   //포인트 충전
   public void insertCharge(String buyer, int nowpoint, int charge) throws Exception {
       Connection conn = null;
        PreparedStatement pstmt = null;
        Timestamp reg=new Timestamp(System.currentTimeMillis());
        try {
            conn = getConnection();
               
                pstmt = conn.prepareStatement("INSERT INTO point(reg_date, content, tpoint, rpoint, u_id) "
                   + "values(?,?,?,?,?)");
             pstmt.setTimestamp(1, reg);
             pstmt.setString(2, "충전");
             pstmt.setString(3, "+"+charge);//거래포인트
             pstmt.setInt(4, nowpoint+charge);//잔여포인트
             pstmt.setString(5, buyer);
             pstmt.executeUpdate();

        }catch(Exception ex) {
           ex.printStackTrace();
        } finally {
            if (pstmt != null) 
               try { pstmt.close(); } catch(SQLException ex) {}
            if (conn != null) 
               try { conn.close(); } catch(SQLException ex) {}
        }
    }
   
   public PointDataBean PointInfo(String u_id) throws Exception {
      Connection conn = null;
      PreparedStatement pstmt = null;
      ResultSet rs = null;
      PointDataBean point = null;

      try {
         conn = getConnection();

         pstmt = conn.prepareStatement("select * from point where u_id=?");
         pstmt.setString(1, u_id);
         rs = pstmt.executeQuery();

         if (rs.next()) {
            point = new PointDataBean();
            point.setU_id(rs.getString("u_id"));
            point.setP_num(rs.getInt("p_num"));
            point.setReg_date(rs.getTimestamp("reg_date"));
            point.setContent(rs.getString("content"));
            point.setTpoint(rs.getString("tpoint"));
            point.setRpoint(rs.getInt("rpoint"));
         }
      } catch (Exception ex) {
         ex.printStackTrace();
      } finally {
         if (rs != null)
            try {
               rs.close();
            } catch (SQLException ex) {
            }
         if (pstmt != null)
            try {
               pstmt.close();
            } catch (SQLException ex) {
            }
         if (conn != null)
            try {
               conn.close();
            } catch (SQLException ex) {
            }
      }
      return point;
   }
   
   //현재포인트 가장최근의날짜의 rpoint
   public int Nowpoint(String u_id) throws Exception {
      Connection conn = null;
      PreparedStatement pstmt = null;
      ResultSet rs = null;
      int x=0;
      try {
         conn = getConnection();

         pstmt = conn.prepareStatement("select rpoint from point where u_id=? "
               + "order by reg_date desc limit 1;");
         pstmt.setString(1, u_id);
         rs = pstmt.executeQuery();

         if (rs.next()) {
            x= rs.getInt(1);
         }
      } catch (Exception ex) {
         ex.printStackTrace();
      } finally {
         if (rs != null)
            try {
               rs.close();
            } catch (SQLException ex) {
            }
         if (pstmt != null)
            try {
               pstmt.close();
            } catch (SQLException ex) {
            }
         if (conn != null)
            try {
               conn.close();
            } catch (SQLException ex) {
            }
      }
      return x;
   }
   
   //판매자포인트
   public int Snowpoint(String u_id) throws Exception {
      Connection conn = null;
      PreparedStatement pstmt = null;
      ResultSet rs = null;
      int x=0;
      try {
         conn = getConnection();

         pstmt = conn.prepareStatement("select rpoint from point where u_id=? "
               + "order by reg_date desc limit 1;");
         pstmt.setString(1, u_id);
         rs = pstmt.executeQuery();

         if (rs.next()) {
            x= rs.getInt(1);
         }
      } catch (Exception ex) {
         ex.printStackTrace();
      } finally {
         if (rs != null)
            try {
               rs.close();
            } catch (SQLException ex) {
            }
         if (pstmt != null)
            try {
               pstmt.close();
            } catch (SQLException ex) {
            }
         if (conn != null)
            try {
               conn.close();
            } catch (SQLException ex) {
            }
      }
      return x;
   }

   public int getPointCount() throws Exception {
      Connection conn = null;
      PreparedStatement pstmt = null;
      ResultSet rs = null;

      int x = 0;

      try {
         conn = getConnection();

         pstmt = conn.prepareStatement("select count(*) from point");
         rs = pstmt.executeQuery();

         if (rs.next())
            x = rs.getInt(1);
      } catch (Exception ex) {
         ex.printStackTrace();
      } finally {
         if (rs != null)
            try {
               rs.close();
            } catch (SQLException ex) {
            }
         if (pstmt != null)
            try {
               pstmt.close();
            } catch (SQLException ex) {
            }
         if (conn != null)
            try {
               conn.close();
            } catch (SQLException ex) {
            }
      }
      return x;
   }

   public List<PointDataBean> getPoints(String u_id) throws Exception {
      Connection conn = null;
      PreparedStatement pstmt = null;
      ResultSet rs = null;
      List<PointDataBean> pointList = new ArrayList<PointDataBean>();
      try {
         conn = getConnection();
         pstmt = conn.prepareStatement("select * from point where u_id = ? order by reg_date desc");
         pstmt.setString(1, u_id);

         rs = pstmt.executeQuery();

         if (rs.next()) {
            do {
               PointDataBean point = new PointDataBean();

               point.setU_id(rs.getString("u_id"));
               point.setP_num(rs.getInt("p_num"));
               point.setReg_date(rs.getTimestamp("reg_date"));
               point.setContent(rs.getString("content"));
               point.setTpoint(rs.getString("tpoint"));
               point.setRpoint(rs.getInt("rpoint"));

               pointList.add(point);
            } while (rs.next());
         }
      } catch (Exception ex) {
         ex.printStackTrace();
      } finally {
         if (rs != null)
            try {
               rs.close();
            } catch (SQLException ex) {
            }
         if (pstmt != null)
            try {
               pstmt.close();
            } catch (SQLException ex) {
            }
         if (conn != null)
            try {
               conn.close();
            } catch (SQLException ex) {
            }
      }
      return pointList;
   }
   
   //관리자페이지에서 사용
   public List<PointDataBean> getAllPoints(String sk, String sv) throws Exception {
      Connection conn = null;
      PreparedStatement pstmt = null;
      ResultSet rs = null;
      StringBuffer buffer = new StringBuffer();
      List<PointDataBean> pointList = new ArrayList<PointDataBean>();
      try {
         conn = getConnection();
         
         buffer.append("select * from point \n");
            buffer.append("where 1=1 \n");
            if (sk != null && !sk.isEmpty()) {
               if(sk.equals("전체")) {
                  buffer.append("and content like ? or u_id like ?\n");
               }if(sk.equals("내역")) {
                  buffer.append("and content like ?\n");
               }if(sk.equals("아이디")) {
                  buffer.append("and u_id like ?\n");
               }
           }
            buffer.append("order by reg_date desc\n");
            pstmt = conn.prepareStatement(buffer.toString());
            int nIdex = 1;
            if (sk != null && !sk.isEmpty()) {
               if(sk.equals("전체")) {
                  pstmt.setString(nIdex++, "%"+sv+"%");
                  pstmt.setString(nIdex++, "%"+sv+"%");
               }if(sk.equals("내역")) {
                  pstmt.setString(nIdex++, "%"+sv+"%");
               }if(sk.equals("아이디")) {
                  pstmt.setString(nIdex++, "%"+sv+"%");
               }
           }
         
         rs = pstmt.executeQuery();

         if (rs.next()) {
            do {
               PointDataBean point = new PointDataBean();

               point.setU_id(rs.getString("u_id"));
               point.setP_num(rs.getInt("p_num"));
               point.setReg_date(rs.getTimestamp("reg_date"));
               point.setContent(rs.getString("content"));
               point.setTpoint(rs.getString("tpoint"));
               point.setRpoint(rs.getInt("rpoint"));

               pointList.add(point);
            } while (rs.next());
         }
      } catch (Exception ex) {
         ex.printStackTrace();
      } finally {
         if (rs != null)
            try {
               rs.close();
            } catch (SQLException ex) {
            }
         if (pstmt != null)
            try {
               pstmt.close();
            } catch (SQLException ex) {
            }
         if (conn != null)
            try {
               conn.close();
            } catch (SQLException ex) {
            }
      }
      return pointList;
   }

}