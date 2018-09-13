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
    <title><sitemesh:write property="title" /></title>
    <jsp:include page="cfCommon.jsp"/>
</head>
<body>

    <div class="container-fluid">
        <sitemesh:write property="body"/>
    </div>

</body>
</html>
