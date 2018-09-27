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
            <h1 class="page-header">
                <c:choose>
                    <c:when test="${weight eq type}">重量</c:when>
                    <c:when test="${price eq type}">单价</c:when>
                    <c:when test="${amount eq type}">金额</c:when>
                    <c:when test="${count eq type}">损失数量</c:when>
                </c:choose>
            </h1>
        </div>
    </div>

    <!-- 搜索 -->
    <div class="row">
        <form action="" class="form-inline text-center">
            <input type="hidden" name="category" value="" />
            <div class="form-group">
                <label for="startDate">开始时间：</label>
                <input type="text" name="startDate" id="startDate" data-enable-time="false" class="form-control flatpickr" placeholder="选择开始时间" readonly />
            </div>
            <div class="form-group">
                <label for="endDate">结束时间：</label>
                <input type="text" name="endDate" id="endDate" data-enable-time="false" class="form-control flatpickr" placeholder="选择结束时间" readonly />
            </div>
            <button type="button" class="btn btn-primary">确认</button>
        </form>
    </div>

    <!-- chart详情 -->
    <div class="row" style="margin-top: 50px;">
        <div class="col-lg-12">
            <div id="chart-weight" class="chart-weight" style="height:500px;"></div>
        </div>
    </div>
</div>

<script>
    $(function () {
        $('#startDate, #endDate').flatpickr();
    });

    var chartWeight = echarts.init(document.getElementById('chart-weight'));
    var weightOptions = {
        title: {
            text: '折线图堆叠'
        },
        tooltip: {
            trigger: 'axis'
        },
        legend: {
            data:['邮件营销','联盟广告','视频广告','直接访问','搜索引擎']
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
            data: ['周一','周二','周三','周四','周五','周六','周日']
        },
        yAxis: {
            type: 'value'
        },
        series: [
            {
                name:'邮件营销',
                type:'line',
                stack: '总量',
                data:[120, 132, 101, 134, 90, 230, 210]
            },
            {
                name:'联盟广告',
                type:'line',
                stack: '总量',
                data:[220, 182, 191, 234, 290, 330, 310]
            },
            {
                name:'视频广告',
                type:'line',
                stack: '总量',
                data:[150, 232, 201, 154, 190, 330, 410]
            },
            {
                name:'直接访问',
                type:'line',
                stack: '总量',
                data:[320, 332, 301, 334, 390, 330, 320]
            },
            {
                name:'搜索引擎',
                type:'line',
                stack: '总量',
                data:[820, 932, 901, 934, 1290, 1330, 1320]
            }
        ]
    };
    chartWeight.setOption(weightOptions);
</script>

</body>
</html>
