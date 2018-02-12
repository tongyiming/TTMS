<%--
  Created by IntelliJ IDEA.
  User: 塞上江南果
  Date: 2016/12/9
  Time: 11:10
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="zh-cn">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>森林花电影院——注册成功</title>
    <link href="/css/bootstrap.min.css" rel="stylesheet">
    <style>

    </style>

    <!--[if lt IE 9]>
    <script src="/js/html5shiv.js"></script>
    <script src="/js/respond.min.js"></script>
    <![endif]-->

    <script>

    </script>



</head>

<body onload="show();loding()">

<div class="warp">

    <div class="mainbody">
        注册成功，<font id="time"></font>秒后返回
    </div>
</div>

<div>
    <form action="/Home/home" method="post" id="myform">

    </form>
</div>

<script src="/js/jquery-1.11.1.min.js"></script>
<script src="/js/bootstrap.min.js"></script>
<script>

    var count = 3;
    function loding()
    {
        setTimeout(
                function () {
                    document.getElementById("myform").submit();
                },4000);
    }
    function show()
    {
        setInterval(function () {
            document.getElementById("time").innerHTML = count-- + "";
        },1000);

    }


</script>
</body>
</html>


