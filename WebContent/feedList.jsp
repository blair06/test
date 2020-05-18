<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.sql.*" %>
 <%
   	Class.forName("com.mysql.jdbc.Driver");
	Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/mysns?useSSL=true", "root", "1111");
   	Statement st= conn.createStatement();
   
   	String str= "<table border=1>";
   	ResultSet rs= st.executeQuery("SELECT no, content, ts FROM feed");
   	while(rs.next()) {
	   	str += "<tr>";
		str += "<td width=100>" + rs.getString("no") + "</td>"; 
		str += "<td width=100>" + rs.getString("content") + "</td>";
		str += "<td width=100>" + rs.getString("ts") + "</td>";
		str += "<td><a href='feedDelete.jsp?no=" + rs.getString("no") + "'>";
		str += "<button>삭제</button>";
		str += "</a></td>";
		str += "</tr>"; 
		}
	str += "</table>";
   out.print(str);
   rs.close(); st.close(); conn.close();
%>