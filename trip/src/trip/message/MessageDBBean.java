package trip.message;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import trip.board.BoardDataBean;
import trip.board.BoardDayBean;
import trip.message.MessageDataBean;

import java.sql.Timestamp;
public class MessageDBBean {

   private static MessageDBBean instance = new MessageDBBean();

   public static MessageDBBean getInstance() {
      return instance;
   }

   private MessageDBBean() {
	}

   private Connection getConnection() throws Exception {
      Context initCtx = new InitialContext();
      Context envCtx = (Context) initCtx.lookup("java:comp/env");
      DataSource ds = (DataSource) envCtx.lookup("jdbc/trip");
      return ds.getConnection();
   }

 
   //쪽지입력
   public void insertMessage(MessageDataBean message) throws Exception {
      Connection conn = null;
      PreparedStatement pstmt1 = null;
      ResultSet rs = null;
      Timestamp reg=new Timestamp(System.currentTimeMillis());
      int number = 0;
      String sql = "";
      try {
         conn = getConnection();

         sql  = "INSERT INTO message\n";
         sql += "( m_sid, m_content, m_date, b_num, u_id, s_id)\n";
         sql += "VALUES(?, ?, ?, ?, ?, ?)";

         pstmt1 = conn.prepareStatement(sql);
         pstmt1.setString(1, message.getM_sid());
         pstmt1.setString(2, message.getM_content());
         pstmt1.setString(3, message.getM_date());
         pstmt1.setInt(4, message.getB_num());
         pstmt1.setString(5, message.getU_id());
         pstmt1.setString(6, message.getS_id());
         pstmt1.executeUpdate();
      } catch (Exception ex) {
         ex.printStackTrace();
      } finally {
         if (rs != null)
            try {
               rs.close();
            } catch (SQLException ex) {
            }
         if (pstmt1 != null)
            try {
               pstmt1.close();
            } catch (SQLException ex) {
            }

         if (conn != null)
            try {
               conn.close();
            } catch (SQLException ex) {
            }
      }
   }
   
   public int getmymessage(String u_id) throws Exception {
	      Connection conn = null;
	      PreparedStatement pstmt = null;
	      ResultSet rs = null;

	      int x = 0;

	      try {
	         conn = getConnection();

	         pstmt = conn.prepareStatement("select count(*) from message where u_id=?");
	         pstmt.setString(1, u_id);
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
  
   public int getmymessages(String s_id) throws Exception {
	      Connection conn = null;
	      PreparedStatement pstmt = null;
	      ResultSet rs = null;

	      int x = 0;

	      try {
	         conn = getConnection();

	         pstmt = conn.prepareStatement("select count(*) from message where s_id=?");
	         pstmt.setString(1, s_id);
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

   

	public List<MessageDataBean> writemessages(String s_id) throws Exception {
	      Connection conn = null;
	      PreparedStatement pstmt = null;
	      ResultSet rs = null;
	      List<MessageDataBean> messageLists = new ArrayList<MessageDataBean>();

	      try {
	         conn = getConnection();
	         pstmt = conn.prepareStatement(
	                	"select * from message where s_id= ? order by m_date desc");
	                pstmt.setString(1, s_id);
	        
	         
	         rs = pstmt.executeQuery();

	         if (rs.next()) {
	            do {
	            	MessageDataBean message = new MessageDataBean ();
	            	message.setM_num(rs.getInt("m_num"));
	            	message.setM_sid(rs.getString("m_sid"));
	            	message.setU_id(rs.getString("u_id"));
	            	message.setM_content(rs.getString("m_content"));
	            	message.setM_date(rs.getString("m_date"));
	            	message.setB_num(rs.getInt("b_num"));
	                messageLists.add(message);
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
	      return messageLists;
	   }
	public List<MessageDataBean> writemessage(String u_id) throws Exception {
	      Connection conn = null;
	      PreparedStatement pstmt = null;
	      ResultSet rs = null;
	      List<MessageDataBean> messageList = new ArrayList<MessageDataBean>();

	      try {
	         conn = getConnection();
	         pstmt = conn.prepareStatement(
	                	"select * from message where u_id= ? order by m_date desc");
	                pstmt.setString(1, u_id);
	        
	         
	         rs = pstmt.executeQuery();

	         if (rs.next()) {
	            do {
	            	MessageDataBean message = new MessageDataBean ();
	            	message.setM_num(rs.getInt("m_num"));
	            	message.setM_sid(rs.getString("m_sid"));
	            	message.setS_id(rs.getString("s_id"));
	            	message.setM_content(rs.getString("m_content"));
	            	message.setM_date(rs.getString("m_date"));
	            	message.setB_num(rs.getInt("b_num"));
	                messageList.add(message);
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
	      return messageList;
	   }
	
	   public MessageDataBean Modalmessage(int m_num) throws Exception {
		      Connection conn = null;
		      PreparedStatement pstmt = null;
		      ResultSet rs = null;
		      MessageDataBean message = null;

		      try {
		         conn = getConnection();

		         pstmt = conn.prepareStatement("select * from message where m_num = ?");
		         pstmt.setInt(1, m_num);
		         rs = pstmt.executeQuery();

		         if (rs.next()) {
		        	 message = new MessageDataBean();
		        	 message.setM_num(rs.getInt("m_num"));
		            	message.setM_sid(rs.getString("m_sid"));
		            	message.setS_id(rs.getString("s_id"));
		            	message.setU_id(rs.getString("u_id"));
		            	message.setM_content(rs.getString("m_content"));
		            	message.setM_date(rs.getString("m_date"));
		            	message.setB_num(rs.getInt("b_num"));
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
		      return message;
		   }
	   public List<MessageDataBean> getmessageArticle(int m_num) throws Exception {
	        Connection conn = null;
	        PreparedStatement pstmt = null;
	        ResultSet rs = null;
	        List<MessageDataBean> modalList = new ArrayList<MessageDataBean>();
	        try {
	           conn = getConnection();

	           pstmt = conn.prepareStatement("select * from message where m_num = ?");
	           pstmt.setInt(1, m_num);
	           rs = pstmt.executeQuery();

	           while (rs.next()) {
	        	   MessageDataBean articles = new MessageDataBean();
	              articles.setM_num(m_num);
	              articles.setM_sid(rs.getString("m_sid"));
	              articles.setM_content(rs.getString("m_content"));
	              articles.setM_date(rs.getString("m_date"));
	              articles.setB_num(rs.getInt("b_num"));
	              modalList.add(articles);
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
	        return modalList;
	     }
	   
	   
	   
	   public int delmymessage(int m_num) throws Exception {
		      Connection conn = null;
		      PreparedStatement pstmt = null;
		      ResultSet rs = null;

		      int x = 0;

		      try {
		         conn = getConnection();

		         pstmt = conn.prepareStatement("delete from message where m_num=?");
		         pstmt.setInt(1, m_num);
		         pstmt.executeUpdate();

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
	 
}