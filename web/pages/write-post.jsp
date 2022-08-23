<%--
  Created by IntelliJ IDEA.
  User: gsu07
  Date: 2022-08-23
  Time: 오후 1:47
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>⚡ 글 작성</title>
    <style>
        input[type=text], textarea {
            width: 100%;
        }

        div.button-wrapper {
            display: flex;
            justify-content: space-between;
            width: 15%;
        }

        div#write-container {
            padding: 50px 0;
        }

        .form-container {
            display: flex;
            flex-direction: column;
            align-items: center;
        }
    </style>
</head>
<body>
<%@ include file="/commons/header.jsp"%>
<div class="container" id="write-container">
    <form action="../functions/writePostSave.jsp" method="post" class="form-container">
        <table class="table table-borderless">
            <tr>
                <th>제목</th>
                <td><input type="text" id="title" name="title"></td>
            </tr>
            <tr>
                <th>내용</th>
                <td><textarea name="contents" id="contents" cols="30" rows="10"></textarea></td>
            </tr>
        </table>
        <div class="button-wrapper">
            <input type="submit" value="등록" class="btn btn-warning">
            <a href="freeboard.jsp" class="btn btn-outline-warning">취소</a>
        </div>
    </form>
</div>
</body>
</html>
