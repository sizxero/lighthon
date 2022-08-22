<%--
  Created by IntelliJ IDEA.
  User: gsu07
  Date: 2022-08-18
  Time: 오후 5:32
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>⚡ 회원가입 - 아이디 중복체크</title>
    <link rel="stylesheet" href="/commons/bootstrap4/bootstrap.min.css">
</head>
<body>
<%
    String Gdata = request.getParameter("id");
%>
<div class="container" align="center">
    <div id="thumb">
        <h1>⚡ L I G H T H O N ⚡</h1>
    </div>
    <form name="open_form" method="get" action="/functions/idCheck.jsp">
        아이디 : <input type="text" name="id" size="10" value="<%= Gdata%>">
        <input type="submit" class="btn btn-warning" value="중복처리">
    </form>
</div>
</body>
</html>
