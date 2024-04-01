center.jsp<%--
  Created by IntelliJ IDEA.
  User: User
  Date: 2024-03-27
  Time: 오전 9:37
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <style>
        p{
            color:red;
        }
    </style>
    <script>
        window.onload=function (){
            $(document).ready(function(){
                $('#ptag').text('Replace Text');
                $('p').click(function(){
                    alert('ok');
                    $(this).text('Click Event');
                });
            });
            // document.getElementById("ptag").innerHTML='Replace Text';
            //
            // document.querySelector('h5').onclick(function (){
            //     alert('OK');
            // });
        };

    </script>
    <div class="col-sm-9">
        <div class="container">
            <h2>HTML1 page</h2>
            <h5>Title description, Sep 2, 2017</h5>
            <div class="fakeimg">Fake Image</div>
            <p id="ptag">Some text..</p>
            <span>Sqan</span>
            <a href="#">A Tag</a>
        </div>
    </div>

</head>
<body>

</body>
</html>
