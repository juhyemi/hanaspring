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
                PWD<input type="password" id="pwd" name="pwd"><br>
                NAME<input type="text" id="name" name="name"><br>
                <button type="button" class="btn btn-primary">REGISTER</button>
            </form>
        </div>

</head>
<body>

</body>
</html>
