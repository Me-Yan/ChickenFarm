<%@ page import="com.me.inner.constant.CommonConstant" %>
<%@ page import="com.me.inner.constant.Constant" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
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
        <div class="col-xs-6 col-sm-8 col-lg-9 text-right"><button class="btn btn-success" id="btnNew">新建</button></div>
    </div>
    <div class="row">
        <div class="col-lg-12">
            <div class="table-responsive">
                <table id="categoryTable" class="table table-hover"></table>
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
                <form:form action="${pageContext.request.contextPath}/category/newCategory" cssClass="form-horizontal" id="newCategoryForm" method="post">
                    <div class="form-group">
                        <label class="col-xs-4 col-sm-4 col-md-2 control-label" for="newClassifyId">一级菜单</label>
                        <div class="col-xs-8 col-sm-7 col-md-9">
                            <select name="classifyId" id="newClassifyId" class="form-control">
                                <option value="">-- 请选择一级菜单 --</option>
                                <c:if test="${not empty classifyList}">
                                    <c:forEach items="${classifyList}" var="classify">
                                        <option value="${classify.classifyId}">${classify.classifyName}</option>
                                    </c:forEach>
                                </c:if>
                            </select>
                            <span class="text-error hide" name="classifyIdMessage"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-xs-4 col-sm-4 col-md-2 control-label" for="newCategoryName">名称</label>
                        <div class="col-xs-8 col-sm-7 col-md-9">
                            <input name="categoryName" type="text" class="form-control" maxlength="20" id="newCategoryName"/>
                            <span class="text-error hide" name="categoryNameMessage"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-xs-4 col-sm-4 col-md-2 control-label" for="newPath">链接</label>
                        <div class="col-xs-8 col-sm-7 col-md-9">
                            <input name="path" type="text" class="form-control" maxlength="50" id="newPath"/>
                            <span class="text-error hide" name="pathMessage"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-xs-4 col-sm-4 col-md-2 control-label" for="newSequence">序列号</label>
                        <div class="col-xs-8 col-sm-7 col-md-9">
                            <input name="sequence" type="text" class="form-control" id="newSequence" maxlength="2"/>
                            <span class="text-error hide" name="sequenceMessage"></span>
                        </div>
                    </div>
                </form:form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                <button type="button" class="btn btn-primary" id="newSubmitCategory">确认</button>
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
                <form:form action="${pageContext.request.contextPath}/category/updateCategory" cssClass="form-horizontal" id="amendCategoryForm" method="post">
                    <input hidden name="categoryId" id="amendCategoryId" />

                    <div class="form-group">
                        <label class="col-xs-4 col-sm-4 col-md-2 control-label" for="amendClassifyId">一级菜单</label>
                        <div class="col-xs-8 col-sm-7 col-md-9">
                            <select name="classifyId" id="amendClassifyId" class="form-control">
                                <option value="">-- 请选择一级菜单 --</option>
                                <c:if test="${not empty classifyList}">
                                    <c:forEach items="${classifyList}" var="classify">
                                        <option value="${classify.classifyId}">${classify.classifyName}</option>
                                    </c:forEach>
                                </c:if>
                            </select>
                            <span class="text-error hide" name="classifyIdMessage"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-xs-4 col-sm-4 col-md-2 control-label" for="amendCategoryName">名称</label>
                        <div class="col-xs-8 col-sm-7 col-md-9">
                            <input name="categoryName" type="text" class="form-control" maxlength="20" id="amendCategoryName"/>
                            <span class="text-error hide" name="categoryNameMessage"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-xs-4 col-sm-4 col-md-2 control-label" for="amendPath">链接</label>
                        <div class="col-xs-8 col-sm-7 col-md-9">
                            <input name="path" type="text" class="form-control" maxlength="50" id="amendPath"/>
                            <span class="text-error hide" name="pathMessage"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-xs-4 col-sm-4 col-md-2 control-label" for="amendSequence">序列号</label>
                        <div class="col-xs-8 col-sm-7 col-md-9">
                            <input name="sequence" type="text" class="form-control" id="amendSequence" maxlength="2"/>
                            <span class="text-error hide" name="sequenceMessage"></span>
                        </div>
                    </div>
                </form:form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                <button type="button" class="btn btn-primary" id="amendSubmitCategory">确认</button>
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
                <p class="text-center logout-tip">确定提交该二级菜单吗？</p>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
                <button type="button" class="btn btn-primary" id="newConfirmCategory">确认</button>
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
                <p class="text-center logout-tip">确定修改该二级菜单吗？</p>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
                <button type="button" class="btn btn-primary" id="amendConfirmCategory">确认</button>
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

<%-- 激活Modal --%>
<div class="modal fade" id="activeModal" tabindex="-1" role="dialog">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title">提示</h4>
            </div>
            <div class="modal-body">
                <p class="text-center logout-tip">确定要开放该二级菜单吗？</p>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
                <button type="button" class="btn btn-primary" id="btnActive">确认</button>
            </div>
        </div>
    </div>
</div>

<%-- 关闭Modal --%>
<div class="modal fade" id="closeModal" tabindex="-1" role="dialog">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title">提示</h4>
            </div>
            <div class="modal-body">
                <p class="text-center logout-tip">确定要关闭二级菜单吗？</p>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
                <button type="button" class="btn btn-primary" id="btnClose">确认</button>
            </div>
        </div>
    </div>
</div>

<script>
    var tableIndex = 1;
    var categoryId = "";
    $(function () {
        initTable();
    });

    // 开放链接
    function activeCategory(id) {
        $("#activeModal").modal("show");
        categoryId =  id;
    }
    $("#btnActive").on("click", function () {
        $("#activeModal").modal("hide");
        $.ajax({
            url: '${pageContext.request.contextPath}/category/activeCategory',
            data: {
                categoryId: categoryId
            },
            type: 'POST',
            success: function (result) {
                if (result.success) {
                    $("#outcomeContent").html("开放成功！");
                    $("#categoryTable").bootstrapTable("refresh");
                    tableIndex = 1;
                } else {
                    $("#outcomeContent").html("开放失败，请重新操作！");
                }
                $("#outcomeModal").modal("show");
            }
        });
    });

    // 关闭链接
    function closeCategory(id) {
        $("#closeModal").modal("show");
        categoryId =  id;
    }
    $("#btnClose").on("click", function () {
        $("#closeModal").modal("hide");
        $.ajax({
            url: '${pageContext.request.contextPath}/category/closeCategory',
            data: {
                categoryId: categoryId
            },
            type: 'POST',
            success: function (result) {
                if (result.success) {
                    $("#outcomeContent").html("关闭成功！");
                    $("#categoryTable").bootstrapTable("refresh");
                    tableIndex = 1;
                } else {
                    $("#outcomeContent").html("关闭失败，请重新操作！");
                }
                $("#outcomeModal").modal("show");
            }
        });
    });

    // 新建二级菜单
    function clearNewForm() {
        $("#newClassifyId").val("");
        $("#newCategoryName").val("");
        $("#newPath").val("");
        $("#newSequence").val("");
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
        $("#newCategoryForm").data("formValidation").destroy();
    });
    $("#newSubmitCategory").on("click", function () {
        var validation = $("#newCategoryForm").data("formValidation");
        validation.validate();
        if (validation.isValid()) {
            $("#newFormModal").modal("hide");
            $("#newModal").modal("show");
        }
    });
    $("#newConfirmCategory").on("click", function () {
        $("#newModal").modal("hide");
        $.ajax({
            url: '${pageContext.request.contextPath}/category/newCategory',
            data: $("#newCategoryForm").serialize(),
            type: 'POST',
            success: function (result) {
                if (result.success === true) {
                    $("#outcomeContent").html("添加成功！");
                } else {
                    $("#outcomeContent").html("添加失败，请重新添加！");
                }
                $("#outcomeModal").modal("show");
                $("#categoryTable").bootstrapTable("refresh");
            }
        });
    });

    // 修改二级菜单
    function amendCategory(categoryId, categoryName, path, classifyId, sequence) {
        $("#amendCategoryId").val(categoryId);
        $("#amendCategoryName").val(categoryName);
        $("#amendPath").val(path);
        $("#amendClassifyId").val(classifyId);
        $("#amendSequence").val(sequence);
        initAmendValidation();
        $("#amendFormModal").modal({
            backdrop: 'static',
            show: true
        });
    }
    $("#amendFormModal").on("hidden.bs.modal", function () {
        $("#amendCategoryForm").data("formValidation").destroy();
    });
    $("#amendSubmitCategory").on("click", function () {
        var validation = $("#amendCategoryForm").data("formValidation");
        validation.validate();
        if (validation.isValid()) {
            $("#amendFormModal").modal("hide");
            $("#amendModal").modal("show");
        }
    });
    $("#amendConfirmCategory").on("click", function () {
        $("#amendModal").modal("hide");
        $.ajax({
            url: '${pageContext.request.contextPath}/category/updateCategory',
            data: $("#amendCategoryForm").serialize(),
            type: 'POST',
            success: function (result) {
                if (result.success === true) {
                    $("#outcomeContent").html("修改成功！");
                } else {
                    $("#outcomeContent").html("修改失败，请重新修改！");
                }
                $("#outcomeModal").modal("show");
                $("#categoryTable").bootstrapTable("refresh");
            }
        });
    });

    $("#classifyName").on("change", function () {
        $("#categoryTable").bootstrapTable("refresh");
        tableIndex = 1;
    });

    var classifyIdValidator = {
        message: '请选择一级菜单',
        validators: {
            notEmpty: {
                message: '请选择一级菜单'
            }
        }
    };

    var categoryNameValidator = {
        message: '请填写名称',
        validators: {
            notEmpty: {
                message: '请填写名称'
            },
            stringLength: {
                max: 20,
                message: '不能超过20个字符'
            }
        }
    };

    var pathValidator = {
        message: '请填写链接',
        validators: {
            notEmpty: {
                message: '请填写链接'
            },
            stringLength: {
                max: 50,
                message: '不能超过50个字符'
            }
        }
    };

    var sequenceValidator = {
        message: '请填写序列号',
        validators: {
            notEmpty: {
                message: '请填写序列号'
            },
            integer: {
                max: 100,
                message: '请填写有效的序列号'
            }
        }
    };
    
    function initNewValidation() {
        $("#newCategoryForm").formValidation({
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
                    var messageNode  = $('#newCategoryForm').find($("span[name='"+messageName+"']"));
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
                classifyId: classifyIdValidator,
                categoryName: categoryNameValidator,
                path: pathValidator,
                sequence: sequenceValidator
            }
        }).on('err.field.fv', function(e, data) {
            $("#newCategoryForm").find("i.form-control-feedback").remove();

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
            $("#newCategoryForm").find("."+data.field+"Message").css("display","none");
            $("#newCategoryForm").find("."+data.field+"Message").addClass("hide");

            //remove checkbox feedback icon
            $("#newCategoryForm").find("i.form-control-feedback").remove();
        });
    }

    function initAmendValidation() {
        $("#amendCategoryForm").formValidation({
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
                    var messageNode  = $('#amendCategoryForm').find($("span[name='"+messageName+"']"));
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
                classifyId: classifyIdValidator,
                categoryName: categoryNameValidator,
                path: pathValidator,
                sequence: sequenceValidator
            }
        }).on('err.field.fv', function(e, data) {
            $("#amendCategoryForm").find("i.form-control-feedback").remove();

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
            $("#amendCategoryForm").find("."+data.field+"Message").css("display","none");
            $("#amendCategoryForm").find("."+data.field+"Message").addClass("hide");

            //remove checkbox feedback icon
            $("#amendCategoryForm").find("i.form-control-feedback").remove();
        });
    }

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
                        var  content = '<div class="btn-group"><button type="button" class="btn btn-primary" onclick="amendCategory(\''+row.categoryId+'\', \''+row.categoryName+'\', \''+row.path+'\', \''+row.classifyId+'\', \''+row.sequence+'\')">修改</button>';

                        if ("<%=Constant.Classify_Status.VARIABLE%>" === row.status) {
                            if ("<%=CommonConstant.IN_ACTIVE.ACTIVE%>" === row.active) {
                                content += '<button type="button" class="btn btn-danger" onclick="closeCategory(\''+row.categoryId+'\')">关闭</button>';
                            } else {
                                content += '<button type="button" class="btn btn-success" onclick="activeCategory(\''+row.categoryId+'\')">开放</button>';
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
