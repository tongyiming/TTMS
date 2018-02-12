// JavaScript Document
function del_schedule(scheduleid)
{
	var flag = confirm("确定要删除吗？");
	if (flag == true)
	{
		document.getElementById("schedule-id").value = scheduleid;
		document.getElementById("myform").action = "deleteschedule";
		document.getElementById("myform").submit();
	}
	else
	{
		return;
	}
}
function update_schedule(scheduleid)
{
	document.getElementById("schedule-id").value = scheduleid;
	document.getElementById("myform").action = "getschedule";
	document.getElementById("myform").submit();
}

function find_schedule(scheduleid)
{
	document.getElementById("schedule-id").value = scheduleid;
	document.getElementById("myform").action = "";
	document.getElementById("myform").submit();
}
