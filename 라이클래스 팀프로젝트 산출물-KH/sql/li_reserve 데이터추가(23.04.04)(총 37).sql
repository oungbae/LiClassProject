alter table li_reserve add REVIEW_STATUS NUMBER default 0 not null;
comment on column li_reserve.review_status is '�������';

--�����ȣ 14, 16, 17 == ȯ�ҵ� ����ǵ�
insert into li_reserve(r_no, user_no, ep_no, c_title, r_date, r_state, r_cnt, r_price)
values( 11, 2302282828, 17, '������ �ݼ��� �Ǵ� ��������� �ö�� �ɴٹ� ������ Ŭ����', to_date('23/04/18 11:00','yyyy/mm/dd hh24:mi'), 2, 3, 156000 );
insert into li_reserve(r_no, user_no, ep_no, c_title, r_date, r_state, r_cnt, r_price)
values( 12, 2001110723, 19, '������ �ݼ��� �Ǵ� ��������� �ö�� �ɴٹ� ������ Ŭ����', to_date('23/04/18 15:00','yyyy/mm/dd hh24:mi'), 2, 6, 324000 );
insert into li_reserve(r_no, user_no, ep_no, c_title, r_date, r_state, r_cnt, r_price)
values( 13, 2303290722, 22, '������ �ݼ��� �Ǵ� ��������� �ö�� �ɴٹ� ������ Ŭ����', to_date('23/04/26 14:00','yyyy/mm/dd hh24:mi'), 2, 2, 106000 );
insert into li_reserve(r_no, user_no, ep_no, c_title, r_date, r_state, r_cnt, r_price)
values( 14, 2303290612, 26, '������ �ݼ��� �Ǵ� ��������� �ö�� �ɴٹ� ������ Ŭ����', to_date('23/04/19 13:00','yyyy/mm/dd hh24:mi'), 3, 3, 78000 );
insert into li_reserve(r_no, user_no, ep_no, c_title, r_date, r_state, r_cnt, r_price)
values( 15, 2303290625, 28, '������ �ݼ��� �Ǵ� ��������� �ö�� �ɴٹ� ������ Ŭ����', to_date('23/04/21 15:00','yyyy/mm/dd hh24:mi'), 2, 2, 52000 );
insert into li_reserve(r_no, user_no, ep_no, c_title, r_date, r_state, r_cnt, r_price)
values( 16, 9205045442, 30, '������ ����, �ó��� ĵ��, �ν�Ÿ�� �����', to_date('23/04/12 15:00','yyyy/mm/dd hh24:mi'), 3, 2, 54000 );
insert into li_reserve(r_no, user_no, ep_no, c_title, r_date, r_state, r_cnt, r_price)
values( 17, 2302282828, 33, '������ ����, �ó��� ĵ��, �ν�Ÿ�� �����', to_date('23/04/14 17:00','yyyy/mm/dd hh24:mi'), 3, 4, 112000 );
insert into li_reserve(r_no, user_no, ep_no, c_title, r_date, r_state, r_cnt, r_price)
values( 18, 2001110723, 38, '������ ����, �ó��� ĵ��, �ν�Ÿ�� �����', to_date('23/04/20 15:00','yyyy/mm/dd hh24:mi'), 2, 3, 81000 );
insert into li_reserve(r_no, user_no, ep_no, c_title, r_date, r_state, r_cnt, r_price)
values( 19, 2303290722, 42, '������ ����, �ó��� ĵ��, �ν�Ÿ�� �����', to_date('23/04/24 14:00','yyyy/mm/dd hh24:mi'), 2, 1, 27000 );
insert into li_reserve(r_no, user_no, ep_no, c_title, r_date, r_state, r_cnt, r_price)
values( 20, 2303290612, 46, '������ ����, �ó��� ĵ��, �ν�Ÿ�� �����', to_date('23/04/27 14:00','yyyy/mm/dd hh24:mi'), 2, 2, 54000 );
insert into li_reserve(r_no, user_no, ep_no, c_title, r_date, r_state, r_cnt, r_price)
values( 21, 2303290625, 49, '������ ����, �ó��� ĵ��, �ν�Ÿ�� �����', to_date('23/04/29 18:00','yyyy/mm/dd hh24:mi'), 2, 4, 120000 );
insert into li_reserve(r_no, user_no, ep_no, c_title, r_date, r_state, r_cnt, r_price)
values( 22, 9205045442, 51, '���� ���ǰ���� �� ������ ��ǰ �������� (�۽��� 50�̸�)', to_date('23/04/15 13:00','yyyy/mm/dd hh24:mi'), 2, 3, 147000 );
insert into li_reserve(r_no, user_no, ep_no, c_title, r_date, r_state, r_cnt, r_price)
values( 23, 2302282828, 53, '���� ���ǰ���� �� ������ ��ǰ �������� (�۽��� 50�̸�)', to_date('23/04/16 13:00','yyyy/mm/dd hh24:mi'), 2, 1, 49000 );
insert into li_reserve(r_no, user_no, ep_no, c_title, r_date, r_state, r_cnt, r_price)
values( 24, 2001110723, 54, '���� ���ǰ���� �� ������ ��ǰ �������� (�۽��� 50�̸�)', to_date('23/04/22 11:00','yyyy/mm/dd hh24:mi'), 2, 2, 94000 );
insert into li_reserve(r_no, user_no, ep_no, c_title, r_date, r_state, r_cnt, r_price)
values( 25, 2303290722, 60, 'Ŀ����! ���ڹ�+�Ŀ�ġ ������ Ŭ����)', to_date('23/04/21 16:00','yyyy/mm/dd hh24:mi'), 2, 2, 80000 );
insert into li_reserve(r_no, user_no, ep_no, c_title, r_date, r_state, r_cnt, r_price)
values( 26, 2302282828, 71, '��¦��¦ ������ �ŷ�, ������ ���� ���� ��������', to_date('2023/03/18 11:00','yyyy/mm/dd hh24:mi'), 2, 1, 38500 );
insert into li_reserve(r_no, user_no, ep_no, c_title, r_date, r_state, r_cnt, r_price)
values( 27, 2001110723, 71, '��¦��¦ ������ �ŷ�, ������ ���� ���� ��������', to_date('2023/03/18 11:00','yyyy/mm/dd hh24:mi'), 2, 1, 38500 );
insert into li_reserve(r_no, user_no, ep_no, c_title, r_date, r_state, r_cnt, r_price)
values( 28, 2303290722, 71, '��¦��¦ ������ �ŷ�, ������ ���� ���� ��������', to_date('2023/03/18 11:00','yyyy/mm/dd hh24:mi'), 2, 1, 38500 );
insert into li_reserve(r_no, user_no, ep_no, c_title, r_date, r_state, r_cnt, r_price)
values( 29, 2303290612, 71, '��¦��¦ ������ �ŷ�, ������ ���� ���� ��������', to_date('2023/03/18 11:00','yyyy/mm/dd hh24:mi'), 2, 1, 38500 );
insert into li_reserve(r_no, user_no, ep_no, c_title, r_date, r_state, r_cnt, r_price)
values( 30, 2303290625, 71, '��¦��¦ ������ �ŷ�, ������ ���� ���� ��������', to_date('2023/03/18 11:00','yyyy/mm/dd hh24:mi'), 2, 1, 38500 );
insert into li_reserve(r_no, user_no, ep_no, c_title, r_date, r_state, r_cnt, r_price)
values( 31, 9205045442, 71, '��¦��¦ ������ �ŷ�, ������ ���� ���� ��������', to_date('2023/03/18 11:00','yyyy/mm/dd hh24:mi'), 2, 1, 38500 );

insert into li_reserve(r_no, user_no, ep_no, c_title, r_date, r_state, r_cnt, r_price)
values( 32, 2302282828, 72, '������ ���� ����� Ŭ���� A.���� B.���� C.�̷� ������', to_date('2023/03/25 11:00','yyyy/mm/dd hh24:mi'), 2, 1, 19000 );
insert into li_reserve(r_no, user_no, ep_no, c_title, r_date, r_state, r_cnt, r_price)
values( 33, 2001110723, 72, '������ ���� ����� Ŭ���� A.���� B.���� C.�̷� ������', to_date('2023/03/25 11:00','yyyy/mm/dd hh24:mi'), 2, 1, 19000 );
insert into li_reserve(r_no, user_no, ep_no, c_title, r_date, r_state, r_cnt, r_price)
values( 34, 2303290722, 72, '������ ���� ����� Ŭ���� A.���� B.���� C.�̷� ������', to_date('2023/03/25 11:00','yyyy/mm/dd hh24:mi'), 2, 1, 19000 );
insert into li_reserve(r_no, user_no, ep_no, c_title, r_date, r_state, r_cnt, r_price)
values( 35, 2303290612, 72, '������ ���� ����� Ŭ���� A.���� B.���� C.�̷� ������', to_date('2023/03/25 11:00','yyyy/mm/dd hh24:mi'), 2, 1, 19000 );
insert into li_reserve(r_no, user_no, ep_no, c_title, r_date, r_state, r_cnt, r_price)
values( 36, 2303290625, 73, '������ ���� ����� Ŭ���� A.���� B.���� C.�̷� ������', to_date('2023/03/25 17:00','yyyy/mm/dd hh24:mi'), 2, 1, 19000 );
insert into li_reserve(r_no, user_no, ep_no, c_title, r_date, r_state, r_cnt, r_price)
values( 37, 9205045442, 73, '������ ���� ����� Ŭ���� A.���� B.���� C.�̷� ������', to_date('2023/03/25 17:00','yyyy/mm/dd hh24:mi'), 2, 1, 19000 );