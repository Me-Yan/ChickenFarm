<%--
  Created by IntelliJ IDEA.
  User: yanyanghong
  Date: 2018/9/9
  Time: 23:16
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>用户登录</title>
</head>
<body>
<form action="checklogin" class="form-horizontal">
    <div class="row">
        <div class="col-xs-3 col-xs-offset-6">
            <div class="form-group">
                <label for="username" class="control-label col-xs-4">用户名 :</label>
                <div class="col-xs-8">
                    <input type="text" name="username" id="username" class="form-control" />
                </div>
            </div>
            <div class="form-group">
                <label for="username" class="control-label col-xs-4">密码 :</label>
                <div class="col-xs-8">
                    <input type="password" name="password" id="password" class="form-control" />
                </div>
            </div>
            <div class="form-group">
                <div class="col-xs-12 text-center">
                    <button type="submit" id="btnSubmit">提交</button>
                </div>
            </div>
        </div>
    </div>
</form>
</body>
</html>
