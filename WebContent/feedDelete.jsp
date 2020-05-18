<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%
   String uno = request.getParameter("no");
   
   Class.forName("com.mysql.jdbc.Driver");
   Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/mysns?useSSL=true", "root", "1234");
         Statement st= conn.createStatement();
         
         String str = "DELETE FROM feed WHERE no = '" + uno + "'";
         int cnt = st.executeUpdate(str);
         
         String res = (cnt > 0) ? "회원 삭제가 완료되었습니다." : "회원 삭제 중 에러가 발생하였습니다.";
         out.print(res);
%>