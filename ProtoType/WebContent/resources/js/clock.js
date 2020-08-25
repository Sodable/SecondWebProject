$(document).ready(function() {
// Create two variable with the names of the months and days in an array
var monthNames = [ "1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12" ]; 
var dayNames= ["일","월","화","수","목","금","토"]

// Create a newDate() object
var newDate = new Date();
// Extract the current date from Date object
newDate.setDate(newDate.getDate());
// Output the day, date, month and year    
$('#Date').
html(
		newDate.getFullYear()+ '년'
	+ monthNames[newDate.getMonth()] + '월'
	+ newDate.getDate() + '일' 
	+ dayNames[newDate.getDay()] + "요일" 
	
	
	);

setInterval( function() {
	// Create a newDate() object and extract the seconds of the current time on the visitor's
	var seconds = new Date().getSeconds();
	// Add a leading zero to seconds value
	$("#sec").html(( seconds < 10 ? "0" : "" ) + seconds+"초");
	},1000);
	
setInterval( function() {
	// Create a newDate() object and extract the minutes of the current time on the visitor's
	var minutes = new Date().getMinutes();
	// Add a leading zero to the minutes value
	$("#min").html(( minutes < 10 ? "0" : "" ) + minutes+"분");
    },1000);
	
setInterval( function() {
	// Create a newDate() object and extract the hours of the current time on the visitor's
	var hours = new Date().getHours();
	hours = hours%12;
	var oh = "";
	if(hours / 12 == 0){
		oh = "오전";
	}else{
		oh = "오후";
	}
	// Add a leading zero to the hours value
	$("#hours").html(oh + " " + ( hours < 10 ? "0" : "" ) + hours+"시");
    }, 1000);
	
}); 