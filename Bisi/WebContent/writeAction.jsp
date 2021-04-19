<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import="bisi.BisiDAO" %>
    <%@page import="java.io.PrintWriter" %>
     <%@ page import = "com.oreilly.servlet.MultipartRequest" %>
<%@ page import = "com.oreilly.servlet.multipart.DefaultFileRenamePolicy" %>
<%@ page import = "java.util.Enumeration" %>
    <%request.setCharacterEncoding("UTF-8");%>
    <jsp:useBean id ="bisi" class="bisi.Bisi" scope="page"/>
    <jsp:setProperty name="bisi" property="bisiTitle"/>
     <jsp:setProperty name="bisi" property="bisiContent"/>
       <jsp:setProperty name="bisi" property="userPhoto"/>
   	
   
  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewprot" content="width=device-width",initial-scale="1">
</head>
<body>
 	<%
 	
 	String userID = null;
 	if(session.getAttribute("userID") !=null){
 		userID=(String)session.getAttribute("userID");
 	}
 	if(userID ==null){
 		PrintWriter script=response.getWriter();
 		script.println("<script>");
 		script.println("alert('로그인을 하세요.')");
 		script.println("window.location.href=login.jsp");
 		script.println("</script>");
 	}else{
 		if(bisi.getBisiTitle() ==null||bisi.getBisiContent() ==null){
 			 		
 			 		PrintWriter script=response.getWriter();
 			 		script.println("<script>");
 			 		script.println("alert('정보를 다 입력해주세요 ')");
 			 		script.println("histroy.back()");
 			 		script.println("window.location.href='main.jsp'");
 			 		script.println("</script>");
 			 		
 			 	}else{
 					BisiDAO bisiDAO = new BisiDAO();
 			 	int result = bisiDAO.wirte(bisi.getBisiTitle(), userID,bisi.getBisiContent());
	 	if(result == -1){
 			 		PrintWriter script=response.getWriter();
 			 		script.println("<script>");
 			 		script.println("alert('글쓰기에 실패했습니다')");
 			 		script.println("histroy.back()");
 			 		script.println("window.location.href='main.jsp'");
 			 		script.println("</script>");
 			 		
 			  	}else{
 			  		
 			 		PrintWriter script=response.getWriter();
 			 		script.println("<script>");
 			 		script.println("window.location.href='bisi.jsp'");
 			 		
 			 		script.println("</script>");
 			 		
 			  		}	
 			 	}
 		}
 	
 	
 	%>
 	
 	<%
 	
 		String uploadPath =application.getRealPath("upload_file");
 	
 	int maxSize= 1024*1024*10; //10mb
 	String file="";
 	String orginFile="";
 	try {
		MultipartRequest multi = new MultipartRequest(request, uploadPath, maxSize, "EUC-KR", new DefaultFileRenamePolicy());
		
		Enumeration files = multi.getFileNames();
		String names = (String)files.nextElement();
		
		file = multi.getFilesystemName(names);
		orginFile = multi.getOriginalFileName(names);
		
	} catch (Exception e) {
		e.printStackTrace();
	}
%>
</body>
</html> 