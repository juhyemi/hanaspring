<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script>
    let item_add={
        init:function(){
            $('#add_form > #btn_write').click(()=>{
                let c = confirm("입력하시겠습니까?");
                if(c==true){
                    this.send();
                }
            });
        },
        send:function(){
            $('#add_form').attr({
                'method':'post',
                'action':'<c:url value="/board/write"/>'
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
                        <label for="title">Title</label>
                        <input type="text"  class="form-control" id="title" placeholder="Enter title" name="boardTitle">
                    </div>
                    <div class="form-group">
                        <label for="content">Content</label>
                        <textarea type="text" class="form-control" id="content" name="boardContent"></textarea>
                    </div>
                    <button type="button" id="btn_write" class="btn btn-primary">Write</button>
                </form>
            </div>
        </div>
    </div>

</div>
