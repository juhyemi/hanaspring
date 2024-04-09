<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<script>
    let center={
        init:function(){
            $.ajax({
                url:'<c:url value="/wh"/>',
                success:(result)=>{
                    let text = result.response.body.items.item[0].wfSv;
                    $('#wh').text(text);
                    alert(text);
                }
            });
        }
    };
    $(function(){
        center.init();
    });
</script>
<html>
<head>
    <div class="col-sm-9">
        <div class="container">
            <h2>Center Page</h2>
            <h5>Title description, Sep 2, 2017</h5>

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
                <c:forEach var="b" items="${ranks}">
                    <tr>
                        <td> <a href="<c:url value="/board/detail"/>?id=${b.boardId}">${b.boardId}</a></td>
                        <td>${b.boardTitle}</td>
                        <td>${b.custId}</td>
                        <fmt:parseDate value="${ board.boardUpdate }"
                                       pattern="yyyy-MM-dd" var="parsedDateTime" type="both" />
                        <fmt:formatDate pattern="yyyy년 MM월 dd일" value="${ parsedDateTime }" />
                        <td>${b.boardCnt}</td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>


            <p>Weather..</p>
            <p id="wh"></p>

        </div>
    </div>
</head>
<body>

</body>
</html>
