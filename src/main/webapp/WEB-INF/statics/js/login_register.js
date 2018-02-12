// JavaScript Document
function setLoginActive()
	{
		var div_lo = document.getElementById("tab-login");
		var li_lo = document.getElementById("li-login");
		var div_re = document.getElementById("tab-register");
		var li_re = document.getElementById("li-register");	
		var uname = document.getElementById("inputname");
		var upass = document.getElementById("inputpass");
		div_re.className = "";
		li_re.className = "";
		div_re.className = "tab-pane";
		div_lo.className = "active";
		li_lo.className = "active";
		uname.className = "form-group";
		upass.className = "form-group";
	}
	
	function setRegisterActive()
	{
		var div_lo = document.getElementById("tab-login");
		var li_lo = document.getElementById("li-login");
		var div_re = document.getElementById("tab-register");
		var li_re = document.getElementById("li-register");	
		var re_name = document.getElementById("input-name");
		var re_pass = document.getElementById("input-pass");
		var re_repass = document.getElementById("input-repass");
		div_lo.className = "";
		li_lo.className = "";
		div_lo.className = "tab-pane";
		div_re.className = "active";
		li_re.className = "active";	
		re_name.className = "form-group";
		re_pass.className = "form-group";
		re_repass.className = "form-group";
	}
	
		
	function showLogin()
	{
			var login_id = document.getElementById("login-register");
			if (login_id.style.display == 'block')
				login_id.style.display = "none";
			setLoginActive();
			login_id.style.display = 'block';	
			
	}
		
	function showRegister()
	{
			var register_id = document.getElementById("login-register");
			if (register_id.style.display == 'block')
				register_id.style.display = "none";
			setRegisterActive();
			register_id.style.display = 'block';	
			
	}
	
	
	function closeTab()
	{
		var tab = document.getElementById("login-register");	
		tab.style.display = "none";
	}
	
function checkName(divid, unameid)
{
    var regtel = /^1[3-8][0-9]{9}$/;
	var regemail = /^([a-zA-Z0-9_-])+@[a-zA-Z0-9_-]+((\.[a-z]{2,3}){1,2})$/;
    var uname = document.getElementById(unameid);
	var div_name = document.getElementById(divid);
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

function checkPass(divid, upassid)
{
    var reg=/^[0-9]{4}$/;
    var pass=document.getElementById(upassid);
	var div_pass = document.getElementById(divid);
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

function checkCode(divid, codeid)
{
	var code = document.getElementById(codeid);
	var div_code = document.getElementById(divid);
	if(code.value != null && code.value.length == 4)
	{
		div_code.className = "form-group has-error";
		return false;	
	}
	else
	{
		div_code.className = "form-group has-success";
		return true;		
	}
}

function checkRepass(passid, repassid, divid)
{
	var pass1 = document.getElementById(passid);
	var pass2 = document.getElementById(repassid);
	var div_pass = document.getElementById(divid);
	if (pass1.value != "" && pass1.value === pass2.value)
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

function checkLoginAll(div_name, unameid, div_pass, upassid, div_code, codeid)
{
    if(!checkName(div_name, unameid) || !checkPass(div_pass, upassid) || !checkCode(div_code, codeid))
        return false;
    else
        return true;
}

function checkRegisterAll(div_name, unameid, div_pass, upassid, div_repass, repassid)
{
    if(!checkName(div_name, unameid) || !checkPass(div_pass, upassid) || !checkRepass(upassid, repassid, div_repass))
        return false;
    else
        return true;
}