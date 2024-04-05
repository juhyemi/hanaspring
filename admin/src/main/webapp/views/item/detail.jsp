<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script>
    let modify={
        init:function(){
            <%--$('#modify_form>#btn_delete').click(()=>{--%>
            <%--    let c = confirm('삭제하시겠습니까?');--%>
            <%--    if(c==true){--%>
            <%--        let id = $('#id').val();--%>
            <%--        location.href = '<c:url value="/cust/delete"/>?id='+id;--%>
            <%--    }--%>
            <%--});--%>
            $('#modify_form > #btn_modify').click(()=>{
               let c = confirm('수정하시겠습니까?');
               if(c) this.send();
            });
        },
        send:function(){
            $('#modify_form').attr({
                'action':'<c:url value="/item/modify"/>',
                'method':'POST',
                'enctype':'multipart/form-data'
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
                        <label for="itemId">ID</label>
                        <input type="text" readonly=readonly value="${item.itemId}" class="form-control" id="itemId" placeholder="Enter id" name="itemId">

                    </div>
                    <div class="form-group">
                        <label for="itemName">Name:</label>
                        <input type="text" value="${item.itemName}"  class="form-control" id="itemName" placeholder="Enter name" name="itemName">
                    </div>
                    <div class="form-group">
                        <label for="itemPrice">Price:</label>
                        <input type="number" value="${item.itemPrice}"  class="form-control" id="itemPrice" placeholder="Enter name" name="itemPrice">
                    </div>
                    <div class="form-group">
                        <h6>
                            <fmt:parseDate value="${ item.regDate }"
                                           pattern="yyyy-MM-dd" var="parsedDateTime" type="both" />
                            <fmt:formatDate pattern="yyyy년 MM월 dd일" value="${ parsedDateTime }" />
                        </h6>
                        <h6>
                            <fmt:parseDate value="${ item.updateDate }"
                                           pattern="yyyy-MM-dd" var="parsedDateTime" type="both" />
                            <fmt:formatDate pattern="yyyy년 MM월 dd일" value="${ parsedDateTime }" />
                        </h6>
                        <img src="<c:url value="/imgs/"/>${item.imgName}">
                        <input type="hidden" name="imgName" value="${item.imgName}"/>
                    </div>
                    <div class="form-group">
                        <label for="newimage">New Image: </label>
                        <input type="file" class="form-control" id="newimage" placehoder="Enter image" name="image"/>
                    </div>
                    <button type="button" id="btn_modify" class="btn btn-primary">MODIFY</button>
                    <button type="button" id="btn_delete" class="btn btn-danger">DELETE</button>
                </form>
            </div>
        </div>
    </div>

</div>
