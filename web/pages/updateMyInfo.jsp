<%--
  Created by IntelliJ IDEA.
  User: gsu07
  Date: 2022-08-19
  Time: 오후 4:45
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>⚡ <%=session.getAttribute("id")%>의 페이지 - 수정</title>
</head>
<body>
<%@ include file="/commons/header.jsp"%>
<%
    gSQL = "select * from members where m_id=?";
    try {
        pstmt = conn.prepareStatement(gSQL);
        pstmt.setString(1, (String)session.getAttribute("id"));
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
    <h2 align="left">내 정보</h2>
    <table class="table table-bordered">
        <tr>
            <th rowspan="5" colspan="1" width="25%" align="center">
                <div id="preview"><img width="150px" height="150px" src="/storage/<%=m_file%>"></div>
                <input type="file">
            </th>
        </tr>
        <tr>
            <th colspan="1">이름</th>
            <td colspan="3"><input type="text" value=<%=m_name%>></td>
        </tr>
        <tr>
            <th colspan="1">닉네임</th>
            <td colspan="3"><input type="text" value=<%=m_nickname%>></td>
        </tr>
        <tr>
            <th colspan="1">이메일</th>
            <td colspan="3"><input type="text" value=<%=m_email%>></td>
        </tr>
        <tr>
            <th colspan="1">휴대전화</th>
            <td colspan="3"><input type="text" value=<%=m_phone%>></td>
        </tr>
        <tr>
            <th colspan="1" rowspan="3">주소</th>
            <td colspan="3"><input type="text" value=<%=m_zipcode%>></td>
        </tr>
        <tr>
            <td colspan="3"><input type="text" value=<%=m_city%>></td>
        </tr>
        <tr>
            <td colspan="3"><input type="text" value=<%=m_street%>></td>
        </tr>
        <tr>
            <th colspan="1">비밀번호</th>
            <td colspan="3"><input type="password"></td>
        </tr>
        <tr>
            <th colspan="1">비밀번호 재확인</th>
            <td colspan="3"><input type="password"></td>
        </tr>
    </table>
    <a href="updateMyInfo.jsp" class="btn btn-warning">수정</a>
    <a href="../index.jsp" class="btn btn-outline-warning">취소</a>
</div>
</body>
</html>