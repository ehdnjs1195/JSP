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