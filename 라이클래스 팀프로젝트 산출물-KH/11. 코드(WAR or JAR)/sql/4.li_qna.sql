-- 4. li_qna

create table li_qna(
qna_no number not null,                    --����,���ǰԽ��� �۹�ȣ
admin_no number,                           --������ ��ȣ
user_no number,                           --03.29 ���� �߰�. �־���ϴ°� �������?
qna_title varchar2(100) not null,          --����,���ǰԽ��� ����
qna_content varchar2(1000) not null,       --����,���ǰԽ��� ����
qna_date date default sysdate,             --����,���ǰԽ��� �����
qna_date_fix date,                          --����,���ǰԽ��� ������
qna_category varchar2(10) not null,        --����,���ǰԽ��� ī�װ�
qna_top_state number default 0 not null,   --��������,���ǻ��� ���� �� �������� ��� ���� ���°�
qna_group number default 0,                          --���ǰԽ��� �亯 �׷��ȣ
qna_indent number default 0,                         --���ǰԽ��� �亯���� ��ġ��ȣ
qna_step number default 0,                           --���ǰԽ��� �亯���� ������ȣ
    constraint li_qna_pk primary key(qna_no),
    constraint li_admin_fk1 foreign key(admin_no) references li_admin(admin_no),
    constraint li_admin_fk2 foreign key(user_no) references li_user(user_no) --03.29 ���� �߰�. �־���ϴ°� �������?
);  

commit;

select * from li_qna;

comment on table li_qna is '����, ���ǰԽ���';
comment on column li_qna.qna_no is '����, ���ǰԽ��� �۹�ȣ';
comment on column li_qna.user_no is '���ǰԽ��� �ۼ�ȸ����ȣ'; --03.29 ���� �߰�. �־���ϴ°� �������?
comment on column li_qna.qna_title is '����, ���ǰԽ��� ����';
comment on column li_qna.qna_content is '����, ���ǰԽ��� ����';
comment on column li_qna.qna_date is '����, ���ǰԽ��� �����';
comment on column li_qna.qna_date_fix is '����, ���ǰԽ��� ������';
comment on column li_qna.qna_category is '��������,���ǻ��� ī�װ�';
comment on column li_qna.qna_top_state is '��������,���ǻ��� ���� �� �������� ��� ���� ���°�';
comment on column li_qna.qna_group is '���ǰԽ��� �亯 �׷��ȣ';
comment on column li_qna.qna_indent is '���ǰԽ��� �亯���� ��ġ��ȣ';
comment on column li_qna.qna_step is '���ǰԽ��� �亯���� ������ȣ';


-- 03.29 ���� ����) ���Ƿ� 9���� �ְ� �����ؾ��ϹǷ� start with 10�� �غ��ϴ�.

create sequence li_qna_seq
start with 10
increment by 1
minvalue 1
nocycle
cache 2;

-- 23.03.29 ���� �߰�
-- qna_no ��ȣ ������ ���� ���⼭�� �������� ��������ʰڽ��ϴ�.
-- ȸ���� 3���� ���Ǳ� �����ϴ�.
-- not null �÷� qna_top_state �켱 0���� �־��µ� �������?

insert into li_qna(qna_no,admin_no,user_no,qna_title,qna_content,qna_category,qna_top_state)
values(1,1,2303291111,'testQnaTitle1','testQnaContent1','����','0');

insert into li_qna(qna_no,admin_no,user_no,qna_title,qna_content,qna_category,qna_top_state)
values(2,1,2303291111,'testQnaTitle2','testQnaContent2','����','0');

insert into li_qna(qna_no,admin_no,user_no,qna_title,qna_content,qna_category,qna_top_state)
values(3,1,2303291111,'testQnaTitle3','testQnaContent3','����','0');

insert into li_qna(qna_no,admin_no,user_no,qna_title,qna_content,qna_category,qna_top_state)
values(4,1,2303292222,'testQnaTitle4','testQnaContent4','����','0');

insert into li_qna(qna_no,admin_no,user_no,qna_title,qna_content,qna_category,qna_top_state)
values(5,1,2303292222,'testQnaTitle5','testQnaContent5','����','0');

insert into li_qna(qna_no,admin_no,user_no,qna_title,qna_content,qna_category,qna_top_state)
values(6,1,2303292222,'testQnaTitle6','testQnaContent6','����','0');

insert into li_qna(qna_no,admin_no,user_no,qna_title,qna_content,qna_category,qna_top_state)
values(7,1,2303293333,'testQnaTitle7','testQnaContent7','����','0');

insert into li_qna(qna_no,admin_no,user_no,qna_title,qna_content,qna_category,qna_top_state)
values(8,1,2303293333,'testQnaTitle8','testQnaContent8','����','0');

insert into li_qna(qna_no,admin_no,user_no,qna_title,qna_content,qna_category,qna_top_state)
values(9,1,2303293333,'testQnaTitle9','testQnaContent9','����','0');

