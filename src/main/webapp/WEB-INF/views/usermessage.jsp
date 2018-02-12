<%--
  Created by IntelliJ IDEA.
  User: 塞上江南果
  Date: 2016/12/5
  Time: 15:04
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="zh-cn">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>森林花电影院——我的信息</title>
    <link href="/css/bootstrap.min.css" rel="stylesheet">
    <link href="/css/ordercenter.css" rel="stylesheet">

    <!--[if lt IE 9]>
    <script src="js/html5shiv.js"></script>
    <script src="js/respond.min.js"></script>
    <![endif]-->


</head>

<body>

<%@include file="nav.jsp"%>
<!--用户信息-->
<div>
    <img src="/images/5.jpg" alt="backgroundPic" class="header-background">
    <div class="user">
        <span style="font-size:40px">${name}</span><br>
        <span>欢迎回来！！</span>
    </div>
    <div class="col-sm-offset-9" style="margin-top:-80px; color:#fff">
        <div class="row">
            <div class="col-sm-3"><a href="usermessage.jsp">我的信息</a></div>
            <div class="col-sm-3"><a href="#">修改密码</a></div>
            <div class="col-sm-3" id="menu">
                <ul>
                    <li><a href="#">我的订单</a>
                        <ul>
                            <li><a href="gethome">全部订单</a></li>
                            <li><a href="getOrderformFromStatus?status=1">已使用</a></li>
                            <li><a href="getOrderformFromStatus?status=2">未使用</a></li>
                        </ul>
                    </li>
                </ul>
            </div>
        </div>
    </div>
</div>

<div class="mainbody" style="margon-top:40px">
    <form class="form-horizontal" role="form" action="updateUser" method="post"  onsubmit="return checkAll()" enctype="multipart/form-data">
        <div class="form-group" id="input-username">
            <label for="user-name" class="col-sm-3 control-label">用户名:</label>
            <div class="col-sm-9">
                <input type="text" class="form-control mess" id="user-name" name="username"
                       readOnly="true" value="${user.username}">
            </div>
        </div>
        <div class="form-group" id="input-phone">
            <label for="user-phone" class="col-sm-3 control-label">电话:</label>
            <div class="col-sm-9">
                <input type="text" class="form-control mess" id="user-phone" name="usercallphone"
                       placeholder="输入电话号码" value="${user.callphone}"  onBlur="check('input-phone','user-phone')">
            </div>
        </div>

        <div class="form-group" id="input-file">
            <label for="file-name" class="col-sm-3 control-label">图像:</label>
            <div class="col-sm-9">
                <input id="filename" id="file-name" type="file" value="" onChange="add_files(this.files)" name="userpicture">
            </div>
        </div>
        <img src="/${user.picture}" class="img-circle size" id="userpic" style="width:150px; height:150px; margin-left:100px;">
        <div class="form-group" style="margin-top:30px;">
            <div class="col-sm-offset-6 col-sm-9">
                <button type="submit" class="btn btn-primary" >修改</button>

                <button type="reset" class="btn btn-primary">取消</button>
            </div>
        </div>

    </form>

    <br><br>
    <hr>
    <footer style="margin-left:0px">
        <p class="pull-right"><a href="#top">回到顶部</a></p>
        <p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&copy; 2016  &nbsp;森林花电影院 </p>
    </footer>
</div>

<script src="/js/jquery-1.11.1.min.js"></script>
<script src="/js/bootstrap.min.js"></script>
<script src="/js/login_register.js"></script>
<script>
    function check(divid, inputid)
    {
        var pname = document.getElementById(inputid);
        var div_name = document.getElementById(divid);
        if(pname.value != "")
        {
            div_name.className = "form-group has-success";
            return true;
        }
        else
        {
            div_name.className = "form-group has-error";
            return false;
        }
    }

    function checkAll()
    {
        var phone = document.getElementById("user-phone").value;

        if (phone != "")
        {
            return true;
        }
        else
        {
            alert("信息不能为空！");
            return false;
        }
    }


</script>
</body>
</html>