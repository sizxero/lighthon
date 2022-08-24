<%@ page import="lighthon.dao.BoardDAO" %>
<%@ page import="lighthon.dto.boards.InsertReplyDTO" %>
<%@ page import="lighthon.dto.boards.UpdateReplyDTO" %><%--
  Created by IntelliJ IDEA.
  User: gsu07
  Date: 2022-08-24
  Time: 오후 5:25
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
    String contents = request.getParameter("contents");

    BoardDAO dao = new BoardDAO();
    UpdateReplyDTO dto = new UpdateReplyDTO(rno, contents);
    dao.updateReply(dto);
%>
</body>
</html>
