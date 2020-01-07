
-- 할일 목록을 저장할 todo 테이블 
create table todo(
num number primary key,
content varchar2(50) not null,
regdate date);

-- todo 테이블에 num 에 순서대로 숫자를 넣기 위한 시퀀스
create sequence todo_seq;