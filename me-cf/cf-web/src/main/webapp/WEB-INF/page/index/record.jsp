<%@ page contentType="text/html;charset=UTF-8" language="java" %>


<!-- 正常添加单条数据弹窗表单 -->
<div class="modal fade" id="add-one" tabindex="-1" role="dialog">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title">记录</h4>
            </div>
            <div class="modal-body">
                <form action="${pageContext.request.contextPath}/record/newRecord" method="post" id="recordForm">
                    <div class="form-group">
                        <label for="late">是否追加</label>
                        <select name="late" class="form-control" id="late">
                            <option value="<%=CommonConstant.YES_NO.NO%>" selected>否</option>
                            <option value="<%=CommonConstant.YES_NO.YES%>">是</option>
                        </select>
                        <span class="text-error hide" name="lateMessage"></span>
                    </div>
                    <div class="form-group">
                        <label for="recordDateStr">日期</label>
                        <input type="text" name="recordDateStr" class="form-control flatpickr" data-max-date="${curDate}" data-date-format="Y-m-d" value="${curDate}"
                               data-default-value="${curDate}" data-enable-time="false" id="recordDateStr" data-date-format="yyyy-mm-dd" readonly style="pointer-events:none"/>
                        <span class="text-error hide" name="lateMessage"></span>
                    </div>
                    <div class="form-group">
                        <label for="type">类型</label>
                        <select name="type" id="type" class="form-control">
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
                        <label for="recordWeight">重量</label>
                        <input type="text" name="weight" class="form-control" id="recordWeight" />
                        <span class="text-error hide" name="weightMessage"></span>
                    </div>
                    <div class="form-group field-type field-price">
                        <label for="price">单价</label>
                        <input type="text" name="price" class="form-control" id="price" />
                        <span class="text-error hide" name="priceMessage"></span>
                    </div>
                    <div class="form-group field-type field-amount">
                        <label for="amount">金额</label>
                        <input type="text" name="amount" class="form-control" id="amount" />
                        <span class="text-error hide" name="amountMessage"></span>
                    </div>
                    <div class="form-group field-type field-count">
                        <label for="count">数量</label>
                        <input type="text" name="count" class="form-control" id="count" maxlength="2" />
                        <span class="text-error hide" name="countMessage"></span>
                    </div>
                    <div class="form-group">
                        <label for="description">备注</label>
                        <textarea name="description" id="description" class="form-control" maxlength="200" style="resize: none;height: 100px;"></textarea>
                        <span class="text-error hide" name="descriptionMessage"></span>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                <button type="button" class="btn btn-primary">确认</button>
            </div>
        </div>
    </div>
</div>

<script>
    $(function () {
        $('#recordDateStr').flatpickr();
        initRecordValidation();
    });

    // 是否追加影响日期
    $("#late").on("change", function () {
        var curDate = "${curDate}";
        var late = $(this).val();
        if ("<%=CommonConstant.YES_NO.YES%>" === late) {
            $("#recordDateStr").css("pointer-events", "auto");
        } else {
            $("#recordDateStr").css("pointer-events", "none");
            $("#recordDateStr").val(curDate).trigger("change");
        }
    });

    // 数据类型变化，影响字段显示
    $("#type").on("change", function () {
        var type = $(this).val();
        var validation = $("#recordForm").data("formValidation");
        if (type) {
            $("#recordWeight").val("");
            $("#price").val("");
            $("#amount").val("");
            $("#count").val("");
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

    function initRecordValidation() {
        $("#recordForm").formValidation({
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
                    var messageNode  = $('#recordForm').find($("span[name='"+messageName+"']"));
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
            $("#recordForm").find("i.form-control-feedback").remove();

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
            $("#btnUserSubmit").removeAttr("disabled");
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
            $("#recordForm").find("."+data.field+"Message").css("display","none");
            $("#recordForm").find("."+data.field+"Message").addClass("hide");

            //remove checkbox feedback icon
            $("#recordForm").find("i.form-control-feedback").remove();
        });
    }
</script>
