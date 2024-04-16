<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<style>
    .comment{
        color:red !important;
    }
</style>
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
    <h1>Board Get</h1>
    <table class="table table-striped" id="board_table">
        <thead>
        <tr>
            <th>ID</th>
            <th>TITLE</th>
            <th>WRITER</th>
            <th>UPDATE</th>
            <th>CNT</th>
        </tr>
        </thead>
        <tbody>
            <c:forEach var="b" items="${cpage.getList()}">
            <tr>
                <td> <a href="<c:url value="/board/detail"/>?id=${b.boardId}">${b.boardId}</a></td>
                <td>
                        ${b.boardTitle}
                    <c:if test="${b.commentCnt!=0}">
                        <span class="comment">[${b.commentCnt}]</span>
                    </c:if>
                </td>
                <td>${b.custId}</td>
                <td>${b.boardUpdate}</td>
                <td>${b.boardCnt}</td>
            </tr>
            </c:forEach>
        </tbody>
    </table>
    <jsp:include page="../page.jsp"/>
</div>