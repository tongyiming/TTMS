<%@ page import="com.web.entity.Film" %>
<%--
  Created by IntelliJ IDEA.
  User: 塞上江南果
  Date: 2016/10/27
  Time: 18:42
  To change this template use File | Settings | File Templates.
--%>
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
                Film film = (Film) request.getAttribute("film");
          %>


    </script>


</head>

<body>

<div class="warp">

    <%@include file="play_nav.jsp"%>
    <div class="mainbody">
        <h2>查看影片信息</h2>
        <div class="col-md-10">
            <form class="form-horizontal" role="form" action="" method="post"  onsubmit="return checkAll()">
                <div class="form-group" id="input-id">
                    <label for="play-id" class="col-sm-3 control-label">影片编号:</label>
                    <div class="col-sm-9">
                        <input type="text" class="form-control mess" id="play-id" name="playid"
                              value="<%=film.getId()%>" readOnly="true" onBlur="check('input-id','play-id')">
                    </div>
                </div>
                <div class="form-group" id="input-name">
                    <label for="play-name" class="col-sm-3 control-label">影片名:</label>
                    <div class="col-sm-9">
                        <input type="text" class="form-control mess" id="play-name" name="playname"
                               value="<%=film.getName()%>" readOnly="true" onBlur="check('input-name','play-name')">
                    </div>
                </div>
                <div class="form-group" id="input-picture">
                    <label for="play-picture" class="col-sm-3 control-label">影片封面名:</label>
                    <div class="col-sm-9">
                        <input type="text" class="form-control mess" id="play-picture" name="playpicture"
                               value="<%=film.getCover()%>" readOnly="true" onBlur="check('input-picture','play-picture')" autofocus>
                    </div>
                </div>
                <div class="form-group" id="input-length">
                    <label for="play-length" class="col-sm-3 control-label">影片时长:</label>
                    <div class="col-sm-9">
                        <input type="text" class="form-control mess" id="play-length" name="playlength"
                               value="<%=film.getLength()%>" readOnly="true" onBlur="check('input-length','play-length')">
                    </div>
                </div>
                <div class="form-group" id="input-director">
                    <label for="play-type" class="col-sm-3 control-label">类型:</label>
                    <div class="col-sm-9">
                        <input type="text" class="form-control mess" id="play-type" name="playdtype"
                               value="<%=film.getFilm_type()%>" readOnly="true" onBlur="check('input-type','play-type')">
                    </div>
                </div>
                <div class="form-group" id="input-lang">
                    <label for="play-lang" class="col-sm-3 control-label">语种:</label>
                    <div class="col-sm-9">
                        <input type="text" class="form-control mess" id="play-lang" name="playlang"
                               value="<%=film.getLang()%>" readOnly="true" onBlur="check('input-lang','play-lang')">
                    </div>
                </div>
                <div class="form-group" id="input-status">
                    <label for="play-status" class="col-sm-3 control-label">影片状态:</label>
                    <div class="col-sm-9">
                        <input type="text" class="form-control mess" id="play-status" name="playstatus"
                               value="<%=film.getFile_status()%>" readOnly="true" onBlur="check('input-status','play-status')">
                    </div>
                </div>
                <div class="form-group" id="input-price">
                    <label for="play-price" class="col-sm-3 control-label">影片票价:</label>
                    <div class="col-sm-9">
                        <input type="text" class="form-control mess" id="play-price" name="playprice"
                               value="<%=film.getTicket_price()%>" readOnly="true" onBlur="check('input-price','play-price')">
                    </div>
                </div>
                <div class="form-group" id="input-introduce">
                    <label for="play-introduce" class="col-sm-3 control-label" >简介:</label>
                    <div class="col-sm-9">
                         <textarea class="form-control mess" rows="5" id="play-introduce" readOnly="true" name="playintroduce"
                                   onBlur="check('input-introduce','play-introduce')"><%=film.getIntroduction()%></textarea>
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
