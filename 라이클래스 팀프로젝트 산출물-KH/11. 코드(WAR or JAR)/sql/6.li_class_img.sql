--6.li_class_img

--Ŭ���� �̹���(Li_Class_img)      (update 23.03.23)
create table li_class_img (
    c_img_no number not null,                            --������ȣ
    c_no number not null,                                --Ŭ���� ��ȣ
    c_img_file varchar2(500) not null,                   --�̹��� �̸�
    thumb_file varchar2(500) not null,                   --����� �̸�
    c_img_date date default sysdate not null,            --�̹��� �����
    constraint li_class_img_pk primary key(c_img_no),
    constraint li_class_img_uk unique(c_img_file),
    constraint li_class_img_fk foreign key(c_no) references li_class(c_no)
);
comment on table li_class_img is 'Ŭ���� �̹��� ���̺�';
comment on column li_class_img.c_img_file is '�̹��� �̸�';
comment on column li_class_img.thumb_file is '����� �̸�';
comment on column li_class_img.c_img_date is '�̹��� �����';

-- 03.29 ���� ����) ���Ƿ�1~18�� �ְ� �����ؾ��ϹǷ� start with 19�� �غ��ϴ�.

--���� ��ȣ ������
create sequence li_class_img_seq
increment by 1
start with 11
minvalue 1
nocycle
nocache;

--********** ���̺� ���泻�� : DDL���� ��� �ݿ��س��ҽ��ϴ�! **********
--alter table li_class_img drop constraint LI_CLASS_IMG_UK2;
--************************************************************************
select * from li_class_img;



-- 23.03.29 ���� �߰�
-- c_img_no ��ȣ ������ ���� ���⼭�� �������� ��������ʰڽ��ϴ�.
--c_no 1�� �̹��� 3��.
insert into li_class_img(c_img_no,c_no,thumb_file,c_img_file)
values(1,1,'thumbnail_class_1629551284217_�ö��1.jpg','class_1629551284217_�ö��1.jpg');
insert into li_class_img(c_img_no,c_no,thumb_file,c_img_file)
values(2,1,'thumbnail_class_1629551284317_�ö��2.jpg','class_1629551284317_�ö��2.jpg');
insert into li_class_img(c_img_no,c_no,thumb_file,c_img_file)
values(3,1,'thumbnail_class_1629521284217_�ö��3.jpg','class_1629521284217_�ö��3.jpg');

--c_no 2�� �̹��� 3��.
insert into li_class_img(c_img_no,c_no,thumb_file,c_img_file)
values(4,2,'thumbnail_class_1629551784312_�ڵ�帳1.jpg','class_1629551784312_�ڵ�帳1.jpg');
insert into li_class_img(c_img_no,c_no,thumb_file,c_img_file)
values(5,2,'thumbnail_class_1629551284312_�ڵ�帳2.jpg','class_1629551284312_�ڵ�帳2.jpg');
insert into li_class_img(c_img_no,c_no,thumb_file,c_img_file)
values(6,2,'thumbnail_class_1629551284313_�ڵ�帳3.jpg','class_1629551284313_�ڵ�帳3.jpg');

--c_no 3�� �̹��� 3��.
insert into li_class_img(c_img_no,c_no,thumb_file,c_img_file)
values(7,3,'thumbnail_class_1679551784314_ĵ��1.jpg','class_1679551784314_ĵ��1.jpg');
insert into li_class_img(c_img_no,c_no,thumb_file,c_img_file)
values(8,3,'thumbnail_class_1679551784312_ĵ��2.jpg','class_1679551784312_ĵ��2.jpg');
insert into li_class_img(c_img_no,c_no,thumb_file,c_img_file)
values(9,3,'thumbnail_class_1679551784514_ĵ��3.jpg','class_1679551784514_ĵ��3.jpg');

--c_no 4�� �̹��� 3��.
insert into li_class_img(c_img_no,c_no,thumb_file,c_img_file)
values(10,4,'thumbnail_class_1679551633205_���1.jpg','class_1679551633205_���1.jpg');
insert into li_class_img(c_img_no,c_no,thumb_file,c_img_file)
values(11,4,'thumbnail_class_1679551634012_���2.png','class_1679551634012_���2.png');
insert into li_class_img(c_img_no,c_no,thumb_file,c_img_file)
values(12,4,'thumbnail_class_1679551634013_���3.png','class_1679551634013_���3.png');

--5. 
insert into li_class_img(c_img_no,c_no,c_img_file,thumb_file)
values(13,5,'class5.jpg','thumbnail_class5.jpg');

--6. 
insert into li_class_img(c_img_no,c_no,c_img_file,thumb_file)
values(14,6,'class6.jpg','thumbnail_class6.jpg');

--7. 
insert into li_class_img(c_img_no,c_no,c_img_file,thumb_file)
values(15,7,'class7.jpg','thumbnail_class7.jpg');

--8. 
insert into li_class_img(c_img_no,c_no,c_img_file,thumb_file)
values(16,8,'class8.jpg','thumbnail_class8.jpg');

--9. 
insert into li_class_img(c_img_no,c_no,c_img_file,thumb_file)
values(17,9,'class9.jpg','thumbnail_class9.jpg');

--10. 
insert into li_class_img(c_img_no,c_no,c_img_file,thumb_file)
values(18,10,'class10.jpg','thumbnail_class10.jpg');

