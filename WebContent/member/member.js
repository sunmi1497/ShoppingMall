$(function(){
	$('#serv_1 img').appendTo($('#serv_1'));
	var a = 0;
	var time3 = setInterval(function(){
			var b = a*500*-1;
			$('#serv_1').animate({left:b},1000);
			a++;
			if(a==6)a=0;
	},2000); 
});


