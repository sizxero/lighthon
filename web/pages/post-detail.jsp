<%@ page import="lighthon.dao.BoardDAO" %>
<%@ page import="lighthon.dto.boards.BoardDTO" %>
<%@ page import="lighthon.dao.PostDetailDTO" %>
<%@ page import="lighthon.dto.members.MemberInfoDTO" %>
<%@ page import="lighthon.dto.members.CompactMemberInfoDTO" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="lighthon.dto.boards.ReplyDTO" %><%--
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

        table#write-reply-container textarea{
            width: 100%;
            height: 100%;
        }

        table#write-reply-container a{
            width: 100px;
            height: 100px;
            line-height: 80px;
        }

        table img{
            width: 100px;
            height: 100px;
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
            if(session.getAttribute("id") != null) {
                String userid = (String)session.getAttribute("id");
                if(dao2.findNicknameById(userid).equals(dto.getWriter())) {
        %>
        <a href="updatePost.jsp?postno=<%=paramPostNo%>" class="btn btn-warning">수정</a>
        <a href="../functions/deletePost.jsp?postno=<%=paramPostNo%>" class="btn btn-warning">삭제</a>
        <%
                }
            }
        %>
        <a href="freeboard.jsp" class="btn btn-outline-warning">목록</a>
    </div>
    <hr>
    <div class="reply-container">
        <table class="table table-bordered">
<%
    ArrayList<ReplyDTO> dtos = dao.findAllReply(paramPostNo);
    for (int i = 0; i < dtos.size(); i++) {
        ReplyDTO rdto = dtos.get(i);
        int mNo = rdto.getMemberNo();
        CompactMemberInfoDTO mdto = dao2.findMemberByNoCompact(mNo);
%>
            <tr height="50px">
                <td width="10%">
                    <div class="user-info">
                        <img src="/storage/<%=mdto.getFile()%>" alt="">
                    </div>
                </td>
                <td width="80%"><p><%=mdto.getNick()%> / <%=rdto.getWdate()%></p>
                <%=rdto.getContents()%>
                </td>
                <td width="10%"></td>
            </tr>
<%
    }
%>
        </table>
    </div>
    <%
        if((String) session.getAttribute("id") != null) {
            CompactMemberInfoDTO dto2 = dao2.findMemberByIdCompact((String) session.getAttribute("id") );
    %>
    <table class="table table-bordered" id="write-reply-container">
        <tr height="50px">
            <td width="10%">
                <div class="user-info">
                    <img src="/storage/<%=dto2.getFile()%>" alt="">
                </div>
            </td>
            <td width="80%"><p><%=dto2.getNick()%></p><textarea id="reply" name="reply"></textarea></td>
            <td width="10%"><button onclick="getInsertRoot(<%=paramPostNo%>)" class="btn btn-outline-warning">등록</button></td>
        </tr>
    </table>
    <%
        }
    %>

</div>
<script type="text/javascript">
    const getInsertRoot = (postNo) => {
        let textarea = document.querySelector("textarea#reply");
        window.location.href = '../functions/insertReply.jsp?postno=' + postNo + "&contents=" + textarea.value;
    };
</script>
</body>
</html>
