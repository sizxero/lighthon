<%@ page import="lighthon.dto.MemberDetailDTO" %>
<%@ page import="lighthon.dao.MemberDAO" %><%--
  Created by IntelliJ IDEA.
  User: gsu07
  Date: 2022-08-19
  Time: 오후 1:12
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>⚡ <%=session.getAttribute("id")%>의 페이지</title>
</head>
<body>
<%@ include file="/commons/header.jsp"%>
<%
    paramId = (String)session.getAttribute("id");
    MemberDAO dao = new MemberDAO();
    MemberDetailDTO dto = dao.findMemberById(paramId);
    String filename = "default.jpeg";
    if(dto.getFile() != null) {
        filename = dto.getFile();
    }

%>
<div class="container" align="center">
    <p/>
    <h2 align="left">내 정보</h2>
    <table class="table table-bordered">
        <tr>
            <th rowspan="5" colspan="1" width="25%" align="center">
                <div><img width="150px" height="150px" src="/storage/<%=filename%>"></div>
            </th>
        </tr>
        <tr>
            <th colspan="1">이름</th>
            <td colspan="3"><%=dto.getName()%></td>
        </tr>
        <tr>
            <th colspan="1">닉네임</th>
            <td colspan="3"><%=dto.getNickname()%></td>
        </tr>
        <tr>
            <th colspan="1">이메일</th>
            <td colspan="3"><%=dto.getEmail()%></td>
        </tr>
        <tr>
            <th colspan="1">휴대전화</th>
            <td colspan="3"><%=dto.getPhone()%></td>
        </tr>
        <tr>
            <th colspan="1" rowspan="3">주소</th>
            <td colspan="3"><%=dto.getZipCode()%></td>
        </tr>
        <tr>
            <td colspan="3"><%=dto.getCity()%></td>
        </tr>
        <tr>
            <td colspan="3"><%=dto.getStreet()%></td>
        </tr>
    </table>
    <a href="update-my-info.jsp?" class="btn btn-warning">수정</a>
    <a href="../index.jsp" class="btn btn-outline-warning">취소</a>
</div>
</body>
</html>
