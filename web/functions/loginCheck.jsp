<%--
  Created by IntelliJ IDEA.
  User: gsu07
  Date: 2022-08-17
  Time: 오후 11:59
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/commons/serverSideInclude.jsp"%>
<html>
<head>
    <title>⚡ 로그인</title>
</head>
<body>
<%
    id = request.getParameter("id");
    pw = request.getParameter("pw");

    gSQL = "select count(*) from members where m_id=? and m_pw=?";
    try {
        pstmt = conn.prepareStatement(gSQL);
        pstmt.setString(1, id);
        pstmt.setString(2, pw);
        rs = pstmt.executeQuery();
        if(rs.next()) {
            cnt = rs.getInt(1);
        }
    } catch(Exception e) {
        System.out.println("error: " + e);
        cnt = 999;
    }
    System.out.println(id + pw + "result: " + cnt);
    if (cnt == 0) {
        response.sendRedirect("../index.jsp");
    } else if(cnt==1) {
        session.setAttribute("id", id);
        response.sendRedirect("../index.jsp");
    }
%>
</body>
</html>
