package com.b3;

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

public class UsersDB {

   private static UsersDB instance = new UsersDB();

   public static UsersDB getInstance() {
      return instance;
   }

   private UsersDB() {
   }

   private Connection getConnection() throws Exception {
      Context initCtx = new InitialContext();
      Context envCtx = (Context) initCtx.lookup("java:comp/env");
      DataSource ds = (DataSource) envCtx.lookup("jdbc/trip");
      return ds.getConnection();
   }

   public Users getUser(String u_id) throws Exception {
      Connection conn = null;
      PreparedStatement pstmt = null;
      ResultSet rs = null;
      Users user = null;

      try {
         conn = getConnection();
         pstmt = conn.prepareStatement("select * from users where u_id = ?");

         pstmt.setString(1, u_id);
         rs = pstmt.executeQuery();
         if (rs.next()) {
            user = new Users();
            user.setU_id(rs.getString("u_id"));
            user.setU_pwd(rs.getString("u_pwd"));
            user.setU_name(rs.getString("u_name"));
            user.setU_age(rs.getInt("u_age"));
            user.setU_type(rs.getString("u_type"));
            user.setU_image(rs.getString("u_image"));
            user.setU_phone(rs.getString("u_phone"));
            user.setU_gender(rs.getString("u_gender"));
            user.setU_email(rs.getString("u_email"));
            user.setU_reg(rs.getTimestamp("u_reg"));
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

      return user;
   }

   public void insertUser(Users user) throws Exception {
      Connection conn = null;
      PreparedStatement pstmt1 = null;
      PreparedStatement pstmt2 = null;
      ResultSet rs = null;
      Timestamp reg = new Timestamp(System.currentTimeMillis());
      int number = 0;
      String sql = "";
      try {
         conn = getConnection();

         sql = "INSERT INTO users(u_id, u_pwd, u_name, u_age, u_phone, u_gender, u_email, u_type, u_image, u_reg)\n";
         sql += "VALUES(?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";

         pstmt1 = conn.prepareStatement(sql);
         pstmt1.setString(1, user.getU_id());
         pstmt1.setString(2, user.getU_pwd());
         pstmt1.setString(3, user.getU_name());
         pstmt1.setInt(4, user.getU_age());
         pstmt1.setString(5, user.getU_phone());
         pstmt1.setString(6, user.getU_gender());
         pstmt1.setString(7, user.getU_email());
         pstmt1.setString(8, user.getU_type());
         pstmt1.setString(9, user.getU_image());
         pstmt1.setTimestamp(10, reg);

         pstmt2 = conn.prepareStatement(
               "INSERT INTO point(reg_date, content, tpoint, rpoint, u_id) " + "values(?,?,?,?,?)");
         pstmt2.setTimestamp(1, reg);
         pstmt2.setString(2, "가입포인트");
         pstmt2.setString(3, "+" + 500);
         pstmt2.setInt(4, 500);
         pstmt2.setString(5, user.getU_id());

         pstmt1.executeUpdate();
         pstmt2.executeUpdate();

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
   }

   public List<Users> getUsers() throws Exception {
      Connection conn = null;
      PreparedStatement pstmt = null;
      ResultSet rs = null;
      List<Users> userList = new ArrayList<Users>();
      try {
         conn = getConnection();
         pstmt = conn.prepareStatement("select * from users");
         rs = pstmt.executeQuery();

         if (rs.next()) {
            userList = new ArrayList<Users>();
            do {
               Users user = new Users();

               user.setU_id(rs.getString("u_id"));
               user.setU_pwd(rs.getString("u_pwd"));
               user.setU_name(rs.getString("u_name"));
               user.setU_type(rs.getString("u_type"));
               user.setU_image(rs.getString("u_image"));
               user.setU_age(rs.getInt("u_age"));
               user.setU_phone(rs.getString("u_phone"));
               user.setU_gender(rs.getString("u_gender"));
               user.setU_email(rs.getString("u_email"));
               user.setU_reg(rs.getTimestamp("u_reg"));

               userList.add(user);
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
      return userList;
   }

   public int getUserCount() throws Exception {
      Connection conn = null;
      PreparedStatement pstmt = null;
      ResultSet rs = null;

      int x = 0;

      try {
         conn = getConnection();

         pstmt = conn.prepareStatement("select count(*) from users");
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

   public int userCheck(String u_id, String u_pwd) // 로그인
         throws Exception {
      Connection conn = null;
      PreparedStatement pstmt = null;
      ResultSet rs = null;
      String dbpasswd = "";
      int x = -1;

      try {
         conn = getConnection();

         pstmt = conn.prepareStatement("select u_pwd from users where u_id = ?");
         pstmt.setString(1, u_id);
         rs = pstmt.executeQuery();

         if (rs.next()) {
            dbpasswd = rs.getString("u_pwd");
            if (dbpasswd.equals(u_pwd))
               x = 1; // 인증 성공
            else
               x = 0; // 비밀번호 틀림
         } else
            x = -1;// 해당 아이디 없음

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

   // 회원가입시 ID를 체크할 때 호출
   public int confirmId(String u_id) throws Exception {
      Connection conn = null;
      PreparedStatement pstmt = null;
      ResultSet rs = null;

      int x = -1;

      try {
         conn = getConnection();
         pstmt = conn.prepareStatement("select u_id from USERS where u_id = ?");
         pstmt.setString(1, u_id);
         rs = pstmt.executeQuery();

         if (rs.next())
            x = 1; // 해당 아이디 있음
         else
            x = -1; // 해당 아이디 없음
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

   // 비밀번호 찾기
   public Users searchPw(String u_id, String u_phone) throws Exception {
      Connection conn = null;
      PreparedStatement pstmt = null;
      ResultSet rs = null;
      Users spw = null;

      try {
         conn = getConnection();
         pstmt = conn.prepareStatement("select u_pwd from USERS where u_id = ? " + "and u_phone =?");
         pstmt.setString(1, u_id);
         pstmt.setString(2, u_phone);

         rs = pstmt.executeQuery();

         if (rs.next()) {
            spw = new Users();
            spw.setU_pwd(rs.getString("u_pwd"));
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
      return spw;
   }

   // 아이디 찾기
   public Users searchId(String u_name, String u_email) throws Exception {
      Connection conn = null;
      PreparedStatement pstmt = null;
      ResultSet rs = null;
      Users sid = null;

      try {
         conn = getConnection();
         pstmt = conn.prepareStatement("select u_id from USERS where u_name = ? " + "and u_email =?");
         pstmt.setString(1, u_name);
         pstmt.setString(2, u_email);

         rs = pstmt.executeQuery();

         if (rs.next()) {
            sid = new Users();
            sid.setU_id(rs.getString("u_id"));
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
      return sid;
   }

   // 회원 탈퇴
   public int deleteUser(String u_id, String u_pwd) throws Exception {
      Connection conn = null;
      PreparedStatement pstmt = null;
      ResultSet rs = null;
      String dbpasswd = "";
      int x = -1;

      try {
         conn = getConnection();

         pstmt = conn.prepareStatement("select u_pwd from users where u_id = ?");
         pstmt.setString(1, u_id);
         rs = pstmt.executeQuery();

         if (rs.next()) {
            dbpasswd = rs.getString("u_pwd");
            if (dbpasswd.equals(u_pwd)) {
               pstmt = conn.prepareStatement("delete from users where u_id=?");
               pstmt.setString(1, u_id);
               pstmt.executeUpdate();
               x = 1; // 회원탈퇴 성공
            } else
               x = 0; // 비밀번호 틀림
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

   // 회원 탈퇴 확인
   public int UsersCheck(String u_id, String u_pwd) throws Exception {
      Connection conn = null;
      PreparedStatement pstmt = null;
      ResultSet rs = null;
      String dbpasswd = "";
      int x = -1;

      try {
         conn = getConnection();

         pstmt = conn.prepareStatement("select u_pwd from users where u_id = ?");
         pstmt.setString(1, u_id);
         rs = pstmt.executeQuery();

         if (rs.next()) {
            dbpasswd = rs.getString("u_pwd");
            if (dbpasswd.equals(u_pwd))
               x = 1; // 인증 성공
            else
               x = 0; // 비밀번호 틀림
         } else
            x = -1;// 해당 아이디 없음

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

   // 회원 수정
   public void updateUser(Users user, String u_id) throws Exception {
      Connection conn = null;
      PreparedStatement pstmt = null;
      String sql;

      try {
         conn = getConnection();

         sql = "update users set u_image=?, u_pwd=?, u_name=?, u_age=?, u_phone=?, u_email=? where u_id=?";

         pstmt = conn.prepareStatement(sql);
         pstmt.setString(1, user.getU_image());
         pstmt.setString(2, user.getU_pwd());
         pstmt.setString(3, user.getU_name());
         pstmt.setInt(4, user.getU_age());
         pstmt.setString(5, user.getU_phone());
         pstmt.setString(6, user.getU_email());
         pstmt.setString(7, u_id);
         pstmt.executeUpdate();

      } catch (Exception ex) {
         ex.printStackTrace();
      } finally {
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
}