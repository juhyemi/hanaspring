<%--
  Created by IntelliJ IDEA.
  User: User
  Date: 2024-03-27
  Time: 오전 9:55
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <p>ITEM</p>
    <ul class="nav nav-pills flex-column">
        <li class="nav-item">
            <a class="nav-link" href="<c:url value="/item/item1"/>">ITEM1</a>
        </li>
        <li class="nav-item">
            <a class="nav-link" href="<c:url value="/item/item2"/>">ITEM2</a>
        </li>
        <li class="nav-item">
            <a class="nav-link" href="<c:url value="/item/item3"/>">ITEM3</a>
        </li>
    </ul>
</head>
<body>

</body>
</html>
