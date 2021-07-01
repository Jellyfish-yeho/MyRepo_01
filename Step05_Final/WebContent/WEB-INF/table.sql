-- 사용자(회원)정보를 저장할 테이블
create table users(
  id varchar2(100) primary key,
  pwd varchar2(100) not null,
  email varchar2(100),
  profile varchar2(100), --프로필 이미지 경로를 저장할 칼럼
  regdate date --가입일
); se

--게시글을 저장할 테이블
create table board_cafe(
	num number primary key, --글번호
	writer varchar2(100) not null, --작성자(로그인된 아이디)
	title varchar2(100) not null, --제목
	content clob, --글 내용
	viewCount number, --조회수
	regdate date --글 작성일
);
--게시글의 번호를 얻어낼 시퀀스
create sequence board_cafe_seq;

-- 업로드된 파일의 정보를 저장할 테이블
CREATE TABLE board_file(
   num NUMBER PRIMARY KEY,
   writer VARCHAR2(100) NOT NULL,
   title VARCHAR2(100) NOT NULL,
   orgFileName VARCHAR2(100) NOT NULL, -- 원본 파일명
   saveFileName VARCHAR2(100) NOT NULL, -- 서버에 실제로 저장된 파일명
   fileSize NUMBER NOT NULL, -- 파일의 크기 
   regdate DATE
);

CREATE SEQUENCE board_file_seq; 

CREATE TABLE board_cafe_comment(
   num NUMBER PRIMARY KEY, --댓글의 글번호
   writer VARCHAR2(100), --댓글 작성자의 아이디
   content VARCHAR2(500), --댓글 내용
   target_id VARCHAR2(100), --댓글의 대상자 아이디
   ref_group NUMBER,
   -- 게시글 내의 댓글은 모두 같은 ref_group 번호를 가지고 있음.
   comment_group NUMBER,
   -- 원 댓글 각각이 하나의 comment_group. 대댓글은 이 그룹 하나의 자식 요소. 
   -- 들여쓰기 여부: ref_group = comment_group 확인
   deleted CHAR(3) DEFAULT 'no',
   -- 삭제 시 yes로 변경, "삭제된 댓글입니다" 출력 
   -- (부모 댓글이 삭제될 시 계층관계 어긋남)
   regdate DATE
);

CREATE SEQUENCE board_cafe_comment_seq;