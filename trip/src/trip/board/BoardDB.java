package trip.board;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import java.sql.Timestamp;

public class BoardDB {

   private static BoardDB instance = new BoardDB();

   public static BoardDB getInstance() {
      return instance;
   }

   private Connection getConnection() throws Exception {
      Context initCtx = new InitialContext();
      Context envCtx = (Context) initCtx.lookup("java:comp/env");
      DataSource ds = (DataSource) envCtx.lookup("jdbc/trip");
      return ds.getConnection();
   }

    //BoardDayBean 클래스를 만들어서 처리할 것.
    public int insertBoardDay(BoardDayBean bean) throws Exception {
        Connection conn = null;
          PreparedStatement pstmt1 = null;
          ResultSet rs = null;
          int number = 0;
          String sql = "";
          try {
             conn = getConnection();

             sql = "INSERT INTO board_day\n";
             sql += "(b_num, b_day, b_trav, b_food, b_trans, b_stay, b_cont, b_post)\n";
             sql += "VALUES(?, ?, ?, ?, ?, ?, ?, ?)";

             pstmt1 = conn.prepareStatement(sql);
             pstmt1.setInt(1, bean.getB_num());
             pstmt1.setString(2, bean.getB_day());
             pstmt1.setString(3, bean.getB_trav());
             pstmt1.setString(4, bean.getB_food());
             pstmt1.setString(5, bean.getB_trans());
             pstmt1.setString(6, bean.getB_stay());
             pstmt1.setString(7, bean.getB_cont());
             pstmt1.setString(8, bean.getB_post());
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
       return 0;
    }

   
      public int insertBoard(BoardDataBean board) throws Exception {
           Connection conn = null;
           PreparedStatement pstmt1 = null;
           PreparedStatement pstmt2 = null;
           ResultSet rs = null;
           Timestamp reg = new Timestamp(System.currentTimeMillis());
           int number = 0;
           String sql = "";
           try {
              conn = getConnection();

              sql = "INSERT INTO board\n";
              sql += "(b_title, b_pic1, b_pic2, b_pic3, b_cate,"
                    + " b_lo, b_tr, b_day1, b_day2, b_one,"
                   + "b_ac, u_id, b_price, appr)\n";
              sql += "VALUES(?,?,?,?,?, ?,?,?,?,?, ?,?,?,?)";
                   

              pstmt1 = conn.prepareStatement(sql);
              pstmt1.setString(1, board.getB_title());
              pstmt1.setString(2, board.getB_pic1());
              pstmt1.setString(3, board.getB_pic2());
              pstmt1.setString(4, board.getB_pic3());
              pstmt1.setString(5, board.getB_cate());
              pstmt1.setString(6, board.getB_lo());
              pstmt1.setString(7, board.getB_tr());
              pstmt1.setInt(8, board.getB_day1());
              pstmt1.setInt(9, board.getB_day2());
              pstmt1.setString(10, board.getB_one());
              pstmt1.setInt(11, board.getB_ac());
              pstmt1.setString(12, board.getU_id());
              pstmt1.setInt(13, board.getB_price());
              pstmt1.setString(14, "미승인");

              pstmt1.executeUpdate();
              
              //pstmt2 = conn.prepareStatement("select auto_increment from information_schema.TABLES where  TABLE_NAME = 'board'");         
              pstmt2 = conn.prepareStatement("select LAST_INSERT_ID()");
              ResultSet rs2 = pstmt2.executeQuery();
              if( rs2.next())
                 number = rs2.getInt(1);
              rs2.close();
              
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
              if (pstmt2 != null)
                 try {
                    pstmt2.close();
                 } catch (SQLException ex) {
                 }

              if (conn != null)
                 try {
                    conn.close();
                 } catch (SQLException ex) {
                 }
           }
           
           return number;
        }


   public int getBoardCount() throws Exception {
      Connection conn = null;
      PreparedStatement pstmt = null;
      ResultSet rs = null;

      int x = 0;

      try {
         conn = getConnection();

         pstmt = conn.prepareStatement("select count(*) from board");
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
   
   //미승인개수
   public int getBoardCount_pre() throws Exception {
      Connection conn = null;
      PreparedStatement pstmt = null;
      ResultSet rs = null;

      int x = 0;

      try {
         conn = getConnection();

         pstmt = conn.prepareStatement("select count(*) from board where appr='미승인'");
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
   
   //내가 쓴 보드개수
   public int getmyCount(String u_id) throws Exception {
      Connection conn = null;
      PreparedStatement pstmt = null;
      ResultSet rs = null;

      int x = 0;

      try {
         conn = getConnection();

         pstmt = conn.prepareStatement("select count(*) from board where u_id=?");
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


   public BoardDataBean ModalInfo() throws Exception {
      Connection conn = null;
      PreparedStatement pstmt = null;
      ResultSet rs = null;
      BoardDataBean board = null;

      try {
         conn = getConnection();

         pstmt = conn.prepareStatement("select * from board");
         rs = pstmt.executeQuery();

         if (rs.next()) {
            board = new BoardDataBean();
            board.setB_num(rs.getInt("b_num"));
            board.setB_title(rs.getString("b_title"));
            board.setB_cate(rs.getString("b_cate"));
            board.setU_id(rs.getString("u_id"));
            board.setB_day1(rs.getInt("b_day1"));
            board.setB_day2(rs.getInt("b_day2"));
            board.setB_ac(rs.getInt("b_ac"));
            board.setB_pic1(rs.getString("b_pic1"));
            board.setB_pic2(rs.getString("b_pic2"));
            board.setB_pic3(rs.getString("b_pic3"));
            board.setB_price(rs.getInt("b_price"));
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
      return board;
   }
   
   //관리자에서 사용
   public List<BoardDataBean> getBoard() throws Exception {
      Connection conn = null;
      PreparedStatement pstmt = null;
      ResultSet rs = null;

      List<BoardDataBean> boardLists = new ArrayList<BoardDataBean>();
      try {
         conn = getConnection();

         pstmt = conn.prepareStatement("select * from board where appr='승인' order by b_create_dt desc");
         rs = pstmt.executeQuery();

         if (rs.next()) {
               do {
                  BoardDataBean board = new BoardDataBean();
                  board.setB_num(rs.getInt("b_num"));
                  board.setB_title(rs.getString("b_title"));
                  board.setB_cate(rs.getString("b_cate"));
                  board.setU_id(rs.getString("u_id"));
                  board.setB_day1(rs.getInt("b_day1"));
                  board.setB_day2(rs.getInt("b_day2"));
                  board.setB_ac(rs.getInt("b_ac"));
                  board.setB_pic1(rs.getString("b_pic1"));
                  board.setB_pic2(rs.getString("b_pic2"));
                  board.setB_pic3(rs.getString("b_pic3"));
                  board.setB_price(rs.getInt("b_price"));
                  board.setB_lo(rs.getString("b_lo"));
                  board.setB_create_dt(rs.getTimestamp("b_create_dt"));
                  boardLists.add(board);
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
      return boardLists;
   }


   //미승인상품
   public List<BoardDataBean> getBoard_pre() throws Exception {
      Connection conn = null;
      PreparedStatement pstmt = null;
      ResultSet rs = null;

      List<BoardDataBean> boardLists = new ArrayList<BoardDataBean>();
      try {
         conn = getConnection();

         pstmt = conn.prepareStatement("select * from board where appr='미승인' order by b_create_dt desc");
         rs = pstmt.executeQuery();

         if (rs.next()) {
               do {
                  BoardDataBean board = new BoardDataBean();
                  board.setB_num(rs.getInt("b_num"));
                  board.setB_title(rs.getString("b_title"));
                  board.setB_cate(rs.getString("b_cate"));
                  board.setU_id(rs.getString("u_id"));
                  board.setB_day1(rs.getInt("b_day1"));
                  board.setB_day2(rs.getInt("b_day2"));
                  board.setB_ac(rs.getInt("b_ac"));
                  board.setB_pic1(rs.getString("b_pic1"));
                  board.setB_pic2(rs.getString("b_pic2"));
                  board.setB_pic3(rs.getString("b_pic3"));
                  board.setB_price(rs.getInt("b_price"));
                  board.setB_lo(rs.getString("b_lo"));
                  board.setB_create_dt(rs.getTimestamp("b_create_dt"));
                  boardLists.add(board);
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
      return boardLists;
   }

   //승인처리
   public void apprBoard(int b_num) throws Exception {
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        String sql = "";
        try {
           conn = getConnection();

           //미승인->승인
           sql = "update board set appr=? where b_num=?";

              pstmt = conn.prepareStatement(sql);
              pstmt.setString(1, "승인"); 
              pstmt.setInt(2, b_num); 
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
       
     }

   public List<BoardDataBean> getModals(String lotation, String day, String cost, String trans, String tema,
            String search) throws Exception {
         Connection conn = null;
         PreparedStatement pstmt = null;
         ResultSet rs = null;
         List<BoardDataBean> modalList = new ArrayList<BoardDataBean>();

         StringBuffer buffer = new StringBuffer();

         try {
            conn = getConnection();

            buffer.append("select * from board \n");
            buffer.append("where 1=1 \n"); //항상 참인 조건

            if (search != null && !search.isEmpty()) {
               buffer.append("and b_title like ?\n");
            }
            if (lotation != null && !lotation.isEmpty()) {
               buffer.append("and b_lo=?\n");
            }
            if (day != null && !day.isEmpty()) {
               if(day.equals("1일 이하")) {
                  buffer.append("and b_day2<=1\n");
               }if(day.equals("2일")) {
                  buffer.append("and b_day2=2\n");
               }if(day.equals("3일")) {
                  buffer.append("and b_day2=3\n");
               }if(day.equals("4일")) {
                  buffer.append("and b_day2=4\n");
               }if(day.equals("5일 이상")) {
                  buffer.append("and b_day2>=5\n");
               }
            }
            if (cost != null && !cost.isEmpty()) {
               if(cost.equals("10만원미만")) {
                  buffer.append("and b_ac<100000\n");
               }if(cost.equals("20만원미만")) {
                  buffer.append("and b_ac>=100000 and b_ac<200000\n");
               }if(cost.equals("20만원이상")) {
                  buffer.append("and b_ac>=200000\n");
               }
               
            }
            if (trans != null && !trans.isEmpty()) {
               buffer.append("and b_tr=?\n");
            }
            if (tema != null && !tema.isEmpty()) {
               buffer.append("and b_cate=?\n");
            }
            buffer.append("and appr='승인'");
            buffer.append("order by b_create_dt desc\n");

            pstmt = conn.prepareStatement(buffer.toString());
            int nIdex = 1;
            if (search != null && !search.isEmpty()) {
               pstmt.setString(nIdex++, "%"+search+"%");
            }
            if (lotation != null && !lotation.isEmpty()) {
               pstmt.setString(nIdex++, lotation);
            }
            if (trans != null && !trans.isEmpty()) {
               pstmt.setString(nIdex++, trans);
            }
            if (tema != null && !tema.isEmpty()) {
               pstmt.setString(nIdex++, tema);
            }

            rs = pstmt.executeQuery();

            if (rs.next()) {
               do {
                  BoardDataBean board = new BoardDataBean();
                  board.setB_num(rs.getInt("b_num"));
                  board.setB_title(rs.getString("b_title"));
                  board.setB_cate(rs.getString("b_cate"));
                  board.setU_id(rs.getString("u_id"));
                  board.setB_day1(rs.getInt("b_day1"));
                  board.setB_day2(rs.getInt("b_day2"));
                  board.setB_ac(rs.getInt("b_ac"));
                  board.setB_pic1(rs.getString("b_pic1"));
                  board.setB_pic2(rs.getString("b_pic2"));
                  board.setB_pic3(rs.getString("b_pic3"));
                  board.setB_price(rs.getInt("b_price"));
                  board.setB_lo(rs.getString("b_lo"));
                  modalList.add(board);
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
         return modalList;
      }
   
   //내가 쓴 상품
   public List<BoardDataBean> getmyModals(String u_id) throws Exception {
         Connection conn = null;
         PreparedStatement pstmt = null;
         ResultSet rs = null;
         List<BoardDataBean> modalList = new ArrayList<BoardDataBean>();

         try {
            conn = getConnection();
            pstmt = conn.prepareStatement(
                      "select * from board where u_id= ? order by b_create_dt desc");
                   pstmt.setString(1, u_id);
            
            rs = pstmt.executeQuery();

            if (rs.next()) {
               do {
                  BoardDataBean board = new BoardDataBean();
                  board.setB_title(rs.getString("b_title"));
                  board.setB_pic1(rs.getString("b_pic1"));
                  board.setB_num(rs.getInt("b_num"));
                  board.setAppr(rs.getString("appr"));
                  modalList.add(board);
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
         return modalList;
      }
   
   
   public BoardDataBean getArticle(int b_num) throws Exception {
       Connection conn = null;
       PreparedStatement pstmt = null;
       ResultSet rs = null;
       BoardDataBean article = null;
       try {
          conn = getConnection();


String sql = "select a.*, (SELECT  sum(b_trav+b_food+b_trans+b_stay) tot_price \n"
+"FROM board_day where b_num = a.b_num) tot_price \n" 
+"from board a where a.b_num = ?";        
          
          pstmt = conn.prepareStatement(sql);
          pstmt.setInt(1, b_num);
          rs = pstmt.executeQuery();

          if (rs.next()) {
             article = new BoardDataBean();
             article.setB_num(b_num);
             article.setB_title(rs.getString("b_title"));
             article.setB_pic1(rs.getString("b_pic1"));
             article.setB_pic2(rs.getString("b_pic2"));
             article.setB_pic3(rs.getString("b_pic3"));
             article.setB_cate(rs.getString("b_cate"));
             article.setB_lo(rs.getString("b_lo"));
             article.setB_tr(rs.getString("b_tr"));
             article.setB_day1(rs.getInt("b_day1"));
             article.setB_day2(rs.getInt("b_day2"));
             article.setB_one(rs.getString("b_one"));
             article.setB_ac(rs.getInt("tot_price"));
             article.setU_id(rs.getString("u_id"));
             article.setB_price(rs.getInt("b_price"));

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
       return article;
    }



   
     public List<BoardDayBean> getdayArticle(int b_num) throws Exception {
           Connection conn = null;
           PreparedStatement pstmt = null;
           ResultSet rs = null;
           List<BoardDayBean> modalList = new ArrayList<BoardDayBean>();
           try {
              conn = getConnection();

              pstmt = conn.prepareStatement("select * from board_day where b_num = ?");
              pstmt.setInt(1, b_num);
              rs = pstmt.executeQuery();

              while (rs.next()) {
                 BoardDayBean articles = new BoardDayBean();
                 articles.setB_num(b_num);
                 articles.setB_day(rs.getString("b_day"));
                 articles.setB_trav(rs.getString("b_trav"));
                 articles.setB_food(rs.getString("b_food"));
                 articles.setB_trans(rs.getString("b_trans"));
                 articles.setB_stay(rs.getString("b_stay"));
                 articles.setB_cont(rs.getString("b_cont"));
                 articles.setB_post(rs.getString("b_post"));
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



   public int getBprice(String b_num)
            throws Exception {
       Connection conn = null;
       PreparedStatement pstmt = null;
       ResultSet rs = null;

       int x=0;

       try {
           conn = getConnection();
           
           pstmt = conn.prepareStatement("select b_price from board where b_num=?");
           pstmt.setString(1, b_num);
           rs = pstmt.executeQuery();

           if (rs.next()) {
              x= rs.getInt(1);
         }
       } catch(Exception ex) {
           ex.printStackTrace();
       } finally {
           if (rs != null) try { rs.close(); } catch(SQLException ex) {}
           if (pstmt != null) try { pstmt.close(); } catch(SQLException ex) {}
           if (conn != null) try { conn.close(); } catch(SQLException ex) {}
       }
      return x;
   }
   
   // 인기순
      public List<BoardDataBean> getPopModals(String lotation, String day, String cost, String trans, String tema,
            String search) throws Exception {
         Connection conn = null;
         PreparedStatement pstmt = null;
         ResultSet rs = null;
         List<BoardDataBean> modalList = new ArrayList<BoardDataBean>();

         StringBuffer buffer = new StringBuffer();

         try {
            conn = getConnection();

            buffer.append("select * from comment c, board b \n");

            buffer.append("where c.b_num = b.b_num \n");

            if (search != null && !search.isEmpty()) {
               buffer.append("and b_title like ?\n");
            }
            if (lotation != null && !lotation.isEmpty()) {
               buffer.append("and b_lo=?\n");
            }
            if (day != null && !day.isEmpty()) {
               if (day.equals("1일 이하")) {
                  buffer.append("and b_day2<=1\n");
               }
               if (day.equals("2일")) {
                  buffer.append("and b_day2=2\n");
               }
               if (day.equals("3일")) {
                  buffer.append("and b_day2=3\n");
               }
               if (day.equals("4일")) {
                  buffer.append("and b_day2=4\n");
               }
               if (day.equals("5일 이상")) {
                  buffer.append("and b_day2>=5\n");
               }
            }
            if (cost != null && !cost.isEmpty()) {
               if (cost.equals("10만원미만")) {
                  buffer.append("and b_ac<100000\n");
               }
               if (cost.equals("20만원미만")) {
                  buffer.append("and b_ac>=100000 and b_ac<200000\n");
               }
               if (cost.equals("20만원이상")) {
                  buffer.append("and b_ac>=200000\n");
               }

            }
            if (trans != null && !trans.isEmpty()) {
               buffer.append("and b_tr=?\n");
            }
            if (tema != null && !tema.isEmpty()) {
               buffer.append("and b_cate=?\n");
            }
            buffer.append("and appr='승인' group by c.b_num order by avg(c.star) desc");
            

            pstmt = conn.prepareStatement(buffer.toString());
            int nIdex = 1;
            if (search != null && !search.isEmpty()) {
               pstmt.setString(nIdex++, "%" + search + "%");
            }
            if (lotation != null && !lotation.isEmpty()) {
               pstmt.setString(nIdex++, lotation);
            }
            if (trans != null && !trans.isEmpty()) {
               pstmt.setString(nIdex++, trans);
            }
            if (tema != null && !tema.isEmpty()) {
               pstmt.setString(nIdex++, tema);
            }

            rs = pstmt.executeQuery();

            if (rs.next()) {
               do {
                  BoardDataBean board = new BoardDataBean();
                  board.setB_num(rs.getInt("b_num"));
                  board.setB_title(rs.getString("b_title"));
                  board.setB_cate(rs.getString("b_cate"));
                  board.setU_id(rs.getString("u_id"));
                  board.setB_day1(rs.getInt("b_day1"));
                  board.setB_day2(rs.getInt("b_day2"));
                  board.setB_ac(rs.getInt("b_ac"));
                  board.setB_pic1(rs.getString("b_pic1"));
                  board.setB_pic2(rs.getString("b_pic2"));
                  board.setB_pic3(rs.getString("b_pic3"));
                  board.setB_price(rs.getInt("b_price"));
                  board.setB_lo(rs.getString("b_lo"));
                  modalList.add(board);
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
         return modalList;
      }

}