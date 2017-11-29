function formValidate(){
	var f1=document.register.fname;
	var l1=document.register.lname;
	var add1=document.register.add;
	var gen1=document.register.gen;
	var emailid1=document.register.emailid;
	var pass1=document.register.pass;
	var cpass1=document.register.pass1;
	if(fn_val(f1))
		{
		if(ln_val(l1))
			{
			if(add_val(add1))
				{
				if(gen_val(gen1))
					{
					if(email_val(emailid1))
						{
					if(pass_val(pass1,7,12))
						{
						if(cpass_val(cpass1,pass1,7,12))
							{
							return true;
							}
						}
					}
				}
			}
		}
	}
	return false;
}


function fn_val(f1)
{
	var letter=/^[A-Za-z]+$/;
	if(f1.value.match(letter))
		{
		return true;
		}
	else
		{
		alert("First Name must be Alphabetic");
		f1.focus();
		return false;
		}
}

function ln_val(l1)
{
	var letter=/^[A-Za-z]+$/;
	if(l1.value.match(letter))
		{
		return true;
		}
	else
		{
		alert("Last Name must be Alphabetic");
		l1.focus();
		return false;
		}
}

function add_val(add1)
{
	var letter=/^[A-Za-z0-9_\.\,\-\&\/\ ]+$/;
	if(add1.value.match(letter))
		{
		return true;
		}
	else
		{
		alert("Please Enter Valid Address");
		add1.focus();
		return false;
		}
}

function gen_val(gen1)
{
	if(gen1.value=="default")
		{
		alert("Please Select gender from list");
		gen1.focus();
		return false;
		}
	else
		{
		return true;
		}
}


function email_val(emailid1)
{
	var letter=/^(\w+\[\.-]?\w+)*@(\w+\[\.-]?\w+)*(\.\w{2,3})+$/;
	var l1=/^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/;
	var l2 = /^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/;
	if(emailid1.value.match(l2))
		{
		return true;
		}
	else
		{
		alert("Please Enter valid Email ID");
		emailid1.focus();
		return false;
		}
}

function pass_val(pass1,min,max)
{
	var pass_len=pass1.value.length;
	if(pass_len>=min && pass_len<=max)
		{
		return true;
		}
	else
		{
		alert("Password length must be b/w "+min+" to "+max); 
		pass1.focus();
		return false;
		}
}
 
function cpass_val(cpass1,pass1,min,max)
{
	var pass_len=cpass1.value.length;
	if(pass_len>=min && pass_len<=max)
		{
		if(pass1.value==cpass1.value)
			{
		return true;
		}
		}
	else
		{
		alert("Password must be same"); 
		cpass1.focus();
		return false;
		}
}