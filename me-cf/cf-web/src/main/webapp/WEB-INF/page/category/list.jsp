<%@ page import="com.me.inner.constant.CommonConstant" %>
<%@ page import="com.me.inner.constant.Constant" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: yanyanghong
  Date: 2018/9/23
  Time: 18:00
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>二级菜单</title>
</head>
<body>

<div class="container-fluid">
    <div class="row">
        <div class="col-lg-12">
            <h1 class="page-header">二级菜单</h1>
        </div>
    </div>
    <div class="row" style="margin-bottom: 15px;">
        <div class="col-xs-6 col-sm-4 col-lg-3">
            <select name="classifyName" id="classifyName" class="form-control">
                <option value="">-- 所有一级菜单 --</option>
                <c:if test="${not empty classifyList}">
                    <c:forEach items="${classifyList}" var="classify">
                        <option value="${classify.classifyId}">${classify.classifyName}</option>
                    </c:forEach>
                </c:if>
            </select>
        </div>
        <div class="col-xs-6 col-sm-8 col-lg-9 text-right"><button class="btn btn-success">新建</button></div>
    </div>
    <div class="row">
        <div class="col-lg-12">
            <div class="table-responsive">
                <table id="categoryTable" class="table table-hover"></table>
            </div>
        </div>
    </div>
</div>

<script>
    var tableIndex = 1;
    $(function () {
        initTable();
    });

    $("#classifyName").on("change", function () {
        $("#categoryTable").bootstrapTable("refresh");
        tableIndex = 1;
    });

    function queryParams(params) {
        var classifyId = $("#classifyName").val();
        return {
            classifyId: classifyId
        };
    }

    function initTable() {
        $("#categoryTable").bootstrapTable({
            url: '${pageContext.request.contextPath}/category/listData',
            method: 'POST',
            cache: false,
            contentType: "application/x-www-form-urlencoded",
            queryParams: queryParams,
            pagination: true,
            sidePagination: 'client',
            uniqueId: 'categoryId',
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
                    field: 'categoryName',
                    title: '名称',
                    align: 'center',
                    valign: 'middle'
                },
                {
                    field: 'classifyName',
                    title: '所属分类',
                    align: 'center',
                    valign: 'middle'
                },
                {
                    field: 'path',
                    title: '链接',
                    align: 'center',
                    valign: 'middle'
                },
                {
                    field: 'sequence',
                    title: '序列号',
                    align: 'center',
                    valign: 'middle'
                },
                {
                    field: 'active',
                    title: '状态',
                    align: 'center',
                    valign: 'middle',
                    formatter: function (value, row, index) {
                        if ("<%=CommonConstant.IN_ACTIVE.ACTIVE%>" === value) {
                            return "开放中";
                        } else {
                            return "已关闭";
                        }
                    }
                },
                {
                    field: 'createDateStr',
                    title: '添加时间',
                    align: 'center',
                    valign: 'middle'
                },
                {
                    field: '',
                    title: '操作',
                    align: 'center',
                    valign: 'middle',
                    formatter: function (value, row, index) {
                        var  content = '<div class="btn-group"><button type="button" class="btn btn-primary" onclick="amendClassify(\''+row.classifyId+'\', \''+row.classifyName+'\', \''+row.classifyClass+'\', \''+row.sequence+'\')">修改</button>';

                        if ("<%=Constant.Classify_Status.VARIABLE%>" === row.status) {
                            if ("<%=CommonConstant.IN_ACTIVE.ACTIVE%>" === row.active) {
                                content += '<button type="button" class="btn btn-danger" onclick="closeClassify('+row.classifyId+')">关闭</button>';
                            } else {
                                content += '<button type="button" class="btn btn-success" onclick="activeClassify('+row.classifyId+')">开放</button>';
                            }
                        }

                        content += '</div>';

                        return content;
                    }
                }
            ]
        });
    }
</script>
</body>
</html>
