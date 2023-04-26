--2. li_center

-- ���� ���̺�
create table li_center(
    ct_bizno varchar2(30) not null,    --����ڵ�Ϲ�ȣ
    ct_name varchar2(50) not null,     --���͸�
    ct_opbiz_ym varchar2(20) not null,   --���Ͱ������
    ct_intro clob not null,   --���� �Ұ�
    ct_mainart clob not null,  --���� �ֿ���ǰ
    ct_zipno number(10) not null,     --���� �����ȣ
    ct_addr clob not null,    --���� �ּ�
    ct_detail_addr clob not null, --���� ���ּ�
    ct_tel varchar2(30), --���� ��ǥ��ȭ
    ct_hmpg_addr varchar2(700), --���� Ȩ�������ּ�
    ct_date date default sysdate not null, --���� �����

    constraint li_center_pk primary key(ct_bizno)
);

select * from li_center;

--drop table li_center;

comment on table li_center is '���� ���̺�';
comment on column li_center.ct_bizno is '����ڵ�Ϲ�ȣ';
comment on column li_center.ct_name is '���͸�';
comment on column li_center.ct_opbiz_ym is '���Ͱ������';
comment on column li_center.ct_intro is '���� �Ұ�';
comment on column li_center.ct_mainart is '���� �ֿ���ǰ';
comment on column li_center.ct_zipno is '���� �����ȣ';
comment on column li_center.ct_addr is '���� �ּ�';
comment on column li_center.ct_detail_addr is '���� ���ּ�';
comment on column li_center.ct_tel is '���� ��ǥ��ȭ';
comment on column li_center.ct_hmpg_addr is '���� Ȩ�������ּ�';
comment on column li_center.ct_date is '���� �����';

select * from li_center;