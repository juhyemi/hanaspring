<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!-- JSTL -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<link rel="stylesheet" href="<c:url value="/css/member/idFind.css"/>"/>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>회원아이디 찾기</title>
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css" integrity="sha384-zCbKRCUGaJDkqS1kPbPd7TveP5iyJE0EjAuZQTgFLD2ylzuqKfdKlfG/eSrtxUkn" crossorigin="anonymous">
    <!-- Bootstarp JS -->
    <script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-fQybjgWLrvvRgtW6bFlB7jaZrFsaBXjsOMm/tB9LTS58ONXgqbR9W8oWht/amnpF" crossorigin="anonymous"></script>

</head>
<body>
<div class="main">
    <form action="#" name="idFindForm">
        <table>
            <tr>
                <td colspan="2">아이디 찾기</td>
            </tr>
            <tr>
                <td colspan="2">아이디를 잊어버리셨나요?<br>회원님의 성명과 이메일을 입력하여 주세요.</td>
            </tr>
            <tr>
                <td style="width: 20%;">
                    <img src="../img/member/txt_join1.gif">
                    <img src="../img/member/txt_email.gif">
                </td>
                <td style="width: 80%;">
                    <input type="text" id="userName" name="userName">
                    <input type="text" class="emailText" id="userEmail" name="userEmail">
                </td>
            </tr>
        </table>
    </form>
    <div><input type="image" src="../img/member/btn_confirm.gif" id="btn_submit"></div>
    <div><input type="image" src="../img/member/btn_close.gif" onclick="window.close()"></div>
</div>
<script>
    let findID = {
        init: function () {
            $('#btn_register').click(function(){
                let id = $('#userID').val();
                let pwd = $('#userPWCheck').val();
                let name = $('#userName').val();

                //html 사이의 text는 .text()로 가져오고 form데이터는 .val()로 가져온다.
                if(id==''||id==null){
                    alert('ID를 입력 하세요');
                    $('#id').focus();
                    return;
                }
                if(pwd==''||pwd==null){
                    alert('pwd를 입력 하세요');
                    $('#pwd').focus();
                    return;
                }
                if(name==''||name==null){
                    alert('name 입력 하세요');
                    $('#userName').focus();
                    return;
                }
                register.send();
            });
        }
    };
    $(function () {
        findID.init();
    });
</script>

