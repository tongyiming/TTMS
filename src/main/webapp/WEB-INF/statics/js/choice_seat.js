// JavaScript Document

function buy(seatid, count, price)
{
	var sum = document.getElementById("sum-ticket");
	var loca = document.querySelectorAll('.loca-seat');
	var cost = document.getElementById("cost-ticket");
	loca[count].innerHTML = seatid.name;
	cost.innerHTML = (""+(price*(count+1)));
	sum.innerHTML = ""+(count+1);
	seatid.src = "/images/ok_seat.png";
	seatid.alt = "false";
}

function update(seatid, count,price)
{
	var sum = document.getElementById("sum-ticket");
	var loca = document.querySelectorAll('.loca-seat');
	var cost = document.getElementById("cost-ticket");
	//更新票上的座位
	var name = seatid.name;
	for (var i = 0; i < loca.length; i++)
	{
		if (loca[i].innerHTML == name)
			loca[i].innerHTML = "";
	}
	//更新票的张数
	var ticket_sum = sum.innerHTML - '1';
	sum.innerHTML = ticket_sum;

	//更新总价
	var num = parseInt(cost.innerHTML) - price;
	cost.innerHTML = ""+num;

	seatid.src = "/images/true_seat.png";
	seatid.alt = "true";
}
