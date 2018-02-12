<%--
  Created by IntelliJ IDEA.
  User: 塞上江南果
  Date: 2016/12/4
  Time: 19:24
  To change this template use File | Settings | File Templates.
--%>
<%@ page import="java.util.List" %>
<%@ page import="com.web.entity.User" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="zh-cn">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>森林花电影院——用户管理</title>
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

    <%@include file="studio_nav.jsp"%>
    <div class="mainbody">
        <div class="col-md-10" id="studio">
            <table>
                <tr style="font-weight: 900; font-size: 18px">
                    <td>用户编号</td>
                    <td>用户名</td>
                    <td>用户电话</td>
                </tr>
                <% List user = (List)request.getAttribute("users");
                    for(int i=0; i<user.size(); i++)
                    {
                        User us = (User) user .get(i);
                %>
                <tr>
                    <td><%=us.getId()%></td>
                    <td><%=us.getUsername()%></td>
                    <td><%=us.getCallphone()%></td>
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
        <input type="hidden" name="studioid" id="studio-id">
    </form>
</div>

<script src="/js/jquery-1.11.1.min.js"></script>
<script src="/js/bootstrap.min.js"></script>
<script src="/js/studio.js"></script>
<script>


</script>
</body>
</html>

