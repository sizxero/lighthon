<%@ page import="lighthon.dao.BoardDAO" %>
<%@ page import="lighthon.dto.boards.BoardDTO" %>
<%@ page import="lighthon.dao.PostDetailDTO" %><%--
  Created by IntelliJ IDEA.
  User: gsu07
  Date: 2022-08-23
  Time: 오후 2:38
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>⚡ 글 세부조회</title>
    <style>
        th {
            background-color: #ffc107;
        }

        div#detail-post-container {
            padding: 50px;
        }
    </style>
</head>
<body>
<%@ include file="/commons/header.jsp"%>
<%
    int paramPostNo = Integer.parseInt(request.getParameter("postno"));
    BoardDAO dao = new BoardDAO();
    MemberDAO dao2 = new MemberDAO();
    PostDetailDTO dto = dao.findPostById(paramPostNo);
%>

<div class="container" align="center" id="detail-post-container">
    <table class="table table-bordered">
        <tr>
            <th>제목</th>
            <td colspan="5"><%=dto.getTitle()%></td>
        </tr>
        <tr>
            <th>작성일</th>
            <td><%=dto.getWdate()%></td>
            <th>작성자</th>
            <td><%=dto.getWriter()%></td>
            <th>조회수</th>
            <td><%=dto.getHit()%></td>
        </tr>
        <tr>
            <td colspan="6" height="300px"><%=dto.getContents()%></td>
        </tr>
    </table>
    <div class="button-wrapper">
        <%
            if(dao2.findNicknameById((String)session.getAttribute("id")).equals(dto.getWriter())) {
        %>
        <a href="updatePost.jsp?postno=<%=paramPostNo%>" class="btn btn-warning">수정</a>
        <a href="../functions/deletePost.jsp?postno=<%=paramPostNo%>" class="btn btn-warning">삭제</a>
        <%
            }
        %>
        <a href="freeboard.jsp" class="btn btn-outline-warning">목록</a>
    </div>
</div>
</body>
</html>
