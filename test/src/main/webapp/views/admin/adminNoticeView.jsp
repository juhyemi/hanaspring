<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!-- JSTL -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>

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
        <div class="noticeViewTitle adminDiv2">
            <span>${nDto.noticeTitle}</span>
            <span>
            <span>글쓴이:${nDto.noticeMemberId}</span>
            <span>글번호:${nDto.noticeIdx}</span>
          </span>
        </div>
        <div class="adminDiv2">
            <div class="noticeViewContent">
            <textarea rows="5" cols="50" id="noticeContent" name="noticeContent">${nDto.noticeContent}</textarea>
            </div>
        </div>
        <div class="noticeViewBtns adminDiv2">
            <div>
                <a href="#" id="btn_modify">수정</a>
                <a href="/admin_notice_delete?notice_idx=1">삭제</a>
            </div>
            <div>
                <a href=<c:url value="/admin/adminnotice"/>>목록</a>
            </div>
        </div>
    </div>
</div>
<script>
    let modifynotice = {
        init: function () {
            $('#btn_modify').click(()=>{
                let noticeContent = $('#noticeContent').val();
                if(noticeContent==''||noticeContent==null){
                    alert('공지사항 수정할 내용을 입력하세요');
                    return;
                }
                modifynotice.send(noticeContent);
            });
        },
        send: function(noticeContent){
            $.ajax({
                url:'<c:url value="/admin/noticemodify"/>',
                data:{
                    "content":noticeContent,
                    "no":${nDto.noticeIdx}
                },
                success:(res)=>{
                    if(res!=0){
                        alert('수정되었습니다.');
                        window.location.href='<c:url value="/admin/adminnotice"/>'
                    }else{
                        alert('수정 실패되었습니다.');
                        window.location.href='<c:url value="/admin/adminnotice"/>'
                    }

                },
                error:(e)=>{console.log(e)}
            })
        }
    };
    $(function () {
        modifynotice.init();
    });
</script>