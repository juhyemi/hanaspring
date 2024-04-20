<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!-- JSTL -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
    <div class="qna" id="qna">
        <table>
            <tr>
                <th>번호</th>
                <th>제목</th>
                <th>작성자</th>
                <th>작성일</th>
            </tr>
            <c:forEach items="${qList}" var="q" varStatus="status">
                <tr onclick="window.open('<c:out value="/support/enterPassword"/>/${q.qnaIdx}','비밀번호입력', 'width=430,height=300,location=no,status=no,scrollbars=no')">
                    <td>${status.index+1}</td>
                    <td>${q.qnaTitle}</td>
                    <td>${q.qnaName}</td>
                    <td><fmt:formatDate  value="${q.qnaDate}" pattern="yyyy-MM-dd" /></td>
                </tr>
            </c:forEach>
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
                <select name="category" id="">
                    <option value="title">제목</option>
                    <option value="content">내용</option>
                    <option value="name">작성자</option>
                </select>
            </td>
            <td>
                <input type="text" id="searchWord">
            </td>
            <td>
                <input type="image" id="btn_search" src='<c:url value="/img/customer/search.gif"/>'>
            </td>
        </tr>
    </table>
</div>

<script>
    let qnaLs = {
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
                qnaLs.send(category, searchWord);
            });
        },
        send:function (category,searchWord){
            $.ajax({
                url:'<c:url value="/support/search"/>',
                data:{
                    "category":category,
                    "word":searchWord
                },
                success:(res)=>{
                    console.log(res);
                    let result = "결과가 없습니다.";
                    if(res.length>0) {
                        result="<table><tr><th>번호</th><th>제목</th><th>작성자</th><th>작성일</th></tr>";
                        for(let i=1; i<=res.length; i++){
                            result+=`<tr onclick="window.open('<c:out value="/support/enterPassword"/>/`
                            result+=res[i-1].qnaIdx;
                            result+=`','비밀번호입력', 'width=430,height=300,location=no,status=no,scrollbars=no')">
                    <td>`;
                            result+=i;
                            result+=`</td><td>`
                            result+=res[i-1].qnaTitle;
                            result+=`</td><td>`;
                            result+=res[i-1].qnaName;
                            result+=`</td><td>`;
                            const dateinfo = new Date(res[i - 1].qnaDate);
                            const year = dateinfo.getFullYear();
                            const month = String(dateinfo.getMonth() + 1).padStart(2, '0');
                            const day = String(dateinfo.getDate()).padStart(2, '0');
                            const formattedDate = year+`-`+month+`-`+day;
                            result+= formattedDate;
                            result+=`</td></tr>`;
                        }
                        result+=`</table>`;

                    }
                    const element = document.getElementById('qna');
                    element.innerHTML = result;
                },
                error:(e)=>{console.log(e)}
            })
        }
    };
    $(function () {
        qnaLs.init();
    });
</script>