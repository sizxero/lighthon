<%--
  Created by IntelliJ IDEA.
  User: gsu07
  Date: 2022-08-18
  Time: 오후 4:20
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="lighthon.dao.SSI" %>
<html>
<head>
    <title>⚡ 회원가입</title>
    <link href="/commons/bootstrap4/bootstrap.min.css" rel="stylesheet">
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

        div#preview {
            width: 150px;
            height: 150px;
            border: solid 1px;
        }

        input[type=file] {
            display: none;
        }
    </style>
</head>
<body>
    <div class="container" align="center">
        <div id="thumb">
            <h1>⚡ L I G H T H O N ⚡</h1>
            <p>환영합니다.</p>
        </div>
        <form action="/functions/signupSave.jsp" name="signUpForm" method="post"  enctype="multipart/form-data" onsubmit="return checkNull()">
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
                    <td><input type="button" class="btn btn-warning" value="일치 확인" onclick="samePwCheck()"></td>
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
                    <td><input type="text" id="phone" name="phone" placeholder="010-XXXX-XXXX"></td>
                    <td></td>
                </tr>
                <tr>
                    <th>이메일</th>
                    <td><input type="text" id="email" name="email" placeholder="example@dot.com"></td>
                    <td></td>
                </tr>
                <tr>
                    <th>우편번호</th>
                    <td><input type="text" id="zipcode" name="zipcode"></td>
                    <td><input type="button" class="btn btn-warning" value="주소 찾기" onclick="sample6_execDaumPostcode()"></td>
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
                    <td>
                        <label for="file1">
                            <div id="preview">
                                <img src="/storage/default.jpeg" width="100%" alt="">
                            </div>
                        </label>
                        <input type="file" id="file1" name="file1">
                    </td>
                    <td></td>
                </tr>
            </table>   
            <input type="submit" class="btn btn-outline-warning" value="SIGN UP">
        </form>
    </div>
    <script type="text/javascript">
        function readImage(input) {
            const previewDiv = document.querySelector('#preview');
            previewDiv.innerHTML = "";
            // 파일이 있는 경우
            if (input.files && input.files[0]) {
                for (var i = 0; i < input.files.length; i++) {
                    let readFileURL = URL.createObjectURL(input.files[i]);
                    previewDiv.innerHTML = `
                    <img src="` + readFileURL + `" width="100%" height="100%" alt="">
                    `;
                }
            }
        }

        let inputFile = document.querySelector('input#file1');
        inputFile.onchange = (e) => {
            readImage(e.currentTarget);
        }
    </script>
    <script type="text/javascript">
        let duplId = false;
        let duplNick = false;

        const duplIdCheck = () => {
            if(signUpForm.id.value==null || signUpForm.id.value==""){
                signUpForm.id.focus();
                return false;
            }
            duplId = true;
            window.open("popup/idCheck.jsp?id="+signUpForm.id.value, "bb", "width=600, height=150, top=400, left=400");
        }

        const duplNickCheck = () => {
            if(signUpForm.nick.value==null || signUpForm.nick.value==""){
                signUpForm.nick.focus();
                return false;
            }
            duplNick = true;
            window.open("popup/nickCheck.jsp?nick="+signUpForm.nick.value, "bb", "width=600, height=150, top=400, left=400");
        }

        const checkNull = () => {
            if (signUpForm.id.value === '' || signUpForm.nick.value === '' || signUpForm.name.value === '' || signUpForm.phone.value === '' || signUpForm.email.value === '' || signUpForm.street.value === '') {
                var msg = '';
                if(signUpForm.id.value === '')
                    msg += '아이디 ';
                if(signUpForm.nick.value === '')
                    msg += '닉네임 ';
                if(signUpForm.name.value === '')
                    msg += '이름 ';
                if(signUpForm.phone.value === '')
                    msg += '휴대전화 ';
                if(signUpForm.email.value === '')
                    msg += '이메일 ';
                if(signUpForm.street.value === '')
                    msg += '집 주소 ';
                alert(msg + '미작성');
                if(!duplId)
                    alert("아이디 중복 체크 미완료");
                if(!duplNick)
                    alert("닉네임 중복 체크 미완료");
                return false;
            } else {
                if(!(duplId && duplNick)) {
                    if(!duplId)
                        alert("아이디 중복 체크 미완료");
                    if(!duplNick)
                        alert("닉네임 중복 체크 미완료");
                    return false;
                } else{
                    return true;
                }
            }
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
    <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
    <script>
        function sample6_execDaumPostcode() {
            new daum.Postcode({
                oncomplete: function(data) {
                    // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                    // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                    // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                    var addr = ''; // 주소 변수
                    var extraAddr = ''; // 참고항목 변수

                    //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                    if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                        addr = data.roadAddress;
                    } else { // 사용자가 지번 주소를 선택했을 경우(J)
                        addr = data.jibunAddress;
                    }

                    // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
                    if(data.userSelectedType === 'R'){
                        // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                        // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                        if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                            extraAddr += data.bname;
                        }
                        // 건물명이 있고, 공동주택일 경우 추가한다.
                        if(data.buildingName !== '' && data.apartment === 'Y'){
                            extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                        }
                        // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                        if(extraAddr !== ''){
                            extraAddr = ' (' + extraAddr + ')';
                        }
                    }

                    // 우편번호와 주소 정보를 해당 필드에 넣는다.
                    document.getElementById('zipcode').value = data.zonecode;
                    document.getElementById("city").value = addr;
                    // 커서를 상세주소 필드로 이동한다.
                    document.getElementById("street").focus();
                }
            }).open();
        }
    </script>
</body>
</html>
