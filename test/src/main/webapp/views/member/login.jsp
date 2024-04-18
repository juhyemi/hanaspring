<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!-- JSTL -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<link rel="stylesheet" href="<c:url value="/css/member/login.css"/>">
    <title>로그인</title>

    <!-- Main CSS : Header, Main, Footer -->
    <link rel="stylesheet" href='<c:url value="/css/main.css"/>'>
    <link rel="stylesheet" href='<c:url value="/css/common.css"/>'>
    <link rel="stylesheet" href='<c:url value="/css/member/login.css"/>'>

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css" integrity="sha384-zCbKRCUGaJDkqS1kPbPd7TveP5iyJE0EjAuZQTgFLD2ylzuqKfdKlfG/eSrtxUkn" crossorigin="anonymous">
    <!-- Bootstarp JS -->
    <script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-fQybjgWLrvvRgtW6bFlB7jaZrFsaBXjsOMm/tB9LTS58ONXgqbR9W8oWht/amnpF" crossorigin="anonymous"></script>


<div class="commonSection1">
    <div class="commonContent1">
        <img src='<c:url value="/img/member/sub-visual01.jpg"/>'
             style="width: 100%; height: 100%;">
        <div class="commonContent2 text-center">
            <div>
                <h3>MEMBER</h3>
            </div>
            <div>
                <p><img src='<c:url value="/img/icon-home.png"/>'> > 로그인</p>
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
                    <input type="text" id="loginID" name="loginID"> <br>
                    <input type="password" id="loginPW" name="loginPW">
                </td>
                <td>
                    <input class="loginImg" id="btn_login" type="image" src='<c:url value="/img/member/btn_login.gif"/>'>
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
                               src='<c:url value="/img/member/btn_id_find.gif"/>'>
                    </td>
                </tr>
                <tr>
                    <td>-비밀번호를 잊으셨나요?</td>
                    <td>
                        <input type="image"
                               onclick="window.open('/member/passwordFind','비밀번호찾기', 'width=430,height=300,location=no,status=no,scrollbars=no')",
                               src='<c:url value="/img/member/btn_pw_find.gif"/>' >
                    </td>
                </tr>
            </table>
        </div>

    </div>
</div>
<script>
    let login = {
        init: function () {
            $('#btn_login').click(()=>{
                let id = $('#loginID').val();
                let pwd = $('#loginPW').val();
                if(id==''||id==null){
                    alert('ID를 입력 하세요');
                    return;
                }
                if(pwd==''||pwd==null){
                    alert('PW를 입력 하세요');
                    return;
                }
                $.ajax({
                    url:'<c:url value="/member/loginimpl"/>',
                    data:{
                        "id":id,
                        "pwd":pwd
                    },
                    success:(result)=>{
                        let msg = '로그인 되었습니다.';
                        if(result=='1'){
                            msg = '아이디가 존재하지 않습니다.';
                            alert(msg);
                            return;
                        }
                        if(result=='2'){
                            msg = '비밀번호가 다릅니다';
                            alert(msg);
                            return;
                        }
                        if(result=='0'){
                            alert(msg);
                            window.location.href="/";
                        }
                    }
                })
            });
        }
    };
    $(function () {
        login.init();
    });
</script>