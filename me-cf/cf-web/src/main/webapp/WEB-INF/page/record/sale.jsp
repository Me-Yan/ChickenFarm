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
                <label for="startDate">开始时间：</label>
                <input type="text" name="startDate" id="startDate" class="form-control flatpickr" value="${startDate}" data-default-value="${startDate}" placeholder="选择开始时间" readonly />
            </div>
            <div class="form-group">
                <label for="endDate">结束时间：</label>
                <input type="text" name="endDate" id="endDate" class="form-control flatpickr" value="${endDate}" data-default-value="${endDate}" placeholder="选择结束时间" readonly />
            </div>
            <button type="button" class="btn btn-primary" id="btnSearch">查询</button>
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

<%-- 删除Modal --%>
<div class="modal fade" id="deleteModal" tabindex="-1" role="dialog">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title">提示</h4>
            </div>
            <div class="modal-body">
                <p class="text-center">确定删除该记录吗？</p>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
                <button type="button" class="btn btn-primary" id="btnDelete">确认</button>
            </div>
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

<script type="text/javascript">
    var recordId = "";
    $(function () {
        $('#startDate, #endDate').flatpickr();
        initTable();
    });

    $("#btnSearch").on("click", function () {
        var startDate = $("#startDate").val();
        var endDate = $("#endDate").val();
        if (startDate&&endDate) {
            var start = new Date(startDate);
            var end = new Date(endDate);
            start.setFullYear(start.getFullYear()+1);
            start.setDate(start.getDate()+1);
            if (start.getTime()<=end.getTime()) {
                $("#outcomeContent").html("时间范围不能超过1年.");
                $("#outcomeModal").modal("show");
            } else {
                $("#recordTable").bootstrapTable("refresh");
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
    });

    function queryParams(params) {
        var startDate = $("#startDate").val();
        var endDate = $("#endDate").val();

        return {
            startDate: startDate,
            endDate: endDate
        };
    }

    function initTable() {
        $("#recordTable").bootstrapTable({
            url: '${pageContext.request.contextPath}/record/listSaleData',
            method: 'POST',
            cache: false,
            contentType: "application/x-www-form-urlencoded",
            queryParams: queryParams,
            pagination: true,
            sidePagination: 'client',
            uniqueId: 'recordId',
            columns: [
                {
                    field: 'serialNo',
                    title: '#',
                    align: 'center',
                    valign: 'middle'
                },
                {
                    field: 'weight',
                    title: '重量',
                    align: 'center',
                    valign: 'middle'
                },
                {
                    field: 'price',
                    title: '单价',
                    align: 'center',
                    valign: 'middle'
                },
                {
                    field: 'amount',
                    title: '金额',
                    align: 'center',
                    valign: 'middle'
                },
                {
                    field: 'description',
                    title: '备注',
                    align: 'center',
                    valign: 'middle'
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
    
    function deleteRecord(id) {
        recordId = id;
        $("#deleteModal").modal("show");
    }

    $("#btnDelete").on("click", function () {
        $("#deleteModal").modal("hide");
        $.ajax({
            url: "${pageContext.request.contextPath}/record/delete",
            data: {
                recordId: recordId
            },
            type: "POST",
            success: function (result) {
                if (result.success) {
                    $("#outcomeContent").html("删除成功！");
                    $("#recordTable").bootstrapTable("refresh");
                } else {
                    $("#outcomeContent").html("删除失败！");
                }
                $("#outcomeModal").modal("show");
            }
        });
    });
</script>
</body>
</html>