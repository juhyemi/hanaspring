<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <p>CUST</p>
    <ul class="nav nav-pills flex-column">
        <li class="nav-item">
            <a class="nav-link" href="<c:url value="/cust/cust1"/>">Add</a>
        </li>
        <li class="nav-item">
            <a class="nav-link" href="<c:url value="/cust/cust2"/>">Get</a>
        </li>
        <li class="nav-item">
            <a class="nav-link" href="<c:url value="/cust/allpage?pageNo=1"/>">allpage</a>
        </li>
        <li class="nav-item">
            <a class="nav-link" href="<c:url value="/cust/cust3"/>">CUST3</a>
        </li>
    </ul>
</head>
<body>

</body>
</html>