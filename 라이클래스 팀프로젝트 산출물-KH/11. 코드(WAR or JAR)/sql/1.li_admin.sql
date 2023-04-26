-- 1. li_admin

create table li_admin(              --관리자 계정
 admin_no number not null,          --관리자 번호
 admin_id varchar2(50) not null,    --관리자 아이디
 admin_pw varchar2(40) not null,    --관리자 비밀번호
 admin_name varchar2(30) not null,  --관리자 이름
 admin_email varchar2(40) not null,  --관리자 이메일
 
 constraint li_admin_pk primary key(admin_no)
);


alter table li_admin modify (admin_name varchar2(30));


-- 03.29 은아 수정) 임의로 1을 넣고 시작해야하므로 start with 2로 해봅니다.
create sequence li_admin_seq
start with 2
increment by 1
minvalue 1
nocycle
cache 2;

comment on table li_admin is '관리자 계정 테이블';
comment on column li_admin.admin_no is '관리자 번호' ;
comment on column li_admin.admin_id is '관리자 아이디';
comment on column li_admin.admin_pw is '관리자 비밀번호';
comment on column li_admin.admin_name is '관리자 이름';
comment on column li_admin.admin_email is '관리자 이메일';

-- admin_no 번호 통일을 위해 여기서는 시퀀스를 사용하지않겠습니다.
insert into li_admin(admin_no, admin_id, admin_pw, admin_name, admin_email)
values(1, 'li_admin', 'admin1234', '최고관리자', 'Liclass_Admin@liclass.co.kr');

select * from li_admin;