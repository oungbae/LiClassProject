-- ��Ʃ��� ���̺�
create table li_studio(
    s_no number(20) not null, --��Ʃ����Խ��� �۹�ȣ
    ct_bizno varchar2(30) not null, --����ڵ�Ϲ�ȣ
    s_title varchar2(300) not null, --��Ʃ����Խ��� ����
    s_content varchar2(700) not null, --��Ʃ����Խ��� ����
    s_date date default sysdate, --��Ʃ����Խ��� �ۼ���
    s_thumb varchar2(700), --��Ʃ����Խ��� �����
    s_file varchar2(700), --��Ʃ����Խ��� ���ϸ�

    constraint li_studio_pk primary key(s_no),
    constraint li_studio_fk foreign key(ct_bizno)
                               references li_center(ct_bizno)

);


--drop table li_studio;
--drop sequence li_studio_seq;

comment on table li_studio is '��Ʃ��� ���̺�';
comment on column li_studio.s_no is '��Ʃ����Խ��� �۹�ȣ';
comment on column li_studio.ct_bizno is '����ڵ�Ϲ�ȣ';
comment on column li_studio.s_title is '��Ʃ����Խ��� ����';
comment on column li_studio.s_content is '��Ʃ����Խ��� ����';
comment on column li_studio.s_date is '��Ʃ����Խ��� �ۼ���';
comment on column li_studio.s_thumb is '��Ʃ����Խ��� �����';
comment on column li_studio.s_file is '��Ʃ����Խ��� ���ϸ�';

INSERT INTO li_studio(s_no, ct_bizno, s_title, s_content, s_thumb, s_file)
    VALUES(1, '6670500768', '����������ũ ȫ��', '�ν�Ÿ @soosoo_cake

��������ũ / ��������ũ / ����ӱ��ö�� / �����ʶ�

??Gwangmyeong, Korea (��⵵ ���� 7ȣ�� ö�꿪)
??KFDA 1�� ����
??�ӱ��ö�� ����/������ Ŭ���� � �� �Ǹ�
??�� ������Ŭ���� �
??����??īī���� �÷���ģ�� ��������ũ (dm??)
pf.kakao.com/_xiDAxlxl', 'thumbnail_studio_1680068537446_soosoo.png', 'studio_1680068537446_soosoo.png');

INSERT INTO li_studio(s_no, ct_bizno, s_title, s_content, s_thumb, s_file)
    VALUES(2, '6538102174', '���� ȫ��', '��ö ����� ������� ���� ����û �Դϴ�.
�������� ���ż� �Բ� �������� ��������?', 'thumbnail_studio_1680068580449_����.png', 'studio_1680068580449_����.png');
    
INSERT INTO li_studio(s_no, ct_bizno, s_title, s_content, s_thumb, s_file)
    VALUES(3, '4121097783', '������� ȫ��', '�ٴ����� �ٱ��� ������� �ݶ�
���ż� �Բ� �����ƿ�', 'thumbnail_studio_1680068614488_hellohappy.jpg', 'studio_1680068614488_hellohappy.jpg');

INSERT INTO li_studio(s_no, ct_bizno, s_title, s_content, s_thumb, s_file)
    VALUES(4, '8177000186', '�����̵� �������� ȫ��', '�Բ� ���� ���� �����ƿ�',
    'thumbnail_studio_1680068691710_�����̵�.jpg', 'studio_1680068691710_�����̵�.jpg');
    
INSERT INTO li_studio(s_no, ct_bizno, s_title, s_content, s_thumb, s_file)
    VALUES(5, '1113274803', '����õ���� �����ƶ㸮�� ȫ��', '�ν�Ÿ @thebom_atelier

����õ���� �����ƶ㸮��
�����ƶ㸮��
����õ����
����õ ������
����õ ĵ��/��ǻ��/���������/�ö��ĵ��
õ����/õ��ȭ��ǰ/���/õ���Կ���
������Ŭ����
���/�ڰ���/â������
��ü����/���ǰ/���׸����ǰ
��ü����/����Ⱝ
īī��ID:�����ƶ㸮��
linktr.ee/thebom_atelier', 'thumbnail_studio_1680068799843_�����ƶ㸮��.png', 'studio_1680068799843_�����ƶ㸮��.png');

INSERT INTO li_studio(s_no, ct_bizno, s_title, s_content, s_thumb, s_file)
    VALUES(6, '1011445141', '�̱��Ѱ� ȫ��', '�ν�Ÿ : @chewymill

??????????????? | �ڵ���̵� ���� | ��̻�Ȱ DIY
���� ���� �� �׸���ũ
? ���� �̱��� Ű��Ʈ ��̻�Ȱ
? ��ģ ���� �������ִ� ���� ģ����
? �ε�ĩ ����ִ� �ڵ���̵� DIY
?
? Kidult Brand��@wittypixy
? Made by��@choran_log
-
linktr.ee/chewymill', 'thumbnail_studio_1680068852892_�̱��Ѱ�.png', 'studio_1680068852892_�̱��Ѱ�.png');

INSERT INTO li_studio(s_no, ct_bizno, s_title, s_content, s_thumb, s_file)
    VALUES(7, '0200600028', '��������ring ȫ��', '�ν�Ÿ : @iam_your_ring
Yes, I AM
#�÷��̸��Ű�� #�ø�Ű�� #����Ű�� #�½�Ű�� #��Ƽ������#�÷��̸��??
?Ŭ�������Ǵ� DM Ȥ�� ī�� ���!
?���Ź��ǵ� DM Ȥ�� ī�� ���!
?īī���÷���ģ���� yes_iam �̿���.
?���̵��,������ ������� �մϴ�?
m.smartstore.naver.com/iam_your_ring', 'thumbnail_studio_1680068887485_��������.png', 'studio_1680068887485_��������.png');
    
INSERT INTO li_studio(s_no, ct_bizno, s_title, s_content, s_thumb, s_file)
    VALUES(8, '2299012336', '�޺�� ȫ��', '�ν�Ÿ @kkooomblooom

��⵵ ������ �߿��� �ݱ����� ��ġ�� �����, ��Ʈ ��Ʃ��� �Դϴ�.
�Ҽ������� ���ڱ� ������ �̼� ������ �̷������  ���������� ������ �����Դϴ�. ;)', 'thumbnail_studio_1680068932139_�޺��.png', 'studio_1680068932139_�޺��.png');

INSERT INTO li_studio(s_no, ct_bizno, s_title, s_content, s_thumb, s_file)
    VALUES(9, '1641100542', '�Ӻ�������Ʈ��Ʃ��� ȫ��', '�ν�Ÿ @anverscake

?���͸�����ũŬ����/�����η��͸�����ũ/�Ӻ�������ũ

?[����������ũ] �Ⱓ
?? ���͸�����ũâ��Ŭ����
?? Ŀ��������ũ�����ֹ�����(��.�� �޹�)
�����а���� �ż��ϰ� ���� ����ũ
010.9978.4684 (īī����anvers)
?�����ν� ������ 28���� 5 .1��
?[����������ũ]å �¶��α���
?
link.inpock.co.kr/anverscake', 'thumbnail_studio_1680069012758_�Ӻ�������Ʈ��Ʃ���.png', 'studio_1680069012758_�Ӻ�������Ʈ��Ʃ���.png');



--��Ʃ��� ���̺� ������
create sequence li_studio_seq
start with 10
increment by 1
minvalue 1
nocycle
nocache;


select * from li_studio;