<%--
  Created by IntelliJ IDEA.
  User: gsu07
  Date: 2022-08-19
  Time: 오후 2:50
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>⚡ 팀원찾기</title>
</head>
<body>
<%@ include file="/commons/header.jsp"%>
<%
    paramMNo = Integer.parseInt(request.getParameter("code"));
    gSQL = "select * from members where m_no=?";
    try {
        pstmt = conn.prepareStatement(gSQL);
        pstmt.setInt(1, paramMNo);
        rs = pstmt.executeQuery();
        if(rs.next()) {
            m_name = rs.getString(4);
            m_nickname = rs.getString(5);
            m_phone = rs.getString(6);
            m_email = rs.getString(7);
            m_zipcode = rs.getInt(8);
            m_city = rs.getString(9);
            m_street = rs.getString(10);
            m_file = rs.getString(11);
        }
    } catch (Exception e) {
        System.out.println("error: " + e);
    }
    if(m_file == null) {
        m_file = "default.jpeg";
    }
%>
<div class="container" align="center">
    <p/>
    <h2 align="left"><%=m_name%>님의 정보</h2>
    <table class="table table-bordered">
        <tr>
            <th rowspan="5" colspan="1" width="25%" align="center">
                <div><img width="150px" height="150px" src="/storage/<%=m_file%>"></div>
            </th>
        </tr>
        <tr>
            <th colspan="1">이름</th>
            <td colspan="3"><%=m_name%></td>
        </tr>
        <tr>
            <th colspan="1">닉네임</th>
            <td colspan="3"><%=m_nickname%></td>
        </tr>
        <tr>
            <th colspan="1">이메일</th>
            <td colspan="3"><%=m_email%></td>
        </tr>
        <tr>
            <th colspan="1">휴대전화</th>
            <td colspan="3"><%=m_phone%></td>
        </tr>
        <tr>
            <th colspan="1" rowspan="3">주소</th>
            <td colspan="3"><%=m_zipcode%></td>
        </tr>
        <tr>
            <td colspan="3"><%=m_city%></td>
        </tr>
        <tr>
            <td colspan="3"><%=m_street%></td>
        </tr>
    </table>
    <a href=explore-member.jsp class="btn btn-outline-warning">취소</a>
</div>
</body>
</html>
