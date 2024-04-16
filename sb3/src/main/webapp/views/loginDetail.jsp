<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<script>
    let custGet = {
        init: function () {
        }
    };
    $(function () {
        custGet.init();
    });
</script>
<div class="container">
    <h1>User Info</h1>
    <table class="table table-striped">
        <thead>
        <tr>
            <th>ID</th>
            <th>PWD</th>
            <th>NAME</th>
        </tr>
        </thead>
        <tbody>

            <tr>
                <td>${userInfo.id}</td>
                <td>${userInfo.pwd}</td>
                <td>${userInfo.name}</td>
            </tr>

        </tbody>
    </table>
</div>