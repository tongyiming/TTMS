var seat = [];
var all1 = [];
var all2 = [];

function setClick()
{
    traver();
    move();
    var seatclick = document.querySelectorAll('.imgseat');
    for (var i = 0; i < seatclick.length; i++)
    {
        seatclick[i].onclick = function()
        {
            if (this.alt == "true")
            {
                var s = {seatid:this.id,status:2};
                seat.push(s);
                this.src = "/images/false_seat.jpg";
                this.setAttribute("alt","false");
            }
            else {
                var s = {seatid:this.id,status:1};
                seat.push(s);
                this.src = "/images/true_seat.png";
                this.setAttribute("alt","true");
            }
        }
    }
}

function move()
{
    setInterval(ok,200);
}

function traver()
{
    var seatclick = document.querySelectorAll('.imgseat');
    for (var i = 0; i < seatclick.length; i++)
    {
        all1[i] = seatclick[i].offsetLeft;
        all2[i] = seatclick[i].offsetTop;
    }
}

function ok()
{
    var seatclick = document.querySelectorAll('.imgseat');
    for (var i = 0; i < seatclick.length; i++)
    {
        shake(seatclick[i],all1[i],all2[i]);
    }
}

function shake(selfid,x,y)
{
    var offx; //水平偏移量
    var offy; //垂直偏移量
    var dir; //控制震动方向
    dir = Math.random()*10 > 5 ? 1 : -1; //获得震动方向
    offx = Math.random()*5*dir;
    offy = Math.random()*5*dir;
    selfid.style.marginTop = x+offy+"px";
    selfid.style.marginLeft = y+offx+"px";
}

function submitSeat()
{
    var data =JSON.stringify(seat);
    document.getElementById("seat").value = data;
}
