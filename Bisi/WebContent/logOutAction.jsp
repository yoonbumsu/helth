<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import="user.UserDAO" %>
  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
</head>
<body>
 	<%
 		session.invalidate();
 	%>
 	<script>
 		location.href="main.jsp";
 	</script>
</body>
</html> 