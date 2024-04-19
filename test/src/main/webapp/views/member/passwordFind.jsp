<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!-- JSTL -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<link rel="stylesheet" href="<c:url value="/css/member/passwordFind.css"/>"/>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>회원비밀번호 찾기</title>
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css" integrity="sha384-zCbKRCUGaJDkqS1kPbPd7TveP5iyJE0EjAuZQTgFLD2ylzuqKfdKlfG/eSrtxUkn" crossorigin="anonymous">
    <!-- Bootstarp JS -->
    <script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-fQybjgWLrvvRgtW6bFlB7jaZrFsaBXjsOMm/tB9LTS58ONXgqbR9W8oWht/amnpF" crossorigin="anonymous"></script>

</head>
<body>
<div class="main" id="main">
    <form action="#" name="passwordFindForm">
        <table>
            <tr>
                <td colspan="2">비밀번호 찾기</td>
            </tr>
            <tr>
                <td colspan="2">비밀번호를 잊어버리셨나요?
                    <br>회원님의 성명과 아이디,이메일을 입력하여 주세요.</td>
            </tr>
            <tr>
                <td style="width: 20%;">
                    <img src='<c:url value="/img/member/txt_join1.gif"/>'>
                    <img src='<c:url value="/img/member/txt_login_01.gif"/>'>
                    <img src='<c:url value="/img/member/txt_email.gif"/>'>
                </td>
                <td style="width: 80%;">
                    <input type="text" id="userName" name="userName">
                    <input type="text" id="userId" class="idText" name="userID">
                    <input type="text" id="userEmail" class="emailText" name="userEmail">
                </td>
            </tr>
        </table>
    </form>
    <div><input type="image" src='<c:url value="/img/member/btn_confirm.gif"/>' id="btn_submit"></div>
    <div><input type="image" src='<c:url value="/img/member/btn_close.gif"/>' onclick="window.close()"></div>
</div>
<script>
    let findPWD = {
        init: function () {
            $('#btn_submit').click(function(){
                let id=$('#userId').val();
                let name = $('#userName').val();
                let email = $('#userEmail').val();
                if(name==''||name==null){
                    alert('이름을 입력 하세요');
                    $('#userName').focus();
                    return;
                }
                if(id==''||id==null){
                    alert('아이디를 입력 하세요');
                    $('#userId').focus();
                    return;
                }

                if(email==''||email==null){
                    alert('이메일을 입력 하세요');
                    $('#userEmail').focus();
                    return;
                }
               findPWD.send(id,name,email);
            });
        },
        send:function(id,name,email){
            $.ajax({
                url:'<c:url value="/member/findpwdimpl"/>',
                data:{
                    "id":id,
                    "name":name,
                    "email":email
                },
                success:(result)=>{
                    const element = document.getElementById('main');
                    element.innerHTML = `<div>`+result+`<div><div><input type="image" src='<c:url value="/img/member/btn_close.gif"/>' onclick="window.close()"></div>`;
                },
                error:(e)=>{console.log(e)}
            })
        }
    };
    $(function () {
        findPWD.init();
    });
</script>
</body>