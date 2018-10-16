<%@ page import="com.me.inner.constant.Constant" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: yanyanghong
  Date: 2018/9/27
  Time: 20:14
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>数据走势</title>
</head>
<body>

<div class="container-fluid">
    <div class="row">
        <div class="col-lg-12">
            <h1 class="page-header"><c:out value="${typeCode.value}"/></h1>
        </div>
    </div>

    <!-- 搜索 -->
    <div class="row">
        <form action="" class="form-inline text-center">
            <input type="hidden" name="category" value="" />
            <div class="form-group">
                <label for="startDate">开始时间：</label>
                <input type="text" name="startDate" id="startDate" value="${startDate}" data-default-value="${startDate}" data-enable-time="false" class="form-control flatpickr" placeholder="选择开始时间" readonly />
            </div>
            <div class="form-group">
                <label for="endDate">结束时间：</label>
                <input type="text" name="endDate" id="endDate" value="${endDate}" data-default-value="${endDate}" data-enable-time="false" class="form-control flatpickr" placeholder="选择结束时间" readonly />
            </div>
            <button type="button" class="btn btn-primary" id="btnSearch">确认</button>
        </form>
    </div>

    <!-- chart详情 -->
    <div class="row" style="margin-top: 50px;">
        <div class="col-lg-12">
            <div id="chart" style="height:500px;"></div>
        </div>
    </div>
</div>

<%-- 结果Modal --%>
<div class="modal fade" id="outcomeModal" tabindex="-1" role="dialog">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title">提示</h4>
            </div>
            <div class="modal-body">
                <p class="text-center" id="outcomeContent"></p>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
            </div>
        </div>
    </div>
</div>

<script>
    var chart;
    var recordData = [];
    var recordDateData = [];
    $(function () {
        $('#startDate, #endDate').flatpickr();

        initChart();
    });
    
    $("#btnSearch").on("click", function () {
        var startDate = $("#startDate").val();
        var endDate = $("#endDate").val();
        if (startDate&&endDate) {
            var start = new Date(startDate);
            var end = new Date(endDate);
            start.setMonth(start.getMonth()+1);
            start.setDate(start.getDate()+1);
            if (start.getTime()<=end.getTime()) {
                $("#outcomeContent").html("时间范围不能超过1个月.");
                $("#outcomeModal").modal("show");
            } else {
                initChart();
            }
        } else {
            if (!startDate&&endDate) {
                $("#outcomeContent").html("请选择开始时间.");
            } else if (startDate&&!endDate) {
                $("#outcomeContent").html("请选择结束时间.");
            } else {
                $("#outcomeContent").html("请选择开始时间和结束时间.");
            }
            $("#outcomeModal").modal("show");
        }
    })

    chart = echarts.init(document.getElementById('chart'));
    function initChart() {
        $.ajax({
            url: "${pageContext.request.contextPath}/record/listRecordData",
            data: {
                type: "${typeCode.name}",
                startDate: $("#startDate").val(),
                endDate: $("#endDate").val()
            },
            type: "POST",
            success: function (result) {
                if (result) {
                    recordData = JSON.parse(result.recordData);
                    recordDateData = JSON.parse(result.recordDateData);
                }

                var chartOptions = {
                    title: {
                        text: "${typeCode.value}"
                    },
                    tooltip: {
                        trigger: 'axis'
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
                        data: recordDateData
                    },
                    yAxis: {
                        type: 'value'
                    },
                    series: [
                        {
                            name:'${typeCode.value}',
                            type:'line',
                            stack: '总量',
                            data:recordData,
                            markPoint: {
                                symbol: 'circle',
                                data : [
                                    {type : 'max', name: '最大值'},
                                    {type : 'min', name: '最小值'}
                                ]
                            }
                        }
                    ],
                    noDataLoadingOption: {},
                };
                chart.showLoading();
                setTimeout(function () {
                    chart.hideLoading();
                    chart.setOption(chartOptions);
                }, 500);
            }
        });
    }
</script>

</body>
</html>
