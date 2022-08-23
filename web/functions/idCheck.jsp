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
%>
<script type="text/javascript">
    alert("이미 사용중인 아이디입니다.");
    duplId = false;
    opener.signUpForm.id.value="";
    opener.signUpForm.id.focus();
    self.close();
</script>
<%
}else{
%>
<script type="text/javascript">
    alert("사용가능한 아이디 입니다.");
    duplId = true;
    opener.signUpForm.id.value= '<%=paramId%>';
    opener.signUpForm.pw.focus();
    self.close();
</script>
<%}%>
</body>
</html>
