<%--
  Created by IntelliJ IDEA.
  User: gsu07
  Date: 2022-08-18
  Time: 오후 4:20
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/commons/serverSideInclude.jsp"%>
<html>
<head>
    <title>⚡ 회원가입</title>
    <link href="/commons/bootstrap4/bootstrap.min.css" rel="stylesheet" integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">
    <style>
        body {
            background-color: lightgray;
        }

        div.container {
            background-color: white;
            height: 100%;
        }

        #thumb {
            padding-top:10%;
            padding-bottom:10px;
        }

        p {
            color: gray;
        }

        table {
            width: 700px;
            text-align: center;
        }

        input {
            margin: 5px 0;
        }

        tr input[type=text], [type=password], [type=file] {
            height: 40px;
            width: 300px;
        }
        input[type=submit] {
            width: 350px;
        }

        tr > td:nth-child(2) > input{
            width: 100%;
        }

        tr > td:nth-child(3){
            text-align: left;
        }
    </style>
</head>
<body>
    <div class="container" align="center">
        <div id="thumb">
            <h1>⚡ L I G H T H O N ⚡</h1>
            <p>환영합니다.</p>
        </div>
        <form action="/functions/signupSave.jsp" name="signUpForm" method="post">
            <table>
                <tr>
                    <th>아이디</th>
                    <td><input type="text" id="id" name="id"></td>
                    <td><input type="button" class="btn btn-warning" value="중복 확인" onclick="duplIdCheck()"></td>
                </tr>
                <tr>
                    <th>비밀번호</th>
                    <td><input type="password" id="pw" name="pw"></td>
                    <td></td>
                </tr>
                <tr>
                    <th>비밀번호 재입력</th>
                    <td><input type="password" id="pw_re" name="pw_re"></td>
                    <td><input type="button" class="btn btn-warning" value="일치 확인"></td>
                </tr>
                <tr>
                    <th>이름</th>
                    <td><input type="text" id="name" name="name"></td>
                    <td></td>
                </tr>
                <tr>
                    <th>닉네임</th>
                    <td><input type="text" id="nick" name="nick"></td>
                    <td><input type="button" class="btn btn-warning" value="중복 확인" onclick="duplNickCheck()"></td>
                </tr>
                <tr>
                    <th>휴대전화</th>
                    <td><input type="text" id="phone" name="phone"></td>
                    <td></td>
                </tr>
                <tr>
                    <th>이메일</th>
                    <td><input type="text" id="email" name="email"></td>
                    <td></td>
                </tr>
                <tr>
                    <th>우편번호</th>
                    <td><input type="text" id="zipcode" name="zipcode"></td>
                    <td><input type="button" class="btn btn-warning" value="주소 찾기"></td>
                </tr>
                <tr>
                    <th>상세 주소 1</th>
                    <td><input type="text" id="city" name="city"></td>
                    <td></td>
                </tr>
                <tr>
                    <th>상세 주소 2</th>
                    <td><input type="text" id="street" name="street"></td>
                    <td></td>
                </tr>
                <tr>
                    <th>프로필 사진</th>
                    <td><input type="file"></td>
                    <td></td>
                </tr>
            </table>   
            <input type="submit" class="btn btn-outline-warning" value="SIGN UP">
        </form>
    </div>
    <script type="text/javascript">
        const sendInfo = () => {

        }

        const duplIdCheck = () => {
            window.open("popup/idCheck.jsp?id="+signUpForm.id.value, "bb", "width=600, height=150, top=400, left=400");
        }

        const duplNickCheck = () => {
            window.open("popup/nickCheck.jsp?nick="+signUpForm.nick.value, "bb", "width=600, height=150, top=400, left=400");
        }

        const checkNull = () => {

        }

        const samePwCheck = () => {
            if(signUpForm.pw.value === signUpForm.pw_re.value) {
                alert('사용할 수 있는 비밀번호입니다.');
                signUpForm.name.focus();
            }
            else {
                alert('비밀번호가 일치하지 않습니다.');
                signUpForm.pw_re.value = '';
                signUpForm.pw_re.focus();
            }
        }
    </script>
</body>
</html>
