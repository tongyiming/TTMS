// JavaScript Document
function checkName()
{
    var regtel = /^1[3-8][0-9]{9}$/;
	var regemail = /^([a-zA-Z0-9_-])+@[a-zA-Z0-9_-]+((\.[a-z]{2,3}){1,2})$/;
    var uname = document.getElementById("name");
	var div_name = document.getElementById("input-name");
    if(regtel.test(uname.value) || regemail.test(uname.value))
    {
		div_name.className = "form-group has-success";
        return true;
    }
    else
    {
        div_name.className = "form-group has-error";
        return false;
    }
}

function checkPass()
{
    var reg=/^[0-9]{4}$/;
    var pass=document.getElementById("pass");
	var div_pass = document.getElementById("input-pass");
    if(reg.test(pass.value))
    {
		div_pass.className = "form-group has-success";
        return true;
    }
    else
    {
       	div_pass.className = "form-group has-error";
        return false;
    }
}

function checkCode()
{
	var code = document.getElementById("code");
	var div_code = document.getElementById("input-code");
	if (code.value != "" && code.length == 4)
	{
		div_code.className = "form-group has-success";
		return true;
	}	
	else
	{
		div_code.className = "form-group has-error";
		return false;
	}
}

function checkAll()
{
    if(!checkName() || !checkPass() || !checkCode())
        return false;
    else
        return true;
}
