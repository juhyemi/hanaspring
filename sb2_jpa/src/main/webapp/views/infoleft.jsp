<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <h3>My Info</h3>
    <ul class="nav nav-pills flex-column">
        <li class="nav-item">
            <a class="nav-link" href="<c:url value="/addr/get?id="/>${id}">Show Addr</a>
        </li>
        <li class="nav-item">
            <a class="nav-link" href="<c:url value="/addr/addForm"/>">Add Addr</a>
        </li>
    </ul>
