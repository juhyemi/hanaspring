<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<script>
    let notice = {
        stompClient:null,
        init: function () {
            $('#send_btn').click(()=>{
                let socket = new SockJS('${serverurl}/notice');//웹소캣 서버 접속
                this.stompClient = Stomp.over(socket);
                console.log(this.stompClient);
                let msg = JSON.stringify({
                    'content1' : $("#notice").val()
                });
                this.stompClient.connect({},function(frame) {
                    console.log(frame);
                    notice.stompClient.send("/noticemsg", {}, msg);
                });
            });
        }
    };
    $(function () {
        notice.init();
    });
</script>


<div class="container-fluid">

    <!-- Page Heading -->
    <h1 class="h3 mb-2 text-gray-800">Tables</h1>

    <!-- DataTales Example -->
    <div class="card shadow mb-4">
        <div class="card-header py-3">
            <h6 class="m-0 font-weight-bold text-primary">DataTables Example</h6>
        </div>
        <div class="card-body">
            <div class="table-responsive">
                <form id="add_form">
                    <div class="form-group">
                        <label for="notice">공지사항 📣</label>
                        <input type="text" class="form-control" id="notice" placeholder="Enter notice" name="notice">

                    </div>
                    <button id="send_btn" type="button" class="btn btn-primary">SEND</button>

                </form>
            </div>
        </div>
    </div>

</div>
