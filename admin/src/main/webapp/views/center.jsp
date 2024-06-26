<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<script>
    let center_websocket={
        stompClient:null,
        init:function(){
            // 페이지 시작하자마자 연결
            let socket = new SockJS('${serverurl}/wss'); //웹소켓 서버로 접속
            //기존 ws(채팅위함)가 아니라 wss 채널로 접속한다.
            this.stompClient = Stomp.over(socket);
            //frame은 접속 후 확인차 서버에서 내려오는 데이터
            this.stompClient.connect({},function(frame){
                //console.log(frame);
                //접속시도하면 받을준비, 받을 때는 msg가 내려온다.
                this.subscribe('/send2',function(msg){
                    console.log(msg);
                    console.log(typeof(msg));
                    console.log(msg.body.content1);
                    console.log(JSON.parse(msg.body).content1);
                    $('#msg1').text(JSON.parse(msg.body).content1);
                    $('#msg2').text(JSON.parse(msg.body).content2);
                    $('#msg3').text(JSON.parse(msg.body).content3);
                    $('#msg4').text(JSON.parse(msg.body).content4);
                    $('#progress1').css('width',JSON.parse(msg.body).content1/100*100+'%');
                    $('#progress1').attr('aria-valuenow',JSON.parse(msg.body).content1/100*100);
                    $('#progress2').css('width',JSON.parse(msg.body).content2/1000*100+'%');
                    $('#progress2').attr('aria-valuenow',JSON.parse(msg.body).content2/1000*100);
                    $('#progress3').css('width',JSON.parse(msg.body).content3/500*100+'%');
                    $('#progress3').attr('aria-valuenow',JSON.parse(msg.body).content3/500*100);
                    $('#progress4').css('width',JSON.parse(msg.body).content4/10*100+'%');
                    $('#progress4').attr('aria-valuenow',JSON.parse(msg.body).content4/10*100);
                });
            });
        }
    };
    let popup = {
        stompClient:null,
        init:function(){
            let socket = new SockJS('${serverurl}/notice'); //웹소켓 서버로 접속
            this.stompClient = Stomp.over(socket);
            this.stompClient.connect({},function(frame){
                this.subscribe('/send3',function(msg){
                    console.log(msg);
                    let check = confirm("공지사항을 확인하시겠습니까?");
                    $('.modal-body').text(JSON.parse(msg.body).content1);
                    $("#myModal").modal("show");
                });
            });
        }
    }
    let center = {
        init:function(){
            const defaultData = '${chartUrl}/logs/custinfo.log';
            const urlInput = document.getElementById('fetchURL');
            const pollingCheckbox = document.getElementById('enablePolling');
            const pollingInput = document.getElementById('pollingTime');

            function createChart() {
                Highcharts.chart('live_chart', {
                    chart: {
                        type: 'areaspline'
                    },
                    title: {
                        text: 'Live Data'
                    },
                    accessibility: {
                        announceNewData: {
                            enabled: true,
                            minAnnounceInterval: 15000,
                            announcementFormatter: function (
                                allSeries,
                                newSeries,
                                newPoint) {
                                if (newPoint) {
                                    return 'New point added. Value: ' + newPoint.y;
                                }
                                return false;
                            }
                        }
                    },
                    plotOptions: {
                        areaspline: {
                            color: '#32CD32',
                            fillColor: {
                                linearGradient: { x1: 0, x2: 0, y1: 0, y2: 1 },
                                stops: [
                                    [0, '#32CD32'],
                                    [1, '#32CD3200']
                                ]
                            },
                            threshold: null,
                            marker: {
                                lineWidth: 1,
                                lineColor: null,
                                fillColor: 'white'
                            }
                        }
                    },
                    data: {
                        csvURL: '${chartUrl}/logs/custinfo.log',
                        enablePolling: true,
                        dataRefreshRate: 1
                    }
                });

                // if (pollingInput.value < 1 || !pollingInput.value) {
                // pollingInput.value = 1;
                // }
            }

            // urlInput.value = defaultData;

            // We recreate instead of using chart update to make sure the loaded CSV
            // and such is completely gone.
            // pollingCheckbox.onchange = urlInput.onchange =
            //     pollingInput.onchange = createChart;

            // Create the chart
            createChart();
        }
    };
    $(function(){
        center.init();
        center_websocket.init();
        popup.init();
    });
</script>
<!--Modal start-->
<div class="modal fade" id="myModal">
    <div class="modal-dialog">
        <div class="modal-content">

            <!-- Modal Header -->
            <div class="modal-header">
                <h4 class="modal-title">공지사항</h4>
                <button type="button" class="close" data-dismiss="modal">×</button>
            </div>

            <!-- Modal body -->
            <div class="modal-body">
            </div>

            <!-- Modal footer -->
            <div class="modal-footer">
                <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
            </div>

        </div>
    </div>
</div>

</div>
<!--End modal-->
<div class="container-fluid">

    <!-- Page Heading -->
    <div class="d-sm-flex align-items-center justify-content-between mb-4">
        <h1 class="h3 mb-0 text-gray-800">Dashboard</h1>
        <a href="#" class="d-none d-sm-inline-block btn btn-sm btn-primary shadow-sm"><i
                class="fas fa-download fa-sm text-white-50"></i> Generate Report</a>
    </div>

    <!-- Content Row -->
    <div class="row">

        <!-- Earnings (Monthly) Card Example -->
<%--        <div class="col-xl-3 col-md-6 mb-4">--%>
<%--            <div class="card border-left-primary shadow h-100 py-2">--%>
<%--                <div class="card-body">--%>
<%--                    <div class="row no-gutters align-items-center">--%>
<%--                        <div class="col mr-2">--%>
<%--                            <div class="text-xs font-weight-bold text-primary text-uppercase mb-1">--%>
<%--                                Earnings (Monthly)</div>--%>
<%--                            <div class="h5 mb-0 font-weight-bold text-gray-800">$40,000</div>--%>
<%--                        </div>--%>
<%--                        <div class="col-auto">--%>
<%--                            <i class="fas fa-calendar fa-2x text-gray-300"></i>--%>
<%--                        </div>--%>
<%--                    </div>--%>
<%--                </div>--%>
<%--            </div>--%>
<%--        </div>--%>

        <!-- Earnings (Monthly) Card Example -->
<%--        <div class="col-xl-3 col-md-6 mb-4">--%>
<%--            <div class="card border-left-success shadow h-100 py-2">--%>
<%--                <div class="card-body">--%>
<%--                    <div class="row no-gutters align-items-center">--%>
<%--                        <div class="col mr-2">--%>
<%--                            <div class="text-xs font-weight-bold text-success text-uppercase mb-1">--%>
<%--                                Earnings (Annual)</div>--%>
<%--                            <div class="h5 mb-0 font-weight-bold text-gray-800">$215,000</div>--%>
<%--                        </div>--%>
<%--                        <div class="col-auto">--%>
<%--                            <i class="fas fa-dollar-sign fa-2x text-gray-300"></i>--%>
<%--                        </div>--%>
<%--                    </div>--%>
<%--                </div>--%>
<%--            </div>--%>
<%--        </div>--%>

        <!-- Earnings (Monthly) Card Example -->
        <div class="col-xl-3 col-md-6 mb-4">
            <div class="card border-left-info shadow h-100 py-2">
                <div class="card-body">
                    <div class="row no-gutters align-items-center">
                        <div class="col mr-2">
                            <div class="text-xs font-weight-bold text-info text-uppercase mb-1">Tasks
                            </div>
                            <div class="row no-gutters align-items-center">
                                <div class="col-auto">
                                    <div id="msg1" class="h5 mb-0 mr-3 font-weight-bold text-gray-800">99%</div>
                                </div>
                                <div class="col">
                                    <div class="progress progress-sm mr-2">
                                        <div id="progress1" class="progress-bar bg-info" role="progressbar"
                                             style="width: 50%" aria-valuenow="50" aria-valuemin="0"
                                             aria-valuemax="100"></div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-auto">
                            <i class="fas fa-clipboard-list fa-2x text-gray-300"></i>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-xl-3 col-md-6 mb-4">
            <div class="card border-left-info shadow h-100 py-2">
                <div class="card-body">
                    <div class="row no-gutters align-items-center">
                        <div class="col mr-2">
                            <div class="text-xs font-weight-bold text-info text-uppercase mb-1">Tasks
                            </div>
                            <div class="row no-gutters align-items-center">
                                <div class="col-auto">
                                    <div id="msg2" class="h5 mb-0 mr-3 font-weight-bold text-gray-800">99%</div>
                                </div>
                                <div class="col">
                                    <div class="progress progress-sm mr-2">
                                        <div id="progress2" class="progress-bar bg-info" role="progressbar"
                                             style="width: 50%" aria-valuenow="50" aria-valuemin="0"
                                             aria-valuemax="100"></div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-auto">
                            <i class="fas fa-clipboard-list fa-2x text-gray-300"></i>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-xl-3 col-md-6 mb-4">
            <div class="card border-left-info shadow h-100 py-2">
                <div class="card-body">
                    <div class="row no-gutters align-items-center">
                        <div class="col mr-2">
                            <div class="text-xs font-weight-bold text-info text-uppercase mb-1">Tasks
                            </div>
                            <div class="row no-gutters align-items-center">
                                <div class="col-auto">
                                    <div id="msg3" class="h5 mb-0 mr-3 font-weight-bold text-gray-800">99%</div>
                                </div>
                                <div class="col">
                                    <div class="progress progress-sm mr-2">
                                        <div id="progress3" class="progress-bar bg-info" role="progressbar"
                                             style="width: 50%" aria-valuenow="50" aria-valuemin="0"
                                             aria-valuemax="100"></div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-auto">
                            <i class="fas fa-clipboard-list fa-2x text-gray-300"></i>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-xl-3 col-md-6 mb-4">
            <div class="card border-left-info shadow h-100 py-2">
                <div class="card-body">
                    <div class="row no-gutters align-items-center">
                        <div class="col mr-2">
                            <div class="text-xs font-weight-bold text-info text-uppercase mb-1">Tasks
                            </div>
                            <div class="row no-gutters align-items-center">
                                <div class="col-auto">
                                    <div id="msg4" class="h5 mb-0 mr-3 font-weight-bold text-gray-800">99%</div>
                                </div>
                                <div class="col">
                                    <div class="progress progress-sm mr-2">
                                        <div id="progress4" class="progress-bar bg-info" role="progressbar"
                                             style="width: 50%" aria-valuenow="50" aria-valuemin="0"
                                             aria-valuemax="100"></div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-auto">
                            <i class="fas fa-clipboard-list fa-2x text-gray-300"></i>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <!-- Pending Requests Card Example -->
<%--        <div class="col-xl-3 col-md-6 mb-4">--%>
<%--            <div class="card border-left-warning shadow h-100 py-2">--%>
<%--                <div class="card-body">--%>
<%--                    <div class="row no-gutters align-items-center">--%>
<%--                        <div class="col mr-2">--%>
<%--                            <div class="text-xs font-weight-bold text-warning text-uppercase mb-1">--%>
<%--                                Pending Requests</div>--%>
<%--                            <div class="h5 mb-0 font-weight-bold text-gray-800">18</div>--%>
<%--                        </div>--%>
<%--                        <div class="col-auto">--%>
<%--                            <i class="fas fa-comments fa-2x text-gray-300"></i>--%>
<%--                        </div>--%>
<%--                    </div>--%>
<%--                </div>--%>
<%--            </div>--%>
<%--        </div>--%>
    </div>

    <!-- Content Row -->

    <div class="row">

        <!-- Area Chart -->
        <div class="col-xl-8 col-lg-7">
            <div class="card shadow mb-4">
                <!-- Card Header - Dropdown -->
                <div
                        class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
                    <h6 class="m-0 font-weight-bold text-primary">Earnings Overview</h6>
                </div>
                <!-- Card Body -->
                <div class="card-body">
                    <div id="live_chart">

                    </div>
                </div>
            </div>
        </div>

        <!-- Pie Chart -->
        <div class="col-xl-4 col-lg-5">
            <div class="card shadow mb-4">
                <!-- Card Header - Dropdown -->
                <div
                        class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
                    <h6 class="m-0 font-weight-bold text-primary">Revenue Sources</h6>
                    <div class="dropdown no-arrow">
                        <a class="dropdown-toggle" href="#" role="button" id="dropdownMenuLink"
                           data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            <i class="fas fa-ellipsis-v fa-sm fa-fw text-gray-400"></i>
                        </a>
                        <div class="dropdown-menu dropdown-menu-right shadow animated--fade-in"
                             aria-labelledby="dropdownMenuLink">
                            <div class="dropdown-header">Dropdown Header:</div>
                            <a class="dropdown-item" href="#">Action</a>
                            <a class="dropdown-item" href="#">Another action</a>
                            <div class="dropdown-divider"></div>
                            <a class="dropdown-item" href="#">Something else here</a>
                        </div>
                    </div>
                </div>
                <!-- Card Body -->
                <div class="card-body">
                    <div class="chart-pie pt-4 pb-2">
                        <canvas id="myPieChart"></canvas>
                    </div>
                    <div class="mt-4 text-center small">
                                        <span class="mr-2">
                                            <i class="fas fa-circle text-primary"></i> Direct
                                        </span>
                        <span class="mr-2">
                                            <i class="fas fa-circle text-success"></i> Social
                                        </span>
                        <span class="mr-2">
                                            <i class="fas fa-circle text-info"></i> Referral
                                        </span>
                    </div>
                </div>
            </div>
        </div>
    </div>



</div>