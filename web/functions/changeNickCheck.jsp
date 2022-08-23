<%--
  Created by IntelliJ IDEA.
  User: gsu07
  Date: 2022-08-23
  Time: 오전 11:37
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="lighthon.dao.MemberDAO" %>
<html>
<head>
    <title>⚡ 정보수정 - 닉네임 중복체크</title>
</head>
<body>
<%
    String paramNick = request.getParameter("nick");
    MemberDAO dao = new MemberDAO();
    if(dao.isExistNickname(paramNick)){
%>
<script type="text/javascript">
    alert("이미 사용중인 닉네임입니다.");
    duplNick = false;
    opener.updateForm.nick.value="";
    opener.updateForm.nick.focus();
    self.close();
</script>
<%
}else{
%>
<script type="text/javascript">
    alert("사용가능한 닉네임입니다.");
    duplNick = true;
    opener.updateForm.nick.value='<%=paramNick%>';
    opener.updateForm.email.focus();
    self.close();
</script>
<%}%>
</body>
</html>
