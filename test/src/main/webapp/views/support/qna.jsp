<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!-- JSTL -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<link rel="stylesheet" href="<c:url value="/css/main.css"/>">
<link rel="stylesheet" href="<c:url value="/css/common.css"/>">
<link rel="stylesheet" href="<c:url value="/css/customer/customer02.css"/>">

    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>묻고답하기</title>

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
                <p><img src='<c:url value="/img/icon-home.png"/>'> > 고객지원 > 묻고답하기</p>
            </div>
        </div>
    </div>
</div>


<!-- 묻고답하기 -->
<div class="communitySection2 container text-center">
    <div>
        <div>묻고답하기</div>
        <div>The design and maintenance are excellent.</div>
    </div>
    <div class="qna">
        <table>
            <tr>
                <th>번호</th>
                <th>제목</th>
                <th>작성자</th>
                <th>작성일</th>
            </tr>
            <tr onclick="window.open('/support/enterPassword','비밀번호입력', 'width=430,height=300,location=no,status=no,scrollbars=no')">
                <td>5</td>
                <td><img src='<c:url value="/img/customer/icon_sct.gif"/>'>문의사항에 대해 자세한 답변 부탁합니다.</td>
                <td>hong</td>
                <td>2019-06-19</td>
            </tr>
            <tr onclick="openWindow(4)">
                <td>4</td>
                <td><img src='<c:url value="/img/customer/icon_sct.gif"/>'>문의사항에 대해 자세한 답변 부탁합니다.</td>
                <td>hong</td>
                <td>2019-06-19</td>
            </tr>
            <tr onclick="openWindow(3)">
                <td>3</td>
                <td><img src='<c:url value="/img/customer/icon_sct.gif"/>'>문의사항에 대해 자세한 답변 부탁합니다.</td>
                <td>hong</td>
                <td>2019-06-19</td>
            </tr>
            <tr onclick="openWindow(2)">
                <td>2</td>
                <td><img src='<c:url value="/img/customer/icon_sct.gif"/>'>문의사항에 대해 자세한 답변 부탁합니다.</td>
                <td>hong</td>
                <td>2019-06-19</td>
            </tr>
            <tr onclick="openWindow(1)">
                <td>1</td>
                <td><img src='<c:url value="/img/customer/icon_sct.gif"/>'>문의사항에 대해 자세한 답변 부탁합니다.</td>
                <td>hong</td>
                <td>2019-06-19</td>
            </tr>
        </table>
    </div>
</div>

<!-- search bar -->
<div class="search container">
    <div>
        <img onclick="window.location.href='#'"
             src='<c:url value="/img/customer/write.gif"/>'>
    </div>
    <table>
        <tr>
            <td>
                <select name="내용" id="">
                    <option value="">제목</option>
                    <option value="">내용</option>
                    <option value="">작성자</option>
                </select>
            </td>
            <td>
                <input type="text">
            </td>
            <td>
                <input type="image" src='<c:url value="/img/customer/search.gif"/>'>
            </td>
        </tr>
    </table>
</div>