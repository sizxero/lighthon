<%--
  Created by IntelliJ IDEA.
  User: gsu07
  Date: 2022-08-18
  Time: 오후 5:05
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/commons/serverSideInclude.jsp"%>
<html>
<head>
    <title>⚡ 회원가입 - 아이디 중복 체크</title>
</head>
<body>
<%
    id = request.getParameter("id");


    gSQL = "select count(*) from members where m_id=?";
    try {
        pstmt = conn.prepareStatement(gSQL);
        pstmt.setString(1, id);
        rs = pstmt.executeQuery();
        if(rs.next()) {
            cnt = rs.getInt(1);
        }
    } catch(Exception e) {
        System.out.println("error: " + e);
        cnt = 999;
    }
    System.out.println(id + "/cnt:" + cnt);
    if( cnt >0){
%>
<script type="text/javascript">
    alert("이미 사용중인 아이디입니다.");
    opener.signUpForm.id.value="";
    opener.signUpForm.id.focus();
    self.close();
</script>
<%
}else{
%>
<script type="text/javascript">
    alert("사용가능한 아이디 입니다.");
    opener.signUpForm.id.value=<%=id%>;
    opener.signUpForm.pw.focus();
    self.close();
</script>
<%}%>
</body>
</html>
