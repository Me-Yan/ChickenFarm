<%@ page import="com.me.inner.constant.CommonConstant" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%--
  Created by IntelliJ IDEA.
  User: yanyanghong
  Date: 2018/8/30
  Time: 23:30
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>List of Code</title>
</head>
<body>

    <div class="container-fluid">
        <div class="row">
            <div class="col-lg-12">
                <h1 class="page-header">系统参数</h1>
            </div>
        </div>
        <div class="row" style="margin-bottom: 15px;">
            <div class="col-xs-6 col-sm-4 col-lg-3">
                <select name="type" id="type" class="form-control">
                    <option value="">-- 选择参数类型 --</option>
                    <c:if test="${not empty codeTypeList}">
                        <c:forEach items="${codeTypeList}" var="codeType">
                            <option value="${codeType}">${codeType}</option>
                        </c:forEach>
                    </c:if>
                </select>
            </div>
            <div class="col-xs-6 col-sm-8 col-lg-9 text-right"><button class="btn btn-success" id="btnNew">新建</button></div>
        </div>
        <div class="row">
            <div class="col-lg-12">
                <div class="table-responsive">
                    <table id="codeTable" class="table table-hover"></table>
                </div>
            </div>
        </div>
    </div>

    <%-- 新建form --%>
    <div class="modal fade" id="newFormModal" tabindex="-1" role="dialog">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title">新建</h4>
                </div>
                <div class="modal-body">
                    <form:form action="${pageContext.request.contextPath}/code/new" cssClass="form-horizontal" id="newCodeForm" method="post">
                        <div class="form-group">
                            <label class="col-xs-4 col-sm-4 col-md-2 control-label" for="newCodeType">参数类型</label>
                            <div class="col-xs-8 col-sm-7 col-md-9">
                                <input name="type" type="text" class="form-control" maxlength="20" id="newCodeType"/>
                                <span class="text-error hide" name="typeMessage"></span>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-xs-4 col-sm-4 col-md-2 control-label" for="newName">名称</label>
                            <div class="col-xs-8 col-sm-7 col-md-9">
                                <input name="name" type="text" class="form-control" maxlength="50" id="newName"/>
                                <span class="text-error hide" name="nameMessage"></span>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-xs-4 col-sm-4 col-md-2 control-label" for="newValue">值</label>
                            <div class="col-xs-8 col-sm-7 col-md-9">
                                <input name="value" type="text" class="form-control" maxlength="50" id="newValue"/>
                                <span class="text-error hide" name="valueMessage"></span>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-xs-4 col-sm-4 col-md-2 control-label" for="newDescription">备注</label>
                            <div class="col-xs-8 col-sm-7 col-md-9">
                                <input name="description" type="text" class="form-control" id="newDescription" maxlength="200"/>
                                <span class="text-error hide" name="descriptionMessage"></span>
                            </div>
                        </div>
                    </form:form>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                    <button type="button" class="btn btn-primary" id="newSubmitCode">确认</button>
                </div>
            </div>
        </div>
    </div>

    <%-- 修改form --%>
    <div class="modal fade" id="amendFormModal" tabindex="-1" role="dialog">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title">新建</h4>
                </div>
                <div class="modal-body">
                    <form:form action="${pageContext.request.contextPath}/code/update" cssClass="form-horizontal" id="amendCodeForm" method="post">
                        <input hidden name="codeId" id="amendCodeId" />

                        <div class="form-group">
                            <label class="col-xs-4 col-sm-4 col-md-2 control-label" for="amendCodeType">参数类型</label>
                            <div class="col-xs-8 col-sm-7 col-md-9">
                                <input name="type" type="text" class="form-control" maxlength="20" id="amendCodeType"/>
                                <span class="text-error hide" name="typeMessage"></span>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-xs-4 col-sm-4 col-md-2 control-label" for="amendName">名称</label>
                            <div class="col-xs-8 col-sm-7 col-md-9">
                                <input name="name" type="text" class="form-control" maxlength="50" id="amendName"/>
                                <span class="text-error hide" name="nameMessage"></span>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-xs-4 col-sm-4 col-md-2 control-label" for="amendValue">值</label>
                            <div class="col-xs-8 col-sm-7 col-md-9">
                                <input name="value" type="text" class="form-control" maxlength="50" id="amendValue"/>
                                <span class="text-error hide" name="valueMessage"></span>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-xs-4 col-sm-4 col-md-2 control-label" for="amendDescription">备注</label>
                            <div class="col-xs-8 col-sm-7 col-md-9">
                                <input name="description" type="text" class="form-control" id="amendDescription" maxlength="200"/>
                                <span class="text-error hide" name="descriptionMessage"></span>
                            </div>
                        </div>
                    </form:form>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                    <button type="button" class="btn btn-primary" id="amendSubmitCode">确认</button>
                </div>
            </div>
        </div>
    </div>

    <%-- 新建二次确认Modal --%>
    <div class="modal fade" id="newModal" tabindex="-1" role="dialog">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title">提示</h4>
                </div>
                <div class="modal-body">
                    <p class="text-center logout-tip">确定提交该参数吗？</p>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
                    <button type="button" class="btn btn-primary" id="newConfirmCode">确认</button>
                </div>
            </div>
        </div>
    </div>

    <%-- 修改二次确认Modal --%>
    <div class="modal fade" id="amendModal" tabindex="-1" role="dialog">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title">提示</h4>
                </div>
                <div class="modal-body">
                    <p class="text-center logout-tip">确定修改该参数吗？</p>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
                    <button type="button" class="btn btn-primary" id="amendConfirmCode">确认</button>
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
                    <p class="text-center logout-tip">确定删除该参数吗？</p>
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

    <script>
        var serialNo = 1;
        var codeId = "";

        $(function () {
            initTable();
            initNewValidation();
            initAmendValidation();
        });

        // 新建Code
        function clearNewForm() {
            $("#newCodeType").val("");
            $("#newName").val("");
            $("#newValue").val("");
            $("#newDescription").val("");
        }
        $("#btnNew").on("click", function () {
            $("#newFormModal").modal({
                backdrop: 'static',
                show: true
            });
        });
        $("#newFormModal").on("show.bs.modal", function () {
            clearNewForm();
            initNewValidation();
        });
        $("#newFormModal").on("hidden.bs.modal", function () {
            $("#newCodeForm").data("formValidation").destroy();
        });
        $("#newSubmitCode").on("click", function () {
            var validation = $("#newCodeForm").data("formValidation");
            validation.validate();
            if (validation.isValid()) {
                $("#newFormModal").modal("hide");
                $("#newModal").modal("show");
            }
        });
        $("#newConfirmCode").on("click", function () {
            $("#newModal").modal("hide");
            $.ajax({
                url: '${pageContext.request.contextPath}/code/new',
                data: $("#newCodeForm").serialize(),
                type: 'POST',
                success: function (result) {
                    if (result.success === true) {
                        $("#outcomeContent").html("添加成功！");
                    } else {
                        $("#outcomeContent").html("添加失败，请重新添加！");
                    }
                    $("#outcomeModal").modal("show");
                    serialNo = 1;
                    $("#codeTable").bootstrapTable("refresh");
                }
            });
        });

        // 修改Code
        function editCode(codeId, type, name, value, description) {
            $("#amendCodeId").val(codeId);
            $("#amendCodeType").val(type);
            $("#amendName").val(name);
            $("#amendValue").val(value);
            $("#amendDescription").val(description);
            initAmendValidation();
            $("#amendFormModal").modal({
                backdrop: 'static',
                show: true
            });
        }

        $("#amendFormModal").on("hidden.bs.modal", function () {
            $("#amendCodeForm").data("formValidation").destroy();
        });
        $("#amendSubmitCode").on("click", function () {
            var validation = $("#amendCodeForm").data("formValidation");
            validation.validate();
            if (validation.isValid()) {
                $("#amendFormModal").modal("hide");
                $("#amendModal").modal("show");
            }
        });
        $("#amendConfirmCode").on("click", function () {
            $("#amendModal").modal("hide");
            $.ajax({
                url: '${pageContext.request.contextPath}/code/update',
                data: $("#amendCodeForm").serialize(),
                type: 'POST',
                success: function (result) {
                    if (result.success === true) {
                        $("#outcomeContent").html("修改成功！");
                    } else {
                        $("#outcomeContent").html("修改失败，请重新修改！");
                    }
                    $("#outcomeModal").modal("show");
                    serialNo = 1;
                    $("#codeTable").bootstrapTable("refresh");
                }
            });
        });

        // 删除Code
        function deleteCode(id) {
            codeId = id;
            $("#deleteModal").modal("show");
        }

        $("#btnDelete").on("click", function () {
            $("#deleteModal").modal("hide");
            $.ajax({
                url: "${pageContext.request.contextPath}/code/delete",
                data: {
                    codeId: codeId
                },
                type: "POST",
                success: function (result) {
                    if (result.success === true) {
                        $("#outcomeContent").html("删除成功！");
                    } else {
                        $("#outcomeContent").html("删除失败！");
                    }
                    $("#outcomeModal").modal("show");
                    serialNo = 1;
                    $("#codeTable").bootstrapTable("refresh");
                }
            });
        });

        $("#type").on("change", function () {
            serialNo = 1;
            $("#codeTable").bootstrapTable("refresh");
        });

        function queryParams(params) {
            return {
                type: $("#type").val()
            };
        }

        var typeValidator = {
            message: '请填写参数类型',
            validators: {
                notEmpty: {
                    message: '请填写参数类型'
                },
                stringLength: {
                    max: 20,
                    message: '不能超过20个字符'
                }
            }
        };
        var nameValidator = {
            message: '请填写参数名',
            validators: {
                notEmpty: {
                    message: '请填写参数名'
                },
                stringLength: {
                    max: 50,
                    message: '不能超过50个字符'
                }
            }
        };
        var valueValidator = {
            message: '请填写值',
            validators: {
                notEmpty: {
                    message: '请填写值'
                },
                stringLength: {
                    max: 50,
                    message: '不能超过50个字符'
                }
            }
        };
        var descriptionValidator = {
            message: '不能超过200个字符',
            validators: {
                stringLength: {
                    max: 200,
                    message: '不能超过200个字符'
                }
            }
        };
        
        function initNewValidation() {
            $("#newCodeForm").formValidation({
                excluded: [':disabled'],
                message: 'This value is not valid',
                feedbackIcons: {
                    valid: 'glyphicon glyphicon-ok',
                    invalid: 'glyphicon glyphicon-remove',
                    validating: 'glyphicon glyphicon-refresh'
                },
                err: {
                    container: function($field, validator) {
                        var messageName = $($field).attr("name")+"Message";
                        var messageNode  = $('#newCodeForm').find($("span[name='"+messageName+"']"));
                        messageNode.addClass("has-error");
                        messageNode.removeClass("hide");
                        return messageNode;
                    }
                },
                row: {
                    valid: 'has-success',
                    invalid: 'has-error',
                    feedback: 'has-feedback'
                },
                icon: {
                    valid: null,
                    invalid: null,
                    validating: null
                },
                fields: {
                    type: typeValidator,
                    name: nameValidator,
                    value: valueValidator,
                    description: descriptionValidator
                }
            }).on('err.field.fv', function(e, data) {
                $("#newCodeForm").find("i.form-control-feedback").remove();

                if($(data.element).is('select')) {
                    $(data.element).next().addClass("has-error");
                    $(data.element).next().removeClass("has-success");
                }
                else if($(data.element).is('textarea')) {
                    $(data.element).parent().addClass("has-error");
                    $(data.element).parent().removeClass("has-success");
                }
                else {
                    $(data.element).addClass("has-error");
                    $(data.element).removeClass("has-success");
                }
            }).on('success.field.fv', function(e, data) {
//            $("#btnUserSubmit").removeAttr("disabled");
                if($(data.element).is('select')) {
                    $(data.element).next().removeClass("has-error");
                    $(data.element).next().addClass("has-success");
                }
                else if($(data.element).is('textarea')) {
                    $(data.element).parent().removeClass("has-error");
                    $(data.element).parent().addClass("has-success");
                }
                else {
                    $(data.element).removeClass("has-error");
                    $(data.element).addClass("has-success");
                }
                $("#newCodeForm").find("."+data.field+"Message").css("display","none");
                $("#newCodeForm").find("."+data.field+"Message").addClass("hide");

                //remove checkbox feedback icon
                $("#newCodeForm").find("i.form-control-feedback").remove();
            });
        }

        function initAmendValidation() {
            $("#amendCodeForm").formValidation({
                excluded: [':disabled'],
                message: 'This value is not valid',
                feedbackIcons: {
                    valid: 'glyphicon glyphicon-ok',
                    invalid: 'glyphicon glyphicon-remove',
                    validating: 'glyphicon glyphicon-refresh'
                },
                err: {
                    container: function($field, validator) {
                        var messageName = $($field).attr("name")+"Message";
                        var messageNode  = $('#amendCodeForm').find($("span[name='"+messageName+"']"));
                        messageNode.addClass("has-error");
                        messageNode.removeClass("hide");
                        return messageNode;
                    }
                },
                row: {
                    valid: 'has-success',
                    invalid: 'has-error',
                    feedback: 'has-feedback'
                },
                icon: {
                    valid: null,
                    invalid: null,
                    validating: null
                },
                fields: {
                    type: typeValidator,
                    name: nameValidator,
                    value: valueValidator,
                    description: descriptionValidator
                }
            }).on('err.field.fv', function(e, data) {
                $("#amendCodeForm").find("i.form-control-feedback").remove();

                if($(data.element).is('select')) {
                    $(data.element).next().addClass("has-error");
                    $(data.element).next().removeClass("has-success");
                }
                else if($(data.element).is('textarea')) {
                    $(data.element).parent().addClass("has-error");
                    $(data.element).parent().removeClass("has-success");
                }
                else {
                    $(data.element).addClass("has-error");
                    $(data.element).removeClass("has-success");
                }
            }).on('success.field.fv', function(e, data) {
//            $("#btnUserSubmit").removeAttr("disabled");
                if($(data.element).is('select')) {
                    $(data.element).next().removeClass("has-error");
                    $(data.element).next().addClass("has-success");
                }
                else if($(data.element).is('textarea')) {
                    $(data.element).parent().removeClass("has-error");
                    $(data.element).parent().addClass("has-success");
                }
                else {
                    $(data.element).removeClass("has-error");
                    $(data.element).addClass("has-success");
                }
                $("#amendCodeForm").find("."+data.field+"Message").css("display","none");
                $("#amendCodeForm").find("."+data.field+"Message").addClass("hide");

                //remove checkbox feedback icon
                $("#amendCodeForm").find("i.form-control-feedback").remove();
            });
        }

        function initTable() {
            $("#codeTable").bootstrapTable({
                url: "${pageContext.request.contextPath}/code/listCodeData",
                method: 'POST',
                dataType: 'json',
                contentType: "application/x-www-form-urlencoded",
                cache: false,
                sidePagination: "client",
                pagination: true,
                queryParams: queryParams,
                pageNumber: 1,
                pageSize: 10,
                pageList: [10],
                uniqueId: "codeId",
                cellStyle: function (value, row, index, field) {
                    return {
                        css: {'word-wrap': 'break-word', 'word-break': 'break-all'}
                    }
                },
                columns: [
                    {
                        field : '',
                        title : '#',
                        align : 'center',
                        valign : 'middle',
                        formatter: function (value, row, index) {
                            return serialNo++;
                        }
                    },
                    {
                        field : 'type',
                        title : '类型',
                        align : 'center',
                        valign : 'middle'
                    },
                    {
                        field : 'name',
                        title : '参数名',
                        align : 'center',
                        valign : 'middle'
                    },
                    {
                        field : 'value',
                        title : '值',
                        align : 'center',
                        valign : 'middle'
                    },
                    {
                        field : 'description',
                        title : '描述',
                        align : 'center',
                        valign : 'middle'
                    },
                    {
                        field : 'createBy',
                        title : '创建者',
                        align : 'center',
                        valign : 'middle'
                    },
                    {
                        field : 'createDateStr',
                        title : '创建时间',
                        align : 'center',
                        valign : 'middle'
                    },
                    {
                        field : '',
                        title : '操作',
                        align : 'center',
                        valign : 'middle',
                        formatter: function (value, row, index) {
                            if ("<%=CommonConstant.CodeStatus.ACTIVE%>" === row.active) {
                                return '<button class="btn btn-primary" onclick="editCode(\'' + row.codeId + '\',\'' + row.type + '\',\'' + row.name + '\',\'' + row.value + '\',\'' + row.description + '\')">修改</button>&nbsp;&nbsp;' +
                                    '<button class="btn btn-danger" onclick="deleteCode(\'' + row.codeId + '\')">删除</button>';
                            }
                            return "不可操作";
                        }
                    }
                ]
            });
        }
    </script>

</body>
</html>
