/**
 *  myMenu.js
 */

function myMenu(status)
{
	var menu = document.getElementById("menuTable");
	
	if (status==1)
	{
		menu.style.display = "block";
		// block 으로 하면 블럭 단위로 그리는 것
		// inline 으로 하면 라인 단위로 그리는 것 
	}
	else
	{
		menu.style.display = "none";
	}
}

/*
function myMenu1()
{
	
}

function myMenu2()
{
	
}
*/
