<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<style>
    img{
        width:100px;
        height: 100px;
    }
</style>
    <div class="col-sm-9">
        <div class="container">
            <table class="table table-bordered" id="dataTable">
                <thead>
                <tr>
                    <th>IMAGE</th>
                    <th>ID</th>
                    <th>NAME</th>
                    <th>PRICE</th>
                    <th>REG DATE</th>
                    <th>UPDATE DATE</th>
                </tr>
                </thead>
                <tfoot>
                <tr>
                    <th>IMAGE</th>
                    <th>ID</th>
                    <th>NAME</th>
                    <th>PRICE</th>
                    <th>REG DATE</th>
                    <th>UPDATE DATE</th>
                </tr>
                </tfoot>
                <tbody>
                <c:forEach var="item" items="${itemList}">
                    <tr>
                        <td>
                            <a href="<c:url value="/item/detail"/>?id=${item.itemId}">
                                <img src="<c:url value="/imgs/"/>${item.imgName}"/>
                            </a>
                        </td>
                        <td>${item.itemId}</td>
                        <td>${item.itemName}</td>
                        <td><fmt:formatNumber type="number" pattern="###,###원" value="${item.itemPrice}" /></td>
                        <td>${item.regDate}</td>
                        <td>${item.updateDate}</td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
        </div>
    </div>


