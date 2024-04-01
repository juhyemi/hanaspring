<%--
  Created by IntelliJ IDEA.
  User: User
  Date: 2024-03-27
  Time: 오전 9:37
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<script>
    $(function(){
        register.init('<c:url value="/registerimpl"/>');
    });
</script>
<head>
        <div class="container">
            <h2>Register Page</h2>
            <form id="register_form">
                ID<input type="text" id="id" name="id"><br>
                PWD<input type="text" id="pwd" name="pwd"><br>
                NAME<input type="text" id="name" name="name"><br>
                <button type="button" class="btn btn-primary">REGISTER</button>
            </form>
        </div>

</head>
<body>

</body>
</html>
