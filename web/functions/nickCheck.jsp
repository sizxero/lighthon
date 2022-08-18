<%--
  Created by IntelliJ IDEA.
  User: gsu07
  Date: 2022-08-18
  Time: 오후 5:44
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/commons/serverSideInclude.jsp"%>
<html>
<head>
    <title>⚡ 회원가입 - 닉네임 중복 체크</title>
</head>
<body>
<%
    nick = request.getParameter("nick");


    gSQL = "select count(*) from members where m_nickname=?";
    try {
        pstmt = conn.prepareStatement(gSQL);
        pstmt.setString(1, nick);
        rs = pstmt.executeQuery();
        if(rs.next()) {
            cnt = rs.getInt(1);
        }
    } catch(Exception e) {
        System.out.println("error: " + e);
        cnt = 999;
    }
    System.out.println(nick + "/cnt:" + cnt);
    if( cnt >0){
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
    opener.signUpForm.nick.value=<%=nick%>;
    opener.signUpForm.phone.focus();
    self.close();
</script>
<%}%>
</body>
</html>
