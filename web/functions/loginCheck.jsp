<%--
  Created by IntelliJ IDEA.
  User: gsu07
  Date: 2022-08-17
  Time: 오후 11:59
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="lighthon.dao.MemberDAO" %>
<html>
<head>
    <title>⚡ 로그인</title>
</head>
<body>
<%
    String paramId = request.getParameter("id");
    String paramPw = request.getParameter("pw");

    MemberDAO dao = new MemberDAO();
    if (dao.login(paramId, paramPw)) {
        session.setAttribute("id", paramId);
        response.sendRedirect("../index.jsp");
    } else {
        response.sendRedirect("../index.jsp");
    }
%>
</body>
</html>
