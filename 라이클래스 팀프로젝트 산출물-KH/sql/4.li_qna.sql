-- 4. li_qna

create table li_qna(
qna_no number not null,                    --공지,문의게시판 글번호
admin_no number,                           --관리자 번호
user_no number,                           --03.29 은아 추가. 있어야하는거 맞을까요?
qna_title varchar2(100) not null,          --공지,문의게시판 제목
qna_content varchar2(1000) not null,       --공지,문의게시판 내용
qna_date date default sysdate,             --공지,문의게시판 등록일
qna_date_fix date,                          --공지,문의게시판 수정일
qna_category varchar2(10) not null,        --공지,문의게시판 카테고리
qna_top_state number default 0 not null,   --공지사항,문의사항 구분 및 공지사항 상단 고정 상태값
qna_group number default 0,                          --문의게시판 답변 그룹번호
qna_indent number default 0,                         --문의게시판 답변글의 위치번호
qna_step number default 0,                           --문의게시판 답변글의 계층번호
    constraint li_qna_pk primary key(qna_no),
    constraint li_admin_fk1 foreign key(admin_no) references li_admin(admin_no),
    constraint li_admin_fk2 foreign key(user_no) references li_user(user_no) --03.29 은아 추가. 있어야하는거 맞을까요?
);  

commit;

select * from li_qna;

comment on table li_qna is '공지, 문의게시판';
comment on column li_qna.qna_no is '공지, 문의게시판 글번호';
comment on column li_qna.user_no is '문의게시판 작성회원번호'; --03.29 은아 추가. 있어야하는거 맞을까요?
comment on column li_qna.qna_title is '공지, 문의게시판 제목';
comment on column li_qna.qna_content is '공지, 문의게시판 내용';
comment on column li_qna.qna_date is '공지, 문의게시판 등록일';
comment on column li_qna.qna_date_fix is '공지, 문의게시판 수정일';
comment on column li_qna.qna_category is '공지사항,문의사항 카테고리';
comment on column li_qna.qna_top_state is '공지사항,문의사항 구분 및 공지사항 상단 고정 상태값';
comment on column li_qna.qna_group is '문의게시판 답변 그룹번호';
comment on column li_qna.qna_indent is '문의게시판 답변글의 위치번호';
comment on column li_qna.qna_step is '문의게시판 답변글의 계층번호';


-- 03.29 은아 수정) 임의로 9개를 넣고 시작해야하므로 start with 10로 해봅니다.

create sequence li_qna_seq
start with 10
increment by 1
minvalue 1
nocycle
cache 2;

-- 23.03.29 은아 추가
-- qna_no 번호 통일을 위해 여기서는 시퀀스를 사용하지않겠습니다.
-- 회원별 3개씩 문의글 만들어봅니다.
-- not null 컬럼 qna_top_state 우선 0으로 넣었는데 맞을까요?

insert into li_qna(qna_no,admin_no,user_no,qna_title,qna_content,qna_category,qna_top_state)
values(1,1,2303291111,'testQnaTitle1','testQnaContent1','문의','0');

insert into li_qna(qna_no,admin_no,user_no,qna_title,qna_content,qna_category,qna_top_state)
values(2,1,2303291111,'testQnaTitle2','testQnaContent2','문의','0');

insert into li_qna(qna_no,admin_no,user_no,qna_title,qna_content,qna_category,qna_top_state)
values(3,1,2303291111,'testQnaTitle3','testQnaContent3','문의','0');

insert into li_qna(qna_no,admin_no,user_no,qna_title,qna_content,qna_category,qna_top_state)
values(4,1,2303292222,'testQnaTitle4','testQnaContent4','문의','0');

insert into li_qna(qna_no,admin_no,user_no,qna_title,qna_content,qna_category,qna_top_state)
values(5,1,2303292222,'testQnaTitle5','testQnaContent5','문의','0');

insert into li_qna(qna_no,admin_no,user_no,qna_title,qna_content,qna_category,qna_top_state)
values(6,1,2303292222,'testQnaTitle6','testQnaContent6','문의','0');

insert into li_qna(qna_no,admin_no,user_no,qna_title,qna_content,qna_category,qna_top_state)
values(7,1,2303293333,'testQnaTitle7','testQnaContent7','문의','0');

insert into li_qna(qna_no,admin_no,user_no,qna_title,qna_content,qna_category,qna_top_state)
values(8,1,2303293333,'testQnaTitle8','testQnaContent8','문의','0');

insert into li_qna(qna_no,admin_no,user_no,qna_title,qna_content,qna_category,qna_top_state)
values(9,1,2303293333,'testQnaTitle9','testQnaContent9','문의','0');

