<%@ page import="java.util.List" %>
<%@ page import="com.web.entity.Film" %>
<%@ page import="com.web.entity.Seat" %>
<%@ page import="com.web.entity.Studio" %>
<%@ page import="com.web.entity.Schedule" %>
<%--
  Created by IntelliJ IDEA.
  User: 塞上江南果
  Date: 2016/10/29
  Time: 15:28
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>森林花电影院——选座</title>
<link href="/css/bootstrap.min.css" rel="stylesheet">
<link href="/css/order.css" rel="stylesheet">
<script>

    function showOrder() {
        var message = document.querySelectorAll('.mess');
        var loca = document.querySelectorAll('.loca-seat');
        <%
           Film film = (Film) request.getAttribute("film");
           Schedule sch = (Schedule)request.getAttribute("schedule");
        %>
        var fimg = "/images/" + "<%=film.getCover()%>";
        message[0].src= fimg;
        var fname = "<%=film.getName()%>";
        message[1].innerHTML = fname;
        var flen = "<%=film.getLang()%>";
        message[2].innerHTML = flen;
        var ftype = "<%=film.getFilm_type()%>";
        message[3].innerHTML = ftype;
        message[4].innerHTML = "森林花";
        <% Studio s = (Studio) request.getAttribute("studio");%>
        var studioname = "<%=s.getName()%>";
        message[5].innerHTML = studioname;
        var time = "<%=sch.getSche_time()%>";
        message[6].innerHTML = time;
        var price = "<%=sch.getSche_ticket_price()%>";
        message[7].innerHTML = price + "";
        var j = 0;
        <%
            List seat = (List)request.getAttribute("seats");
            %>
        var len = "<%=seat.size()%>";
        <%
               for(int i=0; i<seat.size(); i++)
               {
                   Seat st = (Seat) seat .get(i);
         %>
        loca[j].innerHTML = "<%=st.getSeat_row()%>"+"行"+"<%=st.getSeat_col()%>"+"列"+"&nbsp;";
        j++;
        <%
            }
        %>
        message[8].innerHTML = len +"";
        message[9].innerHTML = len*price +"";
    }


</script>


</head>
<body onload="showOrder()">

<%@include file="nav.jsp"%>

<div>

<div class="col-md-6">
    <div style="margin:100px;">
        <h1 style="font-weight:900; color:#FC0">${inmessage}欢迎再次光临！！</h1>
    </div>
</div>


<div class="col-md-6" align="center">
    <div id="create-ticket">
        <table>
            <tr style="width:350px">
                <td>&nbsp;&nbsp;<img src="" style="width:200px; height:240px" class="mess"></td>
                <td>
                    <table style="height:200px">
                        <tr><td><font style="font-weight:900; font-size:30px" class="mess">&nbsp;&nbsp;</font></td></tr>
                        <tr><td>&nbsp;&nbsp;时长：<font  class="mess"></font></td></tr>
                        <tr><td>&nbsp;&nbsp;类型：<font class="mess"></font></td></tr>
                    </table>
                </td>
            </tr>
            <tr style="line-height:30px;"><td colspan="2">&nbsp;&nbsp;影院：<font class="mess"></font></td></tr>
            <tr style="line-height:30px"><td colspan="2" >&nbsp;&nbsp;影厅：<font class="mess"></font></td></tr>
            <tr style="line-height:30px"><td colspan="2">&nbsp;&nbsp;场次：<font class="mess"></font></td></tr>
            <tr><td style="line-height:30px;" colspan="2">&nbsp;&nbsp;座位：
                <font class="loca-seat"></font>&nbsp;
                <font class="loca-seat"></font>&nbsp;
                <font class="loca-seat"></font>&nbsp;
                <font class="loca-seat"></font></td></tr>
            <tr><td style="line-height:30px" colspan="2">&nbsp;&nbsp;票价：
                <font class="mess"></font>元/张</td></tr>
            <tr><td style="line-height:30px" colspan="2">&nbsp;&nbsp;票数：
                <font class="mess"></font></td></tr>
            <tr><td style="line-height:30px" colspan="2">&nbsp;&nbsp;总计：
                <font class="mess"></font></td></tr>
        </table>

    </div>
</div>
</div>
<footer>
    <p class="pull-right"><a href="#top">回到顶部</a></p>

    <p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&copy; 2016  &nbsp;森林花电影院 </p>
</footer>

</body>
</html>
