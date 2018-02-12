// JavaScript Document
function del_studio(delid)
{
	var flag = confirm("确定要删除吗？");
	if (flag == true)
	{
		document.getElementById("studio-id").value = delid;
		document.getElementById("myform").action = "deletestudio";
		document.getElementById("myform").submit();
	}
	else
	{
		return;
	}
}

function update_studio(updateid)
{
	document.getElementById("studio-id").value = updateid;
	document.getElementById("myform").action = "getstudio";
	document.getElementById("myform").submit();
}

function find_studio(findid)
{
	document.getElementById("studio-id").value = findid;
	document.getElementById("myform").action = "findstudio";
	document.getElementById("myform").submit();
}

function enterSeat(studioid)
{
	document.getElementById("studio-id").value = studioid;
	document.getElementById("myform").action = "getseats";
	document.getElementById("myform").submit();
}
