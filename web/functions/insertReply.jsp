<%@ page import="lighthon.dao.BoardDAO" %>
<%@ page import="lighthon.dto.boards.InsertReplyDTO" %>
<%@ page import="lighthon.dao.MemberDAO" %><%--
  Created by IntelliJ IDEA.
  User: gsu07
  Date: 2022-08-23
  Time: 오후 4:18
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>⚡ 댓글 작성</title>
</head>
<body>
<%
    String id = (String) session.getAttribute("id");
    int paramPostNo = Integer.parseInt(request.getParameter("postno"));
    String contents = request.getParameter("contents");

    BoardDAO dao = new BoardDAO();
    InsertReplyDTO dto = new InsertReplyDTO(paramPostNo, id, contents);
    dao.insertReply(dto);
    response.sendRedirect("../pages/post-detail.jsp?postno="+paramPostNo);
%>
</body>
</html>
