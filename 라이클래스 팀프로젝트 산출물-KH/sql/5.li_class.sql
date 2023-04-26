-- 5. li_class

-- 클래스(Li_Class)생성 (update 23.03.23)                                                     
create table li_class (
	c_no number not null,                   --클래스 번호
    ct_bizno varchar2(30) not null,         --사업자 등록번호
    c_title varchar2(1000) not null,        --클래스 제목
    c_content clob not null,                --클래스 소개글
    c_category varchar2(10) not null,       --클래스 카테고리 ( 0.공예, 1.요리, 2.미술, 3.플라워, 4.뷰티, 5.체험및기타 )
    c_level varchar2(3) not null,           --클래스 난이도
    c_area varchar2(100) not null,          --클래스 지역
    c_luv number default 0 not null,        --클래스 관심수
    c_leadtime number not null,             --클래스 소요시간
    c_maxcnt number not null,               --클래스 최대인원
    c_mincnt number default 1 not null,     --클래스 최소인원
    c_date date default sysdate not null,   --클래스 등록일자
    c_state number default 0 not null,      --클래스 상태 ( 0:등록완료/예약가능, 1:삭제/예약불가 )
   	constraint li_class_pk primary key(c_no),
   	constraint li_class_fk foreign key(ct_bizno) references li_center(ct_bizno)
);
comment on table li_class is '클래스 테이블';
comment on column li_class.c_no is '클래스 번호';
comment on column li_class.c_title is '클래스 제목';
comment on column li_class.c_content is '클래스 소개글';
comment on column li_class.c_category is '클래스 카테고리';
comment on column li_class.c_level is '클래스 난이도';
comment on column li_class.c_area is '클래스 지역';
comment on column li_class.c_luv is '클래스 관심수';
comment on column li_class.c_leadtime is '클래스 소요시간';
comment on column li_class.c_maxcnt is '클래스 최대인원';
comment on column li_class.c_mincnt is '클래스 최소인원';
comment on column li_class.c_date is '클래스 등록일자';

-- 03.29 은아 수정) 임의로 10개 샘플을 넣고 시작해야하므로 start with 11로 해봅니다.
--클래스 번호 시퀀스
create sequence li_class_seq
increment by 1
start with 11
minvalue 1
nocycle
nocache;

-- 23.03.29 은아 추가
-- 샘플 클래스 10개
-- c_no 번호 통일을 위해 여기서는 시퀀스를 사용하지않겠습니다.
--1. 
insert into li_class ( c_no, ct_bizno, c_title, c_content, c_category, c_level, c_area, c_leadtime, c_maxcnt)
values(1, 8584400500, '누구나 금손이 되는 프리저브드 플라워 꽃다발 원데이 클래스', '선물하기도 좋고 웨딩촬영, 브라이덜 샤워 등 사진촬영 소품으로도 쓰임새가 많은 꽃다발을 만들어요.
시들지 않도록 보존처리된 프리저브드 플라워 꽃다발은 물을 주거나 번거로운 관리 없이도 오랜기간 이쁘게 볼 수 있어서 인테리어 소품으로도 좋고요 특별한 의미의 선물이라면 시들거나 변하지 않아서 받는 분이 
오래오래 간직할 수 있습니다. 누군가에게 특별한 선물을 주고 싶다면 만드는 과정의 정성까지 담아 직접 만들어 보세요. 브라이덜 샤워나 우정 촬영 소품으로 친구들과 함께 준비하시면 좋은 추억이 되겠지요?',
3, '중', '경기 수원시', 1, 6);

--2.
insert into li_class ( c_no, ct_bizno, c_title, c_content, c_category, c_level, c_area, c_leadtime, c_maxcnt)
values(2, 8466400320, '홈카페의 시작, 핸드드립 원데이 클래스', 
'홈카페의 시작.. 원두고르기 부터 맛있게 추출하는 방법까지 핸드드립 원데이 클래스! 지금 시작해 보세요~!
남녀, 다양한 연령의, 커피에 관심있는 분들은 누구나 참여하실 수 있습니다!
뜨거운 물을 다루어야 하고 커피의 특성상 고등학생 이상 수업이 가능합니다. 반려동물과 함께 수업참여는 불가합니다.
다른날짜에 수업을 원하시는 경우 언제든 메세지로 문의해 주세요~가능한 시간에 최대한 맞춰드리고 있습니다~!
(주말수업을 원하실 경우 메세지로 문의주세요)',
1, '하', '경기 용인시', 2, 4);

--3.
insert into li_class ( c_no, ct_bizno, c_title, c_content, c_category, c_level, c_area, c_leadtime, c_maxcnt)
values(3, 1304758832, '따뜻한 감성, 시나몬 캔들, 왁스타블렛 만들기', 
'자연스러운 멋이 있는 시나몬캔들, 왁스타블렛 클래스를 소개해 드립니다.
-시나몬 캔들
식물성 소이왁스로 캔들을 만들고 시나몬 스틱과 드라이플라워를 사용해 캔들을 원하는대로 꾸며보실 수 있는 클래스입니다. 
유리 컨테이너에 만들어 사용하시기에도 편한 캔들이예요. :)
-시나몬 왁스타블렛
천연 왁스인 밀랍(비즈왁스)로 왁스 타블렛을 만들고 시나몬 스틱과 드라이플라워로 예쁘게 꾸며봅니다.
왁스타블렛은 원하는 곳에 걸어두고 방향제로도 사용할 수 있어요. 좋은 향이 나는 예쁜 인테리어 소품 역할을 톡톡히 한답니다. :)',
0, '하', '경기 부천시', 2, 4);

--4.
insert into li_class ( c_no, ct_bizno, c_title, c_content, c_category, c_level, c_area, c_leadtime, c_maxcnt)
values( 4, 6306200298, '오래 기억되고싶은 향 나만의 명품 향수만들기 (퍼스널 50미리)', 
'세상에 하나밖에 없는 명품 나만의향기를 선물하세요..
- 명품향수를 베이스로 할용하고 나만의 향 30가지 중에 추가하여 세상에서 하나뿐인 향수를 만들 수 있습니다.
+ 향수 시향 후 페이퍼로 샤쉐처럼 이용할 수 있게 만들어드려요
+ 클래스 수강시 쿠폰 도장 꾹꾹꾹 방문하실때마다 혜택이 쏟아집니다.
+ 클래스 수강 후 똑같은 향을 또 즐기고싶다면, 택배로 발송 가능하다는 점!',
4, '하', '경기 안양시', 1, 4);

--5.
insert into li_class ( c_no, ct_bizno, c_title, c_content, c_category, c_level, c_area, c_leadtime, c_maxcnt)
values( 5, 1352837035, '설레임을 담은 수제 여행용 키트 만들기', 
'여행 가기 좋은 날씨, 4월! 봄을 맞아 여행을 계획하고 있는 라이클래스 수강생들 있나요? 설레이는 여행을 더욱더 완벽하게 만들어줄 나만의 여행용품들을
직접 만들고 사용하면서 추억을 쌓아볼 수 있어요.',
0, '하', '경기도 수원시', 2, 6);

--6.
insert into li_class ( c_no, ct_bizno, c_title, c_content, c_category, c_level, c_area, c_leadtime, c_maxcnt)
values(6, 6306200298, '생활 속 소품이 가득, 한 땀 한 땀 프랑스자수 클래스', 
'프랑스자수에서 자주 사용하는 스티치 기법을
제대로 익혀두면, 클래스가 끝난 이후에도
혼자서 수놓을 수 있는 자신감이 생길 거예요.프랑스자수 클래스에서
수틀과 기본 재료 사용법 및 기초 매듭짓기부터
차근차근 알려드릴게요.',
0, '중', '경기도 의정부시', 1, 4);

--7.
insert into li_class ( c_no, ct_bizno, c_title, c_content, c_category, c_level, c_area, c_leadtime, c_maxcnt)
values( 7, 8466400320, '홈파티 걱정은 그만! 자취생을 위한 요리 클래스', 
'자취생을 위한 요리 클래스,요리의 핵심이자 기초!
칼질과 불 조절이죠.기초부터 탄탄하게 알려드립니다:),자취 8년 차,
프로자취러 제이슨 작가님이 알려주는 간단한 레시피!따라 하면 금세 완성되는 근사한 요리들로,
홈파티 이제 더이상 어렵지 않을 거예요',
1, '하', '경기도 의왕시', 2, 7);

--8.
insert into li_class ( c_no, ct_bizno, c_title, c_content, c_category, c_level, c_area, c_leadtime, c_maxcnt)
values( 8, 2885600271, '이런 가죽공예는 처음이야, 가죽 수제화 클래스', 
'전문가가 아닌 모두가 쉽게
자신만의 수제화를 만들어 볼 수 있도록
기초부터 꼼꼼하게 알려드리니,
수업을 차근차근 따라오시다 보면 어려움 없이
나만의 신발이 손에 놓여있을 거예요. 신발이 불편하진 않을까?란 생각을 버리고 나만의
보행을 고려한
입체적인 패턴과 천연 소 가죽을 사용해
양말을 신은 듯 편안한 착화감을
느끼실 수 있을 거예요!',
0, '하', '경기도 성남시', 2, 6);

--9.
insert into li_class ( c_no, ct_bizno, c_title, c_content, c_category, c_level, c_area, c_leadtime, c_maxcnt)
values( 9, 8961600886, '프리미엄 유기농 애플망고 수제잼 만들기', 
'설탕 대신 프락토올리고당으로 만드는 수제잼 클래스 입니다
잼을 졸이며 방 안 가득 감도는 향긋한 과일 향에 취하다 보면 어느새 마음이 편안해진 나를 발견하게 됩니다.직접 만든 정성스러운 선물을 하고 싶으신 분들
잼을 만들어 보고 싶으신 분들
손으로 만드는 핸드 메이드가 좋으신 분들에게 추천합니다.',
1, '하', '경기도 수원시', 2, 8);

--10.
insert into li_class ( c_no, ct_bizno, c_title, c_content, c_category, c_level, c_area, c_leadtime, c_maxcnt)
values(10, 6670500768, '빵부터 직접 만들어보는 다이어트 샌드위치', 
'샌드위치 만드느라 야채를 구매하셨다가 시들어 버렸던 기억 있으시죠?
이제, 야채 아끼지 말고 팍팍 넣기로 해요!
내 손으로 만들어 깨끗하고 더 건강하게 만들 수 있는 샌드위치는
다이어트 식으로도 훌륭하고 야채를 더 맛있게 드실 수 있습니다.
특히 카페를 운영하시는 분들 중에 샌드위치 품목을 추가하고 싶으신 분들에게도 적합한 수업입니다.
재료 구입처와 레시피 알려드려요 :)',
1, '하', '경기도 광명시',2, 8);



--********** 테이블 변경내용 : DDL문에 모두 반영해놓았습니다! **********
--컬럼 변경(update 23.03.15)
--alter table li_class modify c_title varchar2(1000);
--alter table li_class modify c_level varchar2(3);
--alter table li_class modify c_area varchar2(100);
--alter table li_class modify c_luv number default 0;
--alter table li_class modify ct_bizno varchar2(30);
--칼럼 삭제(update 23.03.18)
--alter table li_class drop column c_state;
--제약조건 추가(update 23.03.19)
--alter table li_class add constraint li_class_fk foreign key(ct_bizno) references li_center(ct_bizno);
--************************************************************************

--********** sample data **********--
--create or replace procedure class_insert1
--is
--begin
--    for cnt in 1..30 loop
--        insert into li_class ( c_no, ct_bizno, c_title, c_content, c_category, c_level, c_area, c_leadtime, c_maxcnt)
--        values( li_class_seq.nextval, 8584400500, '누구나 금손이 되는 프리저브드 플라워 꽃다발 원데이 클래스', '선물하기도 좋고 웨딩촬영, 브라이덜 샤워 등 사진촬영 소품으로도 쓰임새가 많은 꽃다발을 만들어요.
--        시들지 않도록 보존처리된 프리저브드 플라워 꽃다발은 물을 주거나 번거로운 관리 없이도 오랜기간 이쁘게 볼 수 있어서 인테리어 소품으로도 좋고요 특별한 의미의 선물이라면 시들거나 변하지 않아서 받는 분이 
--        오래오래 간직할 수 있습니다. 누군가에게 특별한 선물을 주고 싶다면 만드는 과정의 정성까지 담아 직접 만들어 보세요. 브라이덜 샤워나 우정 촬영 소품으로 친구들과 함께 준비하시면 좋은 추억이 되겠지요?',
--        3, '중', '경기 수원시', 1, 6);
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
--        values( li_class_seq.nextval, 8466400320, '홈카페의 시작, 핸드드립 원데이 클래스', 
--        '홈카페의 시작.. 원두고르기 부터 맛있게 추출하는 방법까지 핸드드립 원데이 클래스! 지금 시작해 보세요~!
--        남녀, 다양한 연령의, 커피에 관심있는 분들은 누구나 참여하실 수 있습니다!
--        뜨거운 물을 다루어야 하고 커피의 특성상 고등학생 이상 수업이 가능합니다. 반려동물과 함께 수업참여는 불가합니다.
--        다른날짜에 수업을 원하시는 경우 언제든 메세지로 문의해 주세요~가능한 시간에 최대한 맞춰드리고 있습니다~!
--        (주말수업을 원하실 경우 메세지로 문의주세요)',
--        1, '하', '경기 용인시', 2, 4);
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
--        values( li_class_seq.nextval, 1304758832, '따뜻한 감성, 시나몬 캔들, 왁스타블렛 만들기', 
--        '자연스러운 멋이 있는 시나몬캔들, 왁스타블렛 클래스를 소개해 드립니다.
--        -시나몬 캔들
--        식물성 소이왁스로 캔들을 만들고 시나몬 스틱과 드라이플라워를 사용해 캔들을 원하는대로 꾸며보실 수 있는 클래스입니다. 
--        유리 컨테이너에 만들어 사용하시기에도 편한 캔들이예요. :)
--        
--        -시나몬 왁스타블렛
--        천연 왁스인 밀랍(비즈왁스)로 왁스 타블렛을 만들고 시나몬 스틱과 드라이플라워로 예쁘게 꾸며봅니다.
--        왁스타블렛은 원하는 곳에 걸어두고 방향제로도 사용할 수 있어요. 좋은 향이 나는 예쁜 인테리어 소품 역할을 톡톡히 한답니다. :)',
--        0, '하', '경기 부천시', 2, 4);
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
--        values( li_class_seq.nextval, 6306200298, '오래 기억되고싶은 향 나만의 명품 향수만들기 (퍼스널 50미리)', 
--        '세상에 하나밖에 없는 명품 나만의향기를 선물하세요..
--        - 명품향수를 베이스로 할용하고 나만의 향 30가지 중에 추가하여 세상에서 하나뿐인 향수를 만들 수 있습니다.
--        + 향수 시향 후 페이퍼로 샤쉐처럼 이용할 수 있게 만들어드려요
--        + 클래스 수강시 쿠폰 도장 꾹꾹꾹 방문하실때마다 혜택이 쏟아집니다.
--        + 클래스 수강 후 똑같은 향을 또 즐기고싶다면, 택배로 발송 가능하다는 점!',
--        4, '하', '경기 안양시', 1, 4);
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
