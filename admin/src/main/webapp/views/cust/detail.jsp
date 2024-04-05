
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script>
    let modify={
        init:function(){
            $('#btn_update').click(()=>{
                let id = $('#id').val();
                let pwd = $('#pwd').val();
                let name = $('#name').val();
                if(pwd==""){
                    alert("변경하실 비밀번호를 입력하세요");
                    $('#pwd').focus();
                    return;
                }
                if(name==""){
                    alert("변경하실 닉네임을 입력하세요");
                    $('#name').focus();
                    return;
                }
                $('#modify_form').attr({
                    'action':'<c:url value="/cust/modifyImpl"/>',
                    'method':'POST'
                });
                $('#modify_form').submit();
            });

            $('#modify_form>#btn_delete').click(()=>{
                let c = confirm('삭제하시겠습니까?');
                if(c==true){
                    let id = $('#id').val();
                    location.href = '<c:url value="/cust/delete"/>?id='+id;
                }
            });
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
                        <label for="id">ID</label>
                        <input type="text" readonly=readonly value="${userid}" class="form-control" id="id" placeholder="Enter id" name="id">

                    </div>
                    <div class="form-group">
                        <label for="pwd">Password:</label>
                        <input type="password"  value=""  class="form-control" id="pwd" placeholder="Enter password" name="pwd">

                    </div>
                    <div class="form-group">
                        <label for="name">Name:</label>
                        <input type="text" value=""  class="form-control" id="name" placeholder="Enter name" name="name">

                    </div>
                    <button type="button" id="btn_update" class="btn btn-primary">MODIFY</button>
                    <button type="button" id="btn_delete" class="btn btn-danger">DELETE</button>
                </form>
            </div>
        </div>
    </div>

</div>
