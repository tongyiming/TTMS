<%@ page import="com.web.entity.Studio" %>
<%--
  Created by IntelliJ IDEA.
  User: 塞上江南果
  Date: 2016/10/29
  Time: 23:23
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>森林花电影院——更新演出厅</title>
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
               Studio s = (Studio) request.getAttribute("studio");
            %>

    </script>

</head>

<body>

<div class="warp">

    <%@include file="studio_nav.jsp"%>

    <div class="mainbody">
        <h2>更新影厅信息</h2>
        <div class="col-md-10">
            <form class="form-horizontal" role="form" action="updatestudio" method="post"  onsubmit="return checkAll()">

                <div class="form-group" id="input-name">
                    <label for="studio-name" class="col-sm-3 control-label">影厅名:</label>
                    <div class="col-sm-9">
                        <input type="text" class="form-control" id="studio-name" name="studioname"
                             value="<%=s.getName()%>"  placeholder="输入影厅名" onBlur="check('input-name','studio-name')" autofocus>
                    </div>
                </div>
                <div class="form-group" id="input-rows">
                    <label for="studio-rows" class="col-sm-3 control-label">影厅行:</label>
                    <div class="col-sm-9">
                        <input type="text" class="form-control" id="studio-rows" name="studiorows"
                             value="<%=s.getStudio_row_count()%>"  placeholder="输入影厅的行值" onBlur="check('input-rows','studio-rows')" autofocus>
                    </div>
                </div>
                <div class="form-group" id="input-cols">
                    <label for="studio-cols" class="col-sm-3 control-label">影厅列:</label>
                    <div class="col-sm-9">
                        <input type="text" class="form-control" id="studio-cols" name="studiocols"
                             value="<%=s.getStudio_col_count()%>"  placeholder="输入影厅的列值" onBlur="check('input-cols','studio-cols')">
                    </div>
                </div>
                <div class="form-group" id="input-status">
                    <label for="studio-status" class="col-sm-3 control-label">影厅状态:</label>
                    <div class="col-sm-9">
                        <input type="text" class="form-control" id="studio-status" name="studiostatus"
                               value="<%=s.getStudio_status()%>" placeholder="输入影片状态" onBlur="check('input-stutas','studio-stutas')">
                    </div>
                </div>
                <div class="form-group" id="input-introduce">
                    <label for="studio-introduce" class="col-sm-3 control-label" >简介:</label>
                    <div class="col-sm-9">
                         <textarea class="form-control" rows="5" placeholder="输入影厅简介..." id="studio-introduce"
                                   name="studiointroduce" onBlur="check('input-introduce','studio-introduce')"><%=s.getStudio_introduction()%></textarea>
                    </div>
                </div>
                <input type="hidden"  name="studioid" value="<%=s.getId()%>" >

                <br><br>
                <div class="form-group" style="margin-top:30px;">
                    <div class="col-sm-offset-6 col-sm-9">
                        <button type="submit" class="btn btn-primary" >提交</button>

                        <button type="reset" class="btn btn-primary">取消</button>
                    </div>
                </div>
            </form>

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
        var pname = document.getElementById("studio-name").value;
        var ppic = document.getElementById("studio-rows");
        var ptime = document.getElementById("studio-cols").value;
        var pdirector = document.getElementById("studio-status").value;
        var pintroduce = document.getElementById("status-introduce").value;

        if (pname != "" && ppictrue != "" && ptime != "" && pdirector != ""&& pintroduce != "")
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



