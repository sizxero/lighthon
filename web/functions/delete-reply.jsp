<%@ page import="lighthon.dao.BoardDAO" %><%--
  Created by IntelliJ IDEA.
  User: gsu07
  Date: 2022-08-24
  Time: 오후 8:02
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<%
    int rno = Integer.parseInt(request.getParameter("rno"));

    BoardDAO dao = new BoardDAO();
    dao.deleteReply(rno);
%>
</body>
</html>
