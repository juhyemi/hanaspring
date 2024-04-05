<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<script>
    let ajax3 = {
        init:function(){
            setInterval(function(){
                $.ajax({
                    type:'post',
                    url:'/getsearch',
                    success:function(data){
                        ajax3.display(data);
                    },
                    error:function(error){
                        console.log(error);
                    }
                });
            },5000);

        },
        display:function(data){
            let result = '';
            $(data).each(function(index,datas){
               result+= '<tr>';
               result+= '<td>'+datas.id+'</td>';
               result+= '<td>'+datas.keyword+'</td>';
               result+= '</tr>';
               console.log(result);
            });
            $('#result').html(result);
        }
    };
    $(function (){
        ajax3.init();
    });
</script>
<div class="container">
    <h2>AJAX3 page</h2>
    <table class="table table-striped" id="cust_tb">
        <thead>
        <tr>
            <th>Rank</th>
            <th>Keyword</th>
        </tr>
        </thead>
        <tbody id="result">

        </tbody>
    </table>
</div>
