<%--
  Created by IntelliJ IDEA.
  User: 塞上江南果
  Date: 2016/12/3
  Time: 13:24
  To change this template use File | Settings | File Templates.
--%>
<%@ page import="java.util.List" %>
<%@ page import="com.web.entity.Order" %>
<%@ page import="com.web.entity.Film" %>
<%@ page import="com.web.entity.Studio" %>
<%@ page import="com.web.entity.Seat" %>
<%@ page import="com.web.entity.Schedule" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="zh-cn">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>森林花电影院——我的订单</title>
    <link href="/css/bootstrap.min.css" rel="stylesheet">
    <link href="/css/ordercenter.css" rel="stylesheet">

    <!--[if lt IE 9]>
    <script src="js/html5shiv.js"></script>
    <script src="js/respond.min.js"></script>
    <![endif]-->


</head>

<body>

<%@include file="nav.jsp"%>
<!--用户信息-->
<div>
    <img src="/images/5.jpg" alt="backgroundPic" class="header-background">
    <div class="user">
        <span style="font-size:40px">${name}</span><br>
        <span>欢迎回来！！</span>
    </div>
    <div class="col-sm-offset-9" style="margin-top:-80px; color:#fff">
        <div class="row">
            <div class="col-sm-3"><a href="#" onclick="showMag()">我的信息</a></div>
            <div class="col-sm-3"><a href="#">修改密码</a></div>
            <div class="col-sm-3" id="menu">
                <ul>
                    <li><a href="#">我的订单</a>
                        <ul>
                            <li><a href="gethome">全部订单</a></li>
                            <li><a href="getOrderformFromStatus?status=1">已使用</a></li>
                            <li><a href="getOrderformFromStatus?status=2">未使用</a></li>
                        </ul>
                    </li>
                </ul>
            </div>
        </div>
    </div>
</div>

<div class="mainbody">
    <div id="div1">
    <%
        List film = (List)request.getAttribute("films");
        List order = (List)request.getAttribute("orders");
        List studio = (List)request.getAttribute("studios");
        List seat = (List)request.getAttribute("seats");
        List schedule = (List)request.getAttribute("schedules");
        for (int i = 0; i < film.size(); i++)
        {
            Film f = (Film)film.get(i);
            Order or = (Order)order.get(i);
            Studio st = (Studio)studio.get(i);
            Seat se = (Seat)seat.get(i);
            Schedule sche = (Schedule)schedule.get(i);
    %>
        <div class="row" id="<%=or.getId()%>">
            <span class="time"><%=sche.getSche_time()%></span>
            <hr>
            <table>
                <tr>
                    <td rowspan="2" name="filmpic"><img src="/images/<%=f.getCover()%>"></td>
                    <td>
                        <table style="margin-left:0px">
                            <tr>
                                <td>&nbsp;&nbsp;&nbsp;&nbsp;<h2 name="filmname"><%=f.getName()%></h2></td>
                                <td style="text-align:right">
                                    <% if (or.getOrder_status() == 1)
                                    { %>
                                    <a href="#"><img src="/images/used.png" class="status"></a></td>
                                <%  }%>
                                    <% if (or.getOrder_status() == 2)
                                        {   %>
                                <a href="#" onclick="nolook(<%=or.getId()%>)"><img src="/images/unused.png" class="status"></a></td>
                                  <%  }%>
                            </tr>
                            <tr>
                                <td>&nbsp;&nbsp;&nbsp;&nbsp;观看时间：<span name="time"><%=sche.getSche_time()%></span></td>
                                <td>放映厅：<span id="studio"><%=st.getName()%></span></td>
                            </tr>
                            <tr>
                                <td>&nbsp;&nbsp;&nbsp;&nbsp;座位：<span><%=se.getSeat_row()%></span>行<span><%=se.getSeat_col()%></span>列</td>
                                <td>支付金额：<span name="paymoney"><%=sche.getSche_ticket_price()%></span></td>
                            </tr>
                        </table>
                    </td>
                </tr>
            </table>
        </div>
        <%}%>

        <form style="display:none" id="myform" action="deleteOrder">
            <input type="hidden" type="text" name="orderid" id="orderid">
            <button type="submit" class="btn btn-primary btn-sm" style="margin-left:350px"
                    onClick="delOrder()">退票</button>
            <button type="button" class="btn btn-primary btn-sm" onclick="showOrder()">返回</button>
        </form>
    </div>



    <div id="div2" style="display:none;margin-top:30px">
    <form class="form-horizontal" role="form" action="updateUser" method="post"  onsubmit="return checkAll()" enctype="multipart/form-data">
        <div class="form-group" id="input-username">
            <label for="user-name" class="col-sm-3 control-label">用户名:</label>
            <div class="col-sm-9">
                <input type="text" class="form-control mess" id="user-name" name="username"
                       readOnly="true" value="${user.username}">
            </div>
        </div>
        <div class="form-group" id="input-phone">
            <label for="user-phone" class="col-sm-3 control-label">电话:</label>
            <div class="col-sm-9">
                <input type="text" class="form-control mess" id="user-phone" name="usercallphone"
                       placeholder="输入电话号码" value="${user.callphone}"  onBlur="check('input-phone','user-phone')">
            </div>
        </div>

        <div class="form-group" id="input-file">
            <label for="file-name" class="col-sm-3 control-label">图像:</label>
            <div class="col-sm-9">
                <input id="filename" id="file-name" type="file" value="" onChange="add_files(this.files)" name="userpicture">
            </div>
        </div>
        <img src="/${user.picture}" class="img-circle size" id="userpic" style="width:150px; height:150px; margin-left:100px;">
        <div class="form-group" style="margin-top:30px;">
            <div class="col-sm-offset-6 col-sm-9">
                <button type="submit" class="btn btn-primary" >修改</button>

                <button type="reset" class="btn btn-primary">取消</button>
            </div>
        </div>

    </form>
    </div>

    <br><br>
    <hr>
    <footer style="margin-left:0px">
        <p class="pull-right"><a href="#top">回到顶部</a></p>

        <p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&copy; 2016  &nbsp;森林花电影院 </p>
    </footer>


</div>

<script src="/js/jquery-1.11.1.min.js"></script>
<script src="/js/bootstrap.min.js"></script>
<script src="/js/login_register.js"></script>
<script>

    function nolook(rowid)
    {
        var rowself = document.getElementById(rowid);
        var row = document.getElementsByClassName("row");
        for (var i = 0; i < row.length; i++)
        {
            if (row[i] != rowself)
                row[i].style.display = "none";
        }
        document.getElementById("myform").style.display = "block";
        document.getElementById("orderid").value = rowid;

    }

    function delOrder()
    {
        var flag = confirm("确定要退票吗？");
        if (flag == true)
        {
            document.getElementById("myform").submit();
        }
        else
            showOrder();
    }

    function showOrder()
    {
        var row = document.getElementsByClassName("row");
        for (var i = 0; i < row.length; i++)
        {
            row[i].style.display = "block";
        }
        document.getElementById("myform").style.display = "none";
    }
function showMag() {
    document.getElementById("div1").style.display = "none";
    document.getElementById("div2").style.display = "block";

}

    function add_files(files) {
        if (files.length) {
            var file = files[0];
            var reader = new FileReader();
            reader.onload = function(e) {
                document.getElementById("userpic").src = e.target.result;
                pic = e.target.result;
                alert(document.getElementById("filename").value);
            }
            reader.readAsDataURL(file);
        }
    }


</script>
</body>
</html>