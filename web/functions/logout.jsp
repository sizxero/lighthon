<%--
  Created by IntelliJ IDEA.
  User: gsu07
  Date: 2022-08-17
  Time: 오후 11:59
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>⚡ 로그아웃</title>
</head>
<body>
<%
    session.removeAttribute("id");
    response.sendRedirect("../index.jsp");
%>
</body>
</html>
