<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<script>
    let left = {
        init: function () {
            $('#btn_board_add').click(()=>{
                let login_id = '${sessionScope.id}'; //thymeleaf에서는 대괄호 두 개 추가, js에서도 el태그 사용가능
                if(login_id==''||login_id==null){
                    $('#btn_board_add').removeAttr('href');
                    alert('로그인 하셔야 합니다.');
                }
            });
        }
    };
    $(function () {
        left.init();
    });
</script>
<html>
<head>
    <ul class="nav nav-pills flex-column">
        <li class="nav-item">
            <a id="btn_board_add" class="nav-link" href="<c:url value="/board/add"/>">Board Add</a>
        </li>
        <li class="nav-item">
            <a class="nav-link" href="<c:url value="/board/get"/>">Board Get</a>
        </li>
        <li class="nav-item">
            <a class="nav-link" href="#">link</a>
        </li>

    </ul>
</head>
<body>

</body>
</html>
