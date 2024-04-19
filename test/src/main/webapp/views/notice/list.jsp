<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!-- JSTL -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>공지사항</title>

    <!-- Main CSS : Header, Main, Footer -->
    <link rel="stylesheet" href="<c:url value="/css/main.css"/>">
    <link rel="stylesheet" href="<c:url value="/css/common.css"/>">
    <link rel="stylesheet" href="<c:url value="/css/community/community.css"/>">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css" integrity="sha384-zCbKRCUGaJDkqS1kPbPd7TveP5iyJE0EjAuZQTgFLD2ylzuqKfdKlfG/eSrtxUkn" crossorigin="anonymous">
    <!-- Bootstarp JS -->
    <script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-fQybjgWLrvvRgtW6bFlB7jaZrFsaBXjsOMm/tB9LTS58ONXgqbR9W8oWht/amnpF" crossorigin="anonymous"></script>


<!-- 공지사항 -->
<!-- COMMON -->
<div class="commonSection1">
    <div class="commonContent1">
        <img src='<c:url value="/img/member/sub-visual02.jpg"/>'
             style="width: 100%; height: 100%;">
        <div class="commonContent2 text-center">
            <div>
                <h3>COMMUNITY</h3>
            </div>
            <div>
                <p><img src='<c:url value="/img/icon-home.png"/>'> > 커뮤니티 > 공지사항</p>
            </div>
        </div>
    </div>
</div>
<!-- COMMON - 드랍다운 -->
<nav class="navbar navbar-expand-lg navbar-light bg-light">
    <a class="navbar-brand" href='<c:url value="/"/>' ><button class="homeBtn">H</button></a>
    <ul class="navbar-nav mr-auto navbar-nav-scroll"
        style="max-height: 100px;">

        <li class="nav-item dropdown dropdownHide">
            <a class="nav-link dropdown-toggle" href="#" id="navbarScrollingDropdown" role="button"
               data-toggle="dropdown" aria-expanded="false">
                커뮤니티
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
                공지사항
            </a>
            <ul class="dropdown-menu asd">
                <li><a class="dropdown-item" href="#">공지사항</a></li>
                <li><hr class="dropdown-divider"></li>
                <li><a class="dropdown-item" href="#">홍보자료</a></li>
                <li><hr class="dropdown-divider"></li>
                <li><a class="dropdown-item" href="#">채용안내</a></li>
            </ul>
        </li>
    </ul>
    </div>
</nav>

<!-- 공지사항 -->
<div class="communitySection2 container text-center">
    <div>
        <div>공지사항</div>
        <div>The design and maintenance are excellent.</div>
    </div>
    <div class="Notice" id="searchTable">
        <table>
            <tr>
                <th>번호</th>
                <th>제목</th>
                <th>작성일</th>
            </tr>
            <c:forEach items="${noticeList}" var="n" varStatus="status">
                <tr>
                    <td>${status.index+1}</td>
                    <td> <a href='<c:out value="/notice/detail"/>/${n.noticeIdx}'>${n.noticeTitle}</a></td>
                    <td><fmt:formatDate  value="${n.noticeDate}" pattern="yyyy-MM-dd" /></td>
                </tr>
            </c:forEach>
        </table>
    </div>
</div>


<!-- search bar -->
<div class="search container">
    <table>
        <tr>
            <td>
                <select name="category">
                    <option value="title">제목</option>
                    <option value="content">내용</option>
                </select>
            </td>
            <td>
                <input id="searchWord" type="text">
            </td>
            <td>
                <input type="image" id="btn_search" src='<c:url value="/img/community/search.gif"/>'>
            </td>
        </tr>
    </table>
</div>
<script>
    let noticeLs = {
        init: function () {
            let category='title';
            $("select[name=category]").change(function(){
                category = $(this).val();
            });
            $('#btn_search').click(function(){
                let searchWord = $('#searchWord').val();
                if(searchWord==''||searchWord==null){
                    alert('검색어를 입력 하세요');
                    $('#searchWord').focus();
                    return;
                }
                noticeLs.send(category, searchWord);
            });
        },
        send:function (category,searchWord){
            $.ajax({
                url:'<c:url value="/notice/search"/>',
                data:{
                    "category":category,
                    "word":searchWord
                },
                success:(res)=>{
                    //window.location.href='<c:url value="/notice/searchresult"/>';
                    let result = "결과가 없습니다.";
                    if(res.length>0) {
                        result = "<table><tr><th>번호</th><th>제목</th> <th>작성일</th></tr>";
                        for (let i = 1; i <= res.length; i++) {
                            result += `<tr><td>`;
                            result += i
                            result += `</td><td><a href='<c:out value="/notice/detail"/>/`;
                            result += res[i - 1].noticeIdx;
                            result += `'>`;
                            result += res[i - 1].noticeTitle;
                            result += `</a></td><td>`;
                            result += res[i - 1].noticeDate;
                            result += `</td></tr>`
                        }
                        result += "</table>";
                    }
                    const element = document.getElementById('searchTable');
                    element.innerHTML = result;
                },
                error:(e)=>{console.log(e)}
            })
        }
    };
    $(function () {
        noticeLs.init();
    });
</script>