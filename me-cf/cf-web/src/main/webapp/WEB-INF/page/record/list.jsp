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
            <button type="button" class="btn btn-primary">确认</button>
        </form>
    </div>

    <!-- chart详情 -->
    <div class="row" style="margin-top: 50px;">
        <div class="col-lg-12">
            <div id="chart" style="height:500px;"></div>
        </div>
    </div>
</div>

<script>
    $(function () {
        $('#startDate, #endDate').flatpickr();
    });

    var chart = echarts.init(document.getElementById('chart'));
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
                data:[120, 132, 101, 134, 90, 230, 210],
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
    chart.setOption(chartOptions);
</script>

</body>
</html>
