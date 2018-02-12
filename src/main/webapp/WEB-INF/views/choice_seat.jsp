<%@ page import="java.util.List" %>
<%@ page import="com.web.entity.Film" %>
<%@ page import="com.web.entity.Seat" %>
<%@ page import="com.web.entity.Studio" %>
<%@ page import="com.web.entity.Schedule" %>
<%--
  Created by IntelliJ IDEA.
  User: 塞上江南果
  Date: 2016/10/27
  Time: 10:48
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="zh-cn">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>森林花电影院——选座</title>
    <link href="/css/bootstrap.min.css" rel="stylesheet">
    <link href="/css/choice_seat.css" rel="stylesheet">

    <style>

    </style>

    <!--[if lt IE 9]>
    <script src="js/html5shiv.js"></script>
    <script src="js/respond.min.js"></script>
    <![endif]-->
<script>
    function createSeat() {
        var f = 0; //全局变量，控制票的张数
        var studio_name = document.getElementById("name_studio");
        //var table = document.createElement("table");
        var div_seat = document.getElementById("create-seat");
        <% Studio s = (Studio) request.getAttribute("studio");%>
        studio_name.innerHTML = "<%=s.getName()%>";
        var studio_rows = "<%=s.getStudio_row_count()%>";
        var studio_cols = "<%=s.getStudio_col_count()%>";
       var table = document.createElement("table");
        for (var i = 0; i < studio_rows; i++)
        {
            var tr = document.createElement("tr");
            for (var j = 0; j < studio_cols; j++)
            {
                var td = document.createElement("td");
                tr.appendChild(td);
                td.style.width = "30px";
                td.style.height = "30px";
            }
            table.appendChild(tr);
        }
        div_seat.appendChild(table);
           <%
            List seat = (List)request.getAttribute("seats");
               for(int i=0; i<seat.size(); i++)
               {
                   Seat st = (Seat) seat .get(i);
            %>
            var row = "<%=st.getSeat_row()%>";
            var col = "<%=st.getSeat_col()%>";
            var status = "<%=st.getSeat_status()%>";
            var seatid = "<%=st.getId()%>";
            var img = document.createElement("img");
            if (status == 1)
            {
                img.setAttribute("alt","true");
                img.setAttribute("id",seatid);
                img.src = "/images/true_seat.png";
                img.onclick = function()
                {
                    <%
                         Schedule sch = (Schedule)request.getAttribute("schedule");
                    %>
                    var price = "<%=sch.getSche_ticket_price()%>";
                    if (this.alt == "true" && (f < 4 && f >=0))
                    {
                        buy(this, f, price);
                        f++;
                    }
                    else if(this.alt == "false" && (f <= 4 && f >=0))
                    {
                        update(this, f, price);
                        f--;
                    }
                    else
                    {
                        alert("一次最多只能购买4张哦！");
                    }
                }
            }
            else
            {
                img.src = "/images/false_seat.jpg";
            }
            img.style.cursor = "pointer";
            img.setAttribute("name",(row)+"排"+(col)+"列");
            $(img).tooltip({
                trigger:'hover',
                html:true,
                title:(row)+"排"+(col)+"列"});
            table.rows[row-1].cells[col-1].appendChild(img);
      <%
               }
      %>
    }

    function createTicket() {
        <%
            Film film = (Film) request.getAttribute("film");
            Schedule sch = (Schedule)request.getAttribute("schedule");
         %>
        var name = "<%=film.getName()%>";
        var length = "<%=film.getLength()%>";
        var type = "<%=film.getFilm_type()%>";
        var image_local = "/images/" + "<%=film.getCover()%>";
        var price = "<%=sch.getSche_ticket_price()%>";
        var time = "<%=sch.getSche_time()%>";
        var title = ['&nbsp;&nbsp;时长：','&nbsp;&nbsp;类型：','&nbsp;&nbsp;影院：','&nbsp;&nbsp;场次：', '&nbsp;&nbsp;票价：'];
        var j = 0;
        var ticket = document.getElementById("create-ticket");
        var message = document.querySelectorAll('.mess');
        var data = [image_local, name, length, type, '森林花', time,price];
        for (var i = 0; i < message.length; i++) {
            if (i == 0) {
                message[i].src = data[i];
            }
            else if (i == 1) {
                message[i].innerHTML = data[i];
                message[i].style.fontSize = "20px";
                message[i].style.fontWeight = "bold";
                message[i].style.textAlign = "center";
            }
            else {
                message[i].innerHTML = title[j] + "&nbsp;&nbsp;" + data[i];
                message[i].colSpan = "2";
                j++;
            }

        }
    }

    function pay() {
        <%
              Schedule ch = (Schedule)request.getAttribute("schedule");
        %>
        var scheduleid = "<%=ch.getId()%>";
        var myform = document.getElementById("myform");
        var seatid = "";
        var img = document.getElementsByTagName("img");
        for (var i = 0; i < img.length; i++)
        {
            if (img[i].alt == "false") {
                seatid = seatid + img[i].id + ',';
            }
        }
        document.getElementById("scheduleid").value = scheduleid;
        document.getElementById("seatid").value = seatid;
        myform.action = "/Home/returnticket";
        myform.submit();

    }

</script>

</head>

<body onload="createTicket();createSeat()">

<%@include file="nav.jsp"%>
<div class="content">
    <div class="row" id="play-now">
        <div class="col-md-8">
            <img src="/images/ping.png" style="margin-top:30px;width:100%;height:50px">
            <p>森林花电影院&nbsp;&nbsp;&nbsp;<font id="name_studio"></font></p>
            <div id="create-seat" align="center">

            </div>
            <div>
                <table style="width:100%; text-align:center; margin:52px">
                    <tr>
                        <td><img src="/images/true_seat.png">可选座位</td>
                        <td><img src="/images/ok_seat.png">已选座位</td>
                        <td><img src="/images/false_seat.jpg">不可选座位</td>
                    </tr>
                </table>
            </div>
        </div>
        <div class="col-md-4">
            <div class="content-ticket">
    <p>电影票</p>
    <div id="create-ticket">
        <table>
            <tr style="width:350px">
                <td>&nbsp;&nbsp;<img src="" style="width:100px; height:120px" class="mess"></td>
                <td>
                    <table>
                        <tr><td class="mess"></td></tr>
                        <tr><td class="mess"></td></tr>
                        <tr><td class="mess"></td></tr>
                    </table>
                </td>
            </tr>
            <tr><td class="mess" colspan="2"></td></tr>
            <tr><td class="mess" colspan="2"></td></tr>
            <tr><td style="line-height:30px;" colspan="2">&nbsp;&nbsp;座位：
                <font class="loca-seat"></font>&nbsp;
                <font class="loca-seat"></font>&nbsp;
                <font class="loca-seat"></font>&nbsp;
                <font class="loca-seat"></font></td></tr>
            <tr><td colspan="2"><font class="mess"></font>元/张</td></tr>
            <tr><td style="line-height:30px" colspan="2">&nbsp;&nbsp;票数：
                <font class="mess-color" id="sum-ticket"></font></td></tr>
        </table>
        <hr>
        <p>总计：<font class="mess-color" id="cost-ticket"></font></p>
    </div>
</div>
<button type="button" class="btn btn-primary btn-lg btn-location"
        onclick="pay()">确认付款</button>
</div>
</div>
</div>

<form action="" method="post" id="myform">
    <input type="hidden" id="scheduleid" name="scheduleid">
    <input type="hidden" id="seatid" name="seatid">
</form>



<hr>

<footer>
    <p class="pull-right"><a href="#top">回到顶部</a></p>

    <p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&copy; 2016  &nbsp;森林花电影院 </p>
</footer>

<script src="/js/jquery-1.11.1.min.js"></script>
<script src="/js/bootstrap.min.js"></script>
<script src="/js/login_register.js"></script>
<script src="/js/choice_seat.js"></script>
<script>


</script>
</body>
</html>

