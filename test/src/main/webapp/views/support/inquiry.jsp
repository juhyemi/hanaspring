<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!-- JSTL -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>

    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>1:1문의</title>

    <!-- Main CSS : Header, Main, Footer -->
    <link rel="stylesheet" href="<c:url value="/css/main.css"/>">
    <link rel="stylesheet" href="<c:url value="/css/common.css"/>">
    <link rel="stylesheet" href="<c:url value="/css/customer/customer01.css"/>">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css" integrity="sha384-zCbKRCUGaJDkqS1kPbPd7TveP5iyJE0EjAuZQTgFLD2ylzuqKfdKlfG/eSrtxUkn" crossorigin="anonymous">
    <!-- Bootstarp JS -->
    <script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-fQybjgWLrvvRgtW6bFlB7jaZrFsaBXjsOMm/tB9LTS58ONXgqbR9W8oWht/amnpF" crossorigin="anonymous"></script>

<!-- 1:1문의 -->
<!-- COMMON -->
<div class="commonSection1">
    <div class="commonContent1">
        <img src='<c:url value="/img/member/sub-visual02.jpg"/>'
             style="width: 100%; height: 100%;">
        <div class="commonContent2 text-center">
            <div>
                <h3>COSTOMER</h3>
            </div>
            <div>
                <p><img src='<c:url value="/img/icon-home.png"/>'> > 고객지원 > 1:1문의</p>
            </div>
        </div>
    </div>
</div>
<!-- COMMON - 드랍다운 -->
<nav class="navbar navbar-expand-lg navbar-light bg-light">
    <a class="navbar-brand" href='<c:url value="/"/>'<button class="homeBtn">H</button></a>
    <ul class="navbar-nav mr-auto navbar-nav-scroll"
        style="max-height: 100px;">

        <li class="nav-item dropdown dropdownHide">
            <a class="nav-link dropdown-toggle" href="#" id="navbarScrollingDropdown" role="button"
               data-toggle="dropdown" aria-expanded="false">
                고객지원
            </a>
            <ul class="dropdown-menu" aria-labelledby="navbarScrollingDropdown">
                <li><a class="dropdown-item" href="#">회사소개</a></li>
                <li><hr class="dropdown-divider"></li>
                <li><a class="dropdown-item" href="#">사업분야</a></li>
                <li><hr class="dropdown-divider"></li>
                <li><a class="dropdown-item" href="#">제품안내</a></li>
                <li><hr class="dropdown-divider"></li>
                <li><a class="dropdown-item" href="#">커뮤니티</a></li>
                <li><hr class="dropdown-divider"></li>
                <li><a class="dropdown-item" href="#">고객지원</a></li>
            </ul>
        </li>

        <li class="nav-item dropdown">
            <a class="nav-link dropdown-toggle" href="#" id="navbarScrollingDropdown"
               role="button" data-toggle="dropdown" aria-expanded="false">
                1:1문의
            </a>
            <ul class="dropdown-menu asd">
                <li><a class="dropdown-item" href='<c:url value="#"/>'>1:1문의</a></li>
                <li><hr class="dropdown-divider"></li>
                <li><a class="dropdown-item" href="#">묻고답하기</a></li>
                <li><hr class="dropdown-divider"></li>
                <li><a class="dropdown-item" href="#">FAQ</a></li>
            </ul>
        </li>
    </ul>
    </div>
</nav>

<!-- 1:1문의 -->
<div class="communitySection2 container text-center">
    <div>
        <div>1:1문의</div>
        <div>The design and maintenance are excellent.</div>
    </div>
    <div class="question">
        <form id="questionForm" name="questionForm">
            <table>
                <tr>
                    <td>구분</td>
                    <td><select name="cate">
                        <option value="1">로그인</option>
                        <option value="2">회원가입</option>
                        <option value="3">이용안내</option>
                    </select>
                    </td>
                </tr>
                <tr>
                    <td>성명</td>
                    <td><input type="text" class="inputStyle1" id="name" name="one2oneName"></td>
                </tr>
                <tr>
                    <td>전화번호</td>
                    <td><input type="text" class="inputStyle1" id="tel" name="one2onePhone"></td>
                </tr>
                <tr>
                    <td>이메일</td>
                    <td><input type="text" class="inputStyle2" id="email" name="one2oneEmail"></td>
                </tr>
                <tr>
                    <td>주소</td>
                    <td><input type="text" class="inputStyle2" id="address" name="one2oneAddress"></td>
                </tr>
                <tr>
                    <td>제목</td>
                    <td><input type="text" class="inputStyle2" id="title" name="one2oneTitle"></td>
                </tr>
                <tr>
                    <td>설명</td>
                    <td><textarea id="description" rows="10" style="width: 90%;" name="one2oneContent"></textarea></td>
                </tr>
            </table>
        </form>
    </div>
    <div class="btn">
        <input type="image" id="btn_submit" src='<c:url value="/img/customer/btn_confirm.gif"/>'>
        <input type="image" src='<c:url value="/img/customer/btn_cancel.gif"/>'>
    </div>
</div>
<script>
    let inquery={
        init:function(){
            $('#btn_submit').click(()=>{
                var name = $('#name').val();
                var tel = $('#tel').val();
                var email = $('#email').val();
                var address = $('#address').val();
                var title = $('#title').val();
                var description = $('#description').val();
                if(name==''||name==null) {
                    alert("이름을 입력하세요");
                    return;
                }
                if(tel==''||tel==null) {
                    alert("전화번호를 입력하세요");
                    return;
                }
                if(email==''||email==null) {
                    alert("이메일을 입력하세요");
                    return;
                }
                if(address==''||address==null) {
                    alert("주소를 입력하세요");
                    return;
                }
                if(title==''||title==null) {
                    alert("제목을 입력하세요");
                    return;
                }
                if(description==''||description==null) {
                    alert("설명을 입력하세요");
                    return;
                }
                inquery.send();
            });
        },
        send:function(){
            let flag = confirm("등록하시겠습니까?");
            if(flag){
                $('#questionForm').attr({
                    'method':'post',
                    'action':'<c:url value="/support/addInquery"/>'
                });
                $('#questionForm').submit();
            }
        }
    };
    $(function(){
        inquery.init();
    });
</script>