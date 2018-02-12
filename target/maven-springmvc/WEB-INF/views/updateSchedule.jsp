<%--
  Created by IntelliJ IDEA.
  User: 塞上江南果
  Date: 2016/12/3
  Time: 17:20
  To change this template use File | Settings | File Templates.
--%>
<%@ page import="com.web.entity.Schedule" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="zh-cn">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>森林花电影院——修改演出计划</title>
    <link href="/css/bootstrap.min.css" rel="stylesheet">
    <link href="/css/play.css" rel="stylesheet">
    <style>

        .form-group
        {
            height: 60px;
        }

        .mainbody
        {
            position:absolute;
            margin-left:150px;
            margin-top:80px;
        }

        h2
        {
            margin-left:530px;
        }
    </style>

    <!--[if lt IE 9]>
    <script src="/js/html5shiv.js"></script>
    <script src="/js/respond.min.js"></script>
    <![endif]-->


</head>

<body>

<div class="warp">

    <%@include file="schedule_nav.jsp"%>

    <div class="mainbody">
        <h2>修改演出计划信息</h2>

        <%
            Schedule sche = (Schedule)request.getAttribute("schedule");
        %>
        <div class="col-md-10" id="addPlay">
            <form class="form-horizontal" role="form" action="updateschedule" method="post"  onsubmit="return checkAll()">

                <div class="form-group" id="input-snum">
                    <label for="schedule-snum" class="col-sm-3 control-label">影厅编号:</label>
                    <div class="col-sm-9">
                        <input type="text" class="form-control" id="schedule-snum" name="studioid"
                               value="<%=sche.getStudio_id()%>" placeholder="输入影厅编号" onBlur="check('input-snum','schedule-snum')" autofocus>
                    </div>
                </div>
                <div class="form-group" id="input-fnum">
                    <label for="schedule-fnum" class="col-sm-3 control-label">影片编号:</label>
                    <div class="col-sm-9">
                        <input type="text" class="form-control" id="schedule-fnum" name="filmid"
                               value="<%=sche.getFilm_id()%>" placeholder="输入影片编号" onBlur="check('input-fnum','schedule-fnum')" autofocus>
                    </div>
                </div>
                <div class="form-group" id="input-time">
                    <label for="schedule-time" class="col-sm-3 control-label">演出时间:</label>
                    <div class="col-sm-9">
                        <input type="text" class="form-control" id="schedule-time" name="schetime"
                               value="<%=sche.getSche_time()%>" placeholder="输入演出时间" onBlur="check('input-time','schedule-time')">
                    </div>
                </div>
                <div class="form-group" id="input-price">
                    <label for="schedule-price" class="col-sm-3 control-label">影片票价:</label>
                    <div class="col-sm-9">
                        <input type="text" class="form-control" id="schedule-price" name="scheprice"
                              value="<%=sche.getSche_ticket_price()%>" placeholder="输入影片票价" onBlur="check('input-price','schedule-price')">
                    </div>
                </div>
                <input type="hidden" value="<%=sche.getId()%>" name="scheduleid">
                <br><br>
                <div class="form-group" style="margin-top:30px;">
                    <div class="col-sm-offset-6 col-sm-9">
                        <button type="submit" class="btn btn-primary" >提交</button>

                        <button type="reset" class="btn btn-primary">取消</button>
                    </div>
                </div>
            </form>
            ${inmessage}
        </div>
    </div>

</div>

<script src="/js/jquery-1.11.1.min.js"></script>
<script src="/js/bootstrap.min.js"></script>

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
        var snum = document.getElementById("schedule-snum").value;
        var fnum = document.getElementById("schedule-fnum");
        var time = document.getElementById("schedule-time").value;
        var price = document.getElementById("schedule-price").value;

        if (snum != "" && fnum != "" && time != "" && price != "")
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


