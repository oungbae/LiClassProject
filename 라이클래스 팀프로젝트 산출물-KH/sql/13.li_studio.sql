-- 스튜디오 테이블
create table li_studio(
    s_no number(20) not null, --스튜디오게시판 글번호
    ct_bizno varchar2(30) not null, --사업자등록번호
    s_title varchar2(300) not null, --스튜디오게시판 제목
    s_content varchar2(700) not null, --스튜디오게시판 내용
    s_date date default sysdate, --스튜디오게시판 작성일
    s_thumb varchar2(700), --스튜디오게시판 썸네일
    s_file varchar2(700), --스튜디오게시판 파일명

    constraint li_studio_pk primary key(s_no),
    constraint li_studio_fk foreign key(ct_bizno)
                               references li_center(ct_bizno)

);


--drop table li_studio;
--drop sequence li_studio_seq;

comment on table li_studio is '스튜디오 테이블';
comment on column li_studio.s_no is '스튜디오게시판 글번호';
comment on column li_studio.ct_bizno is '사업자등록번호';
comment on column li_studio.s_title is '스튜디오게시판 제목';
comment on column li_studio.s_content is '스튜디오게시판 내용';
comment on column li_studio.s_date is '스튜디오게시판 작성일';
comment on column li_studio.s_thumb is '스튜디오게시판 썸네일';
comment on column li_studio.s_file is '스튜디오게시판 파일명';

INSERT INTO li_studio(s_no, ct_bizno, s_title, s_content, s_thumb, s_file)
    VALUES(1, '6670500768', '수수떡케이크 홍보', '인스타 @soosoo_cake

수수케이크 / 광명떡케이크 / 광명앙금플라워 / 광명답례떡

??Gwangmyeong, Korea (경기도 광명 7호선 철산역)
??KFDA 1급 수료
??앙금플라워 정규/원데이 클래스 운영 및 판매
??떡 원데이클래스 운영
??문의??카카오톡 플러스친구 수수케이크 (dm??)
pf.kakao.com/_xiDAxlxl', 'thumbnail_studio_1680068537446_soosoo.png', 'studio_1680068537446_soosoo.png');

INSERT INTO li_studio(s_no, ct_bizno, s_title, s_content, s_thumb, s_file)
    VALUES(2, '6538102174', '해윰 홍보', '제철 딸기로 만들어진 리얼 딸기청 입니다.
해윰으로 오셔서 함께 만들어보시지 않을래요?', 'thumbnail_studio_1680068580449_해윰.png', 'studio_1680068580449_해윰.png');
    
INSERT INTO li_studio(s_no, ct_bizno, s_title, s_content, s_thumb, s_file)
    VALUES(3, '4121097783', '헬로해피 홍보', '바느질과 바구니 만들기의 콜라보
오셔서 함께 만들어보아요', 'thumbnail_studio_1680068614488_hellohappy.jpg', 'studio_1680068614488_hellohappy.jpg');

INSERT INTO li_studio(s_no, ct_bizno, s_title, s_content, s_thumb, s_file)
    VALUES(4, '8177000186', '링메이드 반지공방 홍보', '함께 예쁜 반지 만들어보아요',
    'thumbnail_studio_1680068691710_링메이드.jpg', 'studio_1680068691710_링메이드.jpg');
    
INSERT INTO li_studio(s_no, ct_bizno, s_title, s_content, s_thumb, s_file)
    VALUES(5, '1113274803', '동두천공방 더봄아뜰리에 홍보', '인스타 @thebom_atelier

동두천공방 더봄아뜰리에
더봄아뜰리에
동두천공방
동두천 향기공방
동두천 캔들/디퓨저/석고방향제/플라워캔들
천연비누/천연화장품/향수/천연입욕제
원데이클래스
취미/자격증/창업과정
단체선물/답례품/인테리어소품
단체수업/기업출강
카카오ID:더봄아뜰리에
linktr.ee/thebom_atelier', 'thumbnail_studio_1680068799843_더봄아뜰리에.png', 'studio_1680068799843_더봄아뜰리에.png');

INSERT INTO li_studio(s_no, ct_bizno, s_title, s_content, s_thumb, s_file)
    VALUES(6, '1011445141', '쫄깃방앗간 홍보', '인스타 : @chewymill

??????????????? | 핸드메이드 인형 | 취미생활 DIY
놀이 공원 및 테마파크
? 가슴 쫄깃한 키덜트 취미생활
? 지친 나를 응원해주는 작은 친구들
? 두둠칫 재미있는 핸드메이드 DIY
?
? Kidult Brand｜@wittypixy
? Made by｜@choran_log
-
linktr.ee/chewymill', 'thumbnail_studio_1680068852892_쫄깃방앗간.png', 'studio_1680068852892_쫄깃방앗간.png');

INSERT INTO li_studio(s_no, ct_bizno, s_title, s_content, s_thumb, s_file)
    VALUES(7, '0200600028', '아임유얼ring 홍보', '인스타 : @iam_your_ring
Yes, I AM
#플레이모빌키링 #플모키링 #토이키링 #태슬키링 #빈티지토이#플레이모빌??
?클래스문의는 DM 혹은 카톡 고고!
?구매문의도 DM 혹은 카톡 고고!
?카카오플러스친구은 yes_iam 이예용.
?아이디어,디자인 도용금지 합니다?
m.smartstore.naver.com/iam_your_ring', 'thumbnail_studio_1680068887485_아임유얼링.png', 'studio_1680068887485_아임유얼링.png');
    
INSERT INTO li_studio(s_no, ct_bizno, s_title, s_content, s_thumb, s_file)
    VALUES(8, '2299012336', '꿈블룸 홍보', '인스타 @kkooomblooom

경기도 성남시 중원구 금광동에 위치한 세라믹, 아트 스튜디오 입니다.
소수정예의 도자기 수강과 미술 수업이 이루어지며  예술감성을 나누는 공간입니다. ;)', 'thumbnail_studio_1680068932139_꿈블룸.png', 'studio_1680068932139_꿈블룸.png');

INSERT INTO li_studio(s_no, ct_bizno, s_title, s_content, s_thumb, s_file)
    VALUES(9, '1641100542', '앙베르디저트스튜디오 홍보', '인스타 @anverscake

?레터링케이크클래스/의정부레터링케이크/앙베르케이크

?[디자인케이크] 출간
?? 레터링케이크창업클래스
?? 커스텀케이크예약주문제작(일.월 휴무)
유기농밀가루로 신선하게 굽는 케이크
010.9978.4684 (카카오톡anvers)
?의정부시 망월로 28번길 5 .1층
?[디자인케이크]책 온라인구매
?
link.inpock.co.kr/anverscake', 'thumbnail_studio_1680069012758_앙베르디저트스튜디오.png', 'studio_1680069012758_앙베르디저트스튜디오.png');



--스튜디오 테이블 시퀀스
create sequence li_studio_seq
start with 10
increment by 1
minvalue 1
nocycle
nocache;


select * from li_studio;