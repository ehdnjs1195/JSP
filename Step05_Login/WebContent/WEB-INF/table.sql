create table users
(id varchar2(30) primary key,
pwd varchar2(20) not null,
email varchar2(30),
regdate date);

create table board_cafe(
num number primary key,
writer varchar2(100) not null,	-- 글 작성자의 id
title varchar2(100) not null,	
content clob,
viewCount number,	--조회수
regdate date
);

create sequence board_cafe_seq;

--특정 페이지 가져오는 방법--
select * 							--3.page를 select한다.
from
	(select result1.*, ROWNUM as rnum	--2.번호부여하고
	from
		(select num,writer,title	--1.줄세우고
		from board_cafe
		order by num desc) result1)
where rnum between 6 and 10;