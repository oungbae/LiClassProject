drop table li_studio;
drop sequence li_studio_seq;

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



comment on table li_studio is '��Ʃ��� ���̺�';
comment on column li_studio.s_no is '��Ʃ����Խ��� �۹�ȣ';
comment on column li_studio.ct_bizno is '����ڵ�Ϲ�ȣ';
comment on column li_studio.s_title is '��Ʃ����Խ��� ����';
comment on column li_studio.s_content is '��Ʃ����Խ��� ����';
comment on column li_studio.s_date is '��Ʃ����Խ��� �ۼ���';
comment on column li_studio.s_thumb is '��Ʃ����Խ��� �����';
comment on column li_studio.s_file is '��Ʃ����Խ��� ���ϸ�';

INSERT INTO li_studio(s_no, ct_bizno, s_title, s_content, s_thumb, s_file)
    VALUES(1, '1070875074', 'â���ٿ� ȫ��', '�ν�Ÿ : https://www.instagram.com/kmhj2008/

â���ٿ��� â������ ������ ����� �귣���Դϴ�.
������ �̿��� ���������� ����� �������
������ �����ϴ� ��� ���� ������� ��ǰ�� ����ϴ�.

â���ٿ�
HOZE�� ���� ���� ������ â�� �귣��
(wood space/ art furniture)
�ּ� : ��⵵ ���� �ϻ꼭�� ����� 101���� 88 ����
������ȭ : 031-921-9701
ī�幮�� : hoze2018
changjodaum.modoo.at', 'thumbnail_studio_1680488578033_â���ٿ�.png', 'studio_1680488578033_â���ٿ�.png');

INSERT INTO li_studio(s_no, ct_bizno, s_title, s_content, s_thumb, s_file)
    VALUES(2, '2298800875', '������ǳ���̵Ǿ� ȫ��', '�ν�Ÿ : https://www.instagram.com/namoopoonggyoung/ 

��⵵ ���� ������ 11�� �� �ֹ� �������� �� ���� ��ī���̸� ���� ���� �������� â���ڸ� �����Ͽ���
������ ������ �������� �ǿ����̰� ưư�ϰ� �� �ʿ��� ������������ �ܰ���� �����ϴ�
���������� �������� �����ϰ� �۾��� �� �ֵ��� �����ϰ� ���������� �غ�Ǿ� �ֽ��ϴ�.
���� ���濡 ���� ���� ����� ���� �̻� ���׸�� ��ź�� ������ ���Ͻô��󱸿�~
���ż� �����غ����� ���������� ����մϴ�~ ^^

m.blog.naver.com/byulsea', 'thumbnail_studio_1680488608386_������ǳ���̵Ǿ�.png', 'studio_1680488608386_������ǳ���̵Ǿ�.png');
    
INSERT INTO li_studio(s_no, ct_bizno, s_title, s_content, s_thumb, s_file)
    VALUES(3, '5934200031', '�񸶳� ���� ȫ��', '�ν�Ÿ : https://www.instagram.com/gganma_gb
������ ������ ��̰� ����� �� �ִ� ���ڱ⸦ ����ϴ�.

������ �����Ͽ� 2016����� ���� ���ڱ� ������ ��ϸ� �񸶳� �����̶�� �귣�带 �����Ͽ�
�񸶳� ���� ������ ��� ���ڱ⸦ �������Ͽ� �����ϰ� �ֽ��ϴ�.sns���� �۾������� �۾����� �ø���
���ڱ⿡ �����ִ� ������ �����ϸ� �¶��ο��� �ַ� ��ǰ�� �Ǹ��ϰ� �ֽ��ϴ�.
���̺���� �۾����� �Ѵܰ� ���ư� �������� ���׸��� �����⿡�񸶳� ������ ���� �� �ֵ���
�׻� Ž���ϸ� �۾��ϰ� �ֽ��ϴ�.', 'thumbnail_studio_1680488148369_�����װ���.png', 'studio_1680488148369_�����װ���.png');

INSERT INTO li_studio(s_no, ct_bizno, s_title, s_content, s_thumb, s_file)
    VALUES(4, '2141127551', '�½����̽� ȫ��', '�ν�Ÿ : https://www.instagram.com/cocoscented/
���ڼ�Ƽ��ĵ��Cocoscentedcandle Design Lab.
�ѱ����ʰ�����ȸKCCA(���ı������)_�Ʒθ��������ĵ������������
����õ����������ȸKNDA_�����ö��ĵ��/�ö����ö��/����Pĵ�鵵���Ʈ��������ڰ�������
����_kakao ID : cocoscentedblog.naver.com/cocoscented',
    'thumbnail_studio_1680488172861_�½����̽�.png', 'studio_1680488172861_�½����̽�.png');
    
INSERT INTO li_studio(s_no, ct_bizno, s_title, s_content, s_thumb, s_file)
    VALUES(5, '1101141186', 'studio ��� ȫ��', '�ν�Ÿ : https://www.instagram.com/hanjiyun9061/

15�� �̻� �ݼӰ����� ������ ������ �������� �����Դϴ�.
��ű�  ���̺����  �����  ������ �����ϰ������� ������Ŭ����  ��� Ŭ���� �����մϴ�.

smartstore.naver.com/junemetal', 'thumbnail_studio_1680488196867_��Ʃ������.png', 'studio_1680488196867_��Ʃ������.png');

INSERT INTO li_studio(s_no, ct_bizno, s_title, s_content, s_thumb, s_file)
    VALUES(6, '1641100542', '�Ӻ�������Ʈ��Ʃ��� ȫ��', '�ν�Ÿ : https://www.instagram.com/anverscake/

���͸�����ũŬ����/�����η��͸�����ũ/�Ӻ�������ũ

[����������ũ] �Ⱓ
���͸�����ũâ��Ŭ����
Ŀ��������ũ�����ֹ�����(��.�� �޹�)
�����а���� �ż��ϰ� ���� ����ũ
010.9978.4684 (īī����anvers)
�����ν� ������ 28���� 5 .1��
[����������ũ]å �¶��α���
-
link.inpock.co.kr/anverscake', 'thumbnail_studio_1680488220277_�Ӻ�������Ʈ��Ʃ���.png', 'studio_1680488220277_�Ӻ�������Ʈ��Ʃ���.png');


INSERT INTO li_studio(s_no, ct_bizno, s_title, s_content, s_thumb, s_file)
    VALUES(7, '1283408697', '������ȭ���� ȫ��', '�ν�Ÿ : https://www.instagram.com/hanjiyun9061/

������ȭ������ 30�� �� ����� �����Ϳ� ��ȭ �����ڵ��� ���ۿ� �����ϴ� ��ũ�ϼ� �����Դϴ�.
��ȭ����, ��ȭ���� ������
www.gahyunart.com', 'thumbnail_studio_1680488278766_������ȭ����.png', 'studio_1680488278766_������ȭ����.png');

INSERT INTO li_studio(s_no, ct_bizno, s_title, s_content, s_thumb, s_file)
    VALUES(8, '2783800305', '�������� ȫ��', '�ν�Ÿ : https://www.instagram.com/petob_for_us/

�ֹ�����  �����밡��  ��������� �ϴ� ������Դϴ�.į������ ����� �� ������Ŭ������ �����մϴ�.

������ ���ڸ����� ����� �ݰ���
������ ����ϴ�.
instabio.cc/alwaysthere', 'thumbnail_studio_1680488314533_��������.png', 'studio_1680488314533_��������.png');



INSERT INTO li_studio(s_no, ct_bizno, s_title, s_content, s_thumb, s_file)
    VALUES(9, '1011445141', '�̱��Ѱ� ȫ��', '�ν�Ÿ : https://www.instagram.com/chewymill/

�������� 3D������ ����� �����Ͽ� ĳ���� �ǱԾ� �� ������ ��ǰ�� ����� Handicfaft, Design Studio
������ ŰƮ(DIY ĳ���� �ǱԾ�  Ű��  ������  ����)  ĳ���� ĵ��

�̱��Ѱ� | �ڵ���̵� ���� | ��̻�Ȱ DIY
���� ���� �� �׸���ũ
���� �̱��� Ű��Ʈ ��̻�Ȱ
��ģ ���� �������ִ� ���� ģ����
�ε�ĩ ����ִ� �ڵ���̵� DIY
?
Kidult Brand��@wittypixy
Made by��@choran_log
-
linktr.ee/chewymill', 'thumbnail_studio_1680488390809_�̱��Ѱ�.png', 'studio_1680488390809_�̱��Ѱ�.png');
    



INSERT INTO li_studio(s_no, ct_bizno, s_title, s_content, s_thumb, s_file)
    VALUES(10, '0200600028', '��������ring ȫ��', '�ν�Ÿ : https://www.instagram.com/iam_your_ring/

����Ű�� ��Ƽ������Ű�� �Ƹ���Ű�� �÷��̸��Ű��

Yes, I AM
#�÷��̸��Ű�� #�ø�Ű�� #����Ű�� #�½�Ű�� #��Ƽ������#�÷��̸��?
Ŭ�������Ǵ� DM Ȥ�� ī�� ���!
���Ź��ǵ� DM Ȥ�� ī�� ���!
īī���÷���ģ���� yes_iam �̿���.
���̵��,������ ������� �մϴ�
m.smartstore.naver.com/iam_your_ring', 'thumbnail_studio_1680488417346_��������.png', 'studio_1680488417346_��������.png');
    
INSERT INTO li_studio(s_no, ct_bizno, s_title, s_content, s_thumb, s_file)
    VALUES(11, '1113274803', '�����ƶ㸮�� ȫ��', '�ν�Ÿ : https://www.instagram.com/thebom_atelier/

�ϻ��� �ູ�� ������ ��⿡ ��� �߾��ϰ�  ������ �ʰ� ���� �� ������ 
���ο� ������ ����� �� �ִ� �������� ���鵵�� �����ƶ㸮���� �������մϴ�.

õ��ĵ��  õ����  õ��ȭ��ǰ  �Ʒθ��׶��� ����
�������� �����ƶ㸮���� ���� �������� �� �ֽ��ϴ�.

����õ ĵ��/��ǻ��/���������/�ö��ĵ��
õ����/õ��ȭ��ǰ/���/õ���Կ���
������Ŭ����
���/�ڰ���/â������
��ü����/���ǰ/���׸����ǰ
��ü����/����Ⱝ
īī��ID:�����ƶ㸮��
linktr.ee/thebom_atelier', 'thumbnail_studio_1680488455124_�����ƶ㸮��.png', 'studio_1680488455124_�����ƶ㸮��.png');

INSERT INTO li_studio(s_no, ct_bizno, s_title, s_content, s_thumb, s_file)
    VALUES(12, '1020661979', '������̺� ȫ��', '�ν�Ÿ : https://www.instagram.com/rudytable/

�Ȼ�����ũ �Ȼ궱����ũ �Ȼ�ӱ��ö��������ũ / ������̺�
#�ӱ��ö������ũ â���� ���Թ� Ŭ����,�ֹ�,#����,#���϶�
SFCA�����ö������ũ��ȸ
�ν�Ÿ�޼���X
�ֹ����, ��α� �Ʒ� ��ũ Ŭ��
linktr.ee/rudytable', 'thumbnail_studio_1680488489060_������̺�.png', 'studio_1680488489060_������̺�.png');
    
    

INSERT INTO li_studio(s_no, ct_bizno, s_title, s_content, s_thumb, s_file)
    VALUES(13, '1021191308', '��ƾ���װ��� ȫ��', '�ν�Ÿ : https://www.instagram.com/martin_leather_

������ �ͼ����� ���� ���¿��� ó������ ū ���� ����ٺ���
�ð��� ���� �ɸ��� ���� �����̰� �����ΰ� ���θ��� �˴ϴ�.
������ �� ������� ������� ���� ���������� ���� ���� �������μ�
���밨�� �������� �߿伺�� �����ϴ� �����Դϴ�

#�ϻ갡�װ���#�鼮�����װ���#���ε����װ���
blog.naver.com/martinseon', 'thumbnail_studio_1680488519970_��ƾ���װ���.png', 'studio_1680488519970_��ƾ���װ���.png');
    
INSERT INTO li_studio(s_no, ct_bizno, s_title, s_content, s_thumb, s_file)
    VALUES(14, '8961600886', '�޷��� ȫ��', '�ν�Ÿ : https://www.instagram.com/dallaeri/

���� ������ �ǰ��ϰ� ���� ����� �Բ� ������ �޷����Դϴ�.
���� ��Ḹ�� �����Ͽ� ���� Ȩ���̵� ����û ���� �������α����ϰ�
��ô�� ��Ḧ �����ϰ� �������� ����� ���Ϸν� ������ �̿��Ͽ�
���� ����Ұ� ǳ���� ����û���ΰ��� ������ ���� ���� �츰
�ʹ� ���� ���� ���� ����û ���� �޷����Դϴ�.

��ǰ������
ī�� ��ǰ ����
����û. ������. �ڵ�� ������
�ǰ��� ����û�� ����� �޷���
010-2875-1993
���� �ù� ���� 7�����̻� ����
smartstore.naver.com/dallaerifood', 'thumbnail_studio_1680488646034_�޷���.png', 'studio_1680488646034_�޷���.png');

INSERT INTO li_studio(s_no, ct_bizno, s_title, s_content, s_thumb, s_file)
    VALUES(15, '1112050905', '��������Ʋ ȫ��', '�ν�Ÿ : https://www.instagram.com/ggumtle_embroidery/

��ȭ���� ������� ��Ƴ��� ���� �Ϸ���Ʈ �ڼ��� ������ ��������Ʋ �����Դϴ�.
�Ҽ������θ� �̷������ Ŭ������ �������ڼ��� ���ؼ� ��� ����� �� �ִ�
Ŀ��ŧ������ �̷�����ֽ��ϴ�.
�ַ� �Ʊ��ڱ��� �̹����� ������ �پ��� ��ǰ�� ���ڸ� �����
Ŭ������ ���� ��ſ��� �����ϴ� �����Դϴ�.

�ڼ��� �ϻ��� ������
spend daily life with embroidery
?
���� �Ǿ�� ����� �ڼ� ���� ����
linktr.ee/ggumtle',
    'thumbnail_studio_1680488672251_��������Ʋ.png', 'studio_1680488672251_��������Ʋ.png');
    
    

INSERT INTO li_studio(s_no, ct_bizno, s_title, s_content, s_thumb, s_file)
    VALUES(16, '4140693656', '�̽� ȫ��', '�ν�Ÿ : https://www.instagram.com/this.forest/

�������� �̽��Դϴ�.
�����⸦ �̿��Ͽ� ���� ������ �ڵ���̵� ������ �����Դϴ�.
����  ���  ���̺��Ʈ  �񵵸�  ��ī�� �� �پ��� �ڵ���̵� ��ǰ�� �����Դϴ�.

�پ��ϰ� õ�� ¬�ϴ�
õ ¥�� ������
linktr.ee/thisforest', 'thumbnail_studio_1680488725436_�̽�.png', 'studio_1680488725436_�̽�.png');
    
INSERT INTO li_studio(s_no, ct_bizno, s_title, s_content, s_thumb, s_file)
    VALUES(17, '6072666671', '�ٽǰ��� ȫ��', '�ν�Ÿ : https://www.instagram.com/basil0306/

�ڵ���̵� ��ǰ �� ���� �� ���۵��� �ַ� �ϸ������� ���
���Ϲ�  �߰���  �ָ��� �� ��̹� ���ַ� ������ �ϰ� ������
���Ʋ ������ �ϰ� �ִ� ���ΰ����Դϴ�.

�¶������δ� â�� �������ڹ��� ���� �Ǹ��ϰ� �ְ� ���� ��α� �� ������ʵ� ��ϰ� �־��^^

�����������۰� Ŭ������ �����ؿ�
#��õ������ü��ó
#��õ��������û������
#��õ�б���û�ҳ���������������
link.inpock.co.kr/basil0306
https://blog.naver.com/wktmals1035', 'thumbnail_studio_1680488773768_�ٽǰ���.png', 'studio_1680488773768_�ٽǰ���.png');

INSERT INTO li_studio(s_no, ct_bizno, s_title, s_content, s_thumb, s_file)
    VALUES(18, '1101194683', 'mogiwood ȫ��', '�ν�Ÿ : https://www.instagram.com/woodstudio_mogi/


��� ���� ��ŵ��� ��ġ�� ��������� 2006����� ������� �񰡱� �۰��ν��� ���� Ȱ���� �񰡱� �ֹ�����
�ɵ� ���� 1�� ������ ��� ���������� �߽�����  �ܱ� ������ ��̹ݰ� �Ӽ��ݵ� �پ��� ���������� ��ϴ� ������Դϴ�.

since2006 / ���̰��� [woodstudio mogi]
���񰡱��ֹ����� + �����ī����
�湮 �� ����
010 3757 1086
��⵵�� ���������������� ������ ��� ��ǥ����
www.mogiwood.com',
    'thumbnail_studio_1680488974738_mogiwood.png', 'studio_1680488974738_mogiwood.png');
    
    
INSERT INTO li_studio(s_no, ct_bizno, s_title, s_content, s_thumb, s_file)
    VALUES(19, '2299012336', '�޺�� ȫ��', '�ν�Ÿ : https://www.instagram.com/kkooomblooom/

��⵵ ������ �߿��� �ݱ����� ��ġ�� �����, ��Ʈ ��Ʃ��� �Դϴ�.
�Ҽ������� ���ڱ� ������ �̼� ������ �̷������  ���������� ������ �����Դϴ�. ;)', 'thumbnail_studio_1680489007993_�޺��.png', 'studio_1680489007993_�޺��.png');
    
INSERT INTO li_studio(s_no, ct_bizno, s_title, s_content, s_thumb, s_file)
    VALUES(20, '6670500768', '��������ũ ȫ��', '�ν�Ÿ : https://www.instagram.com/soosoo_cake/

��������ũ / ��������ũ / ����ӱ��ö�� / �����ʶ�

Gwangmyeong, Korea (��⵵ ���� 7ȣ�� ö�꿪)
KFDA 1�� ����
�ӱ��ö�� ����/������ Ŭ���� � �� �Ǹ�
�� ������Ŭ���� �
���� : īī���� �÷���ģ�� ��������ũ (dm X)
pf.kakao.com/_xiDAxlxl', 'thumbnail_studio_1680489056159_��������ũ.png', 'studio_1680489056159_��������ũ.png');



--��Ʃ��� ���̺� ������
create sequence li_studio_seq
start with 21
increment by 1
minvalue 1
nocycle
nocache;


select * from li_studio;