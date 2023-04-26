create table li_reserve (
    r_no number not null,                       --�����ȣ
    user_no number not null,                    --ȸ����ȣ
    ep_no number not null,                      --ȸ����ȣ
    c_title varchar2(1000) not null,            --Ŭ���� ����
    r_date date not null,                       --��������
    reg_date date default sysdate not null,     --������������
    r_state number default 1 not null,          --������� 1:������(��������) / 2:����Ϸ�(�����Ϸ�) / 3: �������(ȯ��) 
    r_price number not null,                    --����ݾ�
    r_cnt number not null,                      --�����ο�
    
    constraint li_reserve primary key(r_no),
    constraint li_reserve_fk1 foreign key(ep_no) references li_episode(ep_no),
    constraint li_reserve_fk2 foreign key(user_no) references li_user(user_no) 
);

comment on table li_reserve is 'Ŭ���� ���� ���̺�';
comment on column li_reserve.r_no is '���� ��ȣ';
comment on column li_reserve.r_date is '���� ����';
comment on column li_reserve.r_state is '���� ����';
comment on column li_reserve.r_price is '���� �ݾ�';
comment on column li_reserve.r_cnt is '���� �ο�';
comment on column li_reserve.reg_date is '���� ��������';
comment on column li_reserve.user_no is '������ ��ȣ';
comment on column li_reserve.ep_no is '����ȸ�� ��ȣ';
comment on column li_reserve.c_title is '���భ�� �̸�';

insert into li_reserve( r_no, user_no, ep_no, c_title, r_date, reg_date, r_state, r_cnt, r_price )
values( 1, 2303291111, 2, '������ �ݼ��� �Ǵ� ��������� �ö�� �ɴٹ� ������ Ŭ����', to_date('2023/03/29 14:00','yyyy/mm/dd hh24:mi'), '23/03/29', 2, 2, 116000 );
insert into li_reserve( r_no, user_no, ep_no, c_title, r_date, reg_date, r_state, r_cnt, r_price )
values( 2, 2303292222, 11, '������ �ݼ��� �Ǵ� ��������� �ö�� �ɴٹ� ������ Ŭ����',to_date('2023/04/04 15:00','yyyy/mm/dd hh24:mi'), '23/03/29', 3, 1, 55000 ); --�������
insert into li_reserve( r_no, user_no, ep_no, c_title, r_date, reg_date, r_state, r_cnt, r_price )
values( 3, 2302282828, 3, '������ �ݼ��� �Ǵ� ��������� �ö�� �ɴٹ� ������ Ŭ����', to_date('2023/04/01 14:00','yyyy/mm/dd hh24:mi'), '23/03/29', 2, 6, 348000 );
insert into li_reserve( r_no, user_no, ep_no, c_title, r_date, reg_date, r_state, r_cnt, r_price )
values( 4, 2001110723, 5, '������ �ݼ��� �Ǵ� ��������� �ö�� �ɴٹ� ������ Ŭ����', to_date('2023/04/02 11:00','yyyy/mm/dd hh24:mi'), '23/03/29', 2, 3, 174000 );
insert into li_reserve( r_no, user_no, ep_no, c_title, r_date, reg_date, r_state, r_cnt, r_price )
values( 5, 2303290722, 6, '������ �ݼ��� �Ǵ� ��������� �ö�� �ɴٹ� ������ Ŭ����', to_date('2023/04/02 15:00','yyyy/mm/dd hh24:mi'), '23/03/29', 2, 6, 348000 );
insert into li_reserve( r_no, user_no, ep_no, c_title, r_date, reg_date, r_state, r_cnt, r_price )
values( 6, 2303290612, 8, '������ �ݼ��� �Ǵ� ��������� �ö�� �ɴٹ� ������ Ŭ����', to_date('2023/04/03 15:00','yyyy/mm/dd hh24:mi'), '23/03/29', 2, 3, 159000 );
insert into li_reserve( r_no, user_no, ep_no, c_title, r_date, reg_date, r_state, r_cnt, r_price )
values( 7, 2303290625, 9, '������ �ݼ��� �Ǵ� ��������� �ö�� �ɴٹ� ������ Ŭ����', to_date('2023/04/04 11:00','yyyy/mm/dd hh24:mi'), '23/03/29', 2, 1, 53000 );
insert into li_reserve( r_no, user_no, ep_no, c_title, r_date, reg_date, r_state, r_cnt, r_price )
values( 8, 9205045442, 13, 'Ȩī���� ����, �ڵ�帳 ������ Ŭ����', to_date('2023/04/12 15:00','yyyy/mm/dd hh24:mi'), '23/03/29', 2, 2, 60000 );
insert into li_reserve( r_no, user_no, ep_no, c_title, r_date, reg_date, r_state, r_cnt, r_price )
values( 9, 2302282828, 15, 'Ȩī���� ����, �ڵ�帳 ������ Ŭ����', to_date('2023/04/14 09:00','yyyy/mm/dd hh24:mi'), '23/03/29', 2, 1, 25000 );
insert into li_reserve( r_no, user_no, ep_no, c_title, r_date, reg_date, r_state, r_cnt, r_price )
values( 10, 2302282828, 16, 'Ȩī���� ����, �ڵ�帳 ������ Ŭ����', to_date('2023/04/15 15:00','yyyy/mm/dd hh24:mi'), '23/03/29', 2, 1, 35000 );

--������ ������..