<%--
  Created by IntelliJ IDEA.
  User: yanyanghong
  Date: 2018/9/9
  Time: 22:47
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title><sitemesh:write property="title" /></title>
    <jsp:include page="cfCommon.jsp"/>
    <sitemesh:write property="head"/>
</head>
<body>

    <div class="container-fluid">
        <sitemesh:write property="body"/>
    </div>

</body>
</html>
