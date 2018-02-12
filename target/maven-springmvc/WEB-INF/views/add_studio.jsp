<%--
  Created by IntelliJ IDEA.
  User: 塞上江南果
  Date: 2016/10/28
  Time: 14:00
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="zh-cn">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>森林花电影院——添加影厅</title>
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

    <%@include file="studio_nav.jsp"%>

    <div class="mainbody">
        <h2>添加影厅信息</h2>
        <div class="col-md-10">
            <form class="form-horizontal" role="form" action="insertstudio" method="post"  onsubmit="return checkAll()">

                <div class="form-group" id="input-name">
                    <label for="studio-name" class="col-sm-3 control-label">影厅名:</label>
                    <div class="col-sm-9">
                        <input type="text" class="form-control" id="studio-name" name="studioname"
                               placeholder="输入影厅名" onBlur="check('input-name','studio-name')" autofocus>
                    </div>
                </div>
                <div class="form-group" id="input-rows">
                    <label for="studio-rows" class="col-sm-3 control-label">影厅行:</label>
                    <div class="col-sm-9">
                        <input type="text" class="form-control" id="studio-rows" name="studiorows"
                               placeholder="输入影厅的行值" onBlur="check('input-rows','studio-rows')" autofocus>
                    </div>
                </div>
                <div class="form-group" id="input-cols">
                    <label for="studio-cols" class="col-sm-3 control-label">影厅列:</label>
                    <div class="col-sm-9">
                        <input type="text" class="form-control" id="studio-cols" name="studiocols"
                               placeholder="输入影厅的列值" onBlur="check('input-cols','studio-cols')">
                    </div>
                </div>
                <div class="form-group" id="input-status">
                    <label for="studio-status" class="col-sm-3 control-label">影厅状态:</label>
                    <div class="col-sm-9">
                        <input type="text" class="form-control" id="studio-status" name="studiostutas"
                               placeholder="输入影片状态" onBlur="check('input-stutas','studio-stutas')">
                    </div>
                </div>
                <div class="form-group" id="input-introduce">
                    <label for="studio-introduce" class="col-sm-3 control-label" >简介:</label>
                    <div class="col-sm-9">
                         <textarea class="form-control" rows="5" placeholder="输入影厅简介..." id="studio-introduce"
                                   name="studiointroduce" onBlur="check('input-introduce','studio-introduce')"></textarea>
                    </div>
                </div>
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
        var name = document.getElementById("studio-name").value;
        var rows = document.getElementById("studio-rows");
        var col = document.getElementById("studio-cols").value;
        var status = document.getElementById("studio-status").value;
        var introduce = document.getElementById("studio-introduce").value;
        if (num != "" && name != "" && rows != "" && col != "" && status != "" && introduce != "" )
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



