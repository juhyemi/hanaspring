<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!-- JSTL -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<div id="adminMain">
    <!-- 사이드메뉴 -->
    <div id="adminSide">
        <ul>
            <li><a href="/admin/adminmember" class="adminSideActive">회원 관리</a></li>
            <li><a href="/admin/adminnotice">공지사항 관리</a></li>
            <li><a href="/admin_one2one">1:1문의 관리</a></li>
            <li><a href="/admin_qna">묻고답하기 관리</a></li>
            <li><a href="/admin_faq">FAQ 관리</a></li>
            <li><a href="/admin_product">제품 관리</a></li>
        </ul>
    </div>
    <!-- 메인 -->
    <div id="adminSection">
        <div class="adminDiv">
            <h3>회원관리</h3>
        </div>
        <div class="adminDiv">
            검색 옵션
            <select name="category" id="category">
                <option value="all">전체</option>
                <option value="id">아이디</option>
                <option value="name">성명</option>
                <option value="email">이메일</option>
            </select>
            <input type="text" name="searchWord" id="searchWord" value="">
            <input type="image" id="btn_search" src="../img/community/search.gif">
        </div>
        <div class="adminDiv">
            정렬
            <select class="size" name="order_select" id="order_select">
                <option value="id_asc" selected>아이디 오름차순</option>
                <option value="id_desc">아이디 내림차순</option>
                <option value="join_date_asc">가입일 오름차순</option>
                <option value="join_date_desc">가입일 내림차순</option>
            </select>
        </div>
        <div class="adminDiv2" id="tableTitle">
            <div>회원목록 1건</div>
            <div>한페이지 행수
                <select class="size" name="page_select" id="page_select">
                    <option value="page10" selected>10개씩 보기</option>
                    <option value="page10">20개씩 보기</option>
                    <option value="page10">50개씩 보기</option>
                </select>
            </div>
        </div>
        <div id="myTable">
            <table class="adminTable">
                <thead>
                <tr>
                    <th>아이디</th>
                    <th>성명</th>
                    <th>이메일</th>
                    <th>생일</th>
                    <th>가입일</th>
                    <th>임시비밀번호</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach var="m" items="${mList}">
                    <tr>
                        <td>${m.memberId}</td>
                        <td>${m.memberName}</td>
                        <td>${m.memberEmail}</td>
                        <td>${m.memberBirthDate}</td>
                        <td><fmt:formatDate  value="${m.memberJoinDate}" pattern="yyyy-MM-dd" /></td>
                        <td><button id="sendEmail">이메일보내기</button></td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
        </div>
    </div>
</div>

<script>
    let adminmem = {
        init: function () {
            let category='all';
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
                if(category=="all"){
                    adminmem.searchtotal(searchWord);
                }else{
                    adminmem.searchword(category, searchWord);
                }
            });
        },
        searchword:function (category,searchWord){
            $.ajax({
                url:'<c:url value="/admin/searchword"/>',
                data:{
                    "category":category,
                    "word":searchWord
                },
                success:(res)=>{
                    adminmem.adding(res);
                },
                error:(e)=>{console.log(e)}
            })
        },
        searchtotal:function (searchWord){
            $.ajax({
                url:'<c:url value="/admin/searchtotal"/>',
                data:{
                    "word":searchWord
                },
                success:(res)=>{
                    adminmem.adding(res);
                },
                error:(e)=>{console.log(e)}
            })
        },
        adding:function(res){
            let result = '검색 결과가 없습니다.';
            if(res.length>0){
                result=`<table class="adminTable"><thead><tr><th>아이디</th><th>성명</th><th>이메일</th><th>생일</th><th>가입일</th><th>임시비밀번호</th></tr></thead><tbody>`;
                for(let i=0; i<res.length; i++){
                    result+=`<tr><td>`;
                    result+=res[i].memberId;
                    result+=`</td><td>`;
                    result+=res[i].memberName;
                    result+=`</td><td>`;
                    result+=res[i].memberEmail;
                    result+=`</td><td>`;
                    result+=res[i].memberBirthDate;
                    result+=`</td><td>`;
                    const memberJoinDate = new Date(res[i].memberJoinDate);
                    // 날짜를 yyyy-mm-dd 형식으로 포맷팅
                    const year = memberJoinDate.getFullYear();
                    const month = String(memberJoinDate.getMonth() + 1).padStart(2, '0');
                    const day = String(memberJoinDate.getDate()).padStart(2, '0');
                    const formattedDate = year+`-`+month+`-`+day;
                    result+=formattedDate;
                    result+=`</td><td><button id="sendEmail">이메일보내기</button></td></tr>`;
                }
                result+=`</tbody></table>`
            }
            const element = document.getElementById('myTable');
            element.innerHTML = result;
        }
    };
    $(function () {
        adminmem.init();
    });


</script>