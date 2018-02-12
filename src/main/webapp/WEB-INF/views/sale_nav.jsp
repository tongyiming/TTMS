<%--
  Created by IntelliJ IDEA.
  User: 塞上江南果
  Date: 2016/12/4
  Time: 22:11
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link href="/css/bootstrap.min.css" rel="stylesheet">
    <link href="/css/play.css" rel="stylesheet">
    <title>Title</title>
</head>
<body>

<div class="header-background">
    　 <p>森林花电影院票务管理系统</p>
    <form class="col-sm-offset-4 col-sm-7 form-inline" action="" method="post">
        <div class="form-group">
            <input type="text" id="input-play" class="form-control" name="playid"
                   style="width:400px;font-weight:100" autofocus placeholder="请输入要查找的用户名">
            <button class="btn btn-sm btn-primary" id="find">查找</button>
        </div>
    </form>
</div>

<div class="col-md-2 navbar-vertical">
    <ul class="nav nav-pills nav-stacked">
        <li style="text-align:center"><a href="getallfilm">影片管理</a></li>
        <li style="text-align:center"><a href="getallstudio">影厅管理</a></li>
        <li style="text-align:center"><a href="getallschedule">演出计划管理</a></li>
        <li style="text-align:center"><a href="getsale" style="color:#FFA500">销售统计</a></li>
        <li style="text-align:center"><a href="getusers">用户管理</a></li>
    </ul>

</div>

<script src="/js/jquery-1.11.1.min.js"></script>
<script src="/js/bootstrap.min.js"></script>


</body>
</html>

