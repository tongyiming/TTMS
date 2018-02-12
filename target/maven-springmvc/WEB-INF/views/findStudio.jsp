<%--
  Created by IntelliJ IDEA.
  User: 塞上江南果
  Date: 2016/11/28
  Time: 17:03
  To change this template use File | Settings | File Templates.
--%>
<%@ page import="com.web.entity.Studio" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="zh-cn">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>森林花电影院——查看影片</title>
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
                 Studio studio = (Studio) request.getAttribute("studio");
           %>
    </script>


</head>

<body>

<div class="warp">

    <%@include file="studio_nav.jsp"%>
    <div class="mainbody">
        <h2>查看演出厅信息</h2>
        <div class="col-md-10">
            <form class="form-horizontal" role="form"  method="post">
                <div class="form-group" id="input-id">
                    <label for="studio-id" class="col-sm-3 control-label">影厅编号:</label>
                    <div class="col-sm-9">
                        <input type="text" class="form-control mess" id="studio-id" name="studioid"
                               value="<%=studio.getId()%>" readOnly="true" >
                    </div>
                </div>
                <div class="form-group" id="input-name">
                    <label for="studio-name" class="col-sm-3 control-label">影厅名:</label>
                    <div class="col-sm-9">
                        <input type="text" class="form-control mess" id="studio-name" name="studioname"
                               value="<%=studio.getName()%>" readOnly="true" >
                    </div>
                </div>
                <div class="form-group" id="input-status">
                    <label for="studio-status" class="col-sm-3 control-label">影片封面名:</label>
                    <div class="col-sm-9">
                        <input type="text" class="form-control mess" id="studio-status" name="studiostatus"
                               value="<%=studio.getStudio_status()%>" readOnly="true" )" autofocus>
                    </div>
                </div>
                <div class="form-group" id="input-row">
                    <label for="studio-row" class="col-sm-3 control-label">影厅行数:</label>
                    <div class="col-sm-9">
                        <input type="text" class="form-control mess" id="studio-row" name="studiorow"
                               value="<%=studio.getStudio_row_count()%>" readOnly="true" >
                    </div>
                </div>
                <div class="form-group" id="input-col">
                    <label for="studio-col" class="col-sm-3 control-label">影厅列数:</label>
                    <div class="col-sm-9">
                        <input type="text" class="form-control mess" id="studio-col" name="studiocol"
                               value="<%=studio.getStudio_col_count()%>" readOnly="true" >
                    </div>
                </div>
                <div class="form-group" id="input-introduce">
                    <label for="studio-introduce" class="col-sm-3 control-label" >简介:</label>
                    <div class="col-sm-9">
                         <textarea class="form-control mess" rows="5" id="studio-introduce"
                           readOnly="true" name="studiointroduce"><%=studio.getStudio_introduction()%></textarea>
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
