<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <script>
            let jquery3={
                init:function(){
                    $('#btn_get').click(function(){
                        $.ajax({
                            url:'<c:url value="/getdata"/>',
                            success:function(data){
                                alert(data);
                            }
                        })
                    });
                }
            };

            $(function(){
                jquery3.init();
            });
        </script>
        <div class="container">
            <h2>JQUERY3 page</h2>
            <button id="btn_get" type="button" class="btn btn-primary">LOGIN</button>

        </div>
