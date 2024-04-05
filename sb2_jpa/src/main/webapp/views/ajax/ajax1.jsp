<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<script>
    let ajax1 = {
        init:function(){
            setInterval(function(){
                $.ajax({
                    type:'post',
                    url:'/getservertime',
                    success:function(data){
                        ajax1.display(data);
                    },
                    error:function(error){
                        console.log(error);
                    }
                });
            },1000);

        },
        display:function(data){
            $('#result').text(data);
        }
    };
    $(function (){
       ajax1.init();
    });
</script>
<div class="container">
    <h2>AJAX1 page</h2>
    <h3>Server Time</h3>
    <h3 id="result"></h3>
</div>
