<%--
  Created by IntelliJ IDEA.
  User: gsu07
  Date: 2022-08-18
  Time: 오후 5:05
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="lighthon.dao.MemberDAO" %>
<html>
<head>
    <title>⚡ 회원가입 - 아이디 중복 체크</title>
</head>
<body>
<%
    String paramId = request.getParameter("id");
    MemberDAO dao = new MemberDAO();
    if(dao.isExistId(paramId)){
        throw new Exception("아이디 중복");
    }
%>

</body>
</html>
