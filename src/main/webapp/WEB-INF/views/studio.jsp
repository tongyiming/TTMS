<%@ page import="java.util.List" %>
<%@ page import="com.web.entity.Studio" %>

<%--
  Created by IntelliJ IDEA.
  User: 塞上江南果
  Date: 2016/10/28
  Time: 13:16
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="zh-cn">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>森林花电影院——影厅管理</title>
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
                    <td>影厅编号</td>
                    <td>影厅名</td>
                    <td>状态</td>
                    <td>座位行数</td>
                    <td>座位列数</td>
                    <td>管理座位</td>
                    <td>详细</td>
                    <td>修改</td>
                    <td>删除</td>
                </tr>
                <% List stu = (List)request.getAttribute("studios");
                    for(int i=0; i<stu.size(); i++)
                    {
                        Studio s= (Studio) stu .get(i);
                %>
                <tr>
                    <td><%=s.getId()%></td>
                    <td><%=s.getName()%></td>
                    <td><%=s.getStudio_status()%></td>
                    <td><%=s.getStudio_row_count()%></td>
                    <td><%=s.getStudio_col_count()%></td>
                    <td><a onclick="enterSeat(<%=s.getId()%>)">座位</a></td>
                    <td><a onclick="find_studio(<%=s.getId()%>)">详细</a></td>
                    <td><a onclick="update_studio(<%=s.getId()%>)">修改</a></td>
                    <td><a onclick="del_studio(<%=s.getId()%>)">删除</a></td>
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

