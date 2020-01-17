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
		where writer LIKE '%gura%'	--키워드 검색. =>동적쿼리로 처리. (생길 수도 있고 없을 수도 있고.)
		order by num desc) result1)
where rnum between ? and ?;			--몇번 페이지인지

create table board_file(
num number primary key,
writer varchar2(100),
title varchar2(100) not null,
orgFileName varchar2(100) not null,	-- 원본 파일명
saveFileName varchar2(100) not null, -- 파일 시스템에 저장된 파일명
fileSize number, -- 파일의 크기(byte)
downCount number default 0, -- 다운로드 횟수
regdate date
);

create sequence board_file_seq;