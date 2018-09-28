<%@ page import="com.me.inner.constant.Constant" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%--
  Created by IntelliJ IDEA.
  User: yanyanghong
  Date: 2018/9/23
  Time: 17:22
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>一级菜单</title>
</head>
<body>
    <div class="container-fluid">
        <div class="row">
            <div class="col-lg-12">
                <h1 class="page-header">一级菜单</h1>
            </div>
        </div>
        <div class="row">
            <div class="col-lg-12 text-right" style="margin-bottom: 10px;"><button type="button" class="btn btn-success" id="btnNew">新建</button></div>
        </div>
        <div class="row">
            <div class="col-lg-12">
                <div class="table-responsive">
                    <table id="classifyTable" class="table table-hover"></table>
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
                    <form:form action="${pageContext.request.contextPath}/classify/newClassify" cssClass="form-horizontal" id="newClassifyForm" method="post">
                        <div class="form-group">
                            <label class="col-xs-4 col-sm-4 col-md-2 control-label" for="newClassifyName">名称</label>
                            <div class="col-xs-8 col-sm-7 col-md-9">
                                <input name="classifyName" type="text" class="form-control" maxlength="20" id="newClassifyName"/>
                                <span class="text-error hide" name="classifyNameMessage"></span>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-xs-4 col-sm-4 col-md-2 control-label" for="newClassifyClass">样式</label>
                            <div class="col-xs-8 col-sm-7 col-md-9">
                                <input name="classifyClass" type="text" class="form-control" maxlength="50" id="newClassifyClass"/>
                                <span class="text-error hide" name="classifyClassMessage"></span>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-xs-4 col-sm-4 col-md-2 control-label" for="newSequence">序列号</label>
                            <div class="col-xs-8 col-sm-7 col-md-9">
                                <input name="sequence" type="text" class="form-control" id="newSequence"/>
                                <span class="text-error hide" name="sequenceMessage"></span>
                            </div>
                        </div>
                    </form:form>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                    <button type="button" class="btn btn-primary" id="newSubmitClassify">确认</button>
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
                    <h4 class="modal-title">编辑</h4>
                </div>
                <div class="modal-body">
                    <form:form action="${pageContext.request.contextPath}/classify/updateClassify" cssClass="form-horizontal" modelAttribute="classifyForm" id="amendClassifyForm" method="post">
                        <input hidden name="classifyId" id="amendClassifyId" />
                        <div class="form-group">
                            <label class="col-xs-4 col-sm-4 col-md-2 control-label" for="amendClassifyName">名称</label>
                            <div class="col-xs-8 col-sm-7 col-md-9">
                                <input name="classifyName" type="text" class="form-control" maxlength="20" id="amendClassifyName"/>
                                <span class="text-error hide" name="classifyNameMessage"></span>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-xs-4 col-sm-4 col-md-2 control-label" for="amendClassifyClass">样式</label>
                            <div class="col-xs-8 col-sm-7 col-md-9">
                                <input name="classifyClass" type="text" class="form-control" maxlength="50" id="amendClassifyClass"/>
                                <span class="text-error hide" name="classifyClassMessage"></span>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-xs-4 col-sm-4 col-md-2 control-label" for="amendSequence">序列号</label>
                            <div class="col-xs-8 col-sm-7 col-md-9">
                                <input name="sequence" type="text" class="form-control" id="amendSequence"/>
                                <span class="text-error hide" name="sequenceMessage"></span>
                            </div>
                        </div>
                    </form:form>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                    <button type="button" class="btn btn-primary" id="amendSubmitClassify">确认</button>
                </div>
            </div>
        </div>
    </div>

    <%-- 新建Modal --%>
    <div class="modal fade" id="newModal" tabindex="-1" role="dialog">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title">提示</h4>
                </div>
                <div class="modal-body">
                    <p class="text-center logout-tip">确定添加该类别吗？</p>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
                    <button type="button" class="btn btn-primary" id="newConfirmClassify">确认</button>
                </div>
            </div>
        </div>
    </div>

    <%-- 修改Modal --%>
    <div class="modal fade" id="amendModal" tabindex="-1" role="dialog">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title">提示</h4>
                </div>
                <div class="modal-body">
                    <p class="text-center logout-tip">确定修改该类别吗？</p>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
                    <button type="button" class="btn btn-primary" id="amendConfirmClassify">确认</button>
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
                    <p class="text-center logout-tip">你确定要开放该分类下的全部二级菜单吗？</p>
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
                    <p class="text-center logout-tip">你确定要关闭该分类下的全部二级菜单吗？</p>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
                    <button type="button" class="btn btn-primary" id="btnClose">确认</button>
                </div>
            </div>
        </div>
    </div>

    <%-- 开放或关闭Modal --%>

<script>
    var tableIndex = 1;
    var classifyId = "";
    $(function () {
        initTable();
    });
    // 新建
    function clearNewForm() {
        $("#newClassifyName").val("");
        $("#newClassifyClass").val("");
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
        $("#newClassifyForm").data("formValidation").destroy();
    });
    $("#newSubmitClassify").on("click", function () {
        var validation = $("#newClassifyForm").data("formValidation");
        validation.validate();
        if (validation.isValid()) {
            $("#newFormModal").modal("hide");
            $("#newModal").modal("show");
        }
    });
    $("#newConfirmClassify").on("click", function () {
        $("#newModal").modal("hide");
        $.ajax({
            url: '${pageContext.request.contextPath}/classify/newClassify',
            data: $("#newClassifyForm").serialize(),
            type: 'POST',
            success: function (result) {
                if (result.success) {
                    $("#outcomeContent").html('添加成功！');
                    $("#classifyTable").bootstrapTable("refresh");
                    tableIndex = 1;
                } else {
                    $("#outcomeContent").html('添加失败，请重新操作！');
                }
                $("#outcomeModal").modal("show");
            }
        });
    });

    // 修改
    function amendClassify(classifyId, classifyName,classifyClass, sequence) {
        $("#amendClassifyId").val(classifyId);
        $("#amendClassifyName").val(classifyName);
        $("#amendClassifyClass").val(classifyClass);
        $("#amendSequence").val(sequence);
        initAmendValidation();
        $("#amendFormModal").modal({
            backdrop: 'static',
            show: true
        });
    }
    $("#amendFormModal").on("hidden.bs.modal", function () {
        $("#amendClassifyForm").data("formValidation").destroy();
    });
    $("#amendSubmitClassify").on("click", function () {
        var validation = $("#amendClassifyForm").data("formValidation");
        validation.validate();
        if (validation.isValid()) {
            $("#amendFormModal").modal("hide");
            $("#amendModal").modal("show");
        }
    });
    $("#amendConfirmClassify").on("click", function () {
        $("#amendModal").modal("hide");
        $.ajax({
            url: "${pageContext.request.contextPath}/classify/updateClassify",
            data: $("#amendClassifyForm").serialize(),
            type: 'POST',
            success: function (result) {
                if (result.success) {
                    $("#outcomeContent").html("修改成功！");
                    $("#classifyTable").bootstrapTable("refresh");
                    tableIndex = 1;
                } else {
                    $("#outcomeContent").html("修改失败！");
                }
                $("#outcomeModal").modal("show");
            }
        });
    });

    // 开放链接
    function activeClassify(id) {
        $("#activeModal").modal("show");
        classifyId =  id;
    }
    $("#btnActive").on("click", function () {
        $("#activeModal").modal("hide");
        $.ajax({
            url: '${pageContext.request.contextPath}/classify/activeClassify',
            data: {
                classifyId: classifyId
            },
            type: 'POST',
            success: function (result) {
                if (result.success) {
                    $("#outcomeContent").html("全部开放成功！");
                    $("#classifyTable").bootstrapTable("refresh");
                    tableIndex = 1;
                } else {
                    $("#outcomeContent").html("开放失败，请重新操作！");
                }
                $("#outcomeModal").modal("show");
            }
        });
    });

    // 关闭链接
    function closeClassify(id) {
        $("#closeModal").modal("show");
        classifyId =  id;
    }
    $("#btnClose").on("click", function () {
        $("#closeModal").modal("hide");
        $.ajax({
            url: '${pageContext.request.contextPath}/classify/closeClassify',
            data: {
                classifyId: classifyId
            },
            type: 'POST',
            success: function (result) {
                if (result.success) {
                    $("#outcomeContent").html("全部关闭成功！");
                    $("#classifyTable").bootstrapTable("refresh");
                    tableIndex = 1;
                } else {
                    $("#outcomeContent").html("关闭失败，请重新操作！");
                }
                $("#outcomeModal").modal("show");
            }
        });
    });

    var classifyNameValidator = {
        message: '请填写名称',
        validators: {
            notEmpty: {
                message: '请填写名称'
            },
            stringLength: {
                max: 20,
                message: "名称不能超过20个字符"
            }
        }
    };

    var classifyClassValidator = {
        message: '请填写样式',
        validators: {
            notEmpty: {
                message: '请填写样式'
            },
            stringLength: {
                max: 50,
                message: "名称不能超过50个字符"
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
        $("#newClassifyForm").formValidation({
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
                    var messageNode  = $('#newClassifyForm').find($("span[name='"+messageName+"']"));
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
                classifyName: classifyNameValidator,
                classifyClass: classifyClassValidator,
                sequence: sequenceValidator
            }
        }).on('err.field.fv', function(e, data) {
            $("#newClassifyForm").find("i.form-control-feedback").remove();

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
            $("#newClassifyForm").find("."+data.field+"Message").css("display","none");
            $("#newClassifyForm").find("."+data.field+"Message").addClass("hide");

            //remove checkbox feedback icon
            $("#newClassifyForm").find("i.form-control-feedback").remove();
        });
    }

    function initAmendValidation() {
        $("#amendClassifyForm").formValidation({
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
                    var messageNode  = $('#amendClassifyForm').find($("span[name='"+messageName+"']"));
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
                classifyName: classifyNameValidator,
                classifyClass: classifyClassValidator,
                sequence: sequenceValidator
            }
        }).on('err.field.fv', function(e, data) {
            $("#amendClassifyForm").find("i.form-control-feedback").remove();

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
            $("#amendClassifyForm").find("."+data.field+"Message").css("display","none");
            $("#amendClassifyForm").find("."+data.field+"Message").addClass("hide");

            //remove checkbox feedback icon
            $("#amendClassifyForm").find("i.form-control-feedback").remove();
        });
    }
    
    function initTable() {
        $("#classifyTable").bootstrapTable({
            url: '${pageContext.request.contextPath}/classify/listClassifyData',
            method: 'POST',
            cache: false,
            contentType: "application/x-www-form-urlencoded",
            queryParams: {},
            pagination: true,
            sidePagination: 'client',
            uniqueId: 'classifyId',
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
                    field: 'classifyName',
                    title: '名称',
                    align: 'center',
                    valign: 'middle'
                },
                {
                    field: 'classifyClass',
                    title: '样式',
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
                            if (row.closedCategory>0) {
                                content += '<button type="button" class="btn btn-success" onclick="activeClassify(\''+row.classifyId+'\')">开放</button>';
                            }
                            if (row.activeCategory>0) {
                                content += '<button type="button" class="btn btn-danger" onclick="closeClassify(\''+row.classifyId+'\')">关闭</button>';
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
