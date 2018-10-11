<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!-- 添加销售记录弹窗表单 -->
<div class="modal fade" id="moreFormModal" tabindex="-1" role="dialog">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title">售卖</h4>
            </div>
            <div class="modal-body">
                <form action="${pageContext.request.contextPath}/record/new" method="post" id="moreRecordForm">
                    <div class="form-group">
                        <label for="moreLate">是否追加</label>
                        <select name="late" class="form-control" id="moreLate">
                            <option value="<%=CommonConstant.YES_NO.NO%>" selected>否</option>
                            <option value="<%=CommonConstant.YES_NO.YES%>">是</option>
                        </select>
                        <span class="text-error hide" name="lateMessage"></span>
                    </div>
                    <div class="form-group">
                        <label for="moreRecordDateStr">日期</label>
                        <input type="text" name="recordDateStr" id="moreRecordDateStr" class="form-control flatpickr" data-max-date="${curDate}" data-date-format="Y-m-d" value="${curDate}"
                               data-default-value="${curDate}" data-enable-time="false" readonly style="pointer-events:none" />
                    </div>
                    <div class="form-group">
                        <label for="moreWeight">重量（斤）</label>
                        <input type="text" name="weight" class="form-control" id="moreWeight">
                        <span class="text-error hide" name="weightMessage"></span>
                    </div>
                    <div class="form-group">
                        <label for="morePrice">单价</label>
                        <input type="text" name="price" class="form-control" id="morePrice">
                        <span class="text-error hide" name="priceMessage"></span>
                    </div>
                    <div class="form-group">
                        <label for="moreAmount">金额</label>
                        <input type="text" name="amount" class="form-control" id="moreAmount" />
                        <span class="text-error hide" name="amountMessage"></span>
                    </div>
                    <div class="form-group">
                        <label for="moreDescription">备注</label>
                        <textarea name="description" id="moreDescription" class="form-control" maxlength="200" style="resize: none;height: 100px;"></textarea>
                        <span class="text-error hide" name="descriptionMessage"></span>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                <button type="button" class="btn btn-primary" id="btnSubmitMore">确认</button>
            </div>
        </div>
    </div>
</div>

<%-- 二次确认销售记录 --%>
<div class="modal fade" id="moreConfirmModal" tabindex="-1" role="dialog">
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
                <button type="button" class="btn btn-default" data-dismiss="modal" id="btnCloseMore">关闭</button>
                <button type="button" class="btn btn-primary" id="btnConfirmMore">确认</button>
            </div>
        </div>
    </div>
</div>

<script>

    $(function () {
        $('#moreRecordDateStr').flatpickr({
            onChange: function (dateObj, dateStr, instance) {
                $("#moreRecordForm").data("formValidation").revalidateField("recordDateStr");
            }
        });
        initMoreRecordValidation();
    });

    // 单条数据记录验证
    $("#btnSubmitMore").on("click", function () {
        var validation = $("#moreRecordForm").data("formValidation");
        validation.validate();
        if (validation.isValid()) {
            $("#moreFormModal").modal("hide");
            $("#moreConfirmModal").modal("show");
        }
    });
    $("#btnConfirmMore").on("click", function () {
        $("#moreConfirmModal").modal("hide");
        $.ajax({
            url: "${pageContext.request.contextPath}/record/newRecord",
            data: $("#moreRecordForm").serialize(),
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
    $("#moreFormModal").on("show.bs.modal", function () {
        document.getElementById("moreRecordForm").reset();
        $("#moreRecordDateStr").css("pointer-events", "none");
        initMoreRecordValidation();
    });
    $("#moreFormModal").on("hidden.bs.modal", function () {
        $("#moreRecordForm").data("formValidation").destroy();
    });

    // 是否追加影响日期
    $("#moreLate").on("change", function () {
        var curDate = "${curDate}";
        var late = $(this).val();
        if ("<%=CommonConstant.YES_NO.YES%>" === late) {
            $("#moreRecordDateStr").css("pointer-events", "auto");
        } else {
            $("#moreRecordDateStr").css("pointer-events", "none");
            $("#moreRecordDateStr").val(curDate).trigger("change");
        }
    });

    $("#moreWeight, #morePrice").on("change", function () {
        var weight = $("#moreWeight").val();
        var price = $("#morePrice").val();
        if (weight&&price) {
            var amount = parseFloat(parseFloat(weight).toFixed(2) * parseFloat(price).toFixed(2)).toFixed(2);
            $("#moreAmount").val(amount);
            $("#moreRecordForm").data("formValidation").revalidateField("amount");
        }
    });

    function initMoreRecordValidation() {
        $("#moreRecordForm").formValidation({
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
                    var messageNode  = $('#moreRecordForm').find($("span[name='"+messageName+"']"));
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
                        notEmpty: {
                            message: '请选择日期'
                        }
                    }
                },
                weight:{
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
            $("#moreRecordForm").find("i.form-control-feedback").remove();

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
            $("#moreRecordForm").find("."+data.field+"Message").css("display","none");
            $("#moreRecordForm").find("."+data.field+"Message").addClass("hide");

            //remove checkbox feedback icon
            $("#moreRecordForm").find("i.form-control-feedback").remove();
        });
    }

</script>