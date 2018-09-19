<%@ page import="org.springframework.security.core.context.SecurityContextHolder" %>
<%@ page import="com.me.inner.dto.BaseUserDetails" %>
<%@ page import="com.me.inner.constant.Constant" %>
<%@ page import="com.me.inner.constant.CommonConstant" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>锦昱养殖管理系统</title>
    <script type="application/javascript" src="${pageContext.request.contextPath}/resources/plugins/jquery/jquery-3.3.1.min.js"></script>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/plugins/bootstrap/css/bootstrap.min.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/plugins/font-awesome/css/font-awesome.min.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/plugins/select2/select2.min.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/plugins/datetime-picker/flatpickr.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/plugins/datetime-picker/flatpickr-blue.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/styles/index/sb-bootstrap.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/styles/index/metisMenu.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/styles/index/top.css">
    <script type="application/javascript" src="${pageContext.request.contextPath}/resources/plugins/bootstrap/js/bootstrap.min.js"></script>
    <script type="application/javascript" src="${pageContext.request.contextPath}/resources/plugins/formValidation/formValidation.js"></script>
    <script type="application/javascript" src="${pageContext.request.contextPath}/resources/plugins/formValidation/formValidation.bootstrap.js"></script>
    <script type="application/javascript" src="${pageContext.request.contextPath}/resources/plugins/select2/select2.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/scripts/index/sb-bootstrap.js"></script>
    <script src="${pageContext.request.contextPath}/resources/scripts/index/metisMenu.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/plugins/datetime-picker/flatpickr.min.js"></script>
</head>
<body style="overflow-y: hidden;">
<div id="wrapper">

    <!-- Navigation -->
    <nav class="navbar navbar-default navbar-fixed-top" id="index-top" role="navigation" style="margin-bottom: 0">
        <div class="navbar-header">
            <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand" href="${pageContext.request.contextPath}/home"><%=((BaseUserDetails)SecurityContextHolder.getContext().getAuthentication().getPrincipal()).getUsername()%></a>
        </div>

        <ul class="nav navbar-top-links navbar-right">
            <li class="dropdown">
                <a class="dropdown-toggle" data-toggle="dropdown" href="#">
                    <i class="fa fa-plus fa-fw"></i> <i class="fa fa-caret-down"></i>
                </a>
                <ul class="dropdown-menu dropdown-alerts">
                    <li class="disabled text-center">
                        <i class="fa fa-plus-circle"></i>&nbsp;&nbsp;<span>正常添加</span>
                    </li>
                    <li class="divider"></li>
                    <li><a href="#add-one" data-toggle="modal" data-target="#add-one">单条数据</a></li>
                    <li><a href="#add-more" data-toggle="modal" data-target="#add-more">销售数据</a></li>
                    <li class="divider"></li>
                    <li class="disabled text-center">
                        <i class="fa fa-calendar-plus-o"></i>&nbsp;&nbsp;<span>追加数据</span>
                    </li>
                    <li class="divider"></li>
                    <li><a href="#add-one" data-toggle="modal" data-target="#add-one">单条数据</a></li>
                    <li><a href="#add-more" data-toggle="modal" data-target="#add-more">销售数据</a></li>
                </ul>
                <!-- /.dropdown-alerts -->
            </li>
            <!-- /.dropdown -->
            <li class="dropdown">
                <a class="dropdown-toggle" data-toggle="dropdown" href="#">
                    <i class="fa fa-user fa-fw"></i> <i class="fa fa-caret-down"></i>
                </a>
                <ul class="dropdown-menu dropdown-user">
                    <li>
                        <a href="#user-info" data-toggle="modal" data-target="#user-info"><i class="fa fa-user fa-fw"></i> 个人信息</a>
                    </li>
                    <li>
                        <a href="#user-edit" data-toggle="modal" data-target="#user-edit"><i class="fa fa-edit fa-fw"></i> 修改信息</a>
                    </li>
                    <li class="divider"></li>
                    <li>
                        <a href="#user-logout" data-toggle="modal" data-target="#user-logout"><i class="fa fa-sign-out fa-fw"></i> 退出</a>
                    </li>
                </ul>
            </li>
        </ul>

        <div class="navbar-default sidebar" role="navigation">
            <div class="sidebar-nav navbar-collapse">
                <ul class="nav" id="side-menu">
                    <li>
                        <a href="${pageContext.request.contextPath}/dashboard" target="index-right"><i class="fa fa-dashboard fa-fw"></i> 首页</a>
                    </li>
                    <c:if test="${not empty classifyList and not empty classify.categoryList}">
                        <li>
                            <c:forEach items="${classifyList}" var="classify">
                                <a href="javascript:void(0)"><i class="${classify.classifyClass}"></i> ${classify.classifyName}<span class="fa arrow"></span></a>
                                <ul class="nav nav-second-level">
                                    <c:forEach items="${classify.categoryList}" var="category">
                                        <li><a href="${pageContext.request.contextPath}/${category.path}" target="index-right">${category.categoryName}</a></li>
                                    </c:forEach>
                                </ul>
                            </c:forEach>
                        </li>
                    </c:if>
                </ul>
            </div>
        </div>
    </nav>

    <!-- 内嵌响应网页 -->
    <div id="page-wrapper">
        <iframe id="index-right" name="index-right" src="${pageContext.request.contextPath}/dashboard" width="100%" height="100%" frameborder="0" onload="changeFrameHeight()" scrolling="auto"></iframe>
    </div>

</div>

<!-- 正常添加单条数据弹窗表单 -->
<div class="modal fade" id="add-one" tabindex="-1" role="dialog">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title">记录</h4>
            </div>
            <div class="modal-body">
                <form action="#">
                    <div class="form-group">
                        <label for="one-date">日期</label>
                        <input type="text" name="" class="form-control flatpickr" data-date-format="Y-m-d" data-enable-time="false" id="one-date" data-date-format="yyyy-mm-dd" readonly />
                    </div>
                    <div class="form-group">
                        <label for="one-classify">一级分类</label>
                        <select name="classify" class="form-control" id="one-classify">
                            <option value="">鸡蛋</option>
                            <option value="">鸡房</option>
                            <option value="">日常</option>
                        </select>
                    </div>
                    <div class="form-group">
                        <label for="one-category">二级分类</label>
                        <select name="category" id="one-category" class="form-control">
                            <option value="">重量</option>
                            <option value="">单价</option>
                            <option value="">收入</option>
                            <option value="">死亡</option>
                            <option value="">欠款</option>
                            <option value="">还款</option>
                        </select>
                    </div>
                    <div class="form-group">
                        <label for="one-value">数量</label>
                        <input type="text" name="" class="form-control" id="one-value" />
                    </div>
                    <div class="form-group">
                        <label for="one-desc">备注</label>
                        <input type="text" name="" class="form-control" id="one-desc" />
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                <button type="button" class="btn btn-primary">确认</button>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal-dialog -->
</div>

<!-- 添加销售记录弹窗表单 -->
<div class="modal fade" id="add-more" tabindex="-1" role="dialog">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title">售卖</h4>
            </div>
            <div class="modal-body">
                <form>
                    <div class="form-group">
                        <label for="more-date">日期</label>
                        <input type="text" name="" class="form-control flatpickr" data-date-format="Y-m-d" data-enable-time="false" id="more-date" data-date-format="yyyy-mm-dd" readonly />
                    </div>
                    <div class="form-group">
                        <label for="more-weight">重量</label>
                        <input type="text" class="form-control" id="more-weight">
                    </div>
                    <div class="form-group">
                        <label for="more-price">单价</label>
                        <input type="text" class="form-control" id="more-price">
                    </div>
                    <div class="form-group">
                        <label for="more-amount">金额</label>
                        <input type="text" class="form-control" id="more-amount" readonly>
                    </div>
                    <div class="form-group">
                        <label for="more-actual-amount">实际金额</label>
                        <input type="text" class="form-control" id="more-actual-amount">
                    </div>
                    <div class="form-group">
                        <label for="more-desc">备注</label>
                        <input type="text" name="" class="form-control" id="more-desc" />
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                <button type="button" class="btn btn-primary">确认</button>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal-dialog -->
</div>

<!-- 用户信息弹窗 -->
<div class="modal fade" id="user-info" tabindex="-1" role="dialog">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title">个人信息</h4>
            </div>
            <div class="modal-body">
                <div class="container-fluid">
                    <c:if test="${not empty user.username}">
                        <div class="row">
                            <div class="col-xs-5 text-right">用户名：</div>
                            <div class="col-xs-2"></div>
                            <div class="col-xs-5 text-left"><c:out value="${user.username}"/></div>
                        </div>
                    </c:if>
                    <c:if test="${not empty user.userInfo.name}">
                        <div class="row">
                            <div class="col-xs-5 text-right">姓名：</div>
                            <div class="col-xs-2"></div>
                            <div class="col-xs-5 text-left"><c:out value="${user.userInfo.name}"/></div>
                        </div>
                    </c:if>
                    <c:if test="${not empty user.userInfo.sex}">
                        <div class="row">
                            <div class="col-xs-5 text-right">性别：</div>
                            <div class="col-xs-2"></div>
                            <div class="col-xs-5 text-left">
                                <c:choose>
                                    <c:when test="${'1' eq user.userInfo.sex}">男</c:when>
                                    <c:otherwise>女</c:otherwise>
                                </c:choose>
                            </div>
                        </div>
                    </c:if>
                    <c:if test="${not empty user.userInfo.age}">
                        <div class="row">
                            <div class="col-xs-5 text-right">年龄：</div>
                            <div class="col-xs-2"></div>
                            <div class="col-xs-5 text-left"><c:out value="${user.userInfo.age}"/></div>
                        </div>
                    </c:if>
                    <c:if test="${not empty user.userInfo.fromPlace}">
                        <div class="row">
                            <div class="col-xs-5 text-right">出生地：</div>
                            <div class="col-xs-2"></div>
                            <div class="col-xs-5 text-left"><c:out value="${user.userInfo.fromPlace}"/></div>
                        </div>
                    </c:if>
                    <c:if test="${not empty user.userInfo.birthDay}">
                        <div class="row">
                            <div class="col-xs-5 text-right">出生日期：</div>
                            <div class="col-xs-2"></div>
                            <div class="col-xs-5 text-left">
                                <fmt:formatDate value="${user.userInfo.birthDay}" pattern="yyyy-MM-dd"/>
                            </div>
                        </div>
                    </c:if>
                    <c:if test="${not empty user.userInfo.school}">
                        <div class="row">
                            <div class="col-xs-5 text-right">学校：</div>
                            <div class="col-xs-2"></div>
                            <div class="col-xs-5 text-left"><c:out value="${user.userInfo.school}"/></div>
                        </div>
                    </c:if>
                    <c:if test="${not empty user.userInfo.phone}">
                        <div class="row">
                            <div class="col-xs-5 text-right">手机号码：</div>
                            <div class="col-xs-2"></div>
                            <div class="col-xs-5 text-left"><c:out value="${user.userInfo.phone}"/></div>
                        </div>
                    </c:if>
                    <c:if test="${not empty user.userInfo.email}">
                        <div class="row">
                            <div class="col-xs-5 text-right">邮箱：</div>
                            <div class="col-xs-2"></div>
                            <div class="col-xs-5 text-left"><c:out value="${user.userInfo.email}"/></div>
                        </div>
                    </c:if>
                    <c:if test="${not empty user.userInfo.weight}">
                        <div class="row">
                            <div class="col-xs-5 text-right">重量：</div>
                            <div class="col-xs-2"></div>
                            <div class="col-xs-5 text-left"><c:out value="${user.userInfo.weight}"/> 斤</div>
                        </div>
                    </c:if>
                    <c:if test="${not empty user.userInfo.height}">
                        <div class="row">
                            <div class="col-xs-5 text-right">身高：</div>
                            <div class="col-xs-2"></div>
                            <div class="col-xs-5 text-left"><c:out value="${user.userInfo.height}"/> CM</div>
                        </div>
                    </c:if>
                    <c:if test="${not empty user.userInfo.introduction}">
                        <div class="row">
                            <div class="col-xs-5 text-right">自我介绍：</div>
                            <div class="col-xs-2"></div>
                            <div class="col-xs-5 text-left"><c:out value="${user.userInfo.introduction}"/></div>
                        </div>
                    </c:if>
                </div>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal-dialog -->
</div>

<c:set var="male" value="<%=Constant.Sex.MALE%>"/>
<c:set var="female" value="<%=Constant.Sex.FEMALE%>"/>

<!-- 编辑用户信息 -->
<div class="modal fade" id="user-edit" tabindex="-1" role="dialog">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title">编辑</h4>
            </div>
            <div class="modal-body">
                <form:form modelAttribute="userForm" id="userForm" method="post">
                    <div class="form-group">
                        <label for="username">用户名</label>
                        <form:input path="user.username" value="${user.username}" type="text" class="form-control" maxlength="20" id="username"/>
                        <span class="text-error hide" name="user.usernameMessage"></span>
                    </div>
                    <div class="form-group">
                        <label for="resetPassword">重置密码</label>
                        <form:select path="resetI" class="form-control" id="resetPassword">
                            <form:option value="<%=CommonConstant.YES_NO.NO%>" selected="selected">否</form:option>
                            <form:option value="<%=CommonConstant.YES_NO.YES%>">是</form:option>
                        </form:select>
                    </div>
                    <div id="passwordNode" class="hide">
                        <div class="form-group">
                            <label for="password">密码</label>
                            <form:input path="user.password" type="password" class="form-control" id="password" maxlength="20" placeholder="若重置密码，请填写新密码"/>
                            <span class="text-error hide" name="user.passwordMessage"></span>
                        </div>
                        <div class="form-group">
                            <label for="confirmPassword">确认密码</label>
                            <form:input path="confirmPassword" type="password" class="form-control" maxlength="20" id="confirmPassword"/>
                            <span class="text-error hide" name="confirmPasswordMessage"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="sex">性别</label>
                        <form:select path="user.userInfo.sex" class="form-control" id="sex">
                            <form:option value="<%=Constant.Sex.MALE%>">男</form:option>
                            <form:option value="<%=Constant.Sex.FEMALE%>">女</form:option>
                        </form:select>
                    </div>
                    <div class="form-group">
                        <label for="age">年龄</label>
                        <form:input path="user.userInfo.age" value="${user.userInfo.age}" type="text" class="form-control" id="age" />
                        <span class="text-error hide" name="user.userInfo.ageMessage"></span>
                    </div>
                    <div class="form-group">
                        <label for="fromPlace">出生地</label>
                        <form:input path="user.userInfo.fromPlace" value="${user.userInfo.fromPlace}" type="text" maxlength="20" class="form-control" id="fromPlace" />
                        <span class="text-error hide" name="user.userInfo.fromPlaceMessage"></span>
                    </div>
                    <fmt:formatDate value="${user.userInfo.birthDay}" pattern="yyyy-MM-dd" var="birthDay"/>
                    <div class="form-group">
                        <label for="birthDay">出生日期</label>
                        <form:input path="birthDayStr" type="text" data-enable-time="false" data-default-value="${birthDay}" value="${birthDay}" class="form-control flatpickr" id="birthDay" />
                        <span class="text-error hide" name="birthDayStrMessage"></span>
                    </div>
                    <div class="form-group">
                        <label for="school">学校</label>
                        <form:input path="user.userInfo.school" value="${user.userInfo.school}" type="text" class="form-control" id="school" maxlength="50"/>
                        <span class="text-error hide" name="user.userInfo.schoolMessage"></span>
                    </div>
                    <div class="form-group">
                        <label for="phone">手机号码</label>
                        <form:input path="user.userInfo.phone" value="${user.userInfo.phone}" type="text" class="form-control" id="phone" maxlength="11"/>
                        <span class="text-error hide" name="user.userInfo.phoneMessage"></span>
                    </div>
                    <div class="form-group">
                        <label for="weight">体重</label>
                        <form:input path="user.userInfo.weight" value="${user.userInfo.weight}" type="text" class="form-control" id="weight" placeholder="(斤)"/>
                        <span class="text-error hide" name="user.userInfo.weightMessage"></span>
                    </div>
                    <div class="form-group">
                        <label for="height">身高</label>
                        <form:input path="user.userInfo.height" value="${user.userInfo.height}" type="text" class="form-control" id="height" placeholder="(CM)"/>
                        <span class="text-error hide" name="user.userInfo.heightMessage"></span>
                    </div>
                    <div class="form-group">
                        <label for="email">邮箱</label>
                        <form:input path="user.userInfo.email" value="${user.userInfo.email}" type="email" class="form-control" id="email"/>
                        <span class="text-error hide" name="user.userInfo.emailMessage"></span>
                    </div>
                    <div class="form-group">
                        <label for="introduction">简介</label>
                        <textarea name="user.userInfo.introduction" id="introduction" maxlength="200" class="form-control" style="resize: none;height: 100px;"><c:out value="${user.userInfo.introduction}"/></textarea>
                        <span class="text-error hide" name="user.userInfo.introductionMessage"></span>
                    </div>
                </form:form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal" id="btnUserClose">关闭</button>
                <button type="button" class="btn btn-primary" id="btnUserSubmit">确认</button>
            </div>
        </div>
    </div>
</div>

<!-- 退出 -->
<div class="modal fade" id="user-logout" tabindex="-1" role="dialog">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title">退出</h4>
            </div>
            <div class="modal-body">
                <p class="text-center logout-tip">你确定要退出吗？</p>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                <button type="button" class="btn btn-primary">确认</button>
            </div>
        </div>
    </div>
</div>

<script type="text/javascript">
    $(function () {
        initValidation();
        $('#one-date, #more-date, #birthDay').flatpickr();
    });

    $("#btnUserSubmit").on("click", function () {
        var validation = $("#userForm").data("formValidation");
        validation.validate();
        if (validation.isValid()) {

        }
    });

    $("#resetPassword").on("change", function () {
        var resetI = $(this).val();
        var validation = $("#userForm").data("formValidation");
        if (resetI === "<%=CommonConstant.YES_NO.YES%>") {
            validation.enableFieldValidators("user.password", true).revalidateField("user.password");
            validation.enableFieldValidators("confirmPassword", true).revalidateField("confirmPassword");
            $("#passwordNode").show();
        } else {
            $("#passwordNode").hide();
            validation.enableFieldValidators("user.password", false);
            validation.enableFieldValidators("confirmPassword", false);
            $("#password").val("");
            $("#confirmPassword").val("");
        }
    });

    function initValidation() {
        $("#userForm").formValidation({
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
                    var messageNode  = $('#userForm').find($("span[name='"+messageName+"']"));
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
                'user.username':{
                    message: '请填写用户名',
                    validators: {
                        notEmpty: {
                            message: '请填写用户名'
                        },
                        stringLength: {
                            max: 20,
                            message: "用户名不能超过20个字符"
                        }
                    }
                },
                resetI:{
                    message: '选择是否重置密码',
                    validators: {
                        notEmpty: {
                            message: '选择是否重置密码'
                        }
                    }
                },
                'user.password':{
                    enabled: false,
                    message: '请填写密码',
                    validators: {
                        notEmpty: {
                            message: '请填写密码'
                        },
                        stringLength: {
                            min: 6,
                            max: 20,
                            message: '密码应不少于6个字符，不超过20个字符'
                        }
                    }
                },
                'confirmPassword':{
                    enabled: false,
                    message: '请确认密码',
                    validators: {
                        notEmpty: {
                            message: '请确认密码'
                        }
                    }
                },
                'user.userInfo.sex':{
                    message: '请选择性别',
                    validators: {
                        notEmpty: {
                            message: '请选择性别'
                        }
                    }
                },
                'user.userInfo.age':{
                    message: '请输入合理的年龄',
                    validators: {
                        integer: {
                            max: 150,
                            message: '请输入有效的年龄'
                        }
                    }
                },
                'user.userInfo.fromPlace':{
                    message: '请输入有效长度的字符',
                    validators: {
                        stringLength: {
                            max: 20,
                            message: '不能超过20个字符'
                        }
                    }
                },
                birthDayStr:{
                    message: '请输入有效日期',
                    validators: {
                        date: {
                            format: 'YYYY-MM-DD',
                            message: '请输入有效日期'
                        }
                    }
                },
                'user.userInfo.school':{
                    message: '请输入有效长度的字符',
                    validators: {
                        stringLength: {
                            max: 50,
                            message: '不能超过50个字符'
                        }
                    }
                },
                'user.userInfo.phone':{
                    message: '请输入有效的手机号码',
                    validators: {
                        stringLength: {
                            max: 11,
                            message: '不能超过11个字符'
                        },
                        regexp:{
                            regexp: /^1[1-9][0-9]{9}/,
                            message: '请输入有效的手机号码'
                        }
                    }
                },
                'user.userInfo.weight':{
                    message: '请输入有效的体重',
                    validators: {
                        lessThan: {
                            inclusive: false,
                            max: 200,
                            message: '请输入有效的体重'
                        }
                    }
                },
                'user.userInfo.weight':{
                    message: '请输入有效的身高',
                    validators: {
                        integer: {
                            min: 50,
                            message: '请输入有效的身高'
                        },
                        lessThan: {
                            max: 250,
                            message: '请输入有效的身高'
                        }
                    }
                },
                'user.userInfo.email':{
                    message: '请输入有效的邮箱',
                    validators: {
                        emailAddress: {
                            message: '请输入有效的邮箱'
                        }
                    }
                },
                'user.userInfo.introduction':{
                    message: '不能超过200个字符',
                    validators: {
                        stringLength: {
                            max: '200',
                            message: '不能超过200个字符'
                        }
                    }
                }
            }
        }).on('err.field.fv', function(e, data) {

            //remove checkbox feedback icon
            $("#userForm").find(".glyphicon-ok").css("display","none");
            $("#userForm").find(".glyphicon-remove").css("display","none");

            //mengxuan change
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
//            $("#btnSubmit").removeAttr("disabled");
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
            $("#userForm").find("."+data.field+"Message").css("display","none");
            $("#userForm").find("."+data.field+"Message").addClass("hide");

            //remove checkbox feedback icon
            $("#userForm").find(".glyphicon-ok").css("display","none");
            $("#userForm").find(".glyphicon-remove").css("display","none");
        });
    }

    function changeFrameHeight() {
        var ifm = document.getElementById("index-right");
        ifm.height = document.documentElement.clientHeight;
    }
    window.onresize = function () {
        changeFrameHeight();
    }

    $('#index-right').height($(window).height() - $('#index-top').height());
    $(window).resize(function () {
        $('#index-right').height($(window).height() - $('#index-top').height());
    });
</script>

</body>
</html>