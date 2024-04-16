<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <div class="container">
            <h2>Addr Info</h2>
            <table class="table table-striped">
                <thead>
                <tr>
                    <th>ID</th>
                    <th>NAME</th>
                    <th>DETAIL</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach var="c" items="${loginInfo}">
                    <tr>
<%--                        <td><a href="<c:url value="/cust/get"/>?id=${c.id}">${c.id}</a></td>--%>
                        <td>${c.addr_id}</td>
                        <td>${c.addr_name}</td>
                        <td>${c.addr_detail}</td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
        </div>
