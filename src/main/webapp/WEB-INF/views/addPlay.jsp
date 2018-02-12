<%--
  Created by IntelliJ IDEA.
  User: 塞上江南果
  Date: 2016/10/27
  Time: 12:25
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="zh-cn">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>森林花电影院——添加影片</title>
    <link href="/css/bootstrap.min.css" rel="stylesheet">
    <link href="/css/play.css" rel="stylesheet">
    <style>

        .form-group
        {
            height: 60px;
        }

        .mainbody
        {
            position:fixed;
            margin-left:150px;
            margin-top:80px;
            z-index: -99;
        }

        h2
        {
            margin-top: -20px;
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

    <%@include file="play_nav.jsp"%>
    <div class="mainbody">
        <h2>添加影片信息</h2>
        <div class="col-md-10" id="addPlay">
            <form class="form-horizontal" role="form" action="insertfilm" method="post"  onsubmit="return checkAll()">
                <div class="form-group" id="input-name">
                    <label for="play-name" class="col-sm-3 control-label">影片名:</label>
                    <div class="col-sm-9">
                        <input type="text" class="form-control mess" id="play-name" name="playname"
                              onBlur="check('input-name','play-name')">
                    </div>
                </div>
                <div class="form-group" id="input-picture">
                    <label for="play-picture" class="col-sm-3 control-label">影片封面名:</label>
                    <div class="col-sm-9">
                        <input type="text" class="form-control mess" id="play-picture" name="playpicture"
                               onBlur="check('input-picture','play-picture')" autofocus>
                    </div>
                </div>
                <div class="form-group" id="input-length">
                    <label for="play-length" class="col-sm-3 control-label">影片时长:</label>
                    <div class="col-sm-9">
                        <input type="text" class="form-control mess" id="play-length" name="playlength"
                               onBlur="check('input-length','play-length')">
                    </div>
                </div>
                <div class="form-group" id="input-director">
                    <label for="play-type" class="col-sm-3 control-label">类型:</label>
                    <div class="col-sm-9">
                        <input type="text" class="form-control mess" id="play-type" name="playtype"
                               onBlur="check('input-type','play-type')">
                    </div>
                </div>
                <div class="form-group" id="input-lang">
                    <label for="play-lang" class="col-sm-3 control-label">语种:</label>
                    <div class="col-sm-9">
                        <input type="text" class="form-control mess" id="play-lang" name="playlang"
                              onBlur="check('input-lang','play-lang')">
                    </div>
                </div>
                <div class="form-group" id="input-status">
                    <label for="play-status" class="col-sm-3 control-label">影片状态:</label>
                    <div class="col-sm-9">
                        <input type="text" class="form-control mess" id="play-status" name="playstatus"
                               onBlur="check('input-status','play-status')">
                    </div>
                </div>
                <div class="form-group" id="input-price">
                    <label for="play-price" class="col-sm-3 control-label">影片票价:</label>
                    <div class="col-sm-9">
                        <input type="text" class="form-control mess" id="play-price" name="playprice"
                              onBlur="check('input-price','play-price')">
                    </div>
                </div>
                <div class="form-group" id="input-introduce">
                    <label for="play-introduce" class="col-sm-3 control-label" >简介:</label>
                    <div class="col-sm-9">
                         <textarea class="form-control mess" rows="5" id="play-introduce"
                                   name="playintroduce" onBlur="check('input-introduce','play-introduce')">

                         </textarea>
                    </div>
                </div>
                <br>
                <span>${inmessage}</span>
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
        var pname = document.getElementById("play-name").value;
        var ppic = document.getElementById("play-picture");
        var ptime = document.getElementById("play-length").value;
        var plang = document.getElementById("play-lang").value;
        var ptype = document.getElementById("play-type").value;
        var pprice = document.getElementById("play-price").value;
        var pstatus = document.getElementById("play-status").value;

        var pintroduce = document.getElementById("play-introduce").value;

        if (pname != "" && ppic != "" && ptime != "" && plang != "" && ptype != "" && pstatus != "" && pintroduce != "" && pprice != "")
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


