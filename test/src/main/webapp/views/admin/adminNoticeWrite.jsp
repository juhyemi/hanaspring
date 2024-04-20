<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!-- JSTL -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>

<div id="adminMain">
    <!-- 사이드메뉴 -->
    <div id="adminSide">
        <ul>
            <li><a href=<c:url value="/admin/adminmember"/>>회원 관리</a></li>
            <li><a href=<c:url value="/admin/adminnotice"/> class="adminSideActive">공지사항 관리</a></li>
        </ul>
    </div>
    <!-- 메인 -->
    <div id="adminSection">
        <div class="adminDiv">
            <h3>공지사항 관리</h3>
        </div>
        <div class="noticeWriteTitle adminDiv2">
            <!-- <select name="type_select" id="type_select">
        <option value="normal" selected>일반공지</option>
        <option value="important">중요공지</option>
      </select> -->
            <label style="width: 100px;">타이틀</label>
            <input type="text" name="noticeTitle" id="noticeTitle" value="">
        </div>
        <div class="adminDiv2">
            <textarea rows="5" cols="50" id="noticeContent" name="noticeContent"></textarea>

        </div>
        <div class="noticeWriteBtns adminDiv2">
            <input type="submit" id="btn_submit" value="등록">
            <input type="button" onclick="location.href='<c:url value="/admin/adminnotice"/>'" value="취소">
        </div>

    </div>
</div>


<script src="https://cdn.ckeditor.com/4.15.1/standard/ckeditor.js"></script>
<!-- <script>CKEDITOR.replace('editor4');</script> -->
<script>
    let writenotice = {
        init: function () {
            $('#btn_submit').click(()=>{
                let noticeTitle = $('#noticeTitle').val();
                let noticeContent = $('#noticeContent').val();
                if(noticeTitle==''||noticeTitle==null){
                    alert('공지사항 타이틀을 입력하세요');
                    return;
                }
                if(noticeContent==''||noticeContent==null){
                    alert('공지사항 내용을 입력하세요');
                    return;
                }
                writenotice.send(noticeTitle,noticeContent);
            });
        },
        send: function(noticeTitle,noticeContent){
            $.ajax({
                url:'<c:url value="/admin/noticewrite"/>',
                data:{
                    "title":noticeTitle,
                    "content":noticeContent
                },
                success:(res)=>{
                    alert('공지사항이 등록되었습니다.');
                    window.location.href=`<c:url value="/admin/adminnotice"/>`;
                },
                error:(e)=>{console.log(e)}
            })
        }
    };
    $(function () {
        writenotice.init();
    });


</script>