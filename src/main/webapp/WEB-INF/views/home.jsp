<%@ page import="java.util.List" %>
<%@ page import="com.web.entity.Film" %>
<%@ page import="com.web.entity.User" %>
<%--
  Created by IntelliJ IDEA.
  User: 塞上江南果
  Date: 2016/10/27
  Time: 10:39
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="zh-cn">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>森林花电影院</title>
    <link href="/css/bootstrap.min.css" rel="stylesheet">
    <link href="/css/home.css" rel="stylesheet">

    <style>

    </style>

    <!--[if lt IE 9]>
    <script src="/js/html5shiv.js"></script>
    <script src="/js/respond.min.js"></script>
    <![endif]-->

    <script>
        function getXmlHttpRequest(){
            var xhr = null;
            if((typeof XMLHttpRequest)!='undefined'){
                xhr = new XMLHttpRequest();
            }else {
                xhr = new ActiveXObject('Microsoft.XMLHttp');
            }
            return xhr;
        }
        function change(thenstart){
            var xhr = getXmlHttpRequest();
            xhr.open('post','/Home/then',true);
            xhr.setRequestHeader("Content-Type",
                    "application/x-www-form-urlencoded");
            xhr.onreadystatechange=function () {

                if(xhr.readyState == 4){
                    var str = xhr.responseText;
                    var film = JSON.parse(str);
                    var then = document.getElementById("play-next");
                    then.innerHTML = "";
                    for(var i=0;i<film.length;i++){
                        var name = film[i].name;
                        var length = film[i].length;
                        var type = film[i].film_type;
                        var image_local = "/images/" + film[i].cover;
                        var id = film[i].id;

                        var td_div = document.createElement("div");
                        td_div.className = "col-md-3";
                        var img = document.createElement("img");
                        img.src = image_local;
                        img.style.cursor = "pointer";
                        img.style.width = "200px";
                        img.style.height = "230px";
                        var a_img = document.createElement("a");
                        a_img.appendChild(img);
                        var h = document.createElement("h2");
                        h.innerHTML = name;
                        var p= document.createElement("p");
                        p.innerHTML = length +"&nbsp;&nbsp;"+type;
                        var a = document.createElement("a");
                        a.className = "btn btn-primary";
                        a.innerHTML = "选座购票";
                        a.setAttribute("name",id);
                        a.onclick = function () {
                            var formid = document.getElementById("myform");
                            formid.action = "";
                            var inputid = document.getElementById("then_input");
                            inputid.value = this.name;
                            formid.submit();
                        }
                        td_div.appendChild(a_img);
                        td_div.appendChild(h);
                        td_div.appendChild(p);
                        td_div.appendChild(a);
                        td_div.style.height = "400px";
                        td_div.style.textAlign = "center";

                        then.appendChild(td_div);
                    }

                }
            };
            xhr.send('thenstart=' + thenstart);
        }

        function change_now(nowstart){
            var xhr = getXmlHttpRequest();
            xhr.open('post','/Home/now',true);
            xhr.setRequestHeader("Content-Type",
                    "application/x-www-form-urlencoded");
            xhr.onreadystatechange=function () {

                if(xhr.readyState == 4){
                    var str = xhr.responseText;
                    var film = JSON.parse(str);
                    var now = document.getElementById("play-now");
                    now.innerHTML = "";
                    for(var i=0;i<film.length;i++){
                        var name = film[i].name;
                        var length = film[i].length;
                        var type = film[i].film_type;
                        var image_local = "/images/" + film[i].cover;
                        var id = film[i].id;

                        var td_div = document.createElement("div");
                        td_div.className = "col-md-3";
                        var img = document.createElement("img");
                        img.src = image_local;
                        img.style.cursor = "pointer";
                        img.style.width = "200px";
                        img.style.height = "230px";
                        var a_img = document.createElement("a");
                        a_img.appendChild(img);
                        var h = document.createElement("h2");
                        h.innerHTML = name;
                        var p= document.createElement("p");
                        p.innerHTML = length +"&nbsp;&nbsp;"+type;
                        var a = document.createElement("a");
                        a.className = "btn btn-primary";
                        a.innerHTML = "选座购票";
                        a.setAttribute("name",id);
                        a.onclick = function () {
                            var formid = document.getElementById("myform");
                            formid.action = "";
                            var inputid = document.getElementById("then_input");
                            inputid.value = this.name;
                            formid.submit();
                        }
                        td_div.appendChild(a_img);
                        td_div.appendChild(h);
                        td_div.appendChild(p);
                        td_div.appendChild(a);
                        td_div.style.height = "400px";
                        td_div.style.textAlign = "center";

                        now.appendChild(td_div);
                    }

                }
            };
            xhr.send('nowstart=' + nowstart);
        }

        <%
        String mess=request.getParameter("error");
        if(mess!=null)
        {
        mess = new String(mess.getBytes("iso-8859-1"), "utf-8");
        request.setAttribute("mess", mess);
        }
        %>

        function loading() {
            var error = '<%=mess%>';
            if(${empty user})
                showLogin();
        }


       var count = 0;
        function createImg()
        {
            var oltag = document.getElementById("dian");
            var divtag = document.getElementById("change");
            <%
                List film_img = (List)request.getAttribute("now_film");
                for(int i=0; i<film_img.size(); i++)
                {
                    Film f = (Film)film_img.get(i);
            %>
            var image_local = "/images/" + "<%=f.getCover()%>";
                if (count == 0)
                {
                    document.getElementById("one").src = image_local;
                    count++;
                }
                else
                {
                    var li = document.createElement("li");
                    li.setAttribute("data-target", "#ad-carousel");
                    li.setAttribute("data-slide-to",""+(count));
                    oltag.appendChild(li);
                    count++;

                    var div = document.createElement("div");
                    div.className = "item";
                    var a = document.createElement("a");
                    var img = document.createElement("img");
                    img.src = image_local;
                    a.appendChild(img);
                    div.appendChild(a);
                    divtag.appendChild(div);
                }
            <%
            }
            %>
        }

        function setPlay_now() {

            var now = document.getElementById("play-now");
            <%
                List now_film = (List)request.getAttribute("now_film");
                for(int i=0; i<now_film.size(); i++)
                {
                    Film film = (Film)now_film.get(i);
            %>
            var name = "<%=film.getName()%>";
            var length = "<%=film.getLength()%>";
            var type = "<%=film.getFilm_type()%>";
            var image_local = "/images/" + "<%=film.getCover()%>";
            var id = "<%=film.getId()%>";

            var td_div = document.createElement("div");
            td_div.className = "col-md-3";
            var img = document.createElement("img");
            img.src = image_local;
            img.style.cursor = "pointer";
            img.style.width = "200px";
            img.style.height = "230px";
            var a_img = document.createElement("a");
            a_img.appendChild(img);
            var h = document.createElement("h2");
            h.innerHTML = name;
            var p= document.createElement("p");
            p.innerHTML = length +"&nbsp;&nbsp;"+type;
            var a = document.createElement("a");
            a.className = "btn btn-primary";
            a.innerHTML = "选座购票";
            a.setAttribute("name",id);
            a.onclick = function () {
                var formid = document.getElementById("myform");
                formid.action = "/Home/showfilm";
                var inputid = document.getElementById("now_input");
                inputid.value = this.name;
                formid.submit();
            };
            td_div.appendChild(a_img);
            td_div.appendChild(h);
            td_div.appendChild(p);
            td_div.appendChild(a);
            td_div.style.height = "400px";
            td_div.style.textAlign = "center";

            now.appendChild(td_div);

            <%
                }
            %>

        }



    $(function ()
    {
        $('#ad-carousel').carousel();

    });

        function replace()
        {
            var codeid = document.getElementById("codepic");
            codeid.src = '/code?'+Math.random();
        }

        function setPicture()
        {
            if (!${empty user})
            {
                document.getElementById("login").style.display = "none";
                document.getElementById("register").style.display = "none";
                document.getElementById("pic").style.display = "block";
                document.getElementById("username").style.display = "block";
            }
            else
            {
                document.getElementById("login").style.display = "block";
                document.getElementById("register").style.display = "block";
                document.getElementById("pic").style.display = "none";
                document.getElementById("username").style.display = "none";
            }
        }

    </script>


</head>

<body onLoad="loading();setPicture();createImg();setPlay_now();">

<!-- 顶部导航 -->
<div class="navbar navbar-inverse navbar-fixed-top" role="navigation" id="menu-nav">
    <div class="container">
        <div class="navbar-header">
            <a class="navbar-brand" href="#">森林花影院</a>
        </div>
        <div class="navbar-collapse collapse">
            <ul class="nav navbar-nav">
                <li class="active"><a href="#">首页</a></li>
                <li><a href="#">简述</a></li>
                <li><a href="#" data-toggle="modal" data-target="#about-modal">关于</a></li>
            </ul>
            <ul class="nav navbar-nav" style="margin-left:650px;">
                <li id="login"><a href="#" onClick="showLogin()">登录</a></li>
                <li id="register"><a href="#" onClick="showRegister()">注册</a></li>
                <li style="display:none" id="pic"><a href="gethome"><img src="/${user.picture}" class="img-circle size" style="width:40px; height:40px;margin-top:-10px"></a></li>
                <li style="display:none" id="username"><a href="gethome">${user.username}</a></li>
            </ul>
        </div>
    </div>
</div>



<!-- 广告轮播 -->
<div id="ad-carousel" class="carousel slide" data-ride="carousel">
    <ol class="carousel-indicators" id="dian">
        <li data-target="#ad-carousel" data-slide-to="0" class="active"></li>
    </ol>
    <div class="carousel-inner" id="change">
        <div class="item active">
            <a href="#"><img src="#" id="one"></a>
        </div>
    </div>
    <a class="left carousel-control" href="#ad-carousel" data-slide="prev">
        <span class="glyphicon glyphicon-chevron-left"></span></a>
    <a class="right carousel-control" href="#ad-carousel" data-slide="next">
        <span class="glyphicon glyphicon-chevron-right"></span></a>
</div>


<!--选项卡登录和注册-->
<div id="login-register">
    <ul class="nav nav-tabs" role="tablist">
        <li id="li-login" onClick="setLoginActive()"><a href="#tab-login" role="tab"  data-toggle="tab">登录</a></li>
        <li id="li-register" onClick="setRegisterActive()"><a href="#tab-register" role="tab"  data-toggle="tab">注册</a></li>
        <button onClick="closeTab()" id="btn-close">X</button>
    </ul>

    <div class="tab-content">
        <br>
        <div class="tab-pane" id="tab-login">
            <div class="row feature">
                <br>
                <form class="form-horizontal" role="form" action="/Home/login" method="post" onsubmit="return checkAll()">
                    <div class="form-group" id="inputname">
                        <label for="login-uname" class="col-sm-3 control-label">帐号:</label>
                        <div class="col-sm-9">
                            <input type="text" class="form-control" id="login-uname" name="uname"
                                   placeholder="请输入电子邮箱地址/手机号" autofocus onBlur="checkName('inputname','login-uname')">
                        </div>
                    </div>
                    <div class="form-group" id="inputpass">
                        <label for="login-pass" class="col-sm-3 control-label">密码:</label>
                        <div class="col-sm-9">
                            <input type="password" class="form-control" id="login-pass" name="pwd"
                                   placeholder="请输入您的帐号密码" onBlur="checkPass('inputpass','login-pass')">
                        </div>
                    </div>
                    <div class="form-group" id="inputcode">
                        <label for="login-pass" class="col-sm-3 control-label">验证码:</label>
                        <div class="col-sm-4">
                            <input type="type" class="form-control" id="login-code" name="vcode"
                                   placeholder="输入验证码" onBlur="checkPass('inputcode','login-code')">
                        </div>
                        <a class="btn btn-link btn-sm" onclick="replace()">看不清，换一张</a>
                        <img src="/code" style="width:50px; height:30px" id="codepic">
                        <label style="color: #0033FF">${mess}</label>
                    </div>
                    <div class="form-group">
                        <div class="col-sm-offset-3 col-sm-6">
                            <a href="#"><button type="submit" class="btn btn-primary" >登录</button></a>
                        </div>
                    </div>
                </form>
            </div>
        </div>
        <div class="tab-pane" id="tab-register">
            <div class="row feature">
                <br>
                <form class="form-horizontal" role="form" method="post" action="/Home/insertuser">
                    <div class="form-group" id="input-name">
                        <label for="register-name" class="col-sm-3 control-label">帐号:</label>
                        <div class="col-sm-9">
                            <input type="text" class="form-control" placeholder="请输入电子邮箱地址/手机号"
                                   id="register-name" name="username" onblur="check()"  required autofocus/>
                        </div>
                    </div>
                    <div class="form-group" id="input-pass">
                        <label for="register-pass" class="col-sm-3 control-label">密码:</label>
                        <div class="col-sm-9">
                            <input type="password" class="form-control" id="register-pass" name="pass"
                                   placeholder="请输入您的帐号密码" onBlur="checkPass('input-pass','register-pass')">
                        </div>
                    </div>
                    <div class="form-group" id="input-repass">
                        <label for="register-repass" class="col-sm-3 control-label">密码:</label>
                        <div class="col-sm-9">
                            <input type="password" class="form-control" id="register-repass" name="repass"
                                   placeholder="请再输一次密码，确认是否正确" onBlur="checkRepass('register-pass','register-repass','input-repass')">
                        </div>
                    </div>
                    <label class="control-label"><div id="flag" style="color:red"></div></label>
                    <div class="form-group">
                        <div class="col-sm-offset-3 col-sm-6">
                            <a href="#"><button type="submit" class="btn btn-primary" onclick="return checkLoginAll('input-name','register-uname','input-pass','register-pass','input-repass','register-repass')">注册</button></a>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>


<!--选项卡正在热映和即将上映-->
<ul class="nav nav-tabs" role="tablist">
    <li class="active" style="margin-left:43%"><a href="#tab-now" role="tab"  data-toggle="tab">正在热映</a></li>
    <li><a href="#tab-next" role="tab"  data-toggle="tab" onclick="change(1)">即将上映</a></li>
</ul>

<div class="tab-content">
    <div class="tab-pane active" id="tab-now">
        <br><br>
        <div class="content">
            <div class="row" id="play-now">

            </div>
            <!-- 分页 -->
            <div class="text-center">
                <nav>
                    <ul class="pagination">
                        <li><a href="javascript:;" onclick=choose_now(this)>首页</a></li>
                        <li><a href="javascript:;" onclick=choose_now(this)>上一页</a></li>
                        <li><a href="javascript:;" onclick=choose_now(this)>下一页</a></li>
                        <li><a href="javascript:;" onclick=choose_now(this)>末页</a></li>
                    </ul>
                </nav>
            </div>
        </div>
    </div>

    <div class="tab-pane" id="tab-next">
        <br><br>
        <div class="row" id="play-next">

        </div>
        <!-- 分页 -->
        <div class="text-center">
            <nav>
                <ul class="pagination">
                    <li><a href="javascript:;" onclick=choose(this)>首页</a></li>
                    <li><a href="javascript:;" onclick=choose(this)>上一页</a></li>
                    <li><a href="javascript:;" onclick=choose(this)>下一页</a></li>
                    <li><a href="javascript:;" onclick=choose(this)>末页</a></li>
                </ul>
            </nav>
        </div>
    </div>
</div>


<form action="" method="post" id="myform">
    <input type="hidden" name="now_id" id="now_input">
    <input type="hidden" name="then_id" id="then_input">
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

    function check() {
        //alert("开始检查用户名是否存在.....!");
        var url = "/Home/register?username="
                + document.getElementById("register-name").value;
        if (window.XMLHttpRequest)
            req = new XMLHttpRequest();
        else if (window.ActiveXObject)
            req = new ActiveXObject("Microsoft.XMLHTTP");
        if (req) {
            req.open("get", url, true);
            //get方式可不加如下语句
            req.setRequestHeader("Content-Type","application/x-www-form-urlencoded");
            req.onreadystatechange = complete;
            req.send(null);
            document.getElementById("flag").innerText = "请稍后，正在检查用户名!";
        }
    }

    /*分析返回的XML文档*/
    function complete() {
        if (req.readyState == 4) {
            if (req.status == 200) {
                var result = req.responseText;
                if (result == "yes")
                    infoStr = "用户名没有人用，请继续!";
                else
                    infoStr = "用户名已经有人用了，请换个名字!";
                document.getElementById("flag").innerText = infoStr;
            }
        }
    }

    function isUser()
    {
        var storage = window.localStorage;
        var user = storage.getItem("user");
        if (user != undefined)
        {
            var jsonObj = JSON.parse(user);
            document.getElementById("login-uname").value = jsonObj.name;
            document.getElementById("login-pass").value = jsonObj.password;
        }
    }


    function checkAll()
    {
        var storage = window.localStorage;
        var user = storage.getItem("user");
        if (user == undefined)
        {
            var name = document.getElementById("login-uname").value;
            var password = document.getElementById("login-pass").value;
            var jsonObj = {name:name,password:password};
            var data = JSON.stringify(jsonObj);
            storage.setItem("user",data);
            alert(data);
        }
        else
            return;
    }
    var thenpage = 1;
    function choose(thisid)
    {
        if (thisid.innerHTML == "首页") {
            thenpage = 1;
        }
        else if (thisid.innerHTML == "上一页" && thenpage >= 1) {
            if (thenpage > 1)
                thenpage = thenpage - 1;
            else
                thenpage = 1;
        }
        else if (thisid.innerHTML == "下一页" && thenpage <= ${thenmax_page})
        {
            if (thenpage < ${thenmax_page})
                thenpage = thenpage + 1;
            else
                thenpage = ${thenmax_page};
        }

        else
        {
            thenpage = ${thenmax_page};
        }
        change(thenpage);

    }

    var nowpage = 1;
    function choose_now(thisid)
    {
        if (thisid.innerHTML == "首页") {
            nowpage = 1;
        }
        else if (thisid.innerHTML == "上一页" && nowpage >= 1) {
            if (nowpage > 1)
                nowpage = nowpage - 1;
            else
                nowpage = 1;
        }
        else if (thisid.innerHTML == "下一页" && nowpage <= ${nowmax_page})
        {
            if (nowpage < ${nowmax_page})
                nowpage = nowpage + 1;
            else
                nowpage = ${nowmax_page};
        }

        else
        {
            nowpage = ${nowmax_page};
        }
        change_now(nowpage);

    }
    isUser();
</script>

</body>
</html>

