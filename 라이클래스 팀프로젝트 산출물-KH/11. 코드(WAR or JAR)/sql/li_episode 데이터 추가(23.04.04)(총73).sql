drop sequence li_episode_seq;
create sequence li_episode_seq
start with 74
increment by 1
minvalue 1
nocycle
nocache;


insert into li_episode(ep_no, c_no, ep_price, ep_date, ep_cnt, c_title)
values( 17, 1 , 52000, to_date('2023/04/18 11:00','yyyy/mm/dd hh24:mi'),3,'������ �ݼ��� �Ǵ� ��������� �ö�� �ɴٹ� ������ Ŭ����'); 
insert into li_episode(ep_no, c_no, ep_price, ep_date, c_title)
values( 18, 1 , 52000, to_date('2023/04/19 11:00','yyyy/mm/dd hh24:mi'), '������ �ݼ��� �Ǵ� ��������� �ö�� �ɴٹ� ������ Ŭ����'); 
insert into li_episode(ep_no, c_no, ep_price, ep_date, ep_cnt, c_title )
values( 19, 1 , 54000, to_date('2023/04/21 15:00','yyyy/mm/dd hh24:mi'),6,'������ �ݼ��� �Ǵ� ��������� �ö�� �ɴٹ� ������ Ŭ����'); 
insert into li_episode(ep_no, c_no, ep_price, ep_date, c_title)
values( 20, 1 , 53000, to_date('2023/04/24 14:00','yyyy/mm/dd hh24:mi'),'������ �ݼ��� �Ǵ� ��������� �ö�� �ɴٹ� ������ Ŭ����' ); 
insert into li_episode(ep_no, c_no, ep_price, ep_date, c_title)
values( 21, 1 , 53000, to_date('2023/04/25 14:00','yyyy/mm/dd hh24:mi'),'������ �ݼ��� �Ǵ� ��������� �ö�� �ɴٹ� ������ Ŭ����' ); 
insert into li_episode(ep_no, c_no, ep_price, ep_date, ep_cnt, c_title)
values( 22, 1 , 53000, to_date('2023/04/26 14:00','yyyy/mm/dd hh24:mi'),2, '������ �ݼ��� �Ǵ� ��������� �ö�� �ɴٹ� ������ Ŭ����' ); 
insert into li_episode(ep_no, c_no, ep_price, ep_date, c_title)
values( 23, 1 , 53000, to_date('2023/04/27 14:00','yyyy/mm/dd hh24:mi'), '������ �ݼ��� �Ǵ� ��������� �ö�� �ɴٹ� ������ Ŭ����' ); 
insert into li_episode(ep_no, c_no, ep_price, ep_date, c_title)
values( 24, 1 , 53000, to_date('2023/04/28 14:00','yyyy/mm/dd hh24:mi'), '������ �ݼ��� �Ǵ� ��������� �ö�� �ɴٹ� ������ Ŭ����' ); 

insert into li_episode(ep_no, c_no, ep_price, ep_date, c_title)
values( 25, 2 , 25000, to_date('2023/04/18 13:00','yyyy/mm/dd hh24:mi'), 'Ȩī���� ����, �ڵ�帳 ������ Ŭ����' ); 
insert into li_episode(ep_no, c_no, ep_price, ep_date, ep_cnt, c_title)
values( 26, 2 , 26000, to_date('2023/04/19 13:00','yyyy/mm/dd hh24:mi'), 3, 'Ȩī���� ����, �ڵ�帳 ������ Ŭ����' ); 
insert into li_episode(ep_no, c_no, ep_price, ep_date, c_title)
values( 27, 2 , 26000, to_date('2023/04/20 14:00','yyyy/mm/dd hh24:mi'), 'Ȩī���� ����, �ڵ�帳 ������ Ŭ����' ); 
insert into li_episode(ep_no, c_no, ep_price, ep_date, ep_cnt, c_title)
values( 28, 2 , 26000, to_date('2023/04/21 15:00','yyyy/mm/dd hh24:mi'), 2, 'Ȩī���� ����, �ڵ�帳 ������ Ŭ����' ); 

insert into li_episode(ep_no, c_no, ep_price, ep_date, c_title)
values( 29, 3 , 27000, to_date('2023/04/12 13:00','yyyy/mm/dd hh24:mi'), '������ ����, �ó��� ĵ��, �ν�Ÿ�� �����' ); 
insert into li_episode(ep_no, c_no, ep_price, ep_date, ep_cnt, c_title)
values( 30, 3 , 27000, to_date('2023/04/12 15:00','yyyy/mm/dd hh24:mi'),2, '������ ����, �ó��� ĵ��, �ν�Ÿ�� �����' ); 
insert into li_episode(ep_no, c_no, ep_price, ep_date, c_title)
values( 31, 3 , 27000, to_date('2023/04/13 13:00','yyyy/mm/dd hh24:mi'), '������ ����, �ó��� ĵ��, �ν�Ÿ�� �����' ); 
insert into li_episode(ep_no, c_no, ep_price, ep_date, c_title)
values( 32, 3 , 27000, to_date('2023/04/13 16:00','yyyy/mm/dd hh24:mi'), '������ ����, �ó��� ĵ��, �ν�Ÿ�� �����' ); 
insert into li_episode(ep_no, c_no, ep_price, ep_date, ep_cnt, c_title)
values( 33, 3 , 28000, to_date('2023/04/14 17:00','yyyy/mm/dd hh24:mi'), 4, '������ ����, �ó��� ĵ��, �ν�Ÿ�� �����' ); 
insert into li_episode(ep_no, c_no, ep_price, ep_date, c_title)
values( 34, 3 , 30000, to_date('2023/04/15 13:00','yyyy/mm/dd hh24:mi'), '������ ����, �ó��� ĵ��, �ν�Ÿ�� �����' ); 
insert into li_episode(ep_no, c_no, ep_price, ep_date, c_title)
values( 35, 3 , 30000, to_date('2023/04/16 14:00','yyyy/mm/dd hh24:mi'), '������ ����, �ó��� ĵ��, �ν�Ÿ�� �����' ); 
insert into li_episode(ep_no, c_no, ep_price, ep_date, c_title)
values( 36, 3 , 27000, to_date('2023/04/18 14:00','yyyy/mm/dd hh24:mi'), '������ ����, �ó��� ĵ��, �ν�Ÿ�� �����' ); 
insert into li_episode(ep_no, c_no, ep_price, ep_date, c_title)
values( 37, 3 , 27000, to_date('2023/04/19 13:00','yyyy/mm/dd hh24:mi'), '������ ����, �ó��� ĵ��, �ν�Ÿ�� �����' ); 
insert into li_episode(ep_no, c_no, ep_price, ep_date, ep_cnt, c_title)
values( 38, 3 , 27000, to_date('2023/04/20 15:00','yyyy/mm/dd hh24:mi'), 3, '������ ����, �ó��� ĵ��, �ν�Ÿ�� �����' );
insert into li_episode(ep_no, c_no, ep_price, ep_date, c_title)
values( 39, 3 , 27000, to_date('2023/04/21 14:00','yyyy/mm/dd hh24:mi'), '������ ����, �ó��� ĵ��, �ν�Ÿ�� �����' ); 
insert into li_episode(ep_no, c_no, ep_price, ep_date, c_title)
values( 40, 3 , 30000, to_date('2023/04/22 14:00','yyyy/mm/dd hh24:mi'), '������ ����, �ó��� ĵ��, �ν�Ÿ�� �����' ); 
insert into li_episode(ep_no, c_no, ep_price, ep_date, c_title)
values( 41, 3 , 30000, to_date('2023/04/23 14:00','yyyy/mm/dd hh24:mi'), '������ ����, �ó��� ĵ��, �ν�Ÿ�� �����' ); 
insert into li_episode(ep_no, c_no, ep_price, ep_date, ep_cnt, c_title)
values( 42, 3 , 27000, to_date('2023/04/24 14:00','yyyy/mm/dd hh24:mi'), 1, '������ ����, �ó��� ĵ��, �ν�Ÿ�� �����' ); 
insert into li_episode(ep_no, c_no, ep_price, ep_date, c_title)
values( 43, 3 , 27000, to_date('2023/04/24 18:00','yyyy/mm/dd hh24:mi'), '������ ����, �ó��� ĵ��, �ν�Ÿ�� �����' ); 
insert into li_episode(ep_no, c_no, ep_price, ep_date, c_title)
values( 44, 3 , 27000, to_date('2023/04/25 14:00','yyyy/mm/dd hh24:mi'), '������ ����, �ó��� ĵ��, �ν�Ÿ�� �����' ); 
insert into li_episode(ep_no, c_no, ep_price, ep_date, c_title)
values( 45, 3 , 27000, to_date('2023/04/26 14:00','yyyy/mm/dd hh24:mi'), '������ ����, �ó��� ĵ��, �ν�Ÿ�� �����' ); 
insert into li_episode(ep_no, c_no, ep_price, ep_date, ep_cnt, c_title)
values( 46, 3 , 27000, to_date('2023/04/27 14:00','yyyy/mm/dd hh24:mi'), 2, '������ ����, �ó��� ĵ��, �ν�Ÿ�� �����' ); 
insert into li_episode(ep_no, c_no, ep_price, ep_date, c_title)
values( 47, 3 , 27000, to_date('2023/04/28 14:00','yyyy/mm/dd hh24:mi'), '������ ����, �ó��� ĵ��, �ν�Ÿ�� �����' ); 
insert into li_episode(ep_no, c_no, ep_price, ep_date, c_title)
values( 48, 3 , 30000, to_date('2023/04/29 14:00','yyyy/mm/dd hh24:mi'), '������ ����, �ó��� ĵ��, �ν�Ÿ�� �����' ); 
insert into li_episode(ep_no, c_no, ep_price, ep_date, ep_cnt, c_title)
values( 49, 3 , 30000, to_date('2023/04/29 18:00','yyyy/mm/dd hh24:mi'), 4, '������ ����, �ó��� ĵ��, �ν�Ÿ�� �����' ); 

insert into li_episode(ep_no, c_no, ep_price, ep_date, c_title)
values( 50, 4 , 47000, to_date('2023/04/15 11:00','yyyy/mm/dd hh24:mi'), '���� ���ǰ���� �� ������ ��ǰ �������� (�۽��� 50�̸�)'); 
insert into li_episode(ep_no, c_no, ep_price, ep_date, ep_cnt, c_title)
values( 51, 4 , 49000, to_date('2023/04/15 13:00','yyyy/mm/dd hh24:mi'), 3, '���� ���ǰ���� �� ������ ��ǰ �������� (�۽��� 50�̸�)' ); 
insert into li_episode(ep_no, c_no, ep_price, ep_date, c_title)
values( 52, 4 , 47000, to_date('2023/04/16 11:00','yyyy/mm/dd hh24:mi'), '���� ���ǰ���� �� ������ ��ǰ �������� (�۽��� 50�̸�)' );
insert into li_episode(ep_no, c_no, ep_price, ep_date, ep_cnt, c_title)
values( 53, 4 , 49000, to_date('2023/04/16 13:00','yyyy/mm/dd hh24:mi'), 1, '���� ���ǰ���� �� ������ ��ǰ �������� (�۽��� 50�̸�)' );
insert into li_episode(ep_no, c_no, ep_price, ep_date, ep_cnt, c_title)
values( 54, 4 , 47000, to_date('2023/04/22 11:00','yyyy/mm/dd hh24:mi'), 2, '���� ���ǰ���� �� ������ ��ǰ �������� (�۽��� 50�̸�)' );
insert into li_episode(ep_no, c_no, ep_price, ep_date, c_title)
values( 55, 4 , 49000, to_date('2023/04/23 13:00','yyyy/mm/dd hh24:mi'), '���� ���ǰ���� �� ������ ��ǰ �������� (�۽��� 50�̸�)' );
insert into li_episode(ep_no, c_no, ep_price, ep_date, c_title)
values( 56, 4 , 47000, to_date('2023/04/29 11:00','yyyy/mm/dd hh24:mi'), '���� ���ǰ���� �� ������ ��ǰ �������� (�۽��� 50�̸�)' );
insert into li_episode(ep_no, c_no, ep_price, ep_date, c_title)
values( 57, 4 , 49000, to_date('2023/04/29 13:00','yyyy/mm/dd hh24:mi'), '���� ���ǰ���� �� ������ ��ǰ �������� (�۽��� 50�̸�)' );
insert into li_episode(ep_no, c_no, ep_price, ep_date, c_title)
values( 58, 4 , 49000, to_date('2023/04/30 13:00','yyyy/mm/dd hh24:mi'), '���� ���ǰ���� �� ������ ��ǰ �������� (�۽��� 50�̸�)' );

insert into li_episode(ep_no, c_no, ep_price, ep_date, c_title)
values( 59, 5 , 40000, to_date('2023/04/21 13:00','yyyy/mm/dd hh24:mi'), 'Ŀ����! ���ڹ�+�Ŀ�ġ ������ Ŭ����' );
insert into li_episode(ep_no, c_no, ep_price, ep_date, ep_cnt, c_title)
values( 60, 5 , 40000, to_date('2023/04/21 16:00','yyyy/mm/dd hh24:mi'), 2, 'Ŀ����! ���ڹ�+�Ŀ�ġ ������ Ŭ����' );
insert into li_episode(ep_no, c_no, ep_price, ep_date, c_title)
values( 61, 5 , 40000, to_date('2023/04/22 13:00','yyyy/mm/dd hh24:mi'), 'Ŀ����! ���ڹ�+�Ŀ�ġ ������ Ŭ����' );
insert into li_episode(ep_no, c_no, ep_price, ep_date, c_title)
values( 62, 5 , 40000, to_date('2023/04/22 16:00','yyyy/mm/dd hh24:mi'), 'Ŀ����! ���ڹ�+�Ŀ�ġ ������ Ŭ����' );
insert into li_episode(ep_no, c_no, ep_price, ep_date, c_title)
values( 63, 5 , 40000, to_date('2023/04/23 13:00','yyyy/mm/dd hh24:mi'), 'Ŀ����! ���ڹ�+�Ŀ�ġ ������ Ŭ����' );
insert into li_episode(ep_no, c_no, ep_price, ep_date, c_title)
values( 64, 5 , 40000, to_date('2023/04/23 16:00','yyyy/mm/dd hh24:mi'), 'Ŀ����! ���ڹ�+�Ŀ�ġ ������ Ŭ����' );
insert into li_episode(ep_no, c_no, ep_price, ep_date, c_title)
values( 65, 5 , 40000, to_date('2023/04/28 13:00','yyyy/mm/dd hh24:mi'), 'Ŀ����! ���ڹ�+�Ŀ�ġ ������ Ŭ����' );
insert into li_episode(ep_no, c_no, ep_price, ep_date, c_title)
values( 66, 5 , 40000, to_date('2023/04/28 16:00','yyyy/mm/dd hh24:mi'), 'Ŀ����! ���ڹ�+�Ŀ�ġ ������ Ŭ����' );
insert into li_episode(ep_no, c_no, ep_price, ep_date, c_title)
values( 67, 5 , 40000, to_date('2023/04/29 13:00','yyyy/mm/dd hh24:mi'), 'Ŀ����! ���ڹ�+�Ŀ�ġ ������ Ŭ����' );
insert into li_episode(ep_no, c_no, ep_price, ep_date, c_title)
values( 68, 5 , 40000, to_date('2023/04/29 16:00','yyyy/mm/dd hh24:mi'), 'Ŀ����! ���ڹ�+�Ŀ�ġ ������ Ŭ����' );
insert into li_episode(ep_no, c_no, ep_price, ep_date, c_title)
values( 69, 5 , 40000, to_date('2023/04/30 13:00','yyyy/mm/dd hh24:mi'), 'Ŀ����! ���ڹ�+�Ŀ�ġ ������ Ŭ����' );
insert into li_episode(ep_no, c_no, ep_price, ep_date, c_title)
values( 70, 5 , 40000, to_date('2023/04/30 16:00','yyyy/mm/dd hh24:mi'), 'Ŀ����! ���ڹ�+�Ŀ�ġ ������ Ŭ����' );
insert into li_episode(ep_no, c_no, ep_price, ep_date, ep_cnt, c_title)
values( 71, 11 , 38500, to_date('2023/03/18 11:00','yyyy/mm/dd hh24:mi'), 6, '��¦��¦ ������ �ŷ�, ������ ���� ���� ��������'); 
insert into li_episode(ep_no, c_no, ep_price, ep_date, ep_cnt, c_title)
values( 72, 12 , 19000, to_date('2023/03/25 11:00','yyyy/mm/dd hh24:mi'), 4, '������ ���� ����� Ŭ���� A.���� B.���� C.�̷� ������'); 
insert into li_episode(ep_no, c_no, ep_price, ep_date, ep_cnt, c_title)
values( 73, 12 , 19000, to_date('2023/03/25 17:00','yyyy/mm/dd hh24:mi'), 2, '������ ���� ����� Ŭ���� A.���� B.���� C.�̷� ������'); 
