<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!-- JSTL -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<link rel="stylesheet" href="<c:url value="/css/member/login.css"/>">
    <title>로그인</title>

    <!-- Main CSS : Header, Main, Footer -->
    <link rel="stylesheet" href="../css/main.css">
    <link rel="stylesheet" href="../css/common.css">
    <link rel="stylesheet" href="../css/member/login.css">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css" integrity="sha384-zCbKRCUGaJDkqS1kPbPd7TveP5iyJE0EjAuZQTgFLD2ylzuqKfdKlfG/eSrtxUkn" crossorigin="anonymous">
    <!-- Bootstarp JS -->
    <script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-fQybjgWLrvvRgtW6bFlB7jaZrFsaBXjsOMm/tB9LTS58ONXgqbR9W8oWht/amnpF" crossorigin="anonymous"></script>


<div class="commonSection1">
    <div class="commonContent1">
        <img src="../img/member/sub-visual01.jpg"
             style="width: 100%; height: 100%;">
        <div class="commonContent2 text-center">
            <div>
                <h3>MEMBER</h3>
            </div>
            <div>
                <p><img src="../img/icon-home.png"> > 로그인</p>
            </div>
        </div>
    </div>
</div>

<!-- 로그인 -->
<div class="loginForm container text-center">
    <div class="loginSection1">
        <div><h3>로그인</h3></div>
        <div><p>The design and maintenance are excellent.</p></div>
    </div>
    <div class="loginMain">
        <table class="main1">
            <tr>
                <td>
                    아이디 <br>
                    비밀번호
                </td>
                <td>
                    <input type="text" name="loginID"> <br>
                    <input type="password" name="loginPW">
                </td>
                <td>
                    <input class="loginImg" type="image" src="../img/member/btn_login.gif">
                </td>
            </tr>
        </table>
        <div class="loginSection2">
            <table class="main2">
                <tr>
                    <td>-아이디를 잊으셨나요?</td>
                    <td>
                        <input type="image"
                               onclick="window.open('/member/idFind','아이디찾기', 'width=430,height=300,location=no,status=no,scrollbars=no')",
                               src="../img/member/btn_id_find.gif" >
                    </td>
                </tr>
                <tr>
                    <td>-비밀번호를 잊으셨나요?</td>
                    <td>
                        <input type="image"
                               onclick="window.open('/member/passwordFind','비밀번호찾기', 'width=430,height=300,location=no,status=no,scrollbars=no')",
                               src="../img/member/btn_pw_find.gif" >
                    </td>
                </tr>
            </table>
        </div>

    </div>
</div>