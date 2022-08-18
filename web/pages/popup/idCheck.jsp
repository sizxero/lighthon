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
</head>
<body>
<%
    String Gdata = request.getParameter("id");
%>
<div>
    <form name="open_form" method="get" action="/functions/idCheck.jsp">
        id:<input type="text" name="id" size="10" value="<%= Gdata%>">
        <input type="submit" value="중복처리">
    </form>
</div>
</body>
</html>
