<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!-- JSTL -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<link rel="stylesheet" href="<c:url value="/css/main.css"/>">
<link rel="stylesheet" href="<c:url value="/css/common.css"/>">
<link rel="stylesheet" href="<c:url value="/css/customer/customer03.css"/>">
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>FAQ</title>

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

<!-- FAQ : 상세 -->
<div class="communitySection2 container text-center">
    <div>
        <div>묻고답하기</div>
        <div>The design and maintenance are excellent.</div>
    </div>
    <div class="faq">
        <table>
            <tr>
                <td>제목</td>
                <td>묻고답하기</td>
            </tr>
            <tr>
                <td>작성자</td>
                <td>작성자1</td>
            </tr>
            <tr>
                <td>작성일</td>
                <td>2024-04-16</td>
            </tr>
            <tr>
                <td colspan="2">
                    <div style="text">
                        내용
                    </div>
                </td>
            </tr>
        </table>
    </div>
    <div class="list">
        <img src='<c:url value="/img/customer/list.gif"/>'
             onclick="window.location.href='<c:url value="/support/qna"/>'">
    </div>
</div>