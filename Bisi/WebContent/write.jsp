<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import="java.io.PrintWriter" %>
  
<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<meta name="viewprot" content="width=device-width",initial-scale="1">
 <link rel="stylesheet" href="css/bootstrap.css"> 
  <link rel="stylesheet" href="css/style.css"> 
<title>JSP 게시판 웹 사이트</title>
</head>
<body>
	<%
		String userID=null;
	if(session.getAttribute("userID") !=null){
		userID =(String)session.getAttribute("userID");
	}
	
	%>


 <nav class="navbar navbar-default">
  <div class="navbar-header">
   <button type="button" class="navbar-toggle collapsed"
    data-toggle="collapse" data-target="#bs-example-navbar-collapse-1"
    aria-expanded="false">
   <span class="icon-bar"></span>
   <span class="icon-bar"></span>
   <span class="icon-bar"></span>
  </button>  
  <a class="navbar-brand" href="main.jsp">헬창s</a>
 </div>
 <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
  <ul class="nav navbar-nav">
   <li ><a href="main.jsp">메인</a>
   <li class="active"><a href="bisi.jsp">게시판</a>
  </ul>
  <%
  	if(userID == null){
 
  %>
  <ul class="nav navbar-nav navbar-right">
   <li class="dropdown">
    <a href="#" class="dropddown-toggle"
    data-toggle="dropdown" role="button" aria-haspopup="true"
    aria-expanded="false">접속하기<span class="caret"></span></a>
   <ul class="dropdown-menu">
    <li ><a href="login.jsp">로그인</a></li>
    <li ><a href="join.jsp">회원가입</a></li>
   </ul>
  </li>
  </ul> 
  <%
  	}else{
  %>
  		 <ul class="nav navbar-nav navbar-right">
   <li class="dropdown">
    <a href="#" class="dropddown-toggle"
    data-toggle="dropdown" role="button" aria-haspopup="true"
    aria-expanded="false">회원관리<span class="caret"></span></a>
   <ul class="dropdown-menu">
    <li ><a href="logOutAction.jsp">로그아웃</a></li>
   
   </ul>
  </li>
  </ul> 
  <%
  	}
  %>
 </div>
 </nav>
  	<div class="center">
  <nav id="list">
  	<ol>
  		<li >전체</li>
  		<li>상체</li>
  		<li>하체</li>
  		<li>질문</li>
  		<li>잡담</li>
  	</ol>
  
  </nav>
  <div class="container">
  	<div class="row">
  	<form method="post" action="writeAction.jsp" 	enctype="multipart/from-data">
  	 	<table class="table talbe-striped" style="text-align:center;border:1px solid:#dddddd">
  		<thead>
  			<th colspan="2"style="background-color:#eeeeee;text-align:center;">게시글 작성 양식</th>
  		
  		</thead>
  		<tbody>
				<td>
					<input type="file" name="form-imagefile">
					</td>
  					<tr>
  					<td><input type="text" class="form-control" placeholder="글제목" name="bisiTitle" maxlength="50"></td>
  					</tr>
  					<tr>
  					<td><textarea class="form-control" placeholder="글내용" name="bisiContent" maxlength="2028" style="height:350px"></textarea></td>
  					</tr>
  					
  		</tbody>
	</table>
	<input type="submit"href="writeAction.jsp" class="btn btn-primary pull-right" value="글쓰기"></a>
	</form>
	</div>
	</div>
	
 <script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
 <script src="js/bootstrap.js"></script>
</body>
</html> 