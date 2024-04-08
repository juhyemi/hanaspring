<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<script>

    //register
    let register = {
        init:function(url){
            this.url = url;
            $('#register_form #btn_check').click(()=>{
                let id = $('#id').val();
                if(id==''||id==null){
                    alert('ID를 입력 하세요');
                    return;
                }
                $.ajax({
                    url:'<c:url value="/registercheckid"/>',
                    data:{
                      "id":id
                    },
                    success:(result)=>{
                        let msg='사용 불가능 합니다.';
                        if(result=='1'){
                            msg = '사용 가능 합니다.';
                        }
                        $('#check_msg').html(msg);
                    }
                })
            });
            $('#register_form #btn_register').click(function(){
                let id = $('#id').val();
                let pwd = $('#pwd').val();
                let name = $('#name').val();
                //html 사이의 text는 .text()로 가져오고 form데이터는 .val()로 가져온다.
                if(id==''||id==null){
                    alert('ID를 입력 하세요');
                    $('#id').focus();
                    return;
                }
                if(pwd==''||pwd==null){
                    alert('pwd를 입력 하세요');
                    $('#pwd').focus();
                    return;
                }
                if(name==''||name==null){
                    alert('name 입력 하세요');
                    $('#name').focus();
                    return;
                }
                register.send();
            });
        },
        send:function(){
            $('#register_form').attr({
                'method':'post',
                'action':this.url
            });//html의 attribute는 태그 안에 들어가는 속성
            $('#register_form').submit();
        }
    };
    $(function(){
        register.init('<c:url value="/registerimpl"/>');
    });
</script>
<head>
        <div class="container">
            <h2>Register Page</h2>
            <form id="register_form">
                ID<input type="text" id="id" name="id"><br>
                <button id="btn_check" type="button" class="btn btn-primary">Check ID</button>
                <span id="check_msg"></span>
                PWD<input type="password" id="pwd" name="pwd"><br>
                NAME<input type="text" id="name" name="name"><br>
                <button id="btn_register" type="button" class="btn btn-primary">REGISTER</button>
            </form>
        </div>

</head>
<body>

</body>
</html>
