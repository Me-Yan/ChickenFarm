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
    <title>查询数据</title>
</head>
<body>
<div class="container-fluid">
    <!-- 标题 -->
    <div class="row">
        <div class="col-lg-12">
            <h1 class="page-header">查询</h1>
        </div>
    </div>

    <!-- 搜索 -->
    <div class="row">
        <form class="form-inline text-center" action="">
            <div class="form-group">
                <label for="type">数据类型：</label>
                <select name="type" id="type" class="form-control">
                    <c:if test="${ not empty dataTypeList }">
                        <c:forEach items="${dataTypeList}" var="code">
                            <option value="${code.name}">${code.value}</option>
                        </c:forEach>
                    </c:if>
                </select>
            </div>
            <div class="form-group">
                <label for="startDate">开始时间：</label>
                <input type="text" name="startDate" id="startDate" class="form-control flatpickr" placeholder="选择开始时间" readonly />
            </div>
            <div class="form-group">
                <label for="endDate">结束时间：</label>
                <input type="text" name="endDate" id="endDate" class="form-control flatpickr" placeholder="选择结束时间" readonly />
            </div>
            <button type="button" class="btn btn-primary btn-duty">查询</button>
        </form>
    </div>

    <div class="row">
        <div class="col-lg-12">
            <div class="table-responsive">
                <table id="recordTable" class="table table-hover"></table>
            </div>
        </div>
    </div>
</div>

<script type="text/javascript">
    var tableIndex = 1;
    $(function () {
        $('#startDate, #endDate').flatpickr();
        initTable();
    });

    function initTable() {
        $("#recordTable").bootstrapTable({
            url: '${pageContext.request.contextPath}/record/searchData',
            method: 'POST',
            cache: false,
            contentType: "application/x-www-form-urlencoded",
            queryParams: {
                type: $("#type").val(),
                startDate: $("#startDate").val(),
                endDate: $("#endDate").val()
            },
            pagination: true,
            sidePagination: 'client',
            uniqueId: 'recordId',
            columns: [
                {
                    field: '',
                    title: '#',
                    align: 'center',
                    valign: 'middle',
                    formatter: function (value, row, index) {
                        return tableIndex++;
                    }
                },
                {
                    field: 'typeDisplay',
                    title: '类型',
                    align: 'center',
                    valign: 'middle'
                },
                {
                    field: '',
                    title: '数据',
                    align: 'center',
                    valign: 'middle',
                    formatter: function (value, row, index) {
                        if ("<%=Constant.Record_Type.WEIGHT%>" === row.type) {
                            return row.weight;
                        } else if ("<%=Constant.Record_Type.PRICE%>" === row.type) {
                            return row.price;
                        } else if ("<%=Constant.Record_Type.AMOUNT%>" === row.type) {
                            return row.amount;
                        } else if ("<%=Constant.Record_Type.COUNT%>" === row.type) {
                            return row.count;
                        }
                    }
                },
                {
                    field: 'recordDateStr',
                    title: '记录日期',
                    align: 'center',
                    valign: 'middle'
                },
                {
                    field: '',
                    title: '操作',
                    align: 'center',
                    valign: 'middle',
                    formatter: function (value, row, index) {
                        return '<button type="button" class="btn btn-danger" onclick="deleteRecord(\''+row.recordId+'\')">删除</button>';
                    }
                }
            ]
        });
    }
    
    function deleteRecord(recordId) {

    }
</script>
</body>
</html>