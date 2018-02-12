<%--
  Created by IntelliJ IDEA.
  User: 塞上江南果
  Date: 2016/12/1
  Time: 11:41
  To change this template use File | Settings | File Templates.
--%>
<%@ page import="java.util.List" %>
<%@ page import="com.web.entity.Seat" %>
<%@ page import="com.web.entity.Studio" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="zh-cn">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>森林花电影院——座位</title>
    <link href="/css/bootstrap.min.css" rel="stylesheet">
    <link href="/css/seat.css" rel="stylesheet">

    <style>

        .mainbody
        {
            position:absolute;
            margin-left:350px;
            margin-top:80px;
            text-align: center;
            width:800px;
        }

        table
        {
            margin:0 auto;
            text-align: center;
        }

        h2
        {
            margin-left:530px;
        }
    </style>

    <!--[if lt IE 9]>
    <script src="js/html5shiv.js"></script>
    <script src="js/respond.min.js"></script>
    <![endif]-->
    <script>
        function createSeat() {
            var studio_name = document.getElementById("name_studio");
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
            }
            else if(status == 2)
            {
                img.setAttribute("alt","false");
                img.setAttribute("id",seatid);
                img.src = "/images/false_seat.jpg";
            }
            else {
                img.setAttribute("alt", "true");
                img.setAttribute("id", seatid);
                img.src = "/images/ok_seat.png";
            }
            img.className = "imgseat";
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

        function submitSeat()
        {
            var data =JSON.stringify(seat);
            document.getElementById("seat").value = data;
        }

    </script>

</head>

<body onload="createSeat()">

<%@include file="seat_nav.jsp"%>
<div class="mainbody">
    <img src="/images/ping.png">
    <p>森林花电影院&nbsp;&nbsp;&nbsp;<span id="name_studio"></span></p>
    <div id="create-seat">

    </div>
    <br><br>
    <div>
        <table>
            <tr>
                <td><img src="/images/true_seat.png">未售出座位</td>
                <td><img src="/images/ok_seat.png">已售出座位</td>
                <td><img src="/images/false_seat.jpg">不可选座位</td>
            </tr>
        </table>
    </div>
    <form action="updateseat" method="post" id="myform" onsubmit="return submitSeat()">
        <input type="hidden" id="seat" name="seats">
        <input type="hidden" value="<%=s.getId()%>"id="studio" name="studioid">
        <button type="button" class="btn btn-primary" style="margin-left:700px;margin-top:-40px;"
           onclick="setClick()">修改</button>
        <input type="submit" value="提交" class="btn btn-primary" style="margin-left:800px;margin-top:-80px;">
    </form>
</div>

<hr>
<footer>
    <p class="pull-right"><a href="#top">回到顶部</a></p>

    <p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&copy; 2016  &nbsp;森林花电影院 </p>
</footer>

<script src="/js/jquery-1.11.1.min.js"></script>
<script src="/js/bootstrap.min.js"></script>
<script src="/js/seat.js"></script>
<script>


</script>
</body>
</html>

