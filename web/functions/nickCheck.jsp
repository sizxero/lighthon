<%--
  Created by IntelliJ IDEA.
  User: gsu07
  Date: 2022-08-18
  Time: 오후 5:44
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="lighthon.dao.MemberDAO" %>
<html>
<head>
    <title>⚡ 회원가입 - 닉네임 중복 체크</title>
    <link rel="stylesheet" href="/commons/bootstrap4/bootstrap.min.css">
</head>
<body>
<%
    String paramNick = request.getParameter("nick");
    MemberDAO dao = new MemberDAO();
    if(dao.isExistNickname(paramNick)){
%>
<script type="text/javascript">
    alert("이미 사용중인 닉네임입니다.");
    opener.signUpForm.nick.value="";
    opener.signUpForm.nick.focus();
    self.close();
</script>
<%
}else{
%>
<script type="text/javascript">
    alert("사용가능한 닉네임입니다.");
    opener.signUpForm.nick.value='<%=paramNick%>';
    opener.signUpForm.phone.focus();
    self.close();
</script>
<%}%>
</body>
</html>
