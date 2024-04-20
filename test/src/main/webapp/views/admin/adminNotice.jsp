<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!-- JSTL -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<div id="adminMain">
    <!-- 사이드메뉴 -->
    <div id="adminSide">
        <ul>
            <li><a href=<c:url value="/admin/adminmember"/>>회원 관리</a></li>
            <li>
                <a href=<c:url value="/admin/adminnotice"/> class="adminSideActive">공지사항 관리</a>
            </li>
        </ul>
    </div>
    <!-- 메인 -->
    <div id="adminSection">
        <div class="adminDiv">
            <h3>공지사항 관리</h3>
        </div>
        <div class="adminDiv">
            검색 옵션
            <select name="search_select" id="search_select">
                <option value="all">전체</option>
                <option value="title">제목</option>
                <option value="content">내용</option>
                <option value="member_id">작성자 아이디</option>
            </select>
            <input type="text" name="keyword" id="keyword"/>
            <input type="image" id="btn_search" src="../img/community/search.gif" />
        </div>
        <div class="adminDiv">
            정렬
            <select class="size" name="order_select" id="order_select">
                <option value="member_id_asc">아이디 오름차순</option>
                <option value="member_id_desc">아이디 내림차순</option>
                <option value="date_asc">작성일 오름차순</option>
                <option value="date_desc">작성일 내림차순</option>
            </select>
        </div>
        <div class="adminDiv2" id="tableTitle">
            <div id="listcnt">${cnt}</div>
            <div>
                한페이지 행수
                <select class="size" name="page_select" id="page_select">
                    <option value="all" >전체 보기</option>
                    <option value="5">5개씩 보기</option>
                    <option value="10">10개씩 보기</option>
                </select>
            </div>
        </div>
        <div id="resultTable">
            <table class="adminTable">
                <thead>
                <tr>
                    <th>글번호</th>
                    <th>제목</th>
                    <th>글쓴이</th>
                    <th>작성일</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach var="n" items="${nList}" varStatus="status">
                <tr
                        onclick="location.href='<c:url value="/admin/adminnoticeview"/>/${n.noticeIdx}';"
                        style="cursor: pointer"
                >
                    <td>${status.index+1}</td>
                    <td>${n.noticeTitle}</td>
                    <td>${n.noticeMemberId}</td>
                    <td><fmt:formatDate value="${n.noticeDate}" pattern="yyyy-MM-dd" /></td>
                </tr>
                </c:forEach>
                </tbody>
            </table>
        </div>

        <div class="pageNav adminDiv2">
            <div><a href=<c:url value="/admin/writepage"/>>공지글 쓰기</a></div>
        </div>
    </div>
</div>
<script>
    let adminnotice = {
        init: function () {
            //검색옵션
            let category='all';
            $("select[name=search_select]").change(function(){
                category = $(this).val();
            });
            $('#btn_search').click(function(){
                let keyword = $('#keyword').val();
                if(keyword==''||keyword==null){
                    alert('검색어를 입력 하세요');
                    $('#keyword').focus();
                    return;
                }
                if(category=="all"){
                    adminnotice.searchtotal(keyword);
                }else{
                    adminnotice.searchword(category, keyword);
                }
            });
            //정렬 옵션
            let sortoption = 'member_id_asc';
            let sortstandard = 'member_id';
            let sortorder = 'asc';
            $("select[name=order_select]").change(function(){
                sortoption = $(this).val();
                if(sortoption=='member_id_asc'){
                    sortstandard='member_id';
                    sortorder = 'asc';
                }else if(sortoption=='member_id_desc') {
                    sortstandard = 'member_id';
                    sortorder = 'desc';
                }else if(sortoption=='date_asc'){
                    sortstandard='date';
                    sortorder='asc';
                }else if(sortoption=='date_desc'){
                    sortstandard='date';
                    sortorder='desc';
                }
                adminnotice.orderingoption(sortstandard, sortorder);
            });
            let sortcnt = 'all';
            $("select[name=page_select]").change(function(){
                sortcnt = $(this).val();
                adminnotice.searchcnt(sortcnt);
            });
        },
        searchword:function (category,searchWord){
            $.ajax({
                url:'<c:url value="/admin/noticesearchword"/>',
                data:{
                    "category":category,
                    "word":searchWord
                },
                success:(res)=>{
                    adminnotice.adding(res);
                },
                error:(e)=>{console.log(e)}
            })
        },
        searchtotal:function (keyword){
            $.ajax({
                url:'<c:url value="/admin/noticetotal"/>',
                data:{
                    "keyword1":keyword
                },
                success:(res)=>{
                    console.log(res);
                    adminnotice.adding(res);
                },
                error:(e)=>{console.log(e)}
            })
        },
        orderingoption:function(sortstandard, sortorder){
            $.ajax({
                url:'<c:url value="/admin/noticesearchorder"/>',
                data:{
                    "standard":sortstandard,
                    "sortorder":sortorder
                },
                success:(res)=>{
                    adminnotice.adding(res);
                },
                error:(e)=>{console.log(e)}
            })
        },
        searchcnt:function(sortcnt){
            $.ajax({
                url:'<c:url value="/admin/noticesearchcnt"/>',
                data:{
                    "cnt":sortcnt
                },
                success:(res)=>{
                    adminnotice.adding(res);
                },
                error:(e)=>{console.log(e)}
            })
        },
        adding:function(res){
            let result = '검색 결과가 없습니다.';
            if(res.length>0&&res!=null){
                result=`<table class="adminTable"><thead> <tr><th>글번호</th><th>제목</th><th>글쓴이</th><th>작성일</th></tr></thead><tbody>`;
                for(let i=0; i<res.length; i++){
                    result+=`<tr onclick="location.href='<c:url value="/admin/adminnoticeview"/>/`
                    result+=res[i].noticeIdx;
                    result+=`';"style="cursor: pointer"><td>`
                    result+=(i+1);
                    result+=`</td><td>`;
                    result+=res[i].noticeTitle;
                    result+=`</td><td>`;
                    result+=res[i].noticeMemberId;
                    result+=`</td><td>`;
                    const noticeDa = new Date(res[i].noticeDate);
                    const year = noticeDa.getFullYear();
                    const month = String(noticeDa.getMonth() + 1).padStart(2, '0');
                    const day = String(noticeDa.getDate()).padStart(2, '0');
                    const formattedDate = year+`-`+month+`-`+day;
                    result+=formattedDate;
                    result+=`</td></tr>`;
                }
                result+=`</tbody></table>`;
            }
            const element = document.getElementById('resultTable');
            element.innerHTML = result;
            let totalcnt = '목록 '+res.length+'건';
            const noticecnt = document.getElementById('listcnt');
            noticecnt.innerHTML = totalcnt;
        }
    };
    $(function () {
        adminnotice.init();
    });


</script>