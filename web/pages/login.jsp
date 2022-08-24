<%--
  Created by IntelliJ IDEA.
  User: gsu07
  Date: 2022-08-17
  Time: 오후 11:59
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>⚡ 로그인</title>
    <link rel="stylesheet" href="/commons/bootstrap4/bootstrap.min.css">
    <style>
        #thumb {
            padding-top:40%;
        }
        #login-btn {
            height: 50px;
        }
        table {
            width: 40%;
        }
        table tr td input {
            width: 100%;
        }

        div#loading {
            display: none;
            position: absolute;
            top: 40%;
            left: 50%;
        }
    </style>
</head>
<body>
<div class="container" align="center">
    <div id="thumb">
        <h1>⚡ L I G H T H O N ⚡</h1>
    </div>
    <form method="post">
        <table>
            <tbody>
                <tr>
                    <th width="15%">ID</th>
                    <td width="60%"><input type="text" id="id" name="id"/></td>
                    <td width="25%" rowspan="2">
                        <button class="btn btn-warning" id="login-btn">LOGIN</button>
                    </td>
                </tr>
                <tr>
                    <th width="15%">PWD</th>
                    <td width="60%"><input type="password" id="pw" name="pw"></td>
                </tr>
            </tbody>
        </table>
    </form>
    <div id="sub-link">
        <a href="signup.jsp" class="btn btn-outline-warning">회원가입</a>
        <a href="" class="btn btn-outline-warning">ID/PW 찾기</a>
    </div>
    <div id="loading">
        <img width=100px" src="../images/ajax-loader.gif">
    </div>
</div>
<script src="https://code.jquery.com/jquery-3.5.1.js"></script>
<script>
$(function() {
    $('#login-btn').click(function(e) {
        e.preventDefault();
        $.ajax({
            url: "../functions/loginCheck.jsp",
            type: "get",
            data: {
                id: $('input#id').val(),
                pw: $('input#pw').val()
            },
            beforeSend: function() {
                $('#loading').show();
            },
            always: function() {
                setTimeout(function() {
                    $('#loading').fadeOut( );
                }, 500);
            },
            success: function() {
                window.location.href = "../index.jsp";
            },
            error: function(err) {
                alert('로그인에 실패했습니다.');
                window.location.href = "login.jsp";
            }
        });
    });
})

</script>
</body>
</html>
