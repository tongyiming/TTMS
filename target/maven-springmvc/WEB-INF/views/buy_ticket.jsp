<%@ page import="java.util.List" %>
<%@ page import="com.web.entity.Film" %>
<%@ page import="com.web.entity.Schedule" %>
<%--
  Created by IntelliJ IDEA.
  User: 塞上江南果
  Date: 2016/10/27
  Time: 10:47
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="zh-cn">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>森林花电影院——购票</title>
    <link href="/css/bootstrap.min.css" rel="stylesheet">
    <link href="/css/buy_ticket.css" rel="stylesheet">

    <style>

    </style>

    <!--[if lt IE 9]>
    <script src="/js/html5shiv.js"></script>
    <script src="/js/respond.min.js"></script>
    <![endif]-->
<script>

    function createTable() {
        var m = document.querySelectorAll('.mess');
        <%
            Film film = (Film) request.getAttribute("film");
         %>
        var name = "<%=film.getName()%>";
        var length = "<%=film.getLength()%>";
        var type = "<%=film.getFilm_type()%>";
        var image_local = "/images/" + "<%=film.getCover()%>";
        var introduction = "<%=film.getIntroduction()%>";
        var price = "<%=film.getTicket_price()%>";
        var stutas = "<%=film.getFile_status()%>";
        m[0].src = image_local;
        m[1].innerHTML = name;
        m[2].innerHTML = type;
        if (stutas == 1)
            m[3].innerHTML = "正在热映";
        m[4].innerHTML = length;
        m[5].innerHTML = price;
        m[6].innerHTML = introduction;
        //alert(name);
    }
    function showPlan()
    {
        var today = document.getElementById("tab-today");
        var table = document.createElement("table");
        table.className = "table table-border table-hover";
        var thead = document.createElement("thead");
        var trhead = document.createElement("tr");
        var title = ['开始时间','电影名','时长','类型','放映厅','票价','在线选座'];
        for (var i = 0; i < title.length; i++)
        {
                var th = document.createElement("th");
                th.innerHTML = title[i];
                th.style.textAlign = "center";
                trhead.appendChild(th);
        }
        thead.appendChild(trhead);
        table.appendChild(thead);
        var tbody = document.createElement("tbody");
        <%
            Film f = (Film) request.getAttribute("film");
         %>
        var fname = "<%=f.getName()%>";
        var flength = "<%=f.getLength()%>";
        var ftype = "<%=f.getFilm_type()%>";

        <% List schedules = (List)request.getAttribute("schedules");
               for(int i=0; i<schedules.size(); i++)
               {
                   Schedule s = (Schedule) schedules .get(i);
           %>
                var scheid = "<%=s.getId()%>"
                var sname = "<%=s.getStudio_id()%>"+"号厅";
                var stime = "<%=s.getSche_time()%>";
                var sprice = "<%=s.getSche_ticket_price()%>";
                var plan = [stime,fname,flength,ftype,sname,sprice,"在线选座"];
                var tr = document.createElement("tr");
                for (var j = 0; j < plan.length; j++)
                {
                    var td = document.createElement("td");
                    td.style.textAlign = "center";
                    if (j < plan.length - 1)
                    {
                        td.innerHTML = plan[j];
                        if (j == 5)
                            td.style.color = "red";
                    }
                    else
                    {
                        var a = document.createElement("button");
                        a.className = "btn btn-primary";
                        a.innerHTML = plan[j];
                        a.setAttribute("name",scheid);
                        a.onclick = function () {
                            var formid = document.getElementById("myform");
                            formid.action = "/Home/buyticket";
                            var studioid = document.getElementById("schedule");
                            studioid.value = this.name;
                            formid.submit();
                        }
                        td.appendChild(a);
                    }
                    tr.appendChild(td);
                }
                tbody.appendChild(tr);

           <% }%>
        table.appendChild(tbody);
        today.appendChild(table);
    }

</script>

</head>

<body onLoad="createTable();showPlan()">

<%@include file="nav.jsp"%>
<!--电影内容-->
<div id="field" align="center">
    <table class="play">
        <tr style="margin-top: 20px">
            <td><img src="" class="mess"></td>
            <td>
                <table class="list">
                    <tr><td><h2 class="mess"></h2></td></tr>
                    <tr><td>类型：<font class="mess"></font></td></tr>
                    <tr><td>状态：<font class="mess"></font></td></tr>
                    <tr><td>时长：<font class="mess"></font></td></tr>
                    <tr><td>票价：<font class="mess"></font></td></tr>
                </table>
            </td>
        </tr>
        <tr><td colspan="2">简介：<p class="mess"></p></td></tr>
    </table>
</div>

<!--今天和明天-->
<div align="center">
    <ul class="nav nav-tabs" role="tablist" id="feature-tab" style="width:1000px">
        <li class="active" style="margin-left:38%"><a href="#tab-today" role="tab"  data-toggle="tab">今天（周二）</a></li>
        <li><a href="#tab-tomorrow" role="tab"  data-toggle="tab">明天（周三）</a></li>
    </ul>

    <div class="tab-content">
        <div class="tab-pane active" id="tab-today">

        </div>

        <div class="tab-pane" id="tab-tomorrow">

        </div>
    </div>
</div>

<form action="" method="post" id="myform">
    <input type="hidden" name="scheduleid" id="schedule">
</form>

<hr>

<footer>
    <p class="pull-right"><a href="#top">回到顶部</a></p>

    <p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&copy; 2016  &nbsp;森林花电影院 </p>
</footer>




<script src="/js/jquery-1.11.1.min.js"></script>
<script src="/js/bootstrap.min.js"></script>
<script src="/js/login_register.js"></script>

<script>


</script>
</body>
</html>

