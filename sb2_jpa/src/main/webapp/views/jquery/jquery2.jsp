<%@ page contentType="text/html;charset=UTF-8" language="java" %>
        <style>
            .div_bg{
                border: 2px solid palevioletred !important;
            }
        </style>
<script>
    let jquery2={
        init:function(){
            $('#append').click(function(){
                $('#result').append('<h2>Append</h2>');
            });
            $('#prepend').click(function(){
                $('#result').append('<h2>prepend</h2>');
            });
            $('#after').click(function(){
                $('#result').append('<h2>after</h2>');
            });
            $('#before').click(function(){
                $('#result').append('<h2>before</h2>');
            });
            $('#remove').click(function(){
                $('#result').remove();
            });
            $('#empty').click(function(){
                $('#result').empty();
            });
        }
    }
    $(function(){
        jquery2.init();
    });
</script>
        <div class="container">
            <h2>JQUERY2 page</h2>
            <button id="append" type="button" class="btn btn-primary">APPEND</button>
            <button id="prepend" type="button" class="btn btn-primary">PREPEND</button>
            <button id="after" type="button" class="btn btn-primary">AFTER</button>
            <button id="before" type="button" class="btn btn-primary">BEFORE</button>
            <button id="remove" type="button" class="btn btn-primary">REMOVE</button>
            <button id="empty" type="button" class="btn btn-primary">EMPTY</button>
            <div id="result" class="container div_bg">

            </div>
        </div>
