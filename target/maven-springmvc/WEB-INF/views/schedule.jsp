<%@ page import="java.util.List" %>
<%@ page import="com.web.entity.Schedule" %>
<%@ page import="com.web.entity.Film" %>
<%@ page import="com.web.entity.Studio" %>
<%--
  Created by IntelliJ IDEA.
  User: 塞上江南果
  Date: 2016/10/29
  Time: 23:39
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="zh-cn">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>森林花电影院——演出计划管理</title>
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

    <%@include file="schedule_nav.jsp"%>
    <div class="mainbody">
        <div class="col-md-10" id="schedule">
            <table>
                <tr style="font-weight: 900; font-size: 18px">
                    <td>演出计划编号</td>
                    <td>影厅名</td>
                    <td>影片名</td>
                    <td>演出时间</td>
                    <td>票价</td>
                    <td>修改</td>
                    <td>删除</td>
                </tr>
                <%  List sch = (List)request.getAttribute("schedules");
                    List film = (List) request.getAttribute("films");
                    List studio = (List) request.getAttribute("studios");
                    System.out.println(sch.size());
                    System.out.println(studio.size());
                    if (sch != null)
                    {
                        for(int i=0; i<studio.size(); i++)
                        {
                            Schedule s= (Schedule) sch .get(i);
                            Studio stu = (Studio)studio.get(i);
                            Film f = (Film)film.get(i);
                    %>
                    <tr>
                        <td><%=s.getId()%></td>
                        <td><%=stu.getName()%></td>
                        <td><%=f.getName()%></td>
                        <td><%=s.getSche_time()%></td>
                        <td><%=s.getSche_ticket_price()%></td>
                        <td><a onclick="update_schedule(<%=s.getId()%>)">修改</a></td>
                        <td><a onclick="del_schedule(<%=s.getId()%>)">删除</a></td>
                    </tr>
                    <%

                        }
                    }
                %>

            </table>
            ${nullmag};
        </div>
    </div>

</div>

<div>
    <form action="" method="post" id="myform">
        <input type="hidden" name="scheduleid" id="schedule-id">
    </form>
</div>

<script src="/js/jquery-1.11.1.min.js"></script>
<script src="/js/bootstrap.min.js"></script>
<script src="/js/schedule.js"></script>
<script>


</script>
</body>
</html>

