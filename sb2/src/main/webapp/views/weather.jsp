<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<script>
    let center={
        init:function(){
            $.ajax({
                url:'<c:url value="/weather"/>',
                success:(result)=>{
                    let w1 = result.main.temp;
                    let w2 = result.main.temp_min;
                    let w3 = result.main.temp_max;
                    let w4 = result.weather[0].description;
                    let w5 = result.name;
                    $('#w1').text(w1);
                    $('#w2').text(w2);
                    $('#w3').text(w3);
                    $('#w4').text(w4);
                    $('#w5').text(w5);
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
            <h2>Weather Page</h2>

            <p>Weather..</p>
            기온 : <p id="w1"></p>
            최저기온 : <p id="w2"></p>
            최고기온 : <p id="w3"></p>
            날씨 : <p id="w4"></p>
            지역 : <p id="w5"></p>


        </div>
    </div>
</head>
<body>

</body>
</html>
