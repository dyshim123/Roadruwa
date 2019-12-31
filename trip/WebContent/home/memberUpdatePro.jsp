<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ page import="java.sql.Timestamp"%>
<%@ page import="com.b3.Users"%>
<%@ page import="com.b3.UsersDB"%>
<%@ page import="java.io.*"%>
<%@ page import="java.util.*"%>
<%@ page import="java.text.NumberFormat"%>
<%@ page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@ page import="trip.point.PointDataBean"%>
<%@ page import="trip.point.PointDBBean"%>
<jsp:include page="header.jsp" flush="false" />
<link rel="stylesheet" href="assets/css/card.css" />
<link href="assets/css/mypage.css" rel="stylesheet" type="text/css"
   media="all" />

<jsp:useBean id="user" class="com.b3.Users">
   <jsp:setProperty name="user" property="*" />
</jsp:useBean>

<%
   request.setCharacterEncoding("utf-8");
   String title = "수정완료";
   String realFolder = "";//웹 어플리케이션상의 절대 경로
   String filename = "";
   MultipartRequest imageUp = null;

   String saveFolder = "/imageFile";//파일이 업로드되는 폴더
   String encType = "utf-8"; //엔코딩타입
   int maxSize = 2 * 1024 * 1024; //최대 업로될 파일크기 5Mb

   //현재 jsp페이지의 웹 어플리케이션상의 절대 경로를 구한다
   ServletContext context = getServletContext();
   realFolder = context.getRealPath(saveFolder);

   try {

      //전송을 담당할 콤포넌트를 생성하고 파일을 전송한다.
      //전송할 파일명을 가지고 있는 객체, 서버상의 절대경로,최대 업로드될 파일크기, 문자코드, 기본 보안 적용
      imageUp = new MultipartRequest(request, realFolder, maxSize, encType, new DefaultFileRenamePolicy());

      //전송한 파일 정보를 가져와 출력한다
      Enumeration<?> files = imageUp.getFileNames();

      //파일 정보가 있다면
      while (files.hasMoreElements()) {
         //input 태그의 속성이 file인 태그의 name 속성값 :파라미터이름
         String name = (String) files.nextElement();

         //서버에 저장된 파일 이름
         filename = imageUp.getFilesystemName(name);
      }
   } catch (IOException ioe) {
      System.out.println(ioe);
   } catch (Exception ex) {
      System.out.println(ex);
   }
%>

<%
   String u_id = imageUp.getParameter("u_id");
   String u_pwd = imageUp.getParameter("u_pwd");
   String u_type = imageUp.getParameter("u_type");
   String u_name = imageUp.getParameter("u_name");
   String u_email = imageUp.getParameter("u_email");
   int u_age = Integer.parseInt(imageUp.getParameter("u_age"));
   String u_image = imageUp.getParameter("u_image");
   String u_phone = imageUp.getParameter("u_phone");

   user.setU_id(u_id);
   user.setU_name(u_name);
   user.setU_email(u_email);
   user.setU_age(u_age);
   user.setU_image(filename);
   user.setU_phone(u_phone);
   user.setU_pwd(u_pwd);
   user.setU_type(u_type);

   UsersDB users = UsersDB.getInstance();
   users.updateUser(user, u_id);
%>
<script>
   alert("수정이 완료되었습니다.");
   location.href = "mp_set.jsp";
</script>