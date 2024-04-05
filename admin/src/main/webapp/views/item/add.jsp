<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script>
    let item_add={
        init:function(){
            $('#add_form > #btn_add').click(()=>{
                let c = confirm("입력하시겠습니까?");
                if(c==true){
                    this.send();
                }

            <%--    $('#add_form').attr({--%>
            <%--        'action':'<c:url value="/cust/modifyImpl"/>',--%>
            <%--        'method':'POST'--%>
            <%--    });--%>
            <%--    --%>
            <%--});--%>

            <%--$('#modify_form>#btn_add').click(()=>{--%>
            <%--    let c = confirm('삭제하시겠습니까?');--%>
            <%--    if(c==true){--%>
            <%--        let id = $('#id').val();--%>
            <%--        location.href = '<c:url value="/cust/delete"/>?id='+id;--%>
            <%--    }--%>
            });
        },
        send:function(){
            $('#add_form').attr({
                'method':'post',
                'enctype':'multipart/form-data',
                'action':'<c:url value="/item/addimpl"/>'
            });
            $('#add_form').submit();
        }
    };
    $(function(){
        item_add.init();
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
                <form id="add_form">

                    <div class="form-group">
                        <label for="itemName">Name:</label>
                        <input type="text"  class="form-control" id="itemName" placeholder="Enter name" name="itemName">
                    </div>
                    <div class="form-group">
                        <label for="itemPrice">Price:</label>
                        <input type="number" class="form-control" id="itemPrice" placeholder="Enter name" name="itemPrice">
                    </div>
                    <div class="form-group">
                        <label for="image">Image:</label>
                        <input type="file" class="form-control" id="image" placeholder="Enter name" name="image">
                    </div>
                    <button type="button" id="btn_add" class="btn btn-primary">ADD</button>
                </form>
            </div>
        </div>
    </div>

</div>
