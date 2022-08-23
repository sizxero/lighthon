<%@ page import="lighthon.dao.BoardDAO" %>
<%@ page import="lighthon.dto.boards.UpdatePostDTO" %><%--
  Created by IntelliJ IDEA.
  User: gsu07
  Date: 2022-08-23
  Time: 오후 3:13
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>⚡ 글 수정</title>
</head>
<body>
<%
    request.setCharacterEncoding("UTF-8");
    int paramPostNo = Integer.parseInt(request.getParameter("postno"));
    String title = request.getParameter("title");
    String contents = request.getParameter("contents");

    BoardDAO dao = new BoardDAO();
    UpdatePostDTO dto = new UpdatePostDTO(title, contents);
    dao.updatePost(dto, paramPostNo);
    response.sendRedirect("../pages/post-detail.jsp?postno=" + paramPostNo);
%>
</body>
</html>
