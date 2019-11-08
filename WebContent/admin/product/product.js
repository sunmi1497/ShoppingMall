function go_ab() // 판매가-원가=순매출을 replace해서 계산해 준다. (body onload="go_ab()")
{
	var theForm = document.frm;
	
	var a = theForm.price2.value.replace(/,/g, '');	//* / /g 모든 / /안의 것 global, / /i 영문 대소문자를 무시 ignore
	var b = theForm.price1.value.replace(/,/g, '');
	var ab = parseInt(a) - parseInt(b);
	
	theForm.price3.value = ab;
}

function NumFormat(t) // 원 단위, 찍어주기 - onKeyUp
{
	s = t.value;
	s = s.replace(/\D/g, '');	// \d == 숫자 문자에 대응됩니다. [0-9]와 동일합니다; .replace(/\s/g,''): 문자열 내의 모든 공백 제거
	l = s.length - 3;
	while (l > 0) {
		s = s.substr(0, l) + ',' + s.substr(l);	//* 0~l까지 , l까지 자르고 끝까지; 뒤부터 , 찍어줌
		l -= 3;
	}
	t.value = s;
	return t;
}


function removeComma(input) // ,을 빼고 값을 다시 넣어준다.
{
	return input.value.replace(/,/gi, "");
}


function go_mod_mov(tpage, pseq) {
	var theForm = document.frm;
	theForm.action = 'TalentServlet?command=admin_product_detail&tpage='
			+ tpage + "&pseq=" + pseq;
	theForm.submit();
}
