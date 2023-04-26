--2. li_center

-- 센터 테이블
create table li_center(
    ct_bizno varchar2(30) not null,    --사업자등록번호
    ct_name varchar2(50) not null,     --센터명
    ct_opbiz_ym varchar2(20) not null,   --센터개업년월
    ct_intro clob not null,   --센터 소개
    ct_mainart clob not null,  --센터 주요작품
    ct_zipno number(10) not null,     --센터 우편번호
    ct_addr clob not null,    --센터 주소
    ct_detail_addr clob not null, --센터 상세주소
    ct_tel varchar2(30), --센터 대표전화
    ct_hmpg_addr varchar2(700), --센터 홈페이지주소
    ct_date date default sysdate not null, --센터 등록일

    constraint li_center_pk primary key(ct_bizno)
);

select * from li_center;

--drop table li_center;

comment on table li_center is '센터 테이블';
comment on column li_center.ct_bizno is '사업자등록번호';
comment on column li_center.ct_name is '센터명';
comment on column li_center.ct_opbiz_ym is '센터개업년월';
comment on column li_center.ct_intro is '센터 소개';
comment on column li_center.ct_mainart is '센터 주요작품';
comment on column li_center.ct_zipno is '센터 우편번호';
comment on column li_center.ct_addr is '센터 주소';
comment on column li_center.ct_detail_addr is '센터 상세주소';
comment on column li_center.ct_tel is '센터 대표전화';
comment on column li_center.ct_hmpg_addr is '센터 홈페이지주소';
comment on column li_center.ct_date is '센터 등록일';

select * from li_center;