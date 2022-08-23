<%@ page import="lighthon.dao.BoardDAO" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="lighthon.dto.boards.BoardDTO" %><%--
  Created by IntelliJ IDEA.
  User: gsu07
  Date: 2022-08-23
  Time: 오후 12:44
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>⚡ 자유게시판</title>
    <style>
        div#board-container {
            padding: 5px;
        }
    </style>
</head>
<body>
<%@ include file="/commons/header.jsp"%>
<div class="container" id="board-container">
    <a href="write-post.jsp" class="btn btn-warning" align="right">글 작성하기</a>
    <table class="table table-bordered">
        <thead>
            <tr align="center">
                <th width="10%">순 번</th>
                <th width="40%">제 목</th>
                <th width="20%">작성자</th>
                <th width="20%">작성일</th>
                <th width="10%">조회수</th>
            </tr>
        </thead>
        <tbody>
        <%
            BoardDAO dao = new BoardDAO();
            ArrayList<BoardDTO> dtos = dao.findAllFreePost();
            for (int i = 0; i < dtos.size(); i++) {
                BoardDTO dto = dtos.get(i);
        %>
        <tr>
            <td><%=dto.getRn()%></td>
            <td>
                <a href="post-detail.jsp?postno=<%=dto.getNo()%>"><%=dto.getTitle()%></a>
                <%
                    int replyCnt = dao.replyCnt(dto.getNo());
                    if(replyCnt != 0) {
                        out.print("[" + replyCnt + "]");
                    }
                %>
            </td>
            <td><%=dto.getNickname()%></td>
            <td><%=dto.getWdate()%></td>
            <td><%=dto.getHit()%></td>
        </tr>
        <%
            }
        %>
        </tbody>
    </table>
</div>
</body>
</html>
