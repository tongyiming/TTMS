<%@ page import="java.util.List" %>
<%@ page import="com.web.entity.Film" %>
<%--
  Created by IntelliJ IDEA.
  User: 塞上江南果
  Date: 2016/10/27
  Time: 10:53
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="zh-cn">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>森林花电影院——影片管理</title>
    <link href="/css/bootstrap.min.css" rel="stylesheet">
    <link href="/css/play.css" rel="stylesheet">
    <style>

    </style>

    <!--[if lt IE 9]>
    <script src="/js/html5shiv.js"></script>
    <script src="/js/respond.min.js"></script>
    <![endif]-->
    <script>


    </script>

</head>

<body>

<div class="warp">

    <%@include file="play_nav.jsp"%>
    <div class="mainbody">
        <div class="col-md-10" id="play">
            <table>
                <tr style="font-weight: 900; font-size: 18px">
                    <td>影片编号</td>
                    <td>影片编号</td>
                    <td>状态</td>
                    <td>类型</td>
                    <td>语种</td>
                    <td>详细</td>
                    <td>修改</td>
                    <td>删除</td>
                </tr>
                <% List film = (List)request.getAttribute("film");
                    for(int i=0; i<film.size(); i++)
                    {
                        Film f = (Film) film .get(i);
                %>
                    <tr>
                        <td><%=f.getId()%></td>
                        <td><%=f.getName()%></td>
                        <td><%=f.getFile_status()%></td>
                        <td><%=f.getFilm_type()%></td>
                        <td><%=f.getLang()%></td>
                        <td><a onclick="find_play(<%=f.getId()%>)">详细</a></td>
                        <td><a onclick="update_play(<%=f.getId()%>)">修改</a></td>
                        <td><a onclick="del_play(<%=f.getId()%>)">删除</a></td>
                    </tr>
                <%

                    }
                %>

            </table>

        </div>
    </div>

</div>

<div>
    <form action="" method="post" id="myform">
        <input type="hidden" name="filmid" id="play-id">
    </form>
</div>

<script src="/js/jquery-1.11.1.min.js"></script>
<script src="/js/bootstrap.min.js"></script>
<script src="/js/play.js"></script>
<script>


</script>
</body>
</html>

