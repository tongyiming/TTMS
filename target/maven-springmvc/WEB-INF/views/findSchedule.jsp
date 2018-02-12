<%--
  Created by IntelliJ IDEA.
  User: 塞上江南果
  Date: 2016/11/28
  Time: 17:55
  To change this template use File | Settings | File Templates.
--%>
<%@ page import="com.web.entity.Schedule" %>
<%@ page import="com.web.entity.Film" %>
<%@ page import="com.web.entity.Studio" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="zh-cn">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>森林花电影院——查看演出计划</title>
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
    <script>
        <%
                 Schedule sche = (Schedule) request.getAttribute("schedule");
                 Studio studio = (Studio) request.getAttribute("studio");
                 Film film = (Film) request.getAttribute("film");
           %>
    </script>


</head>

<body>

<div class="warp">

    <%@include file="studio_nav.jsp"%>
    <div class="mainbody">
        <h2>查看演出计划信息</h2>
        <div class="col-md-10">
            <form class="form-horizontal" role="form"  method="post">
                <div class="form-group">
                    <label for="schedule-id" class="col-sm-3 control-label">演出计划编号:</label>
                    <div class="col-sm-9">
                        <input type="text" class="form-control mess" id="schedule-id" name="scheduleid"
                               value="<%=sche.getId()%>" readOnly="true" >
                    </div>
                </div>
                <div class="form-group">
                    <label for="studio-name" class="col-sm-3 control-label">影厅名:</label>
                    <div class="col-sm-9">
                        <input type="text" class="form-control mess" id="studio-name" name="studioname"
                               value="<%=studio.getName()%>" readOnly="true" >
                    </div>
                </div>
                <div class="form-group">
                    <label for="film-name" class="col-sm-3 control-label">影片名:</label>
                    <div class="col-sm-9">
                        <input type="text" class="form-control mess" id="film-name" name="filmname"
                               value="<%=film.getName()%>" readOnly="true" autofocus>
                    </div>
                </div>
                <div class="form-group" >
                    <label for="schedule-time" class="col-sm-3 control-label">演出时间:</label>
                    <div class="col-sm-9">
                        <input type="text" class="form-control mess" id="schedule-time" name="scheduletime"
                               value="<%=sche.getSche_time()%>" readOnly="true" >
                    </div>
                </div>
                <div class="form-group" >
                    <label for="schedule-price" class="col-sm-3 control-label">票价:</label>
                    <div class="col-sm-9">
                        <input type="text" class="form-control mess" id="schedule-price" name="filmprice"
                               value="<%=sche.getSche_ticket_price()%>" readOnly="true" >
                    </div>
                </div>

            </form>
        </div>
    </div>

</div>

<script src="/js/jquery-1.11.1.min.js"></script>
<script src="/js/bootstrap.min.js"></script>

<script>


</script>
</body>
</html>



</body>
</html>
