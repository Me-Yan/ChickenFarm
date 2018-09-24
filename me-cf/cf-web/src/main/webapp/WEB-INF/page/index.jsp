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
            </li>
            <li class="dropdown">
                <a class="dropdown-toggle" data-toggle="dropdown" href="#">
                    <i class="fa fa-user fa-fw"></i> <i class="fa fa-caret-down"></i>
                </a>
                <ul class="dropdown-menu dropdown-user">
                    <li>
                        <a href="#userInfo" data-toggle="modal" data-target="#userInfo"><i class="fa fa-user fa-fw"></i> 个人信息</a>
                    </li>
                    <li>
                        <a href="#userEdit" data-toggle="modal" data-target="#userEdit"><i class="fa fa-edit fa-fw"></i> 修改信息</a>
                    </li>
                    <li class="divider"></li>
                    <li>
                        <a href="#userLogout" data-toggle="modal" data-target="#userLogout"><i class="fa fa-sign-out fa-fw"></i> 退出</a>
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
                    <c:if test="${not empty classifyList}">
                        <li>
                            <c:forEach items="${classifyList}" var="classify">
                                <a href="javascript:void(0)"><i class="${classify.classifyClass}"></i> ${classify.classifyName}<span class="fa arrow"></span></a>
                                <c:if test="${not empty classify.categoryList}">
                                    <ul class="nav nav-second-level">
                                        <c:forEach items="${classify.categoryList}" var="category">
                                            <li><a href="${pageContext.request.contextPath}/${category.path}" target="index-right">${category.categoryName}</a></li>
                                        </c:forEach>
                                    </ul>
                                </c:if>
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


<!-- 用户信息弹窗 -->
<div class="modal fade" id="userInfo" tabindex="-1" role="dialog">
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
                            <div class="col-xs-1"></div>
                            <div class="col-xs-5 text-left"><c:out value="${user.username}"/></div>
                        </div>
                    </c:if>
                    <c:if test="${not empty user.userInfo.name}">
                        <div class="row">
                            <div class="col-xs-5 text-right">姓名：</div>
                            <div class="col-xs-1"></div>
                            <div class="col-xs-5 text-left"><c:out value="${user.userInfo.name}"/></div>
                        </div>
                    </c:if>
                    <c:if test="${not empty user.userInfo.sex}">
                        <div class="row">
                            <div class="col-xs-5 text-right">性别：</div>
                            <div class="col-xs-1"></div>
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
                            <div class="col-xs-1"></div>
                            <div class="col-xs-5 text-left"><c:out value="${user.userInfo.age}"/></div>
                        </div>
                    </c:if>
                    <c:if test="${not empty user.userInfo.fromPlace}">
                        <div class="row">
                            <div class="col-xs-5 text-right">出生地：</div>
                            <div class="col-xs-1"></div>
                            <div class="col-xs-5 text-left"><c:out value="${user.userInfo.fromPlace}"/></div>
                        </div>
                    </c:if>
                    <c:if test="${not empty user.userInfo.birthDay}">
                        <div class="row">
                            <div class="col-xs-5 text-right">出生日期：</div>
                            <div class="col-xs-1"></div>
                            <div class="col-xs-5 text-left">
                                <fmt:formatDate value="${user.userInfo.birthDay}" pattern="yyyy-MM-dd"/>
                            </div>
                        </div>
                    </c:if>
                    <c:if test="${not empty user.userInfo.school}">
                        <div class="row">
                            <div class="col-xs-5 text-right">学校：</div>
                            <div class="col-xs-1"></div>
                            <div class="col-xs-5 text-left"><c:out value="${user.userInfo.school}"/></div>
                        </div>
                    </c:if>
                    <c:if test="${not empty user.userInfo.phone}">
                        <div class="row">
                            <div class="col-xs-5 text-right">手机号码：</div>
                            <div class="col-xs-1"></div>
                            <div class="col-xs-5 text-left"><c:out value="${user.userInfo.phone}"/></div>
                        </div>
                    </c:if>
                    <c:if test="${not empty user.userInfo.email}">
                        <div class="row">
                            <div class="col-xs-5 text-right">邮箱：</div>
                            <div class="col-xs-1"></div>
                            <div class="col-xs-5 text-left"><c:out value="${user.userInfo.email}"/></div>
                        </div>
                    </c:if>
                    <c:if test="${not empty user.userInfo.weight}">
                        <div class="row">
                            <div class="col-xs-5 text-right">重量：</div>
                            <div class="col-xs-1"></div>
                            <div class="col-xs-5 text-left"><c:out value="${user.userInfo.weight}"/> 斤</div>
                        </div>
                    </c:if>
                    <c:if test="${not empty user.userInfo.height}">
                        <div class="row">
                            <div class="col-xs-5 text-right">身高：</div>
                            <div class="col-xs-1"></div>
                            <div class="col-xs-5 text-left"><c:out value="${user.userInfo.height}"/> CM</div>
                        </div>
                    </c:if>
                    <c:if test="${not empty user.userInfo.introduction}">
                        <div class="row">
                            <div class="col-xs-5 text-right">自我介绍：</div>
                            <div class="col-xs-1"></div>
                            <div class="col-xs-5 text-left"><c:out value="${user.userInfo.introduction}"/></div>
                        </div>
                    </c:if>
                </div>
            </div>
        </div>
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
        </div>
    </div>
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
        </div>
    </div>
</div>

<c:set var="male" value="<%=Constant.Sex.MALE%>"/>
<c:set var="female" value="<%=Constant.Sex.FEMALE%>"/>

<!-- 编辑用户信息 -->
<div class="modal fade" id="userEdit" tabindex="-1" role="dialog">
    <div class="modal-dialog modal-lg" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title">编辑</h4>
            </div>
            <div class="modal-body">
                <form:form action="${pageContext.request.contextPath}/updateUser" cssClass="form-horizontal" modelAttribute="userForm" id="userForm" method="post">
                    <div class="form-group">
                        <label class="col-xs-4 col-sm-4 col-md-2 control-label" for="name">姓名</label>
                        <div class="col-xs-8 col-sm-7 col-md-9">
                            <form:input path="userInfo.name" value="${user.userInfo.name}" type="text" class="form-control" maxlength="20" id="name"/>
                            <span class="text-error hide" name="userInfo.nameMessage"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="resetPassword" class="col-xs-4 col-sm-4 col-md-2 control-label">重置密码</label>
                        <div class="col-xs-8 col-sm-7 col-md-9">
                            <form:select path="resetI" class="form-control" id="resetPassword">
                                <form:option value="<%=CommonConstant.YES_NO.NO%>" selected="selected">否</form:option>
                                <form:option value="<%=CommonConstant.YES_NO.YES%>">是</form:option>
                            </form:select>
                        </div>
                    </div>
                    <div id="passwordNode" class="hide">
                        <div class="form-group">
                            <label for="password" class="col-xs-4 col-sm-4 col-md-2 control-label">密码</label>
                            <div class="col-xs-8 col-sm-7 col-md-9">
                                <form:input path="password" type="password" class="form-control" id="password" maxlength="20" placeholder="若重置密码，请填写新密码"/>
                                <span class="text-error hide" name="passwordMessage"></span>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="confirmPassword" class="col-xs-4 col-sm-4 col-md-2 control-label">确认密码</label>
                            <div class="col-xs-8 col-sm-7 col-md-9">
                                <form:input path="confirmPassword" type="password" class="form-control" maxlength="20" id="confirmPassword"/>
                                <span class="text-error hide" name="confirmPasswordMessage"></span>
                            </div>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="sex" class="col-xs-4 col-sm-4 col-md-2 control-label">性别</label>
                        <div class="col-xs-8 col-sm-7 col-md-9">
                            <form:select path="userInfo.sex" class="form-control" id="sex">
                                <form:option value="<%=Constant.Sex.MALE%>">男</form:option>
                                <form:option value="<%=Constant.Sex.FEMALE%>">女</form:option>
                            </form:select>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="age" class="col-xs-4 col-sm-4 col-md-2 control-label">年龄</label>
                        <div class="col-xs-8 col-sm-7 col-md-9">
                            <form:input path="userInfo.age" value="${user.userInfo.age}" type="text" class="form-control" id="age" />
                            <span class="text-error hide" name="userInfo.ageMessage"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="fromPlace" class="col-xs-4 col-sm-4 col-md-2 control-label">出生地</label>
                        <div class="col-xs-8 col-sm-7 col-md-9">
                            <form:input path="userInfo.fromPlace" value="${user.userInfo.fromPlace}" type="text" maxlength="20" class="form-control" id="fromPlace" />
                            <span class="text-error hide" name="userInfo.fromPlaceMessage"></span>
                        </div>
                    </div>
                    <fmt:formatDate value="${user.userInfo.birthDay}" pattern="yyyy-MM-dd" var="birthDay"/>
                    <div class="form-group">
                        <label for="birthDay" class="col-xs-4 col-sm-4 col-md-2 control-label">出生日期</label>
                        <div class="col-xs-8 col-sm-7 col-md-9">
                            <form:input path="birthDayStr" type="text" data-enable-time="false" data-default-value="${birthDay}" value="${birthDay}" class="form-control flatpickr" id="birthDay" />
                            <span class="text-error hide" name="birthDayStrMessage"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="school" class="col-xs-4 col-sm-4 col-md-2 control-label">学校</label>
                        <div class="col-xs-8 col-sm-7 col-md-9">
                            <form:input path="userInfo.school" value="${user.userInfo.school}" type="text" class="form-control" id="school" maxlength="50"/>
                            <span class="text-error hide" name="userInfo.schoolMessage"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="phone" class="col-xs-4 col-sm-4 col-md-2 control-label">手机号码</label>
                        <div class="col-xs-8 col-sm-7 col-md-9">
                            <form:input path="userInfo.phone" value="${user.userInfo.phone}" type="text" class="form-control" id="phone" maxlength="11"/>
                            <span class="text-error hide" name="userInfo.phoneMessage"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="weight" class="col-xs-4 col-sm-4 col-md-2 control-label">体重</label>
                        <div class="col-xs-8 col-sm-7 col-md-9">
                            <form:input path="userInfo.weight" value="${user.userInfo.weight}" type="text" class="form-control" id="weight" placeholder="(斤)"/>
                            <span class="text-error hide" name="userInfo.weightMessage"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="height" class="col-xs-4 col-sm-4 col-md-2 control-label">身高</label>
                        <div class="col-xs-8 col-sm-7 col-md-9">
                            <form:input path="userInfo.height" value="${user.userInfo.height}" type="text" class="form-control" id="height" placeholder="(CM)"/>
                            <span class="text-error hide" name="userInfo.heightMessage"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="email" class="col-xs-4 col-sm-4 col-md-2 control-label">邮箱</label>
                        <div class="col-xs-8 col-sm-7 col-md-9">
                            <form:input path="userInfo.email" value="${user.userInfo.email}" type="email" class="form-control" id="email"/>
                            <span class="text-error hide" name="userInfo.emailMessage"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="introduction" class="col-xs-4 col-sm-4 col-md-2 control-label">简介</label>
                        <div class="col-xs-8 col-sm-7 col-md-9">
                            <textarea name="userInfo.introduction" id="introduction" maxlength="200" class="form-control" style="resize: none;height: 100px;"><c:out value="${user.userInfo.introduction}"/></textarea>
                            <span class="text-error hide" name="userInfo.introductionMessage"></span>
                        </div>
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
<div class="modal fade" id="userLogout" tabindex="-1" role="dialog">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title">提示</h4>
            </div>
            <div class="modal-body">
                <p class="text-center logout-tip">你确定要退出吗？</p>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                <button type="button" class="btn btn-primary" onclick="window.location.href='${pageContext.request.contextPath}/logout'">确认</button>
            </div>
        </div>
    </div>
</div>

<%-- 修改用户信息确认界面 --%>
<div class="modal fade" id="userConfirmModal" tabindex="-1" role="dialog">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title">提示</h4>
            </div>
            <div class="modal-body">
                <p class="text-center logout-tip">你确定要修改吗？</p>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal" id="btnUserConfirmClose">关闭</button>
                <button type="button" class="btn btn-primary" id="btnUserConfirm">确认</button>
            </div>
        </div>
    </div>
</div>

<script type="text/javascript">
    $(function () {
        initValidation();
        $('#one-date, #more-date, #birthDay').flatpickr();
    });

    // 修改用户信息
    $("#btnUserSubmit").on("click", function () {
        var validation = $("#userForm").data("formValidation");
        validation.validate();
        if (validation.isValid()) {
            $("#userEdit").modal("hide");
            $("#userConfirmModal").modal("show");
        }
    });
    $("#btnUserConfirm").on("click", function () {
        var form = document.getElementById("userForm");
        form.submit();
    });
    $("#btnUserConfirmClose").on("click", function () {
        var form = document.getElementById("userForm");
        form.reset();
        $("#userForm").data("formValidation").destroy();
        $("#passwordNode").removeClass("show").addClass("hide");
        initValidation();
    });

    $("#resetPassword").on("change", function () {
        var resetI = $(this).val();
        var validation = $("#userForm").data("formValidation");
        if (resetI === "<%=CommonConstant.YES_NO.YES%>") {
            validation.enableFieldValidators("password", true).revalidateField("password");
            validation.enableFieldValidators("confirmPassword", true).revalidateField("confirmPassword");
            $("#passwordNode").removeClass("hide").addClass("show");
        } else {
            $("#passwordNode").removeClass("show").addClass("hide");
            validation.enableFieldValidators("password", false);
            validation.enableFieldValidators("confirmPassword", false);
            $("#password").val("");
            $("#confirmPassword").val("");
        }
    });

    $("#age").on("change", function () {
        var age = $(this).val();
        if (age && age.trim()) {
            $(this).val(parseInt(age));
            $(this).trigger("change");
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
                'userInfo.name':{
                    message: '请填写姓名',
                    validators: {
                        notEmpty: {
                            message: '请填写姓名'
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
                password:{
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
                confirmPassword:{
                    enabled: false,
                    message: '请确认密码',
                    validators: {
                        callback: {
                            callback: function (value, validator, $field) {
                                var password = $("#password").val();
                                if (!(password && password.trim())) {
                                    return {
                                        valid: false,
                                        message: '请先填写密码'
                                    };
                                } else if (value && value.trim()) {
                                    if (password != value) {
                                        return {
                                            valid: false,
                                            message: '两次密码输入不一致'
                                        };
                                    }
                                    return true;
                                }
                                return {
                                    valid: false,
                                    message: '请确认密码'
                                };
                            }
                        }
                    }
                },
                'userInfo.sex':{
                    message: '请选择性别',
                    validators: {
                        notEmpty: {
                            message: '请选择性别'
                        }
                    }
                },
                'userInfo.age':{
                    message: '请输入合理的年龄',
                    validators: {
                        notEmpty: {
                            message: '请填写年龄'
                        },
                        callback: {
                            message: '请输入合理的年龄',
                            callback: function (value) {
                                if (value && value.trim()) {
                                    var age = parseInt(value);
                                    if (age<150) {
                                        return true;
                                    } else {
                                        return false;
                                    }
                                }
                                return true;
                            }
                        }
                    }
                },
                'userInfo.fromPlace':{
                    message: '请输入有效长度的字符',
                    validators: {
                        notEmpty: {
                            message: '请填写出生地'
                        },
                        stringLength: {
                            max: 20,
                            message: '不能超过20个字符'
                        }
                    }
                },
                birthDayStr:{
                    message: '请输入有效日期',
                    validators: {
                        notEmpty: {
                            message: '请选择出生日期'
                        },
                        date: {
                            format: 'YYYY-MM-DD',
                            message: '请输入有效日期'
                        }
                    }
                },
                'userInfo.school':{
                    message: '请输入有效长度的字符',
                    validators: {
                        stringLength: {
                            max: 50,
                            message: '不能超过50个字符'
                        }
                    }
                },
                'userInfo.phone':{
                    message: '请输入有效的手机号码',
                    validators: {
                        notEmpty: {
                            message: '请填写手机号码'
                        },
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
                'userInfo.weight':{
                    message: '请输入有效的体重',
                    validators: {
                        callback: {
                            message: '请输入有效的体重',
                            callback: function (value) {
                                if (value && value.trim()) {
                                    var weight = parseFloat(value).toFixed(2);
                                    if (weight<250) {
                                        return true;
                                    } else {
                                        return false;
                                    }
                                }
                                return true;
                            }
                        }
                    }
                },
                'userInfo.height':{
                    message: '请输入有效的身高',
                    validators: {
                        callback: {
                            message: '请输入有效的身高',
                            callback: function (value) {
                                if (value && value.trim()) {
                                    var height = parseFloat(value).toFixed(2);
                                    if (height<250) {
                                        return true;
                                    } else {
                                        return false;
                                    }
                                }
                                return true;
                            }
                        }
                    }
                },
                'userInfo.email':{
                    message: '请输入有效的邮箱',
                    validators: {
                        notEmpty: {
                            message: '请填写邮箱'
                        },
                        emailAddress: {
                            message: '请输入有效的邮箱'
                        }
                    }
                },
                'userInfo.introduction':{
                    message: '不能超过200个字符',
                    validators: {
                        notEmpty: {
                            message: '请填写自我介绍'
                        },
                        stringLength: {
                            max: '200',
                            message: '不能超过200个字符'
                        }
                    }
                }
            }
        }).on('err.field.fv', function(e, data) {
            $("#userForm").find("i.form-control-feedback").remove();

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
            $("#userForm").find("."+data.field+"Message").css("display","none");
            $("#userForm").find("."+data.field+"Message").addClass("hide");

            //remove checkbox feedback icon
            $("#userForm").find("i.form-control-feedback").remove();
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