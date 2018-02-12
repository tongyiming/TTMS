<%--
  Created by IntelliJ IDEA.
  User: 塞上江南果
  Date: 2016/10/29
  Time: 15:45
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="zh-cn">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>森林花电影院</title>
    <link href="/css/bootstrap.min.css" rel="stylesheet">
    <link href="/css/nav.css" rel="stylesheet">
    <style>

    </style>

    <!--[if lt IE 9]>
    <script src="/js/html5shiv.js"></script>
    <script src="/js/respond.min.js"></script>
    <![endif]-->


</head>

<body>

<!-- 顶部导航 -->
<div class="navbar navbar-inverse navbar-fixed-top" role="navigation" id="menu-nav">
    <div class="container">
        <div class="navbar-header">
            <a class="navbar-brand" href="#">森林花影院</a>
        </div>
        <div class="navbar-collapse collapse">
            <ul class="nav navbar-nav">
                <li class="active"><a href="home">首页</a></li>
                <li><a href="#">简述</a></li>
                <li><a href="#" data-toggle="modal" data-target="#about-modal">关于</a></li>
            </ul>
            <ul class="nav navbar-nav" style="margin-left:650px;">
                <li id="login"><a href="#" onClick="showLogin()">登录</a></li>
                <li id="register"><a href="#" onClick="showRegister()">注册</a></li>
                <li style="display:none" id="pic"><a href="gethome"><img src="/${user.picture}" class="img-circle size" style="width:40px; height:40px;margin-top:-10px"></a></li>
                <li style="display:none" id="username"><a href="gethome">${user.username}</a></li>
            </ul>
        </div>
    </div>
</div>

<div>

</div>


<!--选项卡登录和注册-->
<div id="login-register">
    <ul class="nav nav-tabs" role="tablist">
        <li id="li-login" onClick="setLoginActive()"><a href="#tab-login" role="tab"  data-toggle="tab">登录</a></li>
        <li id="li-register" onClick="setRegisterActive()"><a href="#tab-register" role="tab"  data-toggle="tab">注册</a></li>
        <button onClick="closeTab()" id="btn-close">X</button>
    </ul>

    <div class="tab-content">
        <br>
        <div class="tab-pane" id="tab-login">
            <div class="row feature">
                <br>
                <form class="form-horizontal" role="form" action="/Home/login" method="post">
                    <div class="form-group" id="inputname">
                        <label for="login-uname" class="col-sm-3 control-label">帐号:</label>
                        <div class="col-sm-9">
                            <input type="text" class="form-control" id="login-uname" name="uname"
                                   placeholder="请输入电子邮箱地址/手机号" autofocus onBlur="checkName('inputname','login-uname')">
                        </div>
                    </div>
                    <div class="form-group" id="inputpass">
                        <label for="login-pass" class="col-sm-3 control-label">密码:</label>
                        <div class="col-sm-9">
                            <input type="password" class="form-control" id="login-pass" name="pwd"
                                   placeholder="请输入您的帐号密码" onBlur="checkPass('inputpass','login-pass')">
                        </div>
                    </div>
                    <div class="form-group" id="inputcode">
                        <label for="login-pass" class="col-sm-3 control-label">验证码:</label>
                        <div class="col-sm-4">
                            <input type="type" class="form-control" id="login-code" name="vcode"
                                   placeholder="输入验证码" onBlur="checkPass('inputcode','login-code')">
                        </div>
                        <a class="btn btn-link btn-sm" onclick="replace()">看不清，换一张</a>
                        <img src="/code" style="width:50px; height:30px" id="codepic">
                    </div>
                    <div class="form-group">
                        <div class="col-sm-offset-3 col-sm-6">
                            <a href="#"><button type="submit" class="btn btn-primary" >登录</button></a>
                        </div>
                    </div>
                </form>
            </div>
        </div>
        <div class="tab-pane" id="tab-register">
            <div class="row feature">
                <br>
                <form class="form-horizontal" role="form" action="/Home/register" method="post">
                    <div class="form-group" id="input-name">
                        <label for="register-name" class="col-sm-3 control-label">帐号:</label>
                        <div class="col-sm-9">
                            <input type="text" class="form-control" id="register-name" name="username"
                                   placeholder="请输入电子邮箱地址/手机号" autofocus onBlur="checkName('input-name','register-name')">
                        </div>
                    </div>
                    <div class="form-group" id="input-pass">
                        <label for="register-pass" class="col-sm-3 control-label">密码:</label>
                        <div class="col-sm-9">
                            <input type="password" class="form-control" id="register-pass" name="pass"
                                   placeholder="请输入您的帐号密码" onBlur="checkPass('input-pass','register-pass')">
                        </div>
                    </div>
                    <div class="form-group" id="input-repass">
                        <label for="register-repass" class="col-sm-3 control-label">密码:</label>
                        <div class="col-sm-9">
                            <input type="password" class="form-control" id="register-repass" name="repass"
                                   placeholder="请再输一次密码，确认是否正确" onBlur="checkRepass('register-pass','register-repass','input-repass')">
                        </div>
                    </div>
                    <font color="red">${error}</font>
                    <div class="form-group">
                        <div class="col-sm-offset-3 col-sm-6">
                            <a href="#"><button type="submit" class="btn btn-primary" onclick="return checkLoginAll('input-name','register-uname','input-pass','register-pass','input-repass','register-repass')">注册</button></a>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>

<script src="/js/jquery-1.11.1.min.js"></script>
<script src="/js/bootstrap.min.js"></script>
<script src="/js/login_register.js"></script>

<script>
    function setPicture()
    {
        if (!${empty user})
        {
            document.getElementById("login").style.display = "none";
            document.getElementById("register").style.display = "none";
            document.getElementById("pic").style.display = "block";
            document.getElementById("username").style.display = "block";
        }
        else
        {
            document.getElementById("login").style.display = "block";
            document.getElementById("register").style.display = "block";
            document.getElementById("pic").style.display = "none";
            document.getElementById("username").style.display = "none";
        }
    }

    setPicture();
</script>
</body>
</html>

