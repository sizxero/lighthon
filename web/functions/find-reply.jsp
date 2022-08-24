<%@ page import="lighthon.dao.BoardDAO" %>
<%@ page import="lighthon.dto.boards.ReplyDTO" %><%--
  Created by IntelliJ IDEA.
  User: gsu07
  Date: 2022-08-24
  Time: 오후 5:30
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="application/json;charset=UTF-8" language="java" %>
<%
    int rno = Integer.parseInt(request.getParameter("rno"));
    System.out.println(rno);
    BoardDAO dao = new BoardDAO();
    ReplyDTO dto = dao.findReply(rno);
%>
{
    "contents": "<%=dto.getContents()%>"
}
