<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script>
    $(function(){
        registerAddr.init('<c:url value="/addr/add"/>');
    });
</script>
<div class="container">
    <h2>Addr Add</h2>
    <form id="register_form">
        AddrName<input type="text" id="addrName" name="addrName"><br>
        AddrDetail<input type="text" id="addrDetail" name="addrDetail"><br>
        <button type="button" class="btn btn-primary">Add</button>
    </form>
</div>


