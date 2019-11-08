<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%>
<style>
/* 메인 상품 css */
#pro_det_article{
	position: relative;
	margin: 0 auto;
	width: 1024px;
	border: 1px solid silver;
	margin-top: 10px;
	border-radius: 10px 10px 10px 10px;
}

h2{text-align:center;}

#img_box {
	width: 900px;
	height: 300px;
	margin: 0 auto;
}

#img_box img {
	margin-left: 270px;
	margin-top: 10px;
	width: 400px;
	height: 250px;
}

#product_box {
	width: 900px;
	height: 185px;
	border: 1px solid silver;
	margin: 0 auto;
	margin-top: -10px;
	text-align:center;
}
#option_box{
	position: relative;
	width: 900px;
	height: 50px;
	margin: 0 auto;
	background: #f9f9f9;
	margin-top: 10px;
	border: 1px solid silver;	
}	

#option_top_01{width: 595px; height: 50px; float: left; line-height: 15px; }
#option_top_02{width: 180px; height: 50px; float: right; line-height: 50px;}
#value{ width: 100px; height: 30px; margin-left:0px;}


#buttons {
	width: 900px;
	height: 80px;
	margin: 0 auto;
	margin-top: 15px;
}

#order {
	width: 400px;
	height: 70px;
	color: gray;
	font-weight: bold;
	font-size: 120%;
	background: lightgreen;
	border-radius: 20px 20px 20px 20px;
	margin-left: 20px;
	margin-right: 50px;
}

#order_qna {
	width: 400px;
	height: 70px;
	color: gray;
	font-weight: bold;
	font-size: 120%;
	border-radius: 20px 20px 20px 20px;
	background: orange;
}

.combo {	width: 222px; height: 90px; float: left;
}
.check{	margin-top: 20px;
}

/*  tab 구간 css*/

#ban { margin:0 auto; width: 1024px; height: 1000px; text-align:center; }
  
#banners{position:reative; margin:0 auto; width: 1024px; height: 40px; margin-top: 20px;}
#tablist{list-style: none; padding: 0px; margin: 0px;  margin-bottom: 20px;}
#tablist li{width:510px; height:40px; float:left;  line-height:40px; text-align:center; border: 1px solid silver;
		             border-radius:5px 5px 0px 0px;  background-color: #f9f9f9; ; font-size: 90%}
#tablist li a{color: black; text-decoration: none; }
#tablist li a:hover{ color: red; font-size: 110%;  text-decoration: none;}
#tablist:hover{background: yellow; }
  
#bang1{font-size:90%;
			line-height: 50px;
			border-left:1px solid silver;
			border-right:1px solid silver;
			border-bottom:1px solid silver;}
#bang2{ font-size:90%;
	line-height: 50px;
	border-left:1px solid silver;
	border-right:1px solid silver;
	border-bottom:1px solid silver;
	display: none;
}
#bang2_03 li{ list-style: none; margin: 0; padding:0; float: left;}
#bang2 img{ margin-right: 40px;}

</style>

<script>
$(function(){
	$('#tablist li:eq(0)').css('background-color', '#FFFFFF' );
	$('#tablist li:eq(1)').css('background-color', '#FFFFFF' );
	
	$('#tablist li').click(function(){
		var s = '#bang' + ($(this).index()+1);
		for(var i=1; i<=2; i++){
			var s1 = '#bang' + i;
			$(s1).hide();
		}
		    $(s).show();
	   });

    });
</script>
<article id="pro_det_article">
	<h2> ${ProductVO.ptitle}</h2>
	<div id ="product">
		<form name="frm" method="post">
			<div id="img_box">
				<img src="images/${ProductVO.image}" />
			</div>	
				<div id="product_box">
					<div class="combo">
					<span style="color:red;">*</span>재능등록일<br>
						<h3>${ProductVO.indate}</h3> </div>
					<div class="combo">		
					<span style="color:red;">*</span>재능종류<br>
						<h3>${ProductVO.kind}</h3>
					</div>
					<div class="combo">
					<span style="color:red;">*</span>판매가능지역<br>
						<h3>${ProductVO.area}</h3> 
					</div>
					<div class="combo">
					<span style="color:red;">*</span>파는사람<br>
						<h3>${ProductVO.id}</h3> 
					</div>
					<div class="combo">
					<span style="color:red;">*</span>전화가능여부<br>
						<h3>${ProductVO.phone} </h3>
					</div>
					<div class="combo">
					<span style="color:red;">*</span>구매만족도<br>
						<h3>100%</h3>
					</div>
					<div class="combo">
					<span style="color:red;">*</span>기본가격<br>
						<h3>${ProductVO.price}</h3>
					</div>			
				</div>
				<div id="option_box">
					<div id="option_top">
						<div id="option_top_02">
						수량 
						<select id="value">
							<option>1</option>
							<option>2</option>
							<option>3</option>
							<option>4</option>
							<option>5</option>
							<option>6</option>
							<option>7</option>
							<option>8</option>
							<option>9</option>
							<option>10</option>
						</select>
						</div>
				
					</div>
				</div>
			<div class="clear"></div>
				<div id="buttons">
					<a href="TalentServlet?commannd=cart">
					<input type="button" value="재능 주문하기" class="submit"  id="order" ></a>
					<a href="TalentServlet?commannd=order_detail">
					<input type="button" value="문의하기" class="submit" id="order_qna"></a>
				</div>			
		</form>
	</div>	
</article>
<div class="clear"></div>

 <div id="ban">
 
 <div id="banners">
  	<ul id="tablist">
		<li id="tab1"><a href="#화면올라감방지용">재능 상세정보</a></li>
		<li id="tab2"><a href="#화면올라감방지용">이용방법</a></li>
	</ul>
  </div>
  <div id="contents">
     <div class="content" id="bang1">
     <c:choose>
     	<c:when test="${empty ProductVO.content_image}"> ${ProductVO.content}
     	</c:when>
     	<c:otherwise>
     		<img src="images/${ProductVO.content_image}" style="width:971px;"/><br>${ProductVO.content}
    	</c:otherwise>
    </c:choose>
     </div>
     <div class="content" id="bang2">
     	<div id="bang2_03">
	     	<img src="images/usecase.jpg" style="width:984px; height:324px;">
	     </div>
	 </div>
  </div>   
 </div>

<%@ include file="../footer.jsp"%>