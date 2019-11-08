
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

DROP SEQUENCE SCOTT.BOARD_SEQ;
DROP SEQUENCE SCOTT.CART_SEQ;
DROP SEQUENCE SCOTT.ORDERS_DETAIL_SEQ;
DROP SEQUENCE SCOTT.ORDERS_SEQ;
DROP SEQUENCE SCOTT.ORDER_DETAIL_SEQ;
DROP SEQUENCE SCOTT.PRODUCT_SEQ;
DROP SEQUENCE SCOTT.QNA_SEQ;




/* Create Sequences */

CREATE SEQUENCE SCOTT.BOARD_SEQ INCREMENT BY 1 MINVALUE 1 MAXVALUE 9999999999999999999999999999 START WITH 41 CACHE 20;
CREATE SEQUENCE SCOTT.CART_SEQ INCREMENT BY 1 MINVALUE 1 MAXVALUE 9999999999999999999999999999 START WITH 21 CACHE 20;
CREATE SEQUENCE SCOTT.ORDERS_DETAIL_SEQ INCREMENT BY 1 MINVALUE 1 MAXVALUE 9999999999999999999999999999 START WITH 21 CACHE 20;
CREATE SEQUENCE SCOTT.ORDERS_SEQ INCREMENT BY 1 MINVALUE 1 MAXVALUE 9999999999999999999999999999 START WITH 21 CACHE 20;
CREATE SEQUENCE SCOTT.ORDER_DETAIL_SEQ INCREMENT BY 1 MINVALUE 1 MAXVALUE 9999999999999999999999999999 START WITH 21 CACHE 20;
CREATE SEQUENCE SCOTT.PRODUCT_SEQ INCREMENT BY 1 MINVALUE 1 MAXVALUE 9999999999999999999999999999 START WITH 21 CACHE 20;
CREATE SEQUENCE SCOTT.QNA_SEQ INCREMENT BY 1 MINVALUE 1 MAXVALUE 9999999999999999999999999999 START WITH 21 CACHE 20;



/* Create Tables */

CREATE TABLE SCOTT.CART
(
	CSEQ number(10,0) NOT NULL,
	ID varchar2(20 char),
	PSEQ number(5,0),
	QUANTITY number(5,0) DEFAULT 1,
	RESULT char(1 char) DEFAULT '''1''',
	INDATE date DEFAULT SYSDATE		-- 주문일	
,
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
	USEYN char(1 char) DEFAULT '''y''',
	INDATE date DEFAULT sysdate
,
	ADMIN_YN varchar2(4),
	CONSTRAINT SYS_C007161 PRIMARY KEY (ID)
);


CREATE TABLE SCOTT.ORDERS
(
	OSEQ number(10,0) NOT NULL,
	ID varchar2(20 char),
	INDATE date DEFAULT sysdate			-- 주문일
,
	CONSTRAINT SYS_C007167 PRIMARY KEY (OSEQ)
);


CREATE TABLE SCOTT.ORDER_DETAIL
(
	ODSEQ number(10,0) NOT NULL,
	OSEQ number(10,0),
	PSEQ number(5,0),
	QUANTITY number(5,0) DEFAULT 1,
	RESULT char(1 char) DEFAULT '''1''						-- 1:미처리 2:처리
',
	CONSTRAINT SYS_C007186 PRIMARY KEY (ODSEQ)
);


CREATE TABLE SCOTT.PRODUCT
(
	PSEQ number(5,0) NOT NULL,
	PTITLE varchar2(100 char),
	KIND char(1 char),
	AREA varchar2(20),
	PRICE number(7,0) DEFAULT '0',
	PHONE varchar2(20 char),
	PERIOD number(5,0),
	CONTENT_SELLER varchar2(4000),
	CONTENT_BUYER varchar2(4000 char),
	IMAGE varchar2(50 char) DEFAULT '''default.jpg''',
	USEYN char(1 char) DEFAULT '''y''',
	BESTYN char(1 char) DEFAULT '''n''',
	INDATE date DEFAULT sysdate	--등록일
,
	ID varchar2(20 char) NOT NULL,
	CONSTRAINT SYS_C007182 PRIMARY KEY (PSEQ)
);


CREATE TABLE SCOTT.QNA
(
	QSEQ number(5,0) NOT NULL,
	SUBJECT varchar2(300 char),
	CONTENT_BUYER varchar2(4000 char),
	REPLY varchar2(1000 char),
	ID varchar2(20 char),
	REP char(1 char) DEFAULT '''1''',
	INDATE date DEFAULT sysdate			-- 작성일
,
	CONSTRAINT SYS_C007172 PRIMARY KEY (QSEQ)
);



/* Create Views */

CREATE OR REPLACE VIEW SCOTT.BEST_PRO_VIEW AS select pseq, name, price2, image
from( select rownum, pseq, name, price2, image
		from product
		where bestyn = 'y'
		order by indate desc)
where rownum <=4;
CREATE OR REPLACE VIEW SCOTT.CART_VIEW AS select o.cseq, o.id, o.pseq, m.name mname, p.name pname,
o.quantity, o.indate, p.price2, o.result
from cart o, member m, product p
where o.id = m.id and o.pseq = p.pseq
and result = '1';
CREATE OR REPLACE VIEW SCOTT.NEW_PRO_VIEW AS select pseq, name, price2, image
from( select rownum, pseq, name, price2, image
		from product
		where useyn = 'y'
		order by indate desc)
where rownum <=4;
CREATE OR REPLACE VIEW SCOTT.ORDER_VIEW AS select d.odseq odetailseq, o.oseq, o.id, o.indate, d.pseq,d.quantity, m.name mname,
m.zip_num, m.address, m.phone, p.name pname, p.price2, d.result oresult 
from orders o, order_detail d, member m, product p
where o.oseq=d.oseq and o.id = m.id and d.pseq = p.pseq;



