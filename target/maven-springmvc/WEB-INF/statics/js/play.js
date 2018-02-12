// JavaScript Document


function del_play(playid)
{
	var flag = confirm("确定要删除吗？");
	if (flag == true)
	{
		document.getElementById("play-id").value = playid;
		document.getElementById("myform").action = "/Admin/deletefilm";
		document.getElementById("myform").submit();
	}
	else
	{
		return;
	}
}

function update_play(playid)
{
	document.getElementById("play-id").value = playid;
	document.getElementById("myform").action = "/Admin/toupdate";
	document.getElementById("myform").submit();
}
function find_play(playid)
{
	document.getElementById("play-id").value = playid;
	document.getElementById("myform").action = "/Admin/getfilm";
	document.getElementById("myform").submit();
}