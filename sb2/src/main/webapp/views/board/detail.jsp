<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script>
    let modify={
        init:function(){
            $('#modify_form>#btn_delete').click(()=>{
                let c = confirm('삭제하시겠습니까?');
                if(c==true){
                    let id = $('#boardId').val();
                    location.href = '<c:url value="/board/delete"/>?id='+id;
                }
            });
            $('#modify_form>#btn_list').click(()=>{
                location.href = '<c:url value="/board/get"/>';
            });
            $('#modify_form > #btn_modify').click(()=>{
                let c = confirm('수정하시겠습니까?');
                if(c) this.send();
            });
        },
        send:function(){
            $('#modify_form').attr({
                'action':'<c:url value="/board/modify"/>',
                'method':'POST'
            });
            $('#modify_form').submit();
        }
    };
    $(function(){
        modify.init();
    });
</script>
<div class="container-fluid">

    <!-- Page Heading -->
    <h1 class="h3 mb-2 text-gray-800">Tables</h1>

    <!-- DataTales Example -->
    <div class="card shadow mb-4">
        <div class="card-header py-3">
            <h6 class="m-0 font-weight-bold text-primary">DataTables Example</h6>
        </div>
        <div class="card-body">
            <div class="table-responsive">
                <form id="modify_form">
                    <div class="form-group">
                        <label for="boardId">ID</label>
                        <input type="text" readonly=readonly value="${board.boardId}" class="form-control" id="boardId" placeholder="Enter id" name="boardId">

                    </div>
                    <div class="form-group">
                        <label for="custId">WRITER</label>
                        <input type="text" readonly=readonly value="${board.custId}" class="form-control" id="custId" placeholder="Enter id" name="custId">

                    </div>
                    <div class="form-group">
                        <label for="boardTitle">TITLE</label>
                        <input type="text" value="${board.boardTitle}"  class="form-control" id="boardTitle" placeholder="Enter name" name="boardTitle">
                    </div>
                    <div class="form-group">
                        <label for="boardContent">CONTENT</label>
                        <input type="text" value="${board.boardContent}"  class="form-control" id="boardContent" placeholder="Enter name" name="boardContent">
                    </div>
                    <div class="form-group">
                        등록일자
                        <h6>
                            <fmt:parseDate value="${ board.boardRegdate }"
                                           pattern="yyyy-MM-dd'T'HH:mm:ss" var="parsedDateTime" type="both" />
                            <fmt:formatDate pattern="yyyy년 MM월 dd일 hh시 mm분 ss초" value="${ parsedDateTime }" />
                        </h6>
                        수정일자
                        <h6>
                            <fmt:parseDate value="${ board.boardUpdate }"
                                           pattern="yyyy-MM-dd" var="parsedDateTime" type="both" />
                            <fmt:formatDate pattern="yyyy년 MM월 dd일" value="${ parsedDateTime }" />
                        </h6>
                    </div>
                    <div class="form-group">
                        <label for="boardCnt">cnt</label>
                        <input type="text" value="${board.boardCnt}" readonly=readonly class="form-control" id="boardCnt" placehoder="Enter image" name="boardCnt"/>
                    </div>
                    <button type="button" id="btn_list" class="btn btn-primary">LIST</button>
                    <c:if test="${board.custId.equals(sessionScope.id)}">
                        <button type="button" id="btn_modify" class="btn btn-primary">MODIFY</button>
                        <button type="button" id="btn_delete" class="btn btn-danger">DELETE</button>
                    </c:if>
                </form>
            </div>
        </div>
    </div>

</div>
