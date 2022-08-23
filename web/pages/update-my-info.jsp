<%--
  Created by IntelliJ IDEA.
  User: gsu07
  Date: 2022-08-19
  Time: 오후 4:45
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="lighthon.dto.MemberDetailDTO" %>
<%@ page import="lighthon.dao.MemberDAO" %>
<html>
<head>
    <title>⚡ <%=session.getAttribute("id")%>의 페이지 - 수정</title>
    <style>
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
<%@ include file="/commons/header.jsp"%>
<%
    paramId = (String)session.getAttribute("id");
    MemberDAO dao = new MemberDAO();
    MemberDetailDTO dto = dao.findMemberById(paramId);
    String filename = "default.jpeg";
    if(dto.getFile() != null) {
        filename = dto.getFile();
    }
%>
<div class="container" align="center">
    <p/>
    <h2 align="left">내 정보</h2>
    <form action="/functions/updateSave.jsp" name="updateForm" method="post" enctype="multipart/form-data" onsubmit="return checkNull()" >
        <table class="table table-bordered">
            <tr>
                <th rowspan="5" colspan="1" width="25%" align="center">
                    <label for="file1">
                        <div id="preview">
                            <img src="/storage/<%=filename%>" width="100%" height="100%" alt="">
                        </div>
                    </label>
                    <input type="file" id="file1" name="file1">
                </th>
            </tr>
            <tr>
                <th colspan="1">이름</th>
                <td colspan="3"><input type="text" id="name" name="name" value=<%=dto.getName()%>></td>
            </tr>
            <tr>
                <th colspan="1">닉네임&nbsp;<input type="button" class="btn btn-warning" onclick="duplNickCheck()" value="중복확인"></th>
                <td colspan="3"><input type="text" id="nick" name="nick" value=<%=dto.getNickname()%>></td>
            </tr>
            <tr>
                <th colspan="1">이메일</th>
                <td colspan="3"><input type="text" id="email" name="email" value=<%=dto.getEmail()%>></td>
            </tr>
            <tr>
                <th colspan="1">휴대전화</th>
                <td colspan="3"><input type="text" id="phone" name="phone" value=<%=dto.getPhone()%>></td>
            </tr>
            <tr>
                <th colspan="1" rowspan="3">주소&nbsp;<input type="button" class="btn btn-warning" onclick="sample6_execDaumPostcode()" value="주소찾기"></th>
                <td colspan="3"><input type="text" id="zipcode" name="zipcode" value=<%=dto.getZipCode()%>></td>
            </tr>
            <tr>
                <td colspan="3"><input type="text" id="city" name="city" value=<%=dto.getCity()%>></td>
            </tr>
            <tr>
                <td colspan="3"><input type="text" id="street" name="street" value=<%=dto.getStreet()%>></td>
            </tr>
            <tr>
                <th colspan="1">비밀번호</th>
                <td colspan="3"><input type="password" id="pw" name="pw"></td>
            </tr>
            <tr>
                <th colspan="1">비밀번호 재확인&nbsp;<input type="button" class="btn btn-warning" onclick="samePwCheck()" value="일치확인"></th>
                <td colspan="3"><input type="password" id="pw_re" name="pw_re"></td>
            </tr>
            <input type="hidden" name="id" value=<%=(String)session.getAttribute("id")%>>
        </table>
        <input type="submit" class="btn btn-warning" value="수정">
        <a href="../index.jsp" class="btn btn-outline-warning">취소</a>
    </form>

</div>
<script type="text/javascript">
    let duplNick = false;

    const duplNickCheck = () => {
        if(updateForm.nick.value==null || updateForm.nick.value==""){
            updateForm.nick.focus();
            return false;
        }
        duplNick = true;
        window.open("popup/changeNickCheck.jsp?nick="+updateForm.nick.value, "bb", "width=600, height=150, top=400, left=400");
    }

    const checkNull = () => {
        if (updateForm.id.value === '' || updateForm.nick.value === '' || updateForm.name.value === '' || updateForm.phone.value === '' || updateForm.email.value === '' || updateForm.street.value === '') {
            var msg = '';
            if(updateForm.id.value === '')
                msg += '아이디 ';
            if(updateForm.nick.value === '')
                msg += '닉네임 ';
            if(updateForm.name.value === '')
                msg += '이름 ';
            if(updateForm.phone.value === '')
                msg += '휴대전화 ';
            if(updateForm.email.value === '')
                msg += '이메일 ';
            if(updateForm.street.value === '')
                msg += '집 주소 ';
            alert(msg + '미작성');
            if(!duplNick)
                alert("닉네임 중복 체크 미완료");
            return false;
        } else {
            if(!duplNick) {
                alert("닉네임 중복 체크 미완료");
                return false;
            } else{
                return true;
            }
        }
    }

    const samePwCheck = () => {
        if(updateForm.pw.value === updateForm.pw_re.value) {
            alert('사용할 수 있는 비밀번호입니다.');
            updateForm.name.focus();
        }
        else {
            alert('비밀번호가 일치하지 않습니다.');
            updateForm.pw_re.value = '';
            updateForm.pw_re.focus();
        }
    }
</script>
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