<%--
  Created by IntelliJ IDEA.
  User: 塞上江南果
  Date: 2016/10/27
  Time: 10:50
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="zh-cn">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>森林花电影院——登录</title>
    <link href="/css/bootstrap.min.css" rel="stylesheet">
    <link href="/css/login.css" rel="stylesheet">
    <style>

    </style>

    <!--[if lt IE 9]>
    <script src="/js/html5shiv.js"></script>
    <script src="/js/respond.min.js"></script>
    <![endif]-->

    <script>
        <%
        String mess=request.getParameter("error");
        if(mess!=null)
        {
        mess = new String(mess.getBytes("iso-8859-1"), "utf-8");
        request.setAttribute("mess", mess);
        }
        %>

        function replace()
        {
            var codeid = document.getElementById("codepic");
            codeid.src = '/code?'+Math.random();
        }
    </script>


</head>

<body onload="loading()">

<div class="warp">
    <div class="col-md-5 left">


    </div>


    <div class="col-md-7 right">
        <form class="form-horizontal form-position" role="form" action="/Admin/login" method="post">
            <h2 class="col-sm-offset-3" style="color:#fff">森林花电影院</h2>
            <br>
            <div class="form-group" id="input-name">
                <label for="name" class="col-sm-3 control-label">帐号:</label>
                <div class="col-sm-9">
                    <input type="text" class="form-control" id="name" placeholder="请你的帐号"
                        name="uname"   onBlur="checkName()" autofocus>
                </div>
            </div>
            <div class="form-group" id="input-pass">
                <label for="pass" class="col-sm-3 control-label">密码:</label>
                <div class="col-sm-9">
                    <input type="password" class="form-control" id="pass"
                           name="pwd"    placeholder="请输入你的帐号密码" onBlur="checkPass()">
                </div>
            </div>
            <div class="form-group" id="input-code">
                <label for="code" class="col-sm-3 control-label">验证码:</label>
                <div class="col-sm-4 code">
                    <input type="text" class="form-control" id="code"
                           name="vcode"   placeholder="请输入验证码" onBlur="checkCode()">
                </div>
                <a class="btn btn-link" onclick="replace()">看不清，换一张</a>
                <img src="/code" style="width:60px; height:30px" id="codepic">
                <label style="color: #0033FF">${mess}</label>
            </div>

            <div class="form-group">
                <div class="col-sm-offset-3 col-sm-6">
                    <button type="submit" class="btn btn-primary"
                            onclick="return checkLoginAll()">登录</button>
                </div>
            </div>
        </form>

    </div>

</div>

<script src="/js/jquery-1.11.1.min.js"></script>
<script src="/js/bootstrap.min.js"></script>
<script src="/js/login.js"></script>
<script>

</script>
</body>
</html>

