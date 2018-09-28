<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!-- 正常添加单条数据弹窗表单 -->
<div class="modal fade" id="oneFormModal" tabindex="-1" role="dialog">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title">记录</h4>
            </div>
            <div class="modal-body">
                <form action="${pageContext.request.contextPath}/record/newRecord" method="post" id="oneRecordForm">
                    <div class="form-group">
                        <label for="oneLate">是否追加</label>
                        <select name="late" class="form-control" id="oneLate">
                            <option value="<%=CommonConstant.YES_NO.NO%>" selected>否</option>
                            <option value="<%=CommonConstant.YES_NO.YES%>">是</option>
                        </select>
                        <span class="text-error hide" name="lateMessage"></span>
                    </div>
                    <div class="form-group">
                        <label for="oneRecordDateStr">日期</label>
                        <input type="text" name="recordDateStr" class="form-control flatpickr" data-max-date="${curDate}" data-date-format="Y-m-d" value="${curDate}"
                               data-default-value="${curDate}" data-enable-time="false" id="oneRecordDateStr" data-date-format="yyyy-mm-dd" readonly style="pointer-events:none"/>
                        <span class="text-error hide" name="recordDateStrMessage"></span>
                    </div>
                    <div class="form-group">
                        <label for="oneType">类型</label>
                        <select name="type" id="oneType" class="form-control">
                            <option value="">-- 请选择数据类型 --</option>
                            <c:if test="${not empty recordTypeList}">
                                <c:forEach items="${recordTypeList}" var="code">
                                    <option value="${code.name}">${code.value}</option>
                                </c:forEach>
                            </c:if>
                        </select>
                        <span class="text-error hide" name="typeMessage"></span>
                    </div>
                    <div class="form-group field-type field-weight">
                        <label for="oneWeight">重量（斤）</label>
                        <input type="text" name="weight" class="form-control" id="oneWeight" />
                        <span class="text-error hide" name="weightMessage"></span>
                    </div>
                    <div class="form-group field-type field-price">
                        <label for="onePrice">单价</label>
                        <input type="text" name="price" class="form-control" id="onePrice" />
                        <span class="text-error hide" name="priceMessage"></span>
                    </div>
                    <div class="form-group field-type field-amount">
                        <label for="oneAmount">金额</label>
                        <input type="text" name="amount" class="form-control" id="oneAmount" />
                        <span class="text-error hide" name="amountMessage"></span>
                    </div>
                    <div class="form-group field-type field-count">
                        <label for="oneCount">数量</label>
                        <input type="text" name="count" class="form-control" id="oneCount" maxlength="2" />
                        <span class="text-error hide" name="countMessage"></span>
                    </div>
                    <div class="form-group">
                        <label for="oneDescription">备注</label>
                        <textarea name="description" id="oneDescription" class="form-control" maxlength="200" style="resize: none;height: 100px;"></textarea>
                        <span class="text-error hide" name="descriptionMessage"></span>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                <button type="button" class="btn btn-primary" id="btnSubmitOne">确认</button>
            </div>
        </div>
    </div>
</div>
<%-- 二次确认添加单条记录 --%>
<div class="modal fade" id="oneConfirmModal" tabindex="-1" role="dialog">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title">提示</h4>
            </div>
            <div class="modal-body">
                <p class="text-center logout-tip">确定添加吗？</p>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal" id="btnCloseOne">关闭</button>
                <button type="button" class="btn btn-primary" id="btnConfirmOne">确认</button>
            </div>
        </div>
    </div>
</div>

<script>
    $(function () {
        $('#oneRecordDateStr').flatpickr({
            onChange: function (dateObj, dateStr, instance) {
                $("#oneRecordForm").data("formValidation").revalidateField("recordDateStr");
            }
        });
        initOneRecordValidation();
    });

    $("#oneType").on("change", function () {
        $("#oneRecordForm").data("formValidation").revalidateField("recordDateStr");
    });

    // 单条数据记录验证
    $("#btnSubmitOne").on("click", function () {
        var validation = $("#oneRecordForm").data("formValidation");
        validation.validate();
        if (validation.isValid()) {
            $("#oneFormModal").modal("hide");
            $("#oneConfirmModal").modal("show");
        }
    });
    $("#btnConfirmOne").on("click", function () {
        $("#oneConfirmModal").modal("hide");
        $.ajax({
            url: "${pageContext.request.contextPath}/record/newRecord",
            data: $("#oneRecordForm").serialize(),
            type: "POST",
            success: function (result) {
                if (result.success) {
                    $("#outcomeContent").html("添加成功！");
                } else {
                    $("#outcomeContent").html("添加失败，请重新操作！");
                }
                $("#outcomeModal").modal("show");
            }
        });
    });
    $("#oneFormModal").on("show.bs.modal", function () {
        document.getElementById("oneRecordForm").reset();
        $("#oneRecordDateStr").css("pointer-events", "none");
        $(".field-type").hide();
        initOneRecordValidation();
    });
    $("#oneFormModal").on("hidden.bs.modal", function () {
        $("#oneRecordForm").data("formValidation").destroy();
    });

    // 是否追加影响日期
    $("#oneLate").on("change", function () {
        var curDate = "${curDate}";
        var late = $(this).val();
        if ("<%=CommonConstant.YES_NO.YES%>" === late) {
            $("#oneRecordDateStr").css("pointer-events", "auto");
        } else {
            $("#oneRecordDateStr").css("pointer-events", "none");
            $("#oneRecordDateStr").val(curDate).trigger("change");
        }
    });

    // 数据类型变化，影响字段显示
    $("#oneType").on("change", function () {
        var type = $(this).val();
        var validation = $("#oneRecordForm").data("formValidation");
        if (type) {
            $("#oneWeight").val("");
            $("#onePrice").val("");
            $("#oneAmount").val("");
            $("#oneCount").val("");
            validation.enableFieldValidators("weight", false);
            validation.enableFieldValidators("price", false);
            validation.enableFieldValidators("amount", false);
            validation.enableFieldValidators("count", false);

            $(".field-type").hide();
            $(".field-"+type).show();
            if (type === "<%=Constant.Record_Type.WEIGHT%>") {
                validation.enableFieldValidators("weight", true).revalidateField("weight");
            } else if (type === "<%=Constant.Record_Type.PRICE%>") {
                validation.enableFieldValidators("price", true).revalidateField("price");
            } else if (type === "<%=Constant.Record_Type.AMOUNT%>") {
                validation.enableFieldValidators("amount", true).revalidateField("amount");
            } else if (type === "<%=Constant.Record_Type.COUNT%>") {
                validation.enableFieldValidators("count", true).revalidateField("count");
            }
        } else {
            $(".field-type").hide();
        }
    });

    $(".field-type input").on("blur", function () {
        var fieldValue = $(this).val();
        if (fieldValue) {
            $(this).val(parseFloat(fieldValue).toFixed(2)).trigger("change");
        }
    });

    function initOneRecordValidation() {
        $("#oneRecordForm").formValidation({
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
                    var messageNode  = $('#oneRecordForm').find($("span[name='"+messageName+"']"));
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
                late:{
                    message: '请选择是否追加',
                    validators: {
                        notEmpty: {
                            message: '请选择是否追加'
                        }
                    }
                },
                recordDateStr:{
                    message: '请选择日期',
                    validators: {
                        callback: {
                            callback: function (value, validator, $field) {
                                if (value&&value.trim()) {
                                    var type = $("#oneType").val();
                                    if (!(type&&type.trim())) {
                                        return true;
                                    }
                                    var outcome;
                                    $.ajax({
                                        url: "${pageContext.request.contextPath}/record/checkRecordExist",
                                        data: {
                                            type: $("#oneType").val(),
                                            recordDateStr: $("#oneRecordDateStr").val()
                                        },
                                        type: "POST",
                                        async: false,
                                        success: function (result) {
                                            if (result.success) {
                                                outcome = true;
                                            } else {
                                                outcome = false;
                                            }
                                        }
                                    });

                                    if (outcome) {
                                        return true;
                                    }
                                    return {
                                        valid: false,
                                        message: '已经添加了该类型记录，请重新选择日期'
                                    };
                                } else {
                                    return {
                                        valid: false,
                                        message: '请选择日期'
                                    };
                                }
                            }
                        }
                    }
                },
                type:{
                    message: '请选择数据类型',
                    validators: {
                        notEmpty: {
                            message: '请选择数据类型'
                        }
                    }
                },
                weight:{
                    enabled: false,
                    message: '请填写重量',
                    validators: {
                        callback: {
                            callback: function (value, validator, $field) {
                                if (value && value.trim()) {
                                    var weight = parseFloat(value).toFixed(2);
                                    if (weight<100000) {
                                        return true;
                                    } else {
                                        return {
                                            valid: false,
                                            message: '请填写合理的重量'
                                        };
                                    }
                                }
                                return {
                                    valid: false,
                                    message: '请填写重量'
                                };
                            }
                        }
                    }
                },
                price:{
                    enabled: false,
                    message: '请填写单价',
                    validators: {
                        callback: {
                            callback: function (value, validator, $field) {
                                if (value && value.trim()) {
                                    var price = parseFloat(value).toFixed(2);
                                    if (price<10) {
                                        return true;
                                    } else {
                                        return {
                                            valid: false,
                                            message: '请填写合理的单价'
                                        };
                                    }
                                }
                                return {
                                    valid: false,
                                    message: '请填写单价'
                                };
                            }
                        }
                    }
                },
                amount:{
                    enabled: false,
                    message: '请填写金额',
                    validators: {
                        callback: {
                            message: '请输入合理的年龄',
                            callback: function (value) {
                                if (value && value.trim()) {
                                    var amount = parseFloat(value).toFixed(2);
                                    if (amount<100000) {
                                        return true;
                                    } else {
                                        return {
                                            valid: false,
                                            message: '请填写合理的金额'
                                        };
                                    }
                                }
                                return {
                                    valid: false,
                                    message: '请填写金额'
                                };
                            }
                        }
                    }
                },
                count:{
                    enabled: false,
                    message: '请填写数量',
                    validators: {
                        notEmpty: {
                            message: '请填写数量'
                        },
                        integer: {
                            min: 1,
                            message: '请填写有效的数量'
                        }
                    }
                },
                description:{
                    message: '请填写备注',
                    validators: {
                        stringLength: {
                            max: 200,
                            message: '不能超过200个字符'
                        }
                    }
                }
            }
        }).on('err.field.fv', function(e, data) {
            $("#oneRecordForm").find("i.form-control-feedback").remove();

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
            $("#oneRecordForm").find("."+data.field+"Message").css("display","none");
            $("#oneRecordForm").find("."+data.field+"Message").addClass("hide");

            //remove checkbox feedback icon
            $("#oneRecordForm").find("i.form-control-feedback").remove();
        });
    }
</script>
