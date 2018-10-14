<%--
  Created by IntelliJ IDEA.
  User: yanyanghong
  Date: 2018/9/15
  Time: 23:51
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>首页</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/styles/dashboard.css">
    <script src="${pageContext.request.contextPath}/resources/plugins/echart/echarts.js"></script>
</head>
<body>
<div id="page-wrapper">
    <div class="row">
        <div class="col-lg-12">
            <h1 class="page-header">首页</h1>
        </div>
    </div>
    <div class="row">
        <div class="col-lg-3 col-md-6">
            <div class="panel panel-default">
                <div class="panel-body text-center body-font">
                    ￥${curOverview.amount eq null ? 0: curOverview.amount}
                </div>
                <div class="panel-footer text-center title-font background-blue">本月销售额</div>
            </div>
        </div>
        <div class="col-lg-3 col-md-6">
            <div class="panel panel-default">
                <div class="panel-body text-center body-font">
                    ￥${curOverview.price eq null ? 0: curOverview.price}
                </div>
                <div class="panel-footer text-center  title-font background-red">本月均价</div>
            </div>
        </div>
        <div class="col-lg-3 col-md-6">
            <div class="panel panel-default">
                <div class="panel-body text-center body-font">
                    ${curOverview.weight eq null ? 0: curOverview.weight}（斤）
                </div>
                <div class="panel-footer text-center title-font background-yellow">本月销售量</div>
            </div>
        </div>
        <div class="col-lg-3 col-md-6">
            <div class="panel panel-default">
                <div class="panel-body text-center body-font">
                    ${curOverview.count eq null ? 0: curOverview.count}（只）
                </div>
                <div class="panel-footer text-center title-font background-purple">本月损失量</div>
            </div>
        </div>
    </div>
    <div class="row">
        <div class="col-lg-3 col-md-6">
            <div class="panel panel-default">
                <div class="panel-body text-center body-font">
                    ￥${preOverview.amount eq null ? 0: preOverview.amount}
                </div>
                <div class="panel-footer text-center title-font background-blue">上月销售额</div>
            </div>
        </div>
        <div class="col-lg-3 col-md-6">
            <div class="panel panel-default">
                <div class="panel-body text-center body-font">
                    ￥${preOverview.price eq null ? 0: preOverview.price}
                </div>
                <div class="panel-footer text-center  title-font background-red">上月均价</div>
            </div>
        </div>
        <div class="col-lg-3 col-md-6">
            <div class="panel panel-default">
                <div class="panel-body text-center body-font">
                    ${preOverview.weight eq null ? 0: preOverview.weight}（斤）
                </div>
                <div class="panel-footer text-center title-font background-yellow">上月销售量</div>
            </div>
        </div>
        <div class="col-lg-3 col-md-6">
            <div class="panel panel-default">
                <div class="panel-body text-center body-font">
                    ${preOverview.count eq null ? 0: preOverview.count}（只）
                </div>
                <div class="panel-footer text-center title-font background-purple">上月损失量</div>
            </div>
        </div>
    </div>
    <div class="row">
        <div class="col-lg-12">
            <div class="panel panel-default">
                <div class="panel-heading">
                    <i class="fa fa-bar-chart-o fa-fw"></i> 近一月单价
                </div>
                <div class="panel-body">
                    <div id="recentPrice" style="height:350px;"></div>
                </div>
            </div>
        </div>
    </div>
    <!-- /.row -->
    <div class="row">
        <div class="col-lg-12">
            <div class="panel panel-default">
                <div class="panel-heading">
                    <i class="fa fa-bar-chart-o fa-fw"></i> 近一月销售额
                </div>
                <!-- /.panel-heading -->
                <div class="panel-body">
                    <div id="recentAmount" style="height:350px;"></div>
                </div>
                <!-- /.panel-body -->
            </div>
        </div>
    </div>
    <!-- /.row -->
    <div class="row">
        <div class="col-lg-12">
            <div class="panel panel-default">
                <div class="panel-heading">
                    <i class="fa fa-bar-chart-o fa-fw"></i> 近一月销量
                </div>
                <!-- /.panel-heading -->
                <div class="panel-body">
                    <div id="recentWeight" style="height:350px;"></div>
                </div>
                <!-- /.panel-body -->
            </div>
        </div>
    </div>
    <!-- /.row -->
</div>

<script type="text/javascript">

    $(function () {
        initPrice();
        initAmount();
        initWeight();
    });

    //  近一月单价
    function initPrice() {
        var price = echarts.init(document.getElementById('recentPrice'));
        var priceOption = {
            title: {
                text: '单价'
            },
            tooltip: {
                trigger: 'axis'
            },
            legend: {
                data:[]
            },
            grid: {
                left: '3%',
                right: '4%',
                bottom: '3%',
                containLabel: true
            },
            toolbox: {
                feature: {
                    saveAsImage: {}
                }
            },
            xAxis: {
                type: 'category',
                boundaryGap: false,
                data: ${priceRecordDateData}
            },
            yAxis: {
                type: 'value'
            },
            series: [
                {
                    name:'单价',
                    type:'line',
                    stack: '总量',
                    data:${priceData},
                    markPoint: {
                        symbol: 'circle',
                        data : [
                            {type : 'max', name: '最大值'},
                            {type : 'min', name: '最小值'}
                        ]
                    }
                }
            ]
        };
        price.setOption(priceOption);
    }

    // 近一月销售额
    function initAmount() {
        var amount = echarts.init(document.getElementById('recentAmount'));
        var amountOption = {
            title: {
                text: '销售额'
            },
            tooltip: {
                trigger: 'axis'
            },
            legend: {
                data:[]
            },
            grid: {
                left: '3%',
                right: '4%',
                bottom: '3%',
                containLabel: true
            },
            toolbox: {
                feature: {
                    saveAsImage: {}
                }
            },
            xAxis: {
                type: 'category',
                boundaryGap: false,
                data: ${amountRecordDateData}
            },
            yAxis: {
                type: 'value'
            },
            series: [
                {
                    name:'销售额',
                    type:'line',
                    stack: '总量',
                    data:${amountData},
                    markPoint: {
                        symbol: 'circle',
                        data : [
                            {type : 'max', name: '最大值'},
                            {type : 'min', name: '最小值'}
                        ]
                    }
                }
            ]
        };
        amount.setOption(amountOption);
    }

    //近一月销量
    function initWeight() {
        var weight = echarts.init(document.getElementById('recentWeight'));
        var weightOption = {
            title: {
                text: '销售额'
            },
            tooltip: {
                trigger: 'axis'
            },
            legend: {
                data:[]
            },
            grid: {
                left: '3%',
                right: '4%',
                bottom: '3%',
                containLabel: true
            },
            toolbox: {
                feature: {
                    saveAsImage: {}
                }
            },
            xAxis: {
                type: 'category',
                boundaryGap: false,
                data: ${amountRecordDateData}
            },
            yAxis: {
                type: 'value'
            },
            series: [
                {
                    name:'销售额',
                    type:'line',
                    stack: '总量',
                    data:${amountData},
                    markPoint: {
                        symbol: 'circle',
                        data : [
                            {type : 'max', name: '最大值'},
                            {type : 'min', name: '最小值'}
                        ]
                    }
                }
            ]
        };
        weight.setOption(weightOption);
    }
</script>
</body>
</html>
