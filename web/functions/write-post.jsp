<%@ page import="lighthon.dao.BoardDAO" %>
<%@ page import="lighthon.dto.boards.FreePostInsertDTO" %><%--
  Created by IntelliJ IDEA.
  User: gsu07
  Date: 2022-08-23
  Time: 오후 2:00
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>⚡ 글 저장</title>
</head>
<body>
<%
    request.setCharacterEncoding("UTF-8");
    String paramId = (String) session.getAttribute("id");
    if(paramId != null) {
        String title = request.getParameter("title");
        String contents = request.getParameter("contents");
        BoardDAO dao = new BoardDAO();
        FreePostInsertDTO dto = new FreePostInsertDTO(paramId, title, contents);
        dao.insertFreePost(dto);
        response.sendRedirect("../pages/freeboard.jsp");
    } else {
%>
<script type="text/javascript">
    alert("회원전용 컨텐츠입니다. 로그인 후 이용해주세요");
    window.location.href = "../pages/login.jsp"
</script>
<%
    }
%>
</body>
</html>
