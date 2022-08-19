<%--
  Created by IntelliJ IDEA.
  User: gsu07
  Date: 2022-08-17
  Time: 오후 10:28
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
  <head>
    <title>⚡ 번개발자 ⚡</title>
  </head>
  <body>
  <%@ include file="/commons/header.jsp"%>
  <div class="container" id="contents" align="center">
    <p>다양한 사람들과 개발을 하고 싶다면?</p>
    <img src="images/gallery2.jpg" width="50%" height="50%">
  </div>
  </body>
  <script type="text/javascript">
    setTimeout("window.location.href='pages/login.jsp'", 100000);
  </script>
</html>
