<%--
  Created by IntelliJ IDEA.
  User: 塞上江南果
  Date: 2016/12/4
  Time: 20:04
  To change this template use File | Settings | File Templates.
--%>
<%@ page import="java.util.List" %>
<%@ page import="com.web.entity.Seat" %>
<%@ page import="com.web.entity.Film" %>
<%@ page import="com.web.entity.Studio" %>
<%@ page import="com.web.entity.User" %>
<%@ page import="com.web.entity.Order" %>
<%@ page import="com.web.entity.Schedule" %>

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

</head>

<body>

<div class="warp">

    <%@include file="sale_nav.jsp"%>
    <div class="mainbody">
        <div class="col-md-10" id="schedule">
            <span style="font-size:20px;font-weight: bold">总金额：</span>
            <span style="color:#ff3845 ;font-size:20px;font-weight: bold">${sum}元</span>
            <table style="margin-top: 20px">
                <tr style="font-weight: 900; font-size: 18px">
                    <td>订单编号</td>
                    <td>用户名</td>
                    <td>影厅名</td>
                    <td>影片名</td>
                    <td>演出时间</td>
                    <td>订单状态</td>
                    <td>座位</td>
                    <td>票价</td>
                </tr>
                <%  List seats = (List)request.getAttribute("seats");
                    List films = (List) request.getAttribute("films");
                    List studios = (List) request.getAttribute("studios");
                    List users = (List) request.getAttribute("users");
                    List orders = (List) request.getAttribute("orders");
                    List schedules = (List) request.getAttribute("schedules");
                    if (orders != null)
                    {
                        for(int i=0; i<orders.size(); i++)
                        {
                            Schedule schedule= (Schedule) schedules .get(i);
                            Studio studio = (Studio)studios.get(i);
                            Film film = (Film)films.get(i);
                            Order order = (Order)orders.get(i);
                            User user = (User)users.get(i);
                            Seat seat = (Seat)seats.get(i);
                %>
                <tr>
                    <td><%=order.getId()%></td>
                    <td><%=user.getUsername()%></td>
                    <td><%=studio.getName()%></td>
                    <td><%=film.getName()%></td>
                    <td><%=schedule.getSche_time()%></td>
                    <td><%=order.getOrder_status()%></td>
                    <td><%=seat.getSeat_row()%>排<%=seat.getSeat_col()%>列</td>
                    <td><%=schedule.getSche_ticket_price()%></td>
                </tr>
                <%

                        }
                    }
                %>

            </table>
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
<script>



</script>
</body>
</html>

