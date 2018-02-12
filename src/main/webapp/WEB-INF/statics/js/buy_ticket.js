// JavaScript Document

function table_plan(head_title, plan)
{
	var table = document.createElement("table");
	table.className = "table table-border table-hover";
	var thead = document.createElement("thead");
	var trhead = document.createElement("tr");
	for (var i = 0; i < head_title.length; i++)
	{
		var th = document.createElement("th");
		th.innerHTML = head_title[i];
		th.style.textAlign = "center";
		trhead.appendChild(th);
		
	}
	thead.appendChild(trhead);
	table.appendChild(thead);
	var tbody = document.createElement("tbody");
	for (var i = 0; i < 10; i++)
	{
		var tr = document.createElement("tr");
		for (var j = 0; j < plan.length; j++)
		{
			var td = document.createElement("td");
			td.style.textAlign = "center";
			if (j < plan.length - 1)
			{
				td.innerHTML = plan[j];
				if (j == 5)
				td.style.color = "red";
			}
			else
			{
				var a = document.createElement("a");
				a.className = "btn btn-primary";
				a.innerHTML = plan[j];
				td.appendChild(a);
			}
			tr.appendChild(td);
		}	
		tbody.appendChild(tr);
		table.appendChild(tbody);
	}
	return table;
}

function createPlan_today()
{
	var title = ['开始时间','结束时间','语言','版本','放映厅','票价','在线选座'];
	var plan1 = ['19:00','21:00','汉语','2D','7号厅','￥34','选座购票'];	
	var today = document.getElementById("tab-today");
	today.appendChild(table_plan(title, plan1));
}

function createPlan_tomorrow()
{
	var title = ['开始时间','结束时间','语言','版本','放映厅','票价','在线选座'];
	var plan2 = ['8:00','10:00','英语','3D','4号厅','￥4','选座购票'];	
	var tomorrow = document.getElementById("tab-tomorrow");
	tomorrow.appendChild(table_plan(title, plan2));
	
}
