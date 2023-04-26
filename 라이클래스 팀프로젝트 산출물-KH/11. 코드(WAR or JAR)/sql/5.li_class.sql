-- 5. li_class

-- Ŭ����(Li_Class)���� (update 23.03.23)                                                     
create table li_class (
	c_no number not null,                   --Ŭ���� ��ȣ
    ct_bizno varchar2(30) not null,         --����� ��Ϲ�ȣ
    c_title varchar2(1000) not null,        --Ŭ���� ����
    c_content clob not null,                --Ŭ���� �Ұ���
    c_category varchar2(10) not null,       --Ŭ���� ī�װ� ( 0.����, 1.�丮, 2.�̼�, 3.�ö��, 4.��Ƽ, 5.ü��ױ�Ÿ )
    c_level varchar2(3) not null,           --Ŭ���� ���̵�
    c_area varchar2(100) not null,          --Ŭ���� ����
    c_luv number default 0 not null,        --Ŭ���� ���ɼ�
    c_leadtime number not null,             --Ŭ���� �ҿ�ð�
    c_maxcnt number not null,               --Ŭ���� �ִ��ο�
    c_mincnt number default 1 not null,     --Ŭ���� �ּ��ο�
    c_date date default sysdate not null,   --Ŭ���� �������
    c_state number default 0 not null,      --Ŭ���� ���� ( 0:��ϿϷ�/���డ��, 1:����/����Ұ� )
   	constraint li_class_pk primary key(c_no),
   	constraint li_class_fk foreign key(ct_bizno) references li_center(ct_bizno)
);
comment on table li_class is 'Ŭ���� ���̺�';
comment on column li_class.c_no is 'Ŭ���� ��ȣ';
comment on column li_class.c_title is 'Ŭ���� ����';
comment on column li_class.c_content is 'Ŭ���� �Ұ���';
comment on column li_class.c_category is 'Ŭ���� ī�װ�';
comment on column li_class.c_level is 'Ŭ���� ���̵�';
comment on column li_class.c_area is 'Ŭ���� ����';
comment on column li_class.c_luv is 'Ŭ���� ���ɼ�';
comment on column li_class.c_leadtime is 'Ŭ���� �ҿ�ð�';
comment on column li_class.c_maxcnt is 'Ŭ���� �ִ��ο�';
comment on column li_class.c_mincnt is 'Ŭ���� �ּ��ο�';
comment on column li_class.c_date is 'Ŭ���� �������';

-- 03.29 ���� ����) ���Ƿ� 10�� ������ �ְ� �����ؾ��ϹǷ� start with 11�� �غ��ϴ�.
--Ŭ���� ��ȣ ������
create sequence li_class_seq
increment by 1
start with 11
minvalue 1
nocycle
nocache;

-- 23.03.29 ���� �߰�
-- ���� Ŭ���� 10��
-- c_no ��ȣ ������ ���� ���⼭�� �������� ��������ʰڽ��ϴ�.
--1. 
insert into li_class ( c_no, ct_bizno, c_title, c_content, c_category, c_level, c_area, c_leadtime, c_maxcnt)
values(1, 8584400500, '������ �ݼ��� �Ǵ� ��������� �ö�� �ɴٹ� ������ Ŭ����', '�����ϱ⵵ ���� �����Կ�, ����̴� ���� �� �����Կ� ��ǰ���ε� ���ӻ��� ���� �ɴٹ��� ������.
�õ��� �ʵ��� ����ó���� ��������� �ö�� �ɴٹ��� ���� �ְų� ���ŷο� ���� ���̵� �����Ⱓ �̻ڰ� �� �� �־ ���׸��� ��ǰ���ε� ����� Ư���� �ǹ��� �����̶�� �õ�ų� ������ �ʾƼ� �޴� ���� 
�������� ������ �� �ֽ��ϴ�. ���������� Ư���� ������ �ְ� �ʹٸ� ����� ������ �������� ��� ���� ����� ������. ����̴� ������ ���� �Կ� ��ǰ���� ģ����� �Բ� �غ��Ͻø� ���� �߾��� �ǰ�����?',
3, '��', '��� ������', 1, 6);

--2.
insert into li_class ( c_no, ct_bizno, c_title, c_content, c_category, c_level, c_area, c_leadtime, c_maxcnt)
values(2, 8466400320, 'Ȩī���� ����, �ڵ�帳 ������ Ŭ����', 
'Ȩī���� ����.. ���ΰ��� ���� ���ְ� �����ϴ� ������� �ڵ�帳 ������ Ŭ����! ���� ������ ������~!
����, �پ��� ������, Ŀ�ǿ� �����ִ� �е��� ������ �����Ͻ� �� �ֽ��ϴ�!
�߰ſ� ���� �ٷ��� �ϰ� Ŀ���� Ư���� ����л� �̻� ������ �����մϴ�. �ݷ������� �Բ� ���������� �Ұ��մϴ�.
�ٸ���¥�� ������ ���Ͻô� ��� ������ �޼����� ������ �ּ���~������ �ð��� �ִ��� ����帮�� �ֽ��ϴ�~!
(�ָ������� ���Ͻ� ��� �޼����� �����ּ���)',
1, '��', '��� ���ν�', 2, 4);

--3.
insert into li_class ( c_no, ct_bizno, c_title, c_content, c_category, c_level, c_area, c_leadtime, c_maxcnt)
values(3, 1304758832, '������ ����, �ó��� ĵ��, �ν�Ÿ�� �����', 
'�ڿ������� ���� �ִ� �ó���ĵ��, �ν�Ÿ�� Ŭ������ �Ұ��� �帳�ϴ�.
-�ó��� ĵ��
�Ĺ��� ���̿ν��� ĵ���� ����� �ó��� ��ƽ�� ������ö���� ����� ĵ���� ���ϴ´�� �ٸ纸�� �� �ִ� Ŭ�����Դϴ�. 
���� �����̳ʿ� ����� ����Ͻñ⿡�� ���� ĵ���̿���. :)
-�ó��� �ν�Ÿ��
õ�� �ν��� �ж�(����ν�)�� �ν� Ÿ���� ����� �ó��� ��ƽ�� ������ö���� ���ڰ� �ٸ纾�ϴ�.
�ν�Ÿ���� ���ϴ� ���� �ɾ�ΰ� �������ε� ����� �� �־��. ���� ���� ���� ���� ���׸��� ��ǰ ������ ������ �Ѵ�ϴ�. :)',
0, '��', '��� ��õ��', 2, 4);

--4.
insert into li_class ( c_no, ct_bizno, c_title, c_content, c_category, c_level, c_area, c_leadtime, c_maxcnt)
values( 4, 6306200298, '���� ���ǰ���� �� ������ ��ǰ �������� (�۽��� 50�̸�)', 
'���� �ϳ��ۿ� ���� ��ǰ ��������⸦ �����ϼ���..
- ��ǰ����� ���̽��� �ҿ��ϰ� ������ �� 30���� �߿� �߰��Ͽ� ���󿡼� �ϳ����� ����� ���� �� �ֽ��ϴ�.
+ ��� ���� �� �����۷� ����ó�� �̿��� �� �ְ� ���������
+ Ŭ���� ������ ���� ���� �ڲڲ� �湮�ϽǶ����� ������ ������ϴ�.
+ Ŭ���� ���� �� �Ȱ��� ���� �� ����ʹٸ�, �ù�� �߼� �����ϴٴ� ��!',
4, '��', '��� �Ⱦ��', 1, 4);

--5.
insert into li_class ( c_no, ct_bizno, c_title, c_content, c_category, c_level, c_area, c_leadtime, c_maxcnt)
values( 5, 1352837035, '�������� ���� ���� ����� ŰƮ �����', 
'���� ���� ���� ����, 4��! ���� �¾� ������ ��ȹ�ϰ� �ִ� ����Ŭ���� �������� �ֳ���? �����̴� ������ ����� �Ϻ��ϰ� ������� ������ �����ǰ����
���� ����� ����ϸ鼭 �߾��� �׾ƺ� �� �־��.',
0, '��', '��⵵ ������', 2, 6);

--6.
insert into li_class ( c_no, ct_bizno, c_title, c_content, c_category, c_level, c_area, c_leadtime, c_maxcnt)
values(6, 6306200298, '��Ȱ �� ��ǰ�� ����, �� �� �� �� �������ڼ� Ŭ����', 
'�������ڼ����� ���� ����ϴ� ��Ƽġ �����
����� �����θ�, Ŭ������ ���� ���Ŀ���
ȥ�ڼ� ������ �� �ִ� �ڽŰ��� ���� �ſ���.�������ڼ� Ŭ��������
��Ʋ�� �⺻ ��� ���� �� ���� �ŵ��������
�������� �˷��帱�Կ�.',
0, '��', '��⵵ �����ν�', 1, 4);

--7.
insert into li_class ( c_no, ct_bizno, c_title, c_content, c_category, c_level, c_area, c_leadtime, c_maxcnt)
values( 7, 8466400320, 'Ȩ��Ƽ ������ �׸�! ������� ���� �丮 Ŭ����', 
'������� ���� �丮 Ŭ����,�丮�� �ٽ����� ����!
Į���� �� ��������.���ʺ��� źź�ϰ� �˷��帳�ϴ�:),���� 8�� ��,
�������뷯 ���̽� �۰����� �˷��ִ� ������ ������!���� �ϸ� �ݼ� �ϼ��Ǵ� �ٻ��� �丮���,
Ȩ��Ƽ ���� ���̻� ����� ���� �ſ���',
1, '��', '��⵵ �ǿս�', 2, 7);

--8.
insert into li_class ( c_no, ct_bizno, c_title, c_content, c_category, c_level, c_area, c_leadtime, c_maxcnt)
values( 8, 2885600271, '�̷� ���װ����� ó���̾�, ���� ����ȭ Ŭ����', 
'�������� �ƴ� ��ΰ� ����
�ڽŸ��� ����ȭ�� ����� �� �� �ֵ���
���ʺ��� �Ĳ��ϰ� �˷��帮��,
������ �������� ������ô� ���� ����� ����
������ �Ź��� �տ� �������� �ſ���. �Ź��� �������� ������?�� ������ ������ ������
������ �����
��ü���� ���ϰ� õ�� �� ������ �����
�縻�� ���� �� ����� ��ȭ����
������ �� ���� �ſ���!',
0, '��', '��⵵ ������', 2, 6);

--9.
insert into li_class ( c_no, ct_bizno, c_title, c_content, c_category, c_level, c_area, c_leadtime, c_maxcnt)
values( 9, 8961600886, '�����̾� ����� ���ø��� ������ �����', 
'���� ��� ������ø�������� ����� ������ Ŭ���� �Դϴ�
���� ���̸� �� �� ���� ������ ����� ���� �⿡ ���ϴ� ���� ����� ������ ������� ���� �߰��ϰ� �˴ϴ�.���� ���� ���������� ������ �ϰ� ������ �е�
���� ����� ���� ������ �е�
������ ����� �ڵ� ���̵尡 ������ �е鿡�� ��õ�մϴ�.',
1, '��', '��⵵ ������', 2, 8);

--10.
insert into li_class ( c_no, ct_bizno, c_title, c_content, c_category, c_level, c_area, c_leadtime, c_maxcnt)
values(10, 6670500768, '������ ���� ������ ���̾�Ʈ ������ġ', 
'������ġ ������� ��ä�� �����ϼ̴ٰ� �õ�� ���ȴ� ��� ��������?
����, ��ä �Ƴ��� ���� ���� �ֱ�� �ؿ�!
�� ������ ����� �����ϰ� �� �ǰ��ϰ� ���� �� �ִ� ������ġ��
���̾�Ʈ �����ε� �Ǹ��ϰ� ��ä�� �� ���ְ� ��� �� �ֽ��ϴ�.
Ư�� ī�並 ��Ͻô� �е� �߿� ������ġ ǰ���� �߰��ϰ� ������ �е鿡�Ե� ������ �����Դϴ�.
��� ����ó�� ������ �˷������ :)',
1, '��', '��⵵ �����',2, 8);



--********** ���̺� ���泻�� : DDL���� ��� �ݿ��س��ҽ��ϴ�! **********
--�÷� ����(update 23.03.15)
--alter table li_class modify c_title varchar2(1000);
--alter table li_class modify c_level varchar2(3);
--alter table li_class modify c_area varchar2(100);
--alter table li_class modify c_luv number default 0;
--alter table li_class modify ct_bizno varchar2(30);
--Į�� ����(update 23.03.18)
--alter table li_class drop column c_state;
--�������� �߰�(update 23.03.19)
--alter table li_class add constraint li_class_fk foreign key(ct_bizno) references li_center(ct_bizno);
--************************************************************************

--********** sample data **********--
--create or replace procedure class_insert1
--is
--begin
--    for cnt in 1..30 loop
--        insert into li_class ( c_no, ct_bizno, c_title, c_content, c_category, c_level, c_area, c_leadtime, c_maxcnt)
--        values( li_class_seq.nextval, 8584400500, '������ �ݼ��� �Ǵ� ��������� �ö�� �ɴٹ� ������ Ŭ����', '�����ϱ⵵ ���� �����Կ�, ����̴� ���� �� �����Կ� ��ǰ���ε� ���ӻ��� ���� �ɴٹ��� ������.
--        �õ��� �ʵ��� ����ó���� ��������� �ö�� �ɴٹ��� ���� �ְų� ���ŷο� ���� ���̵� �����Ⱓ �̻ڰ� �� �� �־ ���׸��� ��ǰ���ε� ����� Ư���� �ǹ��� �����̶�� �õ�ų� ������ �ʾƼ� �޴� ���� 
--        �������� ������ �� �ֽ��ϴ�. ���������� Ư���� ������ �ְ� �ʹٸ� ����� ������ �������� ��� ���� ����� ������. ����̴� ������ ���� �Կ� ��ǰ���� ģ����� �Բ� �غ��Ͻø� ���� �߾��� �ǰ�����?',
--        3, '��', '��� ������', 1, 6);
--    end loop;
--    commit;
--end;
--/
--show error;
--EXECUTE class_insert1;
--
--create or replace procedure class_insert2
--is
--begin
--    for cnt in 1..30 loop
--        insert into li_class ( c_no, ct_bizno, c_title, c_content, c_category, c_level, c_area, c_leadtime, c_maxcnt)
--        values( li_class_seq.nextval, 8466400320, 'Ȩī���� ����, �ڵ�帳 ������ Ŭ����', 
--        'Ȩī���� ����.. ���ΰ��� ���� ���ְ� �����ϴ� ������� �ڵ�帳 ������ Ŭ����! ���� ������ ������~!
--        ����, �پ��� ������, Ŀ�ǿ� �����ִ� �е��� ������ �����Ͻ� �� �ֽ��ϴ�!
--        �߰ſ� ���� �ٷ��� �ϰ� Ŀ���� Ư���� ����л� �̻� ������ �����մϴ�. �ݷ������� �Բ� ���������� �Ұ��մϴ�.
--        �ٸ���¥�� ������ ���Ͻô� ��� ������ �޼����� ������ �ּ���~������ �ð��� �ִ��� ����帮�� �ֽ��ϴ�~!
--        (�ָ������� ���Ͻ� ��� �޼����� �����ּ���)',
--        1, '��', '��� ���ν�', 2, 4);
--    end loop;
--    commit;
--end;
--/
--show error;
--EXECUTE class_insert2;
--
--
--create or replace procedure class_insert3
--is
--begin
--    for cnt in 1..30 loop
--        insert into li_class ( c_no, ct_bizno, c_title, c_content, c_category, c_level, c_area, c_leadtime, c_maxcnt)
--        values( li_class_seq.nextval, 1304758832, '������ ����, �ó��� ĵ��, �ν�Ÿ�� �����', 
--        '�ڿ������� ���� �ִ� �ó���ĵ��, �ν�Ÿ�� Ŭ������ �Ұ��� �帳�ϴ�.
--        -�ó��� ĵ��
--        �Ĺ��� ���̿ν��� ĵ���� ����� �ó��� ��ƽ�� ������ö���� ����� ĵ���� ���ϴ´�� �ٸ纸�� �� �ִ� Ŭ�����Դϴ�. 
--        ���� �����̳ʿ� ����� ����Ͻñ⿡�� ���� ĵ���̿���. :)
--        
--        -�ó��� �ν�Ÿ��
--        õ�� �ν��� �ж�(����ν�)�� �ν� Ÿ���� ����� �ó��� ��ƽ�� ������ö���� ���ڰ� �ٸ纾�ϴ�.
--        �ν�Ÿ���� ���ϴ� ���� �ɾ�ΰ� �������ε� ����� �� �־��. ���� ���� ���� ���� ���׸��� ��ǰ ������ ������ �Ѵ�ϴ�. :)',
--        0, '��', '��� ��õ��', 2, 4);
--    end loop;
--    commit;
--end;
--/
--show error;
--EXECUTE class_insert3;
--
--create or replace procedure class_insert4
--is
--begin
--    for cnt in 1..30 loop
--        insert into li_class ( c_no, ct_bizno, c_title, c_content, c_category, c_level, c_area, c_leadtime, c_maxcnt)
--        values( li_class_seq.nextval, 6306200298, '���� ���ǰ���� �� ������ ��ǰ �������� (�۽��� 50�̸�)', 
--        '���� �ϳ��ۿ� ���� ��ǰ ��������⸦ �����ϼ���..
--        - ��ǰ����� ���̽��� �ҿ��ϰ� ������ �� 30���� �߿� �߰��Ͽ� ���󿡼� �ϳ����� ����� ���� �� �ֽ��ϴ�.
--        + ��� ���� �� �����۷� ����ó�� �̿��� �� �ְ� ���������
--        + Ŭ���� ������ ���� ���� �ڲڲ� �湮�ϽǶ����� ������ ������ϴ�.
--        + Ŭ���� ���� �� �Ȱ��� ���� �� ����ʹٸ�, �ù�� �߼� �����ϴٴ� ��!',
--        4, '��', '��� �Ⱦ��', 1, 4);
--    end loop;
--    commit;
--end;
--/
--show error;
--EXECUTE class_insert4;
----*************************************************************************************************
--
--select count(*) from li_class;
--select * from li_class order by c_no desc;
