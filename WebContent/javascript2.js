/**
 * 
 */
function addstoppage() {
	// alert("theek");
	// alert(a+b+c+d+e+f);
	var url = "addstoppage.jsp";

	if (window.XMLHttpRequest) {
		request = new XMLHttpRequest();
	} else if (window.ActiveXObject) {
		request = new ActiveXObject("Microsoft.XMLHTTP");
	}

	try {
		request.onreadystatechange = function() {
			if (request.readyState == 4) {
				var val = request.responseText;
				document.getElementById('id4').innerHTML = val;
				// document.getElementById('msg1').innerHTML = "";
			}
		}// end of function
		request.open("GET", url, true);
		request.send();
	} catch (e) {
		alert("Unable to connect to server");
	}
}

function addstoppageprocess() {
	// alert("theek");
	// alert(a+b+c+d+e+f);
	var stop_id = document.getElementById("stop_id").value;
	var stop_name = document.getElementById("stop_name").value;
	if (stop_id == "") {
		alert("Please Enter Stop Id.")
	} else if (stop_name == "") {
		alert("Please Enter Stop Name.")
	} else {
		var url = "addstoppageprocess.jsp?stop_id=" + stop_id + "&stop_name="
				+ stop_name;
		// alert(stop_id+""+stop_name);
		if (window.XMLHttpRequest) {
			request = new XMLHttpRequest();
		} else if (window.ActiveXObject) {
			request = new ActiveXObject("Microsoft.XMLHTTP");
		}

		try {
			request.onreadystatechange = function() {
				if (request.readyState == 4) {
					var val = request.responseText;
					document.getElementById('msg1').innerHTML = val;
					// document.getElementById('msg1').innerHTML = "";
				}
			}// end of function
			request.open("GET", url, true);
			request.send();
		} catch (e) {
			alert("Unable to connect to server");
		}
	}
}

function viewstoppage() {
	// alert("theek");
	// alert(a+b+c+d+e+f);
	var url = "viewstoppage.jsp";

	if (window.XMLHttpRequest) {
		request = new XMLHttpRequest();
	} else if (window.ActiveXObject) {
		request = new ActiveXObject("Microsoft.XMLHTTP");
	}

	try {
		request.onreadystatechange = function() {
			if (request.readyState == 4) {
				var val = request.responseText;
				document.getElementById('id4').innerHTML = val;
				// document.getElementById('msg1').innerHTML = "";
			}
		}// end of function
		request.open("GET", url, true);
		request.send();
	} catch (e) {
		alert("Unable to connect to server");
	}
}

function addbus() {
	// alert("theek");
	// alert(a+b+c+d+e+f);
	var url = "addbus.jsp";

	if (window.XMLHttpRequest) {
		request = new XMLHttpRequest();
	} else if (window.ActiveXObject) {
		request = new ActiveXObject("Microsoft.XMLHTTP");
	}

	try {
		request.onreadystatechange = function() {
			if (request.readyState == 4) {
				var val = request.responseText;
				document.getElementById('id4').innerHTML = val;
				// document.getElementById('msg1').innerHTML = "";
			}
		}// end of function
		request.open("GET", url, true);
		request.send();
	} catch (e) {
		alert("Unable to connect to server");
	}
}

function addbusprocess() {
	// alert(a+b+c+d+e+f);
	var bus_id = document.getElementById("bus_id").value;
	var bus_name = document.getElementById("bus_name").value;
	var bus_type = document.getElementById("bus_type").value;
	var seat = document.getElementById("seat").value;
	var s_stop = document.getElementById("s_stop").value;
	var d_stop = document.getElementById("d_stop").value;
	var mon = null, tue = null, wed = null, thu = null, fri = null, sat = null, sun = null;
	if (document.getElementById("t6").checked == true) {
		mon = "mon";
	}
	if (document.getElementById("t7").checked == true) {
		tue = "tue";
	}
	if (document.getElementById("t8").checked == true) {
		wed = "wed";
	}
	if (document.getElementById("t9").checked == true) {
		thu = "thu";
	}
	if (document.getElementById("t10").checked == true) {
		fri = "fri";
	}
	if (document.getElementById("t11").checked == true) {
		sat = "sat";
	}
	if (document.getElementById("t12").checked == true) {
		sun = "sun";
	}
	var b_time = document.getElementById("b_time").value;
	var d_time = document.getElementById("d_time").value;
	var fare = document.getElementById("fare").value;
	var state = document.getElementById("state").value;
	if (bus_id == "") {
		alert("Please Enter Bus Number.");
	} else if (isNaN(bus_id)) {
		alert("Bus Number Must Be In Number.");

	} else if (bus_name == "") {
		alert("Please Enter Bus Name");

	} else if (bus_type == "null") {
		alert("Please Select Bus Type");
	} else if (seat == "null") {
		alert("Please Select Seat.");
	} else if (isNaN(seat)) {
		alert("Seat must be in number");

	} else if (s_stop == "null") {
		alert("Please Select Source Stoppage.");
	} else if (d_stop == "null") {
		alert("Please Select Destination Stoppage.");
	} else if (document.getElementById("t6").checked == false
			&& document.getElementById("t7").checked == false
			&& document.getElementById("t8").checked == false
			&& document.getElementById("t9").checked == false
			&& document.getElementById("t10").checked == false
			&& document.getElementById("t11").checked == false
			&& document.getElementById("t12").checked == false) {
		alert("Please Choose Avl.Day.");
	} else if (b_time == "") {
		alert("Please Enter Bording Time.");

	} else if (d_time == "") {
		alert("Please Enter Droping Time.");

	} else if (fare == "") {
		alert("Please Enter Fare.");

	} else if (isNaN(fare)) {
		alert("Fare Must Be In Number.");

	} else if (state == "null") {
		alert("Please Select States.");

	} else {
		var url = "addbusprocess.jsp?bus_id=" + bus_id + "&bus_name="
				+ bus_name + "&bus_type=" + bus_type + "&seat=" + seat
				+ "&s_stop=" + s_stop + "&d_stop=" + d_stop + "&mon=" + mon
				+ "&tue=" + tue + "&wed=" + wed + "&thu=" + thu + "&fri=" + fri
				+ "&sat=" + sat + "&sun=" + sun + "&b_time=" + b_time
				+ "&d_time=" + d_time + "&fare=" + fare + "&state=" + state;

		if (window.XMLHttpRequest) {
			request = new XMLHttpRequest();
		} else if (window.ActiveXObject) {
			request = new ActiveXObject("Microsoft.XMLHTTP");
		}

		try {
			request.onreadystatechange = function() {
				if (request.readyState == 4) {
					var val = request.responseText;
					document.getElementById('msg1').innerHTML = val;
					// document.getElementById('msg1').innerHTML = "";
				}
			}// end of function
			request.open("GET", url, true);
			request.send();
		} catch (e) {
			alert("Unable to connect to server");
		}
	}
}

function s_stoppage() {
	// alert("theek");
	// alert(a+b+c+d+e+f);
	var s_stop = document.getElementById("s_stop").value;
	var f = "s";
	var url = "findstoppage.jsp?s_stop=" + s_stop + "&f=" + f;

	if (window.XMLHttpRequest) {
		request = new XMLHttpRequest();
	} else if (window.ActiveXObject) {
		request = new ActiveXObject("Microsoft.XMLHTTP");
	}

	try {
		request.onreadystatechange = function() {
			if (request.readyState == 4) {
				var val = request.responseText;
				document.getElementById('s_stop_content').innerHTML = val;
				// document.getElementById('msg1').innerHTML = "";
			}
		}// end of function
		request.open("GET", url, true);
		request.send();
	} catch (e) {
		alert("Unable to connect to server");
	}
}

function d_stoppage() {
	// alert("theek");
	// alert(a+b+c+d+e+f);
	var s_stop = document.getElementById("d_stop").value;
	var f = "d";
	var url = "findstoppage.jsp?s_stop=" + s_stop + "&f=" + f;

	if (window.XMLHttpRequest) {
		request = new XMLHttpRequest();
	} else if (window.ActiveXObject) {
		request = new ActiveXObject("Microsoft.XMLHTTP");
	}

	try {
		request.onreadystatechange = function() {
			if (request.readyState == 4) {
				var val = request.responseText;
				document.getElementById('d_stop_content').innerHTML = val;
				// document.getElementById('msg1').innerHTML = "";
			}
		}// end of function
		request.open("GET", url, true);
		request.send();
	} catch (e) {
		alert("Unable to connect to server");
	}
}

function intervalue1(s_stop, f,value) {

	// alert(a+b+c+d+e+f);
	// var s_stop=document.getElementById("s").value;
	if (f == "s") {
		document.getElementById("s_stop").value =s_stop+"-"+ value;
	} else if (f == "d") {
		document.getElementById("d_stop").value = s_stop+"-"+ value;

	}
}

function change() {
	// alert("rf");
	var s_stop = document.getElementById("s_stop").value;
	var d_stop = document.getElementById("d_stop").value;
	if (s_stop == "" || d_stop == "") {

	} else {
		document.getElementById("s_stop").value = d_stop;
		document.getElementById("d_stop").value = s_stop;
	}

}

function searchbuses() {
	// alert("theek");
	// alert(a+b+c+d+e+f);
	var s_stop = document.getElementById("s_stop").value;
	var d_stop = document.getElementById("d_stop").value;
	var date = document.getElementById("txtdate").value;
	var d=new Date(date);
	var weekday=new Array(7)
	weekday[0]="sun";	
	weekday[1]="mon";			
	weekday[2]="tue";			
	weekday[3]="wed";			
	weekday[4]="thu";			
	weekday[5]="fri";
	weekday[6]="sat";	
	var d1=weekday[d.getDay()];
	if (s_stop == "") {
		alert("Please Enter Source Stoppage.");
	} else if (d_stop == "") {
		alert("Please Enter Destination Stoppage.");
	} else if (date == "") {
		alert("Please Select date.");
	} else {
		var url = "searchbusesprocess.jsp?s_stop=" + s_stop + "&d_stop="
				+ d_stop + "&date=" + date+"&day="+d1;

		if (window.XMLHttpRequest) {
			request = new XMLHttpRequest();
		} else if (window.ActiveXObject) {
			request = new ActiveXObject("Microsoft.XMLHTTP");
		}

		try {
			request.onreadystatechange = function() {
				if (request.readyState == 4) {
					var val = request.responseText;
					document.getElementById('udiv2').innerHTML = val;
					// document.getElementById('msg1').innerHTML = "";
				}
			}// end of function
			request.open("GET", url, true);
			request.send();
		} catch (e) {
			alert("Unable to connect to server");
		}
	}
}

function viewbusseats(bus_id,date) {
	//alert("theek"+bus_id+""+date);
	// alert(a+b+c+d+e+f);
	var url = "viewbusseats.jsp?bus_id="+bus_id+"&date="+date;

	if (window.XMLHttpRequest) {
		request = new XMLHttpRequest();
	} else if (window.ActiveXObject) {
		request = new ActiveXObject("Microsoft.XMLHTTP");
	}

	try {
		request.onreadystatechange = function() {
			if (request.readyState == 4) {
				var val = request.responseText;
				document.getElementById('udiv2').innerHTML = val;
				// document.getElementById('msg1').innerHTML = "";
			}
		}// end of function
		request.open("GET", url, true);
		request.send();
	} catch (e) {
		alert("Unable to connect to server");
	}
}

function selectseat(l,f) {
	var totat_s=0,i,total_f=0,j,seats,seats1,len=0;
	seats=document.getElementById("tns").value;
	seats1=seats.split(",");
	len=seats1.length;
	i=document.getElementById("ts").value;
	totat_s=parseInt(i);
	total_f=parseInt(document.getElementById("tf").value);
	if(document.getElementById("tns").value==""){
		totat_s=totat_s+1;
		total_f=total_f+parseInt(f);
		document.getElementById("ts").value=totat_s;
		seats=l;
		document.getElementById("tns").value=seats;
		document.getElementById("tf").value=total_f;
		document.getElementById(l).style.color="#FF6347";
	}else{
		var k,sss=0;
		for(k=0;k<len;k++){
			if(seats1[k]==l){
				sss=1;
				break;
			}
		}
		if(sss==1){
			total_f=total_f-parseInt(f);
			totat_s=totat_s-1;
			document.getElementById("ts").value=totat_s;
			document.getElementById("tf").value=total_f;
			if(len==1){
				seats="";
				document.getElementById("tns").value="";
			}else{
				var m;
				seats="";
				for(m=0;m<len;m++){
					//alert("ok"+"-"+k+"-"+m);
					if(k!=m){
						//alert("ok1");
						if(m==0 ){
							
							seats=seats1[m];
							//alert("ok2"+" "+seats);
						}else{
							//alert("ok3");
							if(k==0 && m==1){
								seats=seats1[m];
							}else {
								seats=seats+","+seats1[m];
							}
							
							//alert("ok2"+" "+seats);
						}
					}
				}
				document.getElementById("tns").value=seats;
			}
			document.getElementById(l).style.color="green";
		}else{
			if(totat_s<=3){
				totat_s=totat_s+1;
				total_f=total_f+parseInt(f);
				document.getElementById("ts").value=totat_s;
				seats=document.getElementById("tns").value+","+l;
				document.getElementById("tns").value=seats
				document.getElementById("tf").value=total_f;
				document.getElementById(l).style.color="#FF6347";
				
			}else{
				alert("You Are Already Selected Maximum Number Of Seat 4.");
			}
		}
	}	
}


function passengerdetails(bus_id,date) {
	var ts=document.getElementById("ts").value;
	var tns=document.getElementById("tns").value;
	var i=0;
	i=parseInt(ts);
	if(i<1){
		alert("Please Select Seats.");
	}else{
		//alert("theek"+bus_id+" "+date+" "+ts+" "+tns);
		//alert("iry");
		var url = "passengerdetails.jsp?bus_id="+bus_id+"&date="+date+"&ts="+ts+"&tns="+tns;

		if (window.XMLHttpRequest) {
			request = new XMLHttpRequest();
		} else if (window.ActiveXObject) {
			request = new ActiveXObject("Microsoft.XMLHTTP");
		}

		try {
			request.onreadystatechange = function() {
				if (request.readyState == 4) {
					var val = request.responseText;
					document.getElementById('udiv2').innerHTML = val;
					// document.getElementById('msg1').innerHTML = "";
				}
			}// end of function
			request.open("GET", url, true);
			request.send();
		} catch (e) {
			alert("Unable to connect to server");
		
	}
	}
}
function ticketbooking(ts,tns,bus_id,date) {
	var i=0;
	i=parseInt(ts);
	var str="";
	var mob=document.getElementById("mob").value;
	var validmobile=/[7-9]{1}[0-9]{9}$/;
	
		if(i==1){
			var as0=document.getElementById("n0").value;
			var as1=document.getElementById("a0").value;
			var as2=document.getElementById("g0").value;
			if(as0=="" || as1==="" || isNaN(as1) || as2=="null"){
				str="";
			}
			else{
				str="&n0="+as0+"&a0="+as1+"&g0="+as2;
				
			}
			//alert("ok"+ts+" "+tns+" "+bus_id+" "+date+" "+str);
		}
		if(i==2){
			var as0=document.getElementById("n0").value;
			var as1=document.getElementById("a0").value;
			var as2=document.getElementById("g0").value;
			var as3=document.getElementById("n1").value;
			var as4=document.getElementById("a1").value;
			var as5=document.getElementById("g1").value;
			if(as0=="" || as1==="" || isNaN(as1) || as2=="null" || as3=="" || as4==="" || isNaN(as4) || as5=="null"){
				str="";
			}
			else{
				str="&n0="+as0+"&a0="+as1+"&g0="+as2+"&n1="+as3+"&a1="+as4+"&g1="+as5;
				
			}
			//alert("ok"+ts+" "+tns+" "+bus_id+" "+date+" "+str);
		}
		if(i==3){
			var as0=document.getElementById("n0").value;
			var as1=document.getElementById("a0").value;
			var as2=document.getElementById("g0").value;
			var as3=document.getElementById("n1").value;
			var as4=document.getElementById("a1").value;
			var as5=document.getElementById("g1").value;
			var as6=document.getElementById("n2").value;
			var as7=document.getElementById("a2").value;
			var as8=document.getElementById("g2").value;
			if(as0=="" || as1==="" || isNaN(as1) || as2=="null" || as3=="" || as4==="" || isNaN(as4) || as5=="null" || as6=="" || as7==="" || isNaN(as7) || as8=="null"){
				str="";
			}
			else{
				str="&n0="+as0+"&a0="+as1+"&g0="+as2+"&n1="+as3+"&a1="+as4+"&g1="+as5+"&n2="+as6+"&a2="+as7+"&g2="+as8;
				
			}
			//alert("ok"+ts+" "+tns+" "+bus_id+" "+date+" "+str);
		}
		if(i==4){
			var as0=document.getElementById("n0").value;
			var as1=document.getElementById("a0").value;
			var as2=document.getElementById("g0").value;
			var as3=document.getElementById("n1").value;
			var as4=document.getElementById("a1").value;
			var as5=document.getElementById("g1").value;
			var as6=document.getElementById("n2").value;
			var as7=document.getElementById("a2").value;
			var as8=document.getElementById("g2").value;
			var as9=document.getElementById("n3").value;
			var as10=document.getElementById("a3").value;
			var as11=document.getElementById("g3").value;
			if(as0=="" || as1==="" || isNaN(as1) || as2=="null" || as3=="" || as4==="" || isNaN(as4) || as5=="null" || as6=="" || as7==="" || isNaN(as7) || as8=="null" || as9=="" || as10==="" || isNaN(as10) || as11=="null"){
				str="";
			}
			else{
				str="&n0="+as0+"&a0="+as1+"&g0="+as2+"&n1="+as3+"&a1="+as4+"&g1="+as5+"&n2="+as6+"&a2="+as7+"&g2="+as8+"&n3="+as9+"&a3="+as10+"&g3="+as11;
				
			}
			//alert("ok"+ts+" "+tns+" "+bus_id+" "+date+" "+str);
		}
		if(str=="" || mob=="" || isNaN(mob) || !(validmobile.test(mob))){
			alert("Please FillUp Form Properly.");
		}else{
			var url = "ticketbooking.jsp?ts="+ts+"&tns="+tns+"&bus_id="+bus_id+"&date="+date+"&mob="+mob+""+str;
			//alert(url);
			if (window.XMLHttpRequest) {
				request = new XMLHttpRequest();
			} else if (window.ActiveXObject) {
				request = new ActiveXObject("Microsoft.XMLHTTP");
			}

			try {
				request.onreadystatechange = function() {
					if (request.readyState == 4) {
						var val = request.responseText;
						document.getElementById('udiv2').innerHTML = val;
						document.getElementById('udiv1').innerHTML = "";
						// document.getElementById('msg1').innerHTML = "";
					}
				}// end of function
				request.open("GET", url, true);
				request.send();
			} catch (e) {
				alert("Unable to connect to server");
			}
		}
	
}	

function feedback(ticket_id) {
	// alert("theek");
	// alert(a+b+c+d+e+f);
	var url = "feedback.jsp?ticket_id="+ticket_id;

	if (window.XMLHttpRequest) {
		request = new XMLHttpRequest();
	} else if (window.ActiveXObject) {
		request = new ActiveXObject("Microsoft.XMLHTTP");
	}

	try {
		request.onreadystatechange = function() {
			if (request.readyState == 4) {
				var val = request.responseText;
				document.getElementById('udiv2').innerHTML = val;
				document.getElementById('udiv1').innerHTML = "";
				// document.getElementById('msg1').innerHTML = "";
			}
		}// end of function
		request.open("GET", url, true);
		request.send();
	} catch (e) {
		alert("Unable to connect to server");
	}
}

function feedbackprocess(ticket_id) {
	//alert(ticket_id);
	var fb=document.getElementById("fb").value;
	
	if(fb==""){
		alert("Please Enter Feedback.");
	}else if (fb.length>129) {
		alert("Please Reduce Feedback Size.");
		
	}else {
		var url = "feedbackprocess.jsp?ticket_id="+ticket_id+"&fb="+fb;
		//alert(url);
		if (window.XMLHttpRequest) {
			request = new XMLHttpRequest();
		} else if (window.ActiveXObject) {
			request = new ActiveXObject("Microsoft.XMLHTTP");
		}

		try {
			request.onreadystatechange = function() {
				if (request.readyState == 4) {
					var val = request.responseText;
					document.getElementById('udiv2').innerHTML = val;
					document.getElementById('udiv1').innerHTML = "";
					// document.getElementById('msg1').innerHTML = "";
				}
			}// end of function
			request.open("GET", url, true);
			request.send();
		} catch (e) {
			alert("Unable to connect to server");
		}
	}
}

function cancelticket1() {
	var url = "cancelticket1.jsp";

	if (window.XMLHttpRequest) {
		request = new XMLHttpRequest();
	} else if (window.ActiveXObject) {
		request = new ActiveXObject("Microsoft.XMLHTTP");
	}

	try {
		request.onreadystatechange = function() {
			if (request.readyState == 4) {
				var val = request.responseText;
				document.getElementById('udiv2').innerHTML = val;
				document.getElementById('udiv1').innerHTML = "";
				// document.getElementById('msg1').innerHTML = "";
			}
		}// end of function
		request.open("GET", url, true);
		request.send();
	} catch (e) {
		alert("Unable to connect to server");
	}
}


function cancelticket2() {
	var tn=document.getElementById("tn").value;
	//alert(tn);
	if(tn==""){
		alert("Please Enter Ticket Number");
	}else {
		var url = "cancelticket2.jsp?ticket_id="+tn;

		if (window.XMLHttpRequest) {
			request = new XMLHttpRequest();
		} else if (window.ActiveXObject) {
			request = new ActiveXObject("Microsoft.XMLHTTP");
		}

		try {
			request.onreadystatechange = function() {
				if (request.readyState == 4) {
					var val = request.responseText;
					document.getElementById('udiv2').innerHTML = val;
					document.getElementById('udiv1').innerHTML = "";
					// document.getElementById('msg1').innerHTML = "";
				}
			}// end of function
			request.open("GET", url, true);
			request.send();
		} catch (e) {
			alert("Unable to connect to server");
		}
	}
	
}

function viewbookedhisrory() {
	var url = "viewbookedhisrory.jsp";

	if (window.XMLHttpRequest) {
		request = new XMLHttpRequest();
	} else if (window.ActiveXObject) {
		request = new ActiveXObject("Microsoft.XMLHTTP");
	}

	try {
		request.onreadystatechange = function() {
			if (request.readyState == 4) {
				var val = request.responseText;
				document.getElementById('udiv2').innerHTML = val;
				document.getElementById('udiv1').innerHTML = "";
				// document.getElementById('msg1').innerHTML = "";
			}
		}// end of function
		request.open("GET", url, true);
		request.send();
	} catch (e) {
		alert("Unable to connect to server");
	}
}

function cancleprocess(ticket_id,bus_id,date,seat_no) {
	//alert("ok"+ticket_id+" "+bus_id+" "+date+" "+seat_no);
	var url = "cancleprocess.jsp?ticket_id="+ticket_id+"&bus_id="+bus_id+"&date="+date+"&seat_no="+seat_no;

	if (window.XMLHttpRequest) {
		request = new XMLHttpRequest();
	} else if (window.ActiveXObject) {
		request = new ActiveXObject("Microsoft.XMLHTTP");
	}

	try {
		request.onreadystatechange = function() {
			if (request.readyState == 4) {
				var val = request.responseText;
				document.getElementById('msg1').innerHTML = val;
				//document.getElementById('udiv1').innerHTML = "";
				// document.getElementById('msg1').innerHTML = "";
			}
		}// end of function
		request.open("GET", url, true);
		request.send();
	} catch (e) {
		alert("Unable to connect to server");
	}
}

function cancleprocess1(ticket_id,bus_id,date,seat_no) {
	//alert("ok"+ticket_id+" "+bus_id+" "+date+" "+seat_no);
	var url = "cancleprocess1.jsp?ticket_id="+ticket_id+"&bus_id="+bus_id+"&date="+date+"&seat_no="+seat_no;

	if (window.XMLHttpRequest) {
		request = new XMLHttpRequest();
	} else if (window.ActiveXObject) {
		request = new ActiveXObject("Microsoft.XMLHTTP");
	}

	try {
		request.onreadystatechange = function() {
			if (request.readyState == 4) {
				var val = request.responseText;
				document.getElementById('msg1').innerHTML = val;
				//document.getElementById('udiv1').innerHTML = "";
				// document.getElementById('msg1').innerHTML = "";
			}
		}// end of function
		request.open("GET", url, true);
		request.send();
	} catch (e) {
		alert("Unable to connect to server");
	}
}

function refresh(msg) {
	
		var url = msg;

		if (window.XMLHttpRequest) {
			request = new XMLHttpRequest();
		} else if (window.ActiveXObject) {
			request = new ActiveXObject("Microsoft.XMLHTTP");
		}

		try {
			request.onreadystatechange = function() {
				if (request.readyState == 4) {
					var val = request.responseText;
					document.getElementById('udiv2').innerHTML = val;
					document.getElementById('udiv1').innerHTML = "";
					// document.getElementById('msg1').innerHTML = "";
				}
			}// end of function
			request.open("GET", url, true);
			request.send();
		} catch (e) {
			alert("Unable to connect to server");
		}
}

function changepassword() {
	
	//alert("ok");
	var url = "changepassword.jsp";
	if (window.XMLHttpRequest) {
		request = new XMLHttpRequest();
	} else if (window.ActiveXObject) {
		request = new ActiveXObject("Microsoft.XMLHTTP");
	}

	try {
		request.onreadystatechange = function() {
			if (request.readyState == 4) {
				var val = request.responseText;
				document.getElementById('udiv2').innerHTML = val;
				document.getElementById('udiv1').innerHTML = "";
				// document.getElementById('msg1').innerHTML = "";
			}
		}// end of function
		request.open("GET", url, true);
		request.send();
	} catch (e) {
		alert("Unable to connect to server");
	}
}

function changepassprocess() {
	var ui=document.getElementById("ui").value;
	var op=document.getElementById("op").value;
	var np=document.getElementById("np").value;
	var cp=document.getElementById("cp").value;
	var url = "changepassprocess.jsp?ui="+ui+"&op="+op+"&np="+np;
	if(ui==""){
		alert("Please Enter User Id");	
	}
	else if(op==""){
		alert("Please Enter Old Password.");
	}
	else if(np==""){
		alert("Please Enter New Password");
		
	}else if(np.length<=4 || np.length>8){
		alert("Password Length Do not Matched.")
	}
	else if(cp==""){
		alert("Please Enter Your Confirm Password ");
	}
	else if(np!=cp){
		alert("Mismatch password");
	}else {
		if (window.XMLHttpRequest) {
			request = new XMLHttpRequest();
		} else if (window.ActiveXObject) {
			request = new ActiveXObject("Microsoft.XMLHTTP");
		}

		try {
			request.onreadystatechange = function() {
				if (request.readyState == 4) {
					var val = request.responseText;
					document.getElementById('msg1').innerHTML = val;
					//document.getElementById('udiv1').innerHTML = "";
					// document.getElementById('msg1').innerHTML = "";
				}
			}// end of function
			request.open("GET", url, true);
			request.send();
		} catch (e) {
			alert("Unable to connect to server");
		}
	}
	
}

function updateprofile() {
	
	//alert("ok");
	var url = "updateprofile.jsp";
	if (window.XMLHttpRequest) {
		request = new XMLHttpRequest();
	} else if (window.ActiveXObject) {
		request = new ActiveXObject("Microsoft.XMLHTTP");
	}

	try {
		request.onreadystatechange = function() {
			if (request.readyState == 4) {
				var val = request.responseText;
				document.getElementById('udiv2').innerHTML = val;
				document.getElementById('udiv1').innerHTML = "";
				// document.getElementById('msg1').innerHTML = "";
			}
		}// end of function
		request.open("GET", url, true);
		request.send();
	} catch (e) {
		alert("Unable to connect to server");
	}
}

function updateprofileprocess() {
	var ui=document.getElementById("ui").value
	var question=document.getElementById("question").value
	var sans=document.getElementById("sans").value
	var ms=document.getElementById("ms").value
	var date=document.getElementById("date").value
	var ei=document.getElementById("ei").value
	var mob=document.getElementById("mob").value
	var ad=document.getElementById("ad").value
	var validmobile=/[7-9]{1}[0-9]{9}$/;
	var validmail=/[a-zA-Z0-9.-_]+[@]{1}[a-z]+[.]{1}[a-zA-Z]{3}$/;
	var url="updateprofileprocess.jsp?ui="+ui+"&question="+question+"&sans="+sans+"&ms="+ms+"&date="+date+"&ei="+ei+"&mob="+mob+"&ad="+ad;
	if(sans==""){
		alert("please Enter Security Answer.");
	}else if (date=="") {
		alert("Please Select Date.");	
	}else if (ei=="") {
		alert("Please Enter Email Id.");	
	}else if(!(validmail.test(ei))){
		alert("Email id is incorrect");
		return false;
	}else if (mob=="") {
		alert("Please Enter Mobile Number.");	
	}else if(isNaN(mob)){
		alert("Invalid mobile Number");
	}else if(!(validmobile.test(mob))){
		alert("mobile number incorrect");
	}else if (ad=="") {
		alert("Please Enter Address.");	
	}
	else{
		if (window.XMLHttpRequest) {
			request = new XMLHttpRequest();
		} else if (window.ActiveXObject) {
			request = new ActiveXObject("Microsoft.XMLHTTP");
		}

		try {
			request.onreadystatechange = function() {
				if (request.readyState == 4) {
					var val = request.responseText;
					document.getElementById('msg1').innerHTML = val;
					//document.getElementById('udiv1').innerHTML = "";
					// document.getElementById('msg1').innerHTML = "";
				}
			}// end of function
			request.open("GET", url, true);
			request.send();
		} catch (e) {
			alert("Unable to connect to server");
		}
	
	}
}
function viewfeedback() {
	//alert("oooooooooooooooooooooooo");
	var url = "viewfeedback.jsp";

	if (window.XMLHttpRequest) {
		request = new XMLHttpRequest();
	} else if (window.ActiveXObject) {
		request = new ActiveXObject("Microsoft.XMLHTTP");
	}

	try {
		request.onreadystatechange = function() {
			if (request.readyState == 4) {
				var val = request.responseText;
				document.getElementById('id4').innerHTML = val;
				// document.getElementById('msg1').innerHTML = "";
			}
		}// end of function
		request.open("GET", url, true);
		request.send();
	} catch (e) {
		alert("Unable to connect to server");
	}
}

function viewbusstatus() {
	//alert("oooooooooooooooooooooooo");
	var url = "viewbusstatus.jsp";

	if (window.XMLHttpRequest) {
		request = new XMLHttpRequest();
	} else if (window.ActiveXObject) {
		request = new ActiveXObject("Microsoft.XMLHTTP");
	}

	try {
		request.onreadystatechange = function() {
			if (request.readyState == 4) {
				var val = request.responseText;
				document.getElementById('id4').innerHTML = val;
				// document.getElementById('msg1').innerHTML = "";
			}
		}// end of function
		request.open("GET", url, true);
		request.send();
	} catch (e) {
		alert("Unable to connect to server");
	}
}

function viewbusstatus2() {
	var bi=document.getElementById("bi").value;
	var date=document.getElementById("date").value;
	if(bi==""){
		alert("Please Enter Bus Number.");
	}else if (isNaN(bi)) {
		alert("Bus Id Must Be In Number.");
		
	}else if (date=="") {
		alert("Please Enter date.");
		
	}else {
		var url = "viewbusstatus2.jsp?bi="+bi+"&date="+date;

		if (window.XMLHttpRequest) {
			request = new XMLHttpRequest();
		} else if (window.ActiveXObject) {
			request = new ActiveXObject("Microsoft.XMLHTTP");
		}

		try {
			request.onreadystatechange = function() {
				if (request.readyState == 4) {
					var val = request.responseText;
					document.getElementById('id4').innerHTML = val;
					// document.getElementById('msg1').innerHTML = "";
				}
			}// end of function
			request.open("GET", url, true);
			request.send();
		} catch (e) {
			alert("Unable to connect to server");
		}
	}
	
}
function viewbus() {
	var url = "viewbus.jsp";

	if (window.XMLHttpRequest) {
		request = new XMLHttpRequest();
	} else if (window.ActiveXObject) {
		request = new ActiveXObject("Microsoft.XMLHTTP");
	}

	try {
		request.onreadystatechange = function() {
			if (request.readyState == 4) {
				var val = request.responseText;
				document.getElementById('id4').innerHTML = val;
				// document.getElementById('msg1').innerHTML = "";
			}
		}// end of function
		request.open("GET", url, true);
		request.send();
	} catch (e) {
		alert("Unable to connect to server");
	}
}

function viewbus2() {
	//alert("ok");
	var bi=document.getElementById("bi").value;
	if(bi==""){
		alert("Please Enter Bus Number.");
	}else if (isNaN(bi)) {
		alert("Bus Id Must Be In Number.");
		
	}else {
		var url = "viewbus2.jsp?bi="+bi;

		if (window.XMLHttpRequest) {
			request = new XMLHttpRequest();
		} else if (window.ActiveXObject) {
			request = new ActiveXObject("Microsoft.XMLHTTP");
		}

		try {
			request.onreadystatechange = function() {
				if (request.readyState == 4) {
					var val = request.responseText;
					document.getElementById('id4').innerHTML = val;
					// document.getElementById('msg1').innerHTML = "";
				}
			}// end of function
			request.open("GET", url, true);
			request.send();
		} catch (e) {
			alert("Unable to connect to server");
		}
	}
}

function updatebus() {
	//alert("update");
	var bi=document.getElementById("bi").value;
	var bt=document.getElementById("bt").value;
	var dt=document.getElementById("dt").value;
	var fare=document.getElementById("fare").value;
	var status=document.getElementById("status").value;
	if(bt==""){
		alert("Please Enter Bording Time.");
	}else if (dt=="") {
		alert("Please Enter Dropintg Time.");
		
	}else if (fare=="") {
		alert("Please Enter Fare.");
		
	}else if (isNaN(fare)) {
		alert("Fare Must Be In Number");
		
	}else {
		var url = "updateprocess.jsp?bi="+bi+"&bt="+bt+"&dt="+dt+"&fare="+fare+"&status="+status;

		if (window.XMLHttpRequest) {
			request = new XMLHttpRequest();
		} else if (window.ActiveXObject) {
			request = new ActiveXObject("Microsoft.XMLHTTP");
		}

		try {
			request.onreadystatechange = function() {
				if (request.readyState == 4) {
					var val = request.responseText;
					document.getElementById('msg1').innerHTML = val;
					// document.getElementById('msg1').innerHTML = "";
				}
			}// end of function
			request.open("GET", url, true);
			request.send();
		} catch (e) {
			alert("Unable to connect to server");
		}
	}
	
	
}

function deletebus() {
	//alert("delete");
	var bi=document.getElementById("bi").value;
	var url = "deleteprocess.jsp?bi="+bi;

	if (window.XMLHttpRequest) {
		request = new XMLHttpRequest();
	} else if (window.ActiveXObject) {
		request = new ActiveXObject("Microsoft.XMLHTTP");
	}

	try {
		request.onreadystatechange = function() {
			if (request.readyState == 4) {
				var val = request.responseText;
				document.getElementById('msg1').innerHTML = val;
				// document.getElementById('msg1').innerHTML = "";
			}
		}// end of function
		request.open("GET", url, true);
		request.send();
	} catch (e) {
		alert("Unable to connect to server");
	}
}

function updatestoppage(sid,i) {
	var sname=document.getElementById(i).value;
	//alert(sid+" "+sname);
	var url = "updatestoppage.jsp?sid="+sid+"&sname="+sname;

	if (window.XMLHttpRequest) {
		request = new XMLHttpRequest();
	} else if (window.ActiveXObject) {
		request = new ActiveXObject("Microsoft.XMLHTTP");
	}

	try {
		request.onreadystatechange = function() {
			if (request.readyState == 4) {
				var val = request.responseText;
				document.getElementById('msg1').innerHTML = val;
				// document.getElementById('msg1').innerHTML = "";
			}
		}// end of function
		request.open("GET", url, true);
		request.send();
	} catch (e) {
		alert("Unable to connect to server");
	}
	
}

function deletestoppage(sid) {
	//alert(sid);
	var url = "deletestoppage.jsp?sid="+sid;

	if (window.XMLHttpRequest) {
		request = new XMLHttpRequest();
	} else if (window.ActiveXObject) {
		request = new ActiveXObject("Microsoft.XMLHTTP");
	}

	try {
		request.onreadystatechange = function() {
			if (request.readyState == 4) {
				var val = request.responseText;
				document.getElementById('msg1').innerHTML = val;
				// document.getElementById('msg1').innerHTML = "";
			}
		}// end of function
		request.open("GET", url, true);
		request.send();
	} catch (e) {
		alert("Unable to connect to server");
	}
	
}