<%--
  Created by IntelliJ IDEA.
  User: gsu07
  Date: 2022-08-19
  Time: 오후 1:16
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/commons/serverSideInclude.jsp"%>
<html>
<head>
    <link href="/commons/bootstrap4/bootstrap.min.css" rel="stylesheet" integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">
    <style>
        #thumb {
            padding-top:20%;
        }
        h1 {
            font-size: 45px;
        }
        p {
            color: gray;
        }
        span {
            background-color: red;
            margin-left: 700px;
        }
    </style>
</head>
<body>
<div class="container" align="center">
    <div id="thumb">
        <h1>⚡ L I G H T H O N ⚡</h1>
        <%
            id = (String) session.getAttribute("id");
            if(id == null) {
        %>
        <p>번갯불에 콩 구워먹듯 개발하고 싶다면?</p>
        <%
        } else {
            gSQL = "select m_nickname from members where m_id=?";
            try {
                pstmt = conn.prepareStatement(gSQL);
                pstmt.setString(1, id);
                rs = pstmt.executeQuery();
                if(rs.next())
                    m_nickname = rs.getString(1);
            } catch (Exception e) {
                System.out.println("error: " + e);
                m_nickname=null;
            }
        %>
        <p><%= m_nickname%>님, 환영합니다.</p>
        <%
            }
        %>
    </div>
</div>
<nav class="navbar navbar-expand-lg navbar-light bg-warning">
    <a class="navbar-brand" href="/index.jsp">⚡</a>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNavAltMarkup" aria-controls="navbarNavAltMarkup" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarNavAltMarkup">
        <div class="navbar-nav">
            <a class="nav-item nav-link" href="">Explore</a>
            <a class="nav-item nav-link" href="#">FreeBoard</a>
            <%
                if(session.getAttribute("id") == null) {
            %>
            <a class="nav-item nav-link" href="pages/login.jsp">Login</a>
            <%
            } else {
            %>
            <a class="nav-item nav-link" href="pages/mypage.jsp">MyPage</a>
            <a class="nav-item nav-link" href="../functions/logout.jsp">Logout</a>
            <%
                }
            %>
        </div>
    </div>
</nav>
</body>
</html>
