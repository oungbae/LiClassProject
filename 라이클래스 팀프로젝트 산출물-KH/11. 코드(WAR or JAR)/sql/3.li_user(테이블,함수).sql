-- 3. li_user (테이블,함수)

-- 사용자(li_user) 
-- (update 23.03.16 - 회원번호 랜덤생성함수 추가)  
-- (update 23.03.22 - 회원프로필사진 default img) 
-- (update 23.03.29 - 코멘트) 
-- (update 23.04.04 - 테이블 및 함수생성, 테스트용 insert 주석)
create table li_user (
	user_no	number NOT NULL,
	user_email varchar2(100) NOT NULL,
	user_pw	varchar2(255) NOT NULL,
	user_name varchar2(30) NOT NULL,
    
	user_tel varchar2(30),
    user_img	clob DEFAULT 'default-profile.png' NOT NULL,
    user_point number DEFAULT 0,
	user_regdate date DEFAULT sysdate NOT NULL,
    user_update date DEFAULT sysdate NOT NULL,
	user_unregdate	date,
	user_status	number	DEFAULT 0 NOT NULL,
    user_type number  DEFAULT 0 NOT NULL ,
    
   	constraint li_user_pk primary key(user_no),
   	constraint li_user_uk unique(user_email)
);

--drop table li_user;
    
comment on table li_user is '회원 테이블';
comment on column li_user.user_no is '회원번호';
comment on column li_user.user_email is '회원이메일';
comment on column li_user.user_pw is '회원비밀번호';
comment on column li_user.user_name is '회원이름';

comment on column li_user.user_tel  is '회원연락처';
comment on column li_user.user_img is '회원프로필사진';
comment on column li_user.user_point is '포인트';

comment on column li_user.user_regdate is '회원가입일자';
comment on column li_user.user_update is '회원수정일자';
comment on column li_user.user_unregdate is '회원탈퇴일자';
comment on column li_user.user_status is '회원계정상태(0:정상회원 1:탈퇴회원)';
comment on column li_user.user_type is '회원계정종류(0:이메일 1:카카오 2:네이버)'; 

--회원번호 생성 함수
CREATE OR REPLACE EDITIONABLE FUNCTION USER_NO_FUNC (sysdate IN date)
RETURN number IS
user_no number;
BEGIN 
  IF sysdate IS NULL OR sysdate = NULL THEN
    user_no := '0000000000';
  ELSE 
      SELECT to_char(sysdate,'YYMMDD') || ROUND(DBMS_RANDOM.VALUE (1000, 9999))
      INTO user_no 
      FROM dual;
  END IF;
  RETURN user_no;
EXCEPTION 
  WHEN OTHERS THEN
    RETURN '0000000000';
END user_no_func;

/

--샘플 데이터
--회원번호 통일을 위해 여기서는 함수를 사용하지 않겠습니다.
--계정상태 탈퇴/일반, 비밀번호 변경일 90일 지난 회원별 샘플입니다.
--비밀번호만료 알림창을 확인하려면 1번샘플 회원으로 로그인해주세요.

--1. 비밀번호 만료회원
--insert into li_user(user_no,user_email,user_pw,user_name,user_tel,user_type,user_regdate,user_update)
--values( '2303291111','test1111@gmail.com','1234','testUser1','01012341234','0','2022/03/29','2022/03/29');

--2. 일반회원
--insert into li_user(user_no,user_email,user_pw,user_name,user_tel,user_type)
--values('2303292222','test2222@gmail.com','1234','testUser2','01012341234','0');

--3. 탈퇴회원
--insert into li_user(user_no,user_email,user_pw,user_name,user_tel,user_type,user_regdate,user_unregdate,user_status)
--values( '2303293333','test3333@gmail.com','1234','testUser3','01012341234','0','2022/03/29','2023/03/28','1');