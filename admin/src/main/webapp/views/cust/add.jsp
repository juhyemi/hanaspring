
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script>
    let add={
        init:function(){
            $('#bnt_add').click(()=>{
                let id = $('#id').val();
                let pwd = $('#pwd').val();
                let name = $('#name').val();
                if(id==""){
                    alert("아이디를 입력하세요");
                    $('#pwd').focus();
                    return;
                }
                if(pwd==""){
                    alert("비밀번호를 입력하세요");
                    $('#pwd').focus();
                    return;
                }
                if(name==""){
                    alert("닉네임을 입력하세요");
                    $('#name').focus();
                    return;
                }
                $('#insert_form').attr({
                    'action':'<c:url value="/cust/addImpl"/>',
                    'method':'POST'
                });
                $('#insert_form').submit();
            });

        }
    };
    $(function(){
        add.init();
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
                <form id="insert_form">
                    <div class="form-group">
                        <label for="id">ID</label>
                        <input type="text" value="" class="form-control" id="id" placeholder="Enter id" name="id">

                    </div>
                    <div class="form-group">
                        <label for="pwd">Password:</label>
                        <input type="password"  value=""  class="form-control" id="pwd" placeholder="Enter password" name="pwd">

                    </div>
                    <div class="form-group">
                        <label for="name">Name:</label>
                        <input type="text" value=""  class="form-control" id="name" placeholder="Enter name" name="name">

                    </div>
                    <button type="button" id="bnt_add" class="btn btn-primary">ADD</button>
                </form>
            </div>
        </div>
    </div>

</div>
