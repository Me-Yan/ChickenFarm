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
    <title>养殖管理系统</title>
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
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/styles/common.css">

    <style>
        .field-type {
            display: none;
        }
    </style>
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
                    <li><a class="cursor-pointer" id="btnOne">单条数据</a></li>
                    <li><a class="cursor-pointer" id="btnMore">销售数据</a></li>
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
                        <c:forEach items="${classifyList}" var="classify">
                            <li>
                                <a href="javascript:void(0)"><i class="${classify.classifyClass}"></i> ${classify.classifyName}<span class="fa arrow"></span></a>
                                <c:if test="${not empty classify.categoryList}">
                                    <ul class="nav nav-second-level">
                                        <c:forEach items="${classify.categoryList}" var="category">
                                            <li><a href="${pageContext.request.contextPath}/${category.path}" target="index-right">${category.categoryName}</a></li>
                                        </c:forEach>
                                    </ul>
                                </c:if>
                            </li>
                        </c:forEach>
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

<%@ include file="record.jsp" %>
<%@ include file="user.jsp" %>

<script>
    $("#btnOne").on("click", function () {
       $("#oneFormModal").modal({
           backdrop: 'static',
           show: true
       });
    });

    $("#btnMore").on("click", function () {
        $("#moreFormModal").modal({
            backdrop: 'static',
            show: true
        });
    });

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