package trip.comment;

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

public class CommentDBBean {
   
    private static CommentDBBean instance = new CommentDBBean();
    //.jsp페이지에서 DB연동빈인 BoardDBBean클래스의 메소드에 접근시 필요
    public static CommentDBBean getInstance() {
        return instance;
    }
    
    private CommentDBBean() {}
    
    //커넥션풀로부터 Connection객체를 얻어냄
    private Connection getConnection() throws Exception {
        Context initCtx = new InitialContext();
        Context envCtx = (Context) initCtx.lookup("java:comp/env");
        DataSource ds = (DataSource)envCtx.lookup("jdbc/trip");
        return ds.getConnection();
    }
 
    public void insertComment(CommentDataBean cmtdto) throws Exception {
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;     
      String sql="";

        try {
            conn = getConnection();                     

            sql = "insert into comment(c_id,c_content,b_num,star,c_pic) values(?,?,?,?,?)";

            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, cmtdto.getC_id());
            pstmt.setString(2, cmtdto.getC_content());
            pstmt.setInt(3, cmtdto.getB_num());   
            pstmt.setString(4, cmtdto.getStar());
            pstmt.setString(5, cmtdto.getC_pic());

            pstmt.executeUpdate();
            

        } catch(Exception ex) {
            ex.printStackTrace();
        } finally {
           if (rs != null) try { rs.close(); } catch(SQLException ex) {}
            if (pstmt != null) try { pstmt.close(); } catch(SQLException ex) {}
            if (conn != null) try { conn.close(); } catch(SQLException ex) {}
        }
    }
    
    public void updatePoint(CommentDataBean cmtdto,int starsum, int bprice) throws Exception {
        Connection conn = null;
        PreparedStatement pstmt2 = null;
        ResultSet rs = null;    

        try {
            conn = getConnection();      
            
            //별점의 합계가 50개씩 증가할때마다 가격이 100원씩 증가한다(최대 3000원까지)
            if(starsum>=((bprice+100)/2)) {
               if(bprice<3000) {
               pstmt2 = conn.prepareStatement("UPDATE board SET b_price = ? where b_num=?");
               pstmt2.setInt(1, bprice+100);
               pstmt2.setInt(2, cmtdto.getB_num());
               pstmt2.executeUpdate();}
            }
        } catch(Exception ex) {
            ex.printStackTrace();
        } finally {
           if (rs != null) try { rs.close(); } catch(SQLException ex) {}
            if (pstmt2 != null) try { pstmt2.close(); } catch(SQLException ex) {}
            if (conn != null) try { conn.close(); } catch(SQLException ex) {}
        }
    }


   public int getArticleCount()
             throws Exception {
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        int x=0;

        try {
            conn = getConnection();
            
            pstmt = conn.prepareStatement("select count(*) from comment");
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

   public List<CommentDataBean> getArticles(String b_num)
            throws Exception {
       Connection conn = null;
       PreparedStatement pstmt = null;
       ResultSet rs = null;
       List<CommentDataBean> CarticleList=new ArrayList<CommentDataBean>();
       try {
           conn = getConnection();
           
           pstmt = conn.prepareStatement(
              "select * from comment where b_num= ? order by c_reg desc");
           pstmt.setString(1, b_num);
           rs = pstmt.executeQuery();

           if (rs.next()) {
               CarticleList = new ArrayList<CommentDataBean>();
               do{
                 CommentDataBean article= new CommentDataBean();
               article.setC_num(rs.getInt("c_num"));
               article.setC_reg(rs.getTimestamp("c_reg"));
               article.setB_num(rs.getInt("b_num"));
               article.setC_content(rs.getString("c_content"));
               article.setC_id(rs.getString("c_id"));
               article.setStar(rs.getString("star"));
               article.setC_pic(rs.getString("c_pic"));
              
                 CarticleList.add(article);
             }while(rs.next());
         }
       } catch(Exception ex) {
           ex.printStackTrace();
       } finally {
           if (rs != null) try { rs.close(); } catch(SQLException ex) {}
           if (pstmt != null) try { pstmt.close(); } catch(SQLException ex) {}
           if (conn != null) try { conn.close(); } catch(SQLException ex) {}
       }
      return CarticleList;
   }
   
   //별평균개수세기
   public double getStarcount(String b_num)
            throws Exception {
       Connection conn = null;
       PreparedStatement pstmt = null;
       ResultSet rs = null;

       double x=0.0;

       try {
           conn = getConnection();
           
           pstmt = conn.prepareStatement("select avg(star) from comment where b_num= ? ");
           pstmt.setString(1, b_num);
           rs = pstmt.executeQuery();

           if (rs.next()) {
              x= rs.getDouble(1);
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
   
   //별합계
   public int getStarSum(String b_num)
            throws Exception {
       Connection conn = null;
       PreparedStatement pstmt = null;
       ResultSet rs = null;

       int x=0;

       try {
           conn = getConnection();
           
           pstmt = conn.prepareStatement("select sum(star) from comment where b_num= ? ");
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
 
   //글의 내용을 보기(1개의 글)(select문)<=content.jsp페이지에서 사용
   public CommentDataBean getArticle(String c_num)
            throws Exception {
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        CommentDataBean Carticle=null;
        try {
            conn = getConnection();          

            pstmt = conn.prepareStatement("select * from comment where c_num = ?");
            pstmt.setString(1, c_num);
            rs = pstmt.executeQuery();

            if (rs.next()) {
                Carticle = new CommentDataBean();
                Carticle.setC_num(rs.getInt("c_num"));
             Carticle.setC_reg(rs.getTimestamp("c_reg"));
                Carticle.setB_num(rs.getInt("b_num"));
                Carticle.setC_content(rs.getString("c_content"));
             Carticle.setC_id(rs.getString("c_id"));
             Carticle.setStar(rs.getString("star"));
             Carticle.setC_pic(rs.getString("c_pic"));

         }
        } catch(Exception ex) {
            ex.printStackTrace();
        } finally {
            if (rs != null) try { rs.close(); } catch(SQLException ex) {}
            if (pstmt != null) try { pstmt.close(); } catch(SQLException ex) {}
            if (conn != null) try { conn.close(); } catch(SQLException ex) {}
        }
      return Carticle;//결과값 돌려줌
    }
    
    //글 수정처리에서 사용(update문)<=updatePro.jsp에서 사용
    public void updateArticle(int c_num,String c_content)
          throws Exception {
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs= null;

        String sql="";

        try {
            conn = getConnection();

                sql="update comment set c_content=? where c_num=?";
                pstmt = conn.prepareStatement(sql);
                pstmt.setString(1, c_content);
                pstmt.setInt(2, c_num);
                pstmt.executeUpdate();
        } catch(Exception ex) {
            ex.printStackTrace();
        } finally {
         if (rs != null) try { rs.close(); } catch(SQLException ex) {}
            if (pstmt != null) try { pstmt.close(); } catch(SQLException ex) {}
            if (conn != null) try { conn.close(); } catch(SQLException ex) {}
        }
    }
    
    public void delete(int c_num)
           throws Exception {
               Connection conn = null;
               PreparedStatement pstmt = null;
               ResultSet rs= null;
               
               try {
                conn = getConnection();

                   pstmt = conn.prepareStatement(
                      "delete from comment where c_num=?");
                   pstmt.setInt(1, c_num);
                   
                   pstmt.executeUpdate();
                   
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
           }
    
    public void update(int c_num,String content,String pic)
           throws Exception {
               Connection conn = null;
               PreparedStatement pstmt = null;
               ResultSet rs= null;
               
               try {
                conn = getConnection();

                   pstmt = conn.prepareStatement(
                      "UPDATE comment SET c_content = ?,c_pic = ? WHERE c_num =?;");
                   pstmt.setString(1, content);
                   pstmt.setString(2, pic);
                   pstmt.setInt(3, c_num);
                   
                   pstmt.executeUpdate();
                   
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
           }
    
    public void updateComment(CommentDataBean cmtdto,int c_num) throws Exception {
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;     
      String sql="";

        try {
            conn = getConnection();                     

            sql = "UPDATE comment SET c_content = ?,c_pic = ?,star=? WHERE c_num =?";

            pstmt = conn.prepareStatement(sql);
            
            pstmt.setString(1, cmtdto.getC_content());
            pstmt.setString(2, cmtdto.getC_pic());
            pstmt.setString(3, cmtdto.getStar());
            pstmt.setInt(4, c_num);

            pstmt.executeUpdate();
            

        } catch(Exception ex) {
            ex.printStackTrace();
        } finally {
           if (rs != null) try { rs.close(); } catch(SQLException ex) {}
            if (pstmt != null) try { pstmt.close(); } catch(SQLException ex) {}
            if (conn != null) try { conn.close(); } catch(SQLException ex) {}
        }
    }

}