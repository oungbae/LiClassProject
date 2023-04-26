-- 1. li_admin

create table li_admin(              --������ ����
 admin_no number not null,          --������ ��ȣ
 admin_id varchar2(50) not null,    --������ ���̵�
 admin_pw varchar2(40) not null,    --������ ��й�ȣ
 admin_name varchar2(30) not null,  --������ �̸�
 admin_email varchar2(40) not null,  --������ �̸���
 
 constraint li_admin_pk primary key(admin_no)
);


alter table li_admin modify (admin_name varchar2(30));


-- 03.29 ���� ����) ���Ƿ� 1�� �ְ� �����ؾ��ϹǷ� start with 2�� �غ��ϴ�.
create sequence li_admin_seq
start with 2
increment by 1
minvalue 1
nocycle
cache 2;

comment on table li_admin is '������ ���� ���̺�';
comment on column li_admin.admin_no is '������ ��ȣ' ;
comment on column li_admin.admin_id is '������ ���̵�';
comment on column li_admin.admin_pw is '������ ��й�ȣ';
comment on column li_admin.admin_name is '������ �̸�';
comment on column li_admin.admin_email is '������ �̸���';

-- admin_no ��ȣ ������ ���� ���⼭�� �������� ��������ʰڽ��ϴ�.
insert into li_admin(admin_no, admin_id, admin_pw, admin_name, admin_email)
values(1, 'li_admin', 'admin1234', '�ְ������', 'Liclass_Admin@liclass.co.kr');

select * from li_admin;