--부대원
create table users
id varchar2(100) primary key,
pwd varchar2(100) not null,
profile varchar2(100),
regdate date;
--게시판 
create table message(
num number primary key,
category varchar2(100),
writer varchar2(100) not null,
title varchar2(100) not null,
content clob,
viewCount number,
regdate date);

--글번호 시퀀스
create sequence message_seq;

--서브쿼리 연습
select * from
(select result1.*, rownum as rnum
from
(select num, category, writer, title, viewCount,regdate
from message
order by num desc) result1)
where num between ? and ?
