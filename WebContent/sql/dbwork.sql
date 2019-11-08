
/* Drop Views */

DROP VIEW SCOTT.BEST_PRO_VIEW;
DROP VIEW SCOTT.CART_VIEW;
DROP VIEW SCOTT.NEW_PRO_VIEW;
DROP VIEW SCOTT.ORDER_VIEW;



/* Drop Tables */

DROP TABLE SCOTT.CART CASCADE CONSTRAINTS;
DROP TABLE SCOTT.ORDER_DETAIL CASCADE CONSTRAINTS;
DROP TABLE SCOTT.ORDERS CASCADE CONSTRAINTS;
DROP TABLE SCOTT.PRODUCT CASCADE CONSTRAINTS;
DROP TABLE SCOTT.MEMBER CASCADE CONSTRAINTS;
DROP TABLE SCOTT.QNA CASCADE CONSTRAINTS;



/* Drop Sequences */

DROP SEQUENCE SCOTT.CART_SEQ;
DROP SEQUENCE SCOTT.ORDERS_SEQ;
DROP SEQUENCE SCOTT.ORDER_DETAIL_SEQ;
DROP SEQUENCE SCOTT.PRODUCT_SEQ;
DROP SEQUENCE SCOTT.QNA_SEQ;




/* Create Sequences */

CREATE SEQUENCE SCOTT.CART_SEQ INCREMENT BY 1 MINVALUE 1 MAXVALUE 9999999999999999999999999999 START WITH 21 CACHE 20;
CREATE SEQUENCE SCOTT.ORDER_DETAIL_SEQ INCREMENT BY 1 MINVALUE 1 MAXVALUE 9999999999999999999999999999 START WITH 21 CACHE 20;
CREATE SEQUENCE SCOTT.ORDERS_SEQ INCREMENT BY 1 MINVALUE 1 MAXVALUE 9999999999999999999999999999 START WITH 21 CACHE 20;
CREATE SEQUENCE SCOTT.PRODUCT_SEQ INCREMENT BY 1 MINVALUE 1 MAXVALUE 9999999999999999999999999999 START WITH 21 CACHE 20;
CREATE SEQUENCE SCOTT.QNA_SEQ INCREMENT BY 1 MINVALUE 1 MAXVALUE 9999999999999999999999999999 START WITH 21 CACHE 20;



/* Create Tables */

CREATE TABLE SCOTT.CART
(
	CSEQ number(10,0) NOT NULL, --장바구니번호
	ID varchar2(20 char), --주문자 아이디(FK:member.id)
	PSEQ number(5,0), --주문 상품번호(FK:product.pseq)
	QUANTITY number(5,0) DEFAULT 1, --주문 수량
	RESULT char(1 char) DEFAULT '1',	--1:미처리 2:처리
	INDATE date DEFAULT SYSDATE,		-- 주문일	
	CONSTRAINT SYS_C007183 PRIMARY KEY (CSEQ)
);


CREATE TABLE SCOTT.MEMBER
(
	ID varchar2(20 char) NOT NULL,
	PWD varchar2(20 char),
	NAME varchar2(40 char),
	EMAIL varchar2(40 char),
	ADDRESS varchar2(100 char),
	PHONE varchar2(20 char),
	USEYN char(1 char) DEFAULT 'y', --현재 id 사용여부(활동중/비활동중)
	INDATE date DEFAULT sysdate,  --가입일
	ADMIN_YN varchar2(4) default 'n',	--관리자인지 사용자인지
	CONSTRAINT SYS_C007161 PRIMARY KEY (ID)
);


CREATE TABLE SCOTT.ORDERS
(
	OSEQ number(10,0) NOT NULL, --주문번호
	ID varchar2(20 char), --주문자 아이디
	INDATE date DEFAULT sysdate,		--주문일
	CONSTRAINT SYS_C007167 PRIMARY KEY (OSEQ)
);


CREATE TABLE SCOTT.ORDER_DETAIL
(
	ODSEQ number(10,0) NOT NULL, --주문상세번호
	OSEQ number(10,0), --주문번호
	PSEQ number(5,0), --상품번호
	QUANTITY number(5,0) DEFAULT 1, --주문수량
	RESULT char(1 char) DEFAULT '1',		--1:미처리 2:처리
	CONSTRAINT SYS_C007186 PRIMARY KEY (ODSEQ)
);


CREATE TABLE SCOTT.PRODUCT
(
	PSEQ number(5,0) NOT NULL,
	PTITLE varchar2(200),
	KIND varchar2(20),
	AREA varchar2(20),
	PRICE number(7,0) DEFAULT '0',
	PHONE varchar2(20 char),
	PERIOD number(5,0),	--작업기간
	CONTENT varchar2(4000), --재능등록 내용
	CONTENT_img varchar2(50), --재능등록 내용 상세설명 이미지
	image varchar2(50) default 'default.jpg', --상품이미지
	useyn char(1) default 'y', 	--현재 판매중여부
	bestyn char(1) default 'n',	--베스트 상품 y/n
	indate date default sysdate,	 --등록일
	ID varchar2(20 char) NOT NULL,		--상품등록 판매자 아이디
	readcount number(10,0) default 0,
	CONSTRAINT SYS_C007182 PRIMARY KEY (PSEQ)
);


CREATE TABLE SCOTT.QNA
(
	qseq number(5) primary key,  --글번호
	subject varchar2(300), --제목
	content varchar2(1000), --문의내용
	reply varchar2(1000),	--답변내용
	id varchar2(20),	--작성자(FK:member.id)
	rep char(1) default '1',	--1:답변 무 2:답변 유
	indate date default sysdate		--작성일
);



/* Create Views */

CREATE OR REPLACE VIEW SCOTT.BEST_PRO_VIEW AS select pseq, ptitle, price, image, readcount
from( select rownum, pseq, ptitle, price, image, readcount
		from product
		where bestyn = 'y'
		order by indate desc)
where rownum <=4;

CREATE OR REPLACE VIEW SCOTT.CART_VIEW AS select o.cseq, o.id, o.pseq, m.name mname, p.ptitle ptitle,
o.quantity, o.indate, p.price, o.result
from cart o, member m, product p
where o.id = m.id and o.pseq = p.pseq
and result = '1';

CREATE OR REPLACE VIEW SCOTT.NEW_PRO_VIEW AS select pseq, ptitle, price, image, readcount
from( select rownum, pseq, ptitle, price, image, readcount
		from product
		where useyn = 'y'
		order by indate desc)
where rownum <=4;

CREATE OR REPLACE VIEW SCOTT.ORDER_VIEW AS select d.odseq odetailseq, o.oseq, o.id, o.indate, d.pseq,d.quantity, m.name mname,
m.address, m.phone, p.ptitle ptitle, p.price, d.result oresult 
from orders o, order_detail d, member m, product p
where o.oseq=d.oseq and o.id = m.id and d.pseq = p.pseq;

---------------------------중간 수정 내용--------------------------------
ALTER TABLE product ADD(READCOUNT number(10,0));
ALTER TABLE product drop column content_seller;
ALTER TABLE product rename column content_buyer to content;
alter table product add(content_image varchar2(50));
-------------------------------------------------------------------------

insert into MEMBER(ID,PWD,NAME,EMAIL,ADDRESS,PHONE,ADMIN_YN)
	values('scott','tiger','관리자','admin@naver.com','서울시 강서구 화곡동','010-0000-0000','y');
	
insert into product (PSEQ,PTITLE,KIND,AREA,PRICE,PHONE,PERIOD,image,CONTENT,ID) values(PRODUCT_SEQ.nextval,'일러스트/캐릭터/로고/디자인을 한번에! 디자인포털서비스 -디자인브릿지원- 입니다',
	'디자인','서울','50000','010-0000-0000','5','01.jpg','안녕하세요. 합리적이며 퀄리티 높은 홈페이지 제작을
찾으신다면 후회없는 선택이 될 것입니다. 무리한 추가
비용이나 수정비용 등 으로 저렴한 홈페이지 제작을 내
세우는 업체들과는 전혀 다릅니다.
WIX기반의 홈페이지 제작으로 개발비용을 최소화 하며.
제작 작업의 대부분을 디자인과 UI/UX에 투자하여 자연
스럽게 비용은 저렴해지고 퀄리티는 높힐 수 있습니다.
또한 1억원 상당의 유료폰트,이미지,영상,캘리그라피 등을
보유하여 저작권에서 더욱 자유로운 디자인을 구현할수 있습니다.
정말 합리적인 비용으로 높은 퀄리티의 홈페이지를 제작
을 원하신다면 후회없는 선택이 되실 것 입니다.​
','scott');

insert into product (PSEQ,PTITLE,KIND,AREA,PRICE,PHONE,PERIOD,image,CONTENT,ID) values(PRODUCT_SEQ.nextval,'★젊은 감각·깊은 통찰의 감성 사주상담 / Jay 의 감성상담소 / 제이사주/ 궁합, 진로, 결혼, 연애, 년도별★',
	'생활서비스','전국','30000','010-0000-0000','3','02.jpg','** 그​동안 오프라인​ 상담이 많아 재능넷 상담을 보름간 보류하였습니다. 이제 재능넷 상담도 정상적으로
이루어 집니다. 오래 기다리시게 해서 죄송합니다. 최선을 다해 더 나은 상담을 드리도록 하겠습니다 **
2018년 7월 1일(일) 사주 상담을 드렸습니다.
그런데 사주풀이가 완전 반대로 나와서 고객님께서 틀렸다고 평가하셨습니다. 송구함에 몸둘바 몰라 환불해 드리고자 계좌번호를 문의하며 나름의 견해를 보내드렸습니다. 
그런데.. 틀린 것이 아니었습니다. 오히려 정확히 맞춘 것이 었습니다. 
고객님과의 메모 메세지를 그대로 복사하여 올립니다.
','scott');
insert into product (PSEQ,PTITLE,KIND,AREA,PRICE,PHONE,PERIOD,image,CONTENT,ID) values(PRODUCT_SEQ.nextval,'한->영, 영->한 번역 24시간 상담 환영 (비즈니스,해외계약서,전문번역(의학,저널) 메뉴얼,국제인증, 국제표준) ',
	'번역외국어','전국','30000','010-0000-0000','3','03.jpg','<원어민 에디터 영문 문서 교정 서비스 >
미국에서 석사 과정까지 마치고 현재 프리랜서로 한국인 학생들의 문서 교정을 도와주고있는
미국인 에디터 입니다.
다앙한 분야의 영어 문서를 매끈하게 수정하여 드립니다.
한국인이 번역한 번역물의 흔한 오류 (예, 관사 a, the, 문장 순서 오류, 과도하게  연결된 긴글 등)를 
원문을 살려 쉬운글로 만들어 드립니다.
오 탈자 및 문법 수정등 도와 드립니다.
빠른 커뮤니케이션으로 빠른 진행 도와드려요.
감수자 경력
뷰티 블로그, 대학교 홈페이지, 병원 홈페이지 영문 감수
다수의 논문초록, 학회 제출용 문서 감수
출판책 감수 
미국 그린카드, 대학교 대학원 지원서 에세이 감수 등등
문의는 한글 또는 영어 편한대로 주세요.
','scott');
insert into product (PSEQ,PTITLE,KIND,AREA,PRICE,PHONE,PERIOD,image,CONTENT_img,ID) values(PRODUCT_SEQ.nextval,'사업계획서,제안서,기획서 및 홍보용 PPT 작성(디자인보다 내용에 충실합니다.) ',
	'문서작성','경기','30000','010-0000-0000','3','04.jpg','content_01.jpg','scott');
insert into product (PSEQ,PTITLE,KIND,AREA,PRICE,PHONE,PERIOD,image,CONTENT,ID) values(PRODUCT_SEQ.nextval,'[홈페이지형 블로그 디자인] 추가금액없이 블로그 스킨+모바일커버 디자인해드립니다. ',
	'프로그램개장','서울','30000','010-0000-0000','3','05.jpg','워드프레스를 설치는 했지만, 그다음 어떻게 해야할지 모르시나요? 혹은 설치가 어렵나요?
무료 워드프레스부터 프리미엄 테마까지 설치하여 드립니다.
워드프레스는 블로그형 시스템이긴 하나 현재 대기업, 관공서, 회사, 
쇼핑몰, 개인 블로그 및 홈페이지로 다양하게 사용되고 있습니다.
다양한 디자인부터 기능까지 사용이 어렵지 않게 플러그인으로 지원되고 있으며, 
PC, 테블릿, 스마트폰까지 지원하는 반응형 웹 테마 및 시스템까지 쉽게 만들 수 있습니다.
별도로 웹사이트 운용 및 국내/해외 쇼핑몰 운용 부분까지 컨설팅까지 가능합니다. 
또는 다른 기술 개발 및 병합에 대한 기획 컨설팅도 가능하니 언제든 문의 주세요.
(세금계산서 가능)
이런분에게 추천해 드립니다.
1. 워드프레스 사이트를 구축하고 싶은데, 방법이나 진행방향을 모르시는 분
2. 기본 설치는 했으나 운용을 어떻게 해야할지 모르시는 분
3. 유료테마 구매를 했지만 설치 방법이나 운용방법을 모르시는 분
4. 쇼핑몰 구축을 하고 싶은데 어떻게 진행해야 할지 모르시는 분
5. 디자인은 있는데 워드프레스를 활용하여 구축하지 못하시는 분
6. 기타 웹사이트 구축에 필요한 컨설팅 및 기획이 필요하신 분
작업 소요 기간
1. 테마/웹호스팅/도메인을 가지고 있는 경우 : 3일 (단, 테마 설치 후 세부 내용은 구매자께서 작성)
   - 테마/웹호스팅/도메인을 가지고 있지 않은 경우 선택 및 구매는 구매자께서 직접 진행하시거나 대행해서 진행하며, 그 기간은 별도 기간임
2. 테마를 설치 후 구매자께서 원하시는 사이트 초안 구축 : 작업기준(평일)7일 정도 소요되며 내용에 따라 기간은 지연될 수 있음 
3. 우커머스(쇼핑몰)의 경우 테스트 및 기간은 결제 및 기타 연동된 기능에 따라 기간이 달라질 수 있음','scott');	
	
commit

select * from product