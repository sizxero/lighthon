<%@ page import="lighthon.dao.BoardDAO" %><%--
  Created by IntelliJ IDEA.
  User: gsu07
  Date: 2022-08-23
  Time: 오후 3:12
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>⚡ 글 삭제</title>
</head>
<body>
<%
    int paramPostNo = Integer.parseInt(request.getParameter("postno"));
    BoardDAO dao = new BoardDAO();
    dao.deletePost(paramPostNo);
    response.sendRedirect("../pages/freeboard.jsp");
%>
</body>
</html>
