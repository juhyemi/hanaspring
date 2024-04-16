<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script>
    function fDel(num){
        $.ajax({
            url:'<c:url value="/addr/del"/>',
            data : {  "num":num  },
            success:function(result){
                console.log("Ok");
                alert("삭제되었습니다.");
                location.reload();
            },
            error:function (e){
                console.log("no"+e);
            }
        });
    }
</script>
<div class="container">
    <h2>Addr Info</h2>
    <table class="table table-striped">
        <thead>
        <tr>
            <th>ID</th>
            <th>NAME</th>
            <th>DETAIL</th>
            <th></th>
        </tr>
        </thead>
        <tbody>
        <c:forEach var="c" items="${loginInfo}">
            <tr>
                    <%--                        <td><a href="<c:url value="/cust/get"/>?id=${c.id}">${c.id}</a></td>--%>
                <td>${c.addrId}</td>
                <td>${c.addrName}</td>
                <td>${c.addrDetail}</td>
                <td><button onclick="fDel('${c.addrId}')">삭제</button></td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</div>
