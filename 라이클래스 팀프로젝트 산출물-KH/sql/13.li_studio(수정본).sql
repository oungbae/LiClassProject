drop table li_studio;
drop sequence li_studio_seq;

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



comment on table li_studio is '스튜디오 테이블';
comment on column li_studio.s_no is '스튜디오게시판 글번호';
comment on column li_studio.ct_bizno is '사업자등록번호';
comment on column li_studio.s_title is '스튜디오게시판 제목';
comment on column li_studio.s_content is '스튜디오게시판 내용';
comment on column li_studio.s_date is '스튜디오게시판 작성일';
comment on column li_studio.s_thumb is '스튜디오게시판 썸네일';
comment on column li_studio.s_file is '스튜디오게시판 파일명';

INSERT INTO li_studio(s_no, ct_bizno, s_title, s_content, s_thumb, s_file)
    VALUES(1, '1070875074', '창조다움 홍보', '인스타 : https://www.instagram.com/kmhj2008/

창조다움은 창의적인 공간을 만드는 브랜드입니다.
원목을 이용한 공간조형을 만드는 사람들이
공간에 존재하는 모든 것을 대상으로 작품을 만듭니다.

창조다움
HOZE의 꿈을 담은 목조형 창작 브랜드
(wood space/ art furniture)
주소 : 경기도 고양시 일산서구 구산로 101번길 88 나동
문의전화 : 031-921-9701
카톡문의 : hoze2018
changjodaum.modoo.at', 'thumbnail_studio_1680488578033_창조다움.png', 'studio_1680488578033_창조다움.png');

INSERT INTO li_studio(s_no, ct_bizno, s_title, s_content, s_thumb, s_file)
    VALUES(2, '2298800875', '나무가풍경이되어 홍보', '인스타 : https://www.instagram.com/namoopoonggyoung/ 

경기도 지역 내에서 11년 간 주문 가구제작 및 교육 아카데미를 통해 많은 수강생과 창업자를 배출하였고
여성의 섬세한 감성으로 실용적이고 튼튼하고 꼭 필요한 가구제작으로 단골고객이 많습니다
수강생들이 마음놓고 안전하게 작업할 수 있도록 쾌적하고 넓은공간이 준비되어 있습니다.
저희 공방에 들어서는 순간 까페와 같은 이쁜 인테리어에 감탄을 금하지 못하시더라구요~
오셔서 힐링해보세요 주차공간은 충분합니다~ ^^

m.blog.naver.com/byulsea', 'thumbnail_studio_1680488608386_나무가풍경이되어.png', 'studio_1680488608386_나무가풍경이되어.png');
    
INSERT INTO li_studio(s_no, ct_bizno, s_title, s_content, s_thumb, s_file)
    VALUES(3, '5934200031', '깐마네 공방 홍보', '인스타 : https://www.instagram.com/gganma_gb
따뜻한 집에서 즐겁게 사용할 수 있는 도자기를 만듭니다.

도예를 전공하여 2016년부터 개인 도자기 공방을 운영하며 깐마네 공방이라는 브랜드를 오픈하여
깐마네 만의 감성이 담긴 도자기를 디자인하여 제작하고 있습니다.sns에서 작업사진과 작업물을 올리며
도자기에 관심있는 사람들과 소통하며 온라인에서 주로 작품을 판매하고 있습니다.
테이블웨어 작업에서 한단계 나아가 전반적인 인테리어 분위기에깐마네 감성을 담을 수 있도록
항상 탐구하며 작업하고 있습니다.', 'thumbnail_studio_1680488148369_깜마네공방.png', 'studio_1680488148369_깜마네공방.png');

INSERT INTO li_studio(s_no, ct_bizno, s_title, s_content, s_thumb, s_file)
    VALUES(4, '2141127551', '온스페이스 홍보', '인스타 : https://www.instagram.com/cocoscented/
코코센티드캔들Cocoscentedcandle Design Lab.
한국양초공예협회KCCA(정식교육기관)_아로마지도사범캔들전문가과정
대한천연디자인협회KNDA_소이플라워캔들/플라스터플라워/소이P캔들도우아트지도사범자격증과정
문의_kakao ID : cocoscentedblog.naver.com/cocoscented',
    'thumbnail_studio_1680488172861_온스페이스.png', 'studio_1680488172861_온스페이스.png');
    
INSERT INTO li_studio(s_no, ct_bizno, s_title, s_content, s_thumb, s_file)
    VALUES(5, '1101141186', 'studio 모루 홍보', '인스타 : https://www.instagram.com/hanjiyun9061/

15년 이상 금속공예를 연구한 공예가 한지윤의 공방입니다.
장신구  테이블웨어  벽장식  오브제 제작하고있으며 원데이클래스  취미 클래스 진행합니다.

smartstore.naver.com/junemetal', 'thumbnail_studio_1680488196867_스튜디오모루.png', 'studio_1680488196867_스튜디오모루.png');

INSERT INTO li_studio(s_no, ct_bizno, s_title, s_content, s_thumb, s_file)
    VALUES(6, '1641100542', '앙베르디저트스튜디오 홍보', '인스타 : https://www.instagram.com/anverscake/

레터링케이크클래스/의정부레터링케이크/앙베르케이크

[디자인케이크] 출간
레터링케이크창업클래스
커스텀케이크예약주문제작(일.월 휴무)
유기농밀가루로 신선하게 굽는 케이크
010.9978.4684 (카카오톡anvers)
의정부시 망월로 28번길 5 .1층
[디자인케이크]책 온라인구매
-
link.inpock.co.kr/anverscake', 'thumbnail_studio_1680488220277_앙베르디저트스튜디오.png', 'studio_1680488220277_앙베르디저트스튜디오.png');


INSERT INTO li_studio(s_no, ct_bizno, s_title, s_content, s_thumb, s_file)
    VALUES(7, '1283408697', '가현판화공방 홍보', '인스타 : https://www.instagram.com/hanjiyun9061/

가현판화공방은 30여 년 경력의 마스터와 판화 전공자들이 제작에 참여하는 테크니션 집단입니다.
판화제작, 판화전문 갤러리
www.gahyunart.com', 'thumbnail_studio_1680488278766_가현판화공방.png', 'studio_1680488278766_가현판화공방.png');

INSERT INTO li_studio(s_no, ct_bizno, s_title, s_content, s_thumb, s_file)
    VALUES(8, '2783800305', '얼웨이즈데어 홍보', '인스타 : https://www.instagram.com/petob_for_us/

주문가구  영업용가구  목공교육을 하는 목공방입니다.캄포도마 만들기 등 원데이클래스도 진행합니다.

언제나 그자리에서 당신을 반겨줄
물건을 만듭니다.
instabio.cc/alwaysthere', 'thumbnail_studio_1680488314533_얼웨이즈데어.png', 'studio_1680488314533_얼웨이즈데어.png');



INSERT INTO li_studio(s_no, ct_bizno, s_title, s_content, s_thumb, s_file)
    VALUES(9, '1011445141', '쫄깃방앗간 홍보', '인스타 : https://www.instagram.com/chewymill/

수공예와 3D프린팅 기술을 융합하여 캐릭터 피규어 및 디자인 소품을 만드는 Handicfaft, Design Studio
여행자 키트(DIY 캐릭터 피규어  키링  스탬프  뱃지)  캐릭터 캔들

쫄깃방앗간 | 핸드메이드 인형 | 취미생활 DIY
놀이 공원 및 테마파크
가슴 쫄깃한 키덜트 취미생활
지친 나를 응원해주는 작은 친구들
두둠칫 재미있는 핸드메이드 DIY
?
Kidult Brand｜@wittypixy
Made by｜@choran_log
-
linktr.ee/chewymill', 'thumbnail_studio_1680488390809_쫄깃방앗간.png', 'studio_1680488390809_쫄깃방앗간.png');
    



INSERT INTO li_studio(s_no, ct_bizno, s_title, s_content, s_thumb, s_file)
    VALUES(10, '0200600028', '아임유얼ring 홍보', '인스타 : https://www.instagram.com/iam_your_ring/

토이키링 빈티지토이키링 맥마담키링 플레이모빌키링

Yes, I AM
#플레이모빌키링 #플모키링 #토이키링 #태슬키링 #빈티지토이#플레이모빌?
클래스문의는 DM 혹은 카톡 고고!
구매문의도 DM 혹은 카톡 고고!
카카오플러스친구은 yes_iam 이예용.
아이디어,디자인 도용금지 합니다
m.smartstore.naver.com/iam_your_ring', 'thumbnail_studio_1680488417346_아임유얼링.png', 'studio_1680488417346_아임유얼링.png');
    
INSERT INTO li_studio(s_no, ct_bizno, s_title, s_content, s_thumb, s_file)
    VALUES(11, '1113274803', '더봄아뜰리에 홍보', '인스타 : https://www.instagram.com/thebom_atelier/

일상의 행복한 순간을 향기에 담아 추억하고  보이지 않고 만질 순 없지만 
향기로운 날들을 기억할 수 있는 오브제를 만들도록 더봄아뜰리에가 디자인합니다.

천연캔들  천연비누  천연화장품  아로마테라피 등의
향기공예를 더봄아뜰리에를 통해 만나보실 수 있습니다.

동두천 캔들/디퓨저/석고방향제/플라워캔들
천연비누/천연화장품/향수/천연입욕제
원데이클래스
취미/자격증/창업과정
단체선물/답례품/인테리어소품
단체수업/기업출강
카카오ID:더봄아뜰리에
linktr.ee/thebom_atelier', 'thumbnail_studio_1680488455124_더봄아뜰리에.png', 'studio_1680488455124_더봄아뜰리에.png');

INSERT INTO li_studio(s_no, ct_bizno, s_title, s_content, s_thumb, s_file)
    VALUES(12, '1020661979', '루디테이블 홍보', '인스타 : https://www.instagram.com/rudytable/

안산케이크 안산떡케이크 안산앙금플라워떡케이크 / 루디테이블
#앙금플라워케이크 창업반 정규반 클래스,주문,#돌떡,#백일떡
SFCA서울플라워케이크협회
인스타메세지X
주문상담, 블로그 아래 링크 클릭
linktr.ee/rudytable', 'thumbnail_studio_1680488489060_루디테이블.png', 'studio_1680488489060_루디테이블.png');
    
    

INSERT INTO li_studio(s_no, ct_bizno, s_title, s_content, s_thumb, s_file)
    VALUES(13, '1021191308', '마틴가죽공방 홍보', '인스타 : https://www.instagram.com/martin_leather_

공예에 익숙하지 않은 상태에서 처음부터 큰 것을 만들다보면
시간이 오래 걸리는 것은 물론이고 스스로가 서두르게 됩니다.
오히려 더 어렵지만 결과물이 비교적 빨리나오는 작은 것을 만듦으로서
성취감과 디테일의 중요성을 이해하는 공방입니다

#일산가죽공방#백석동가죽공방#마두동가죽공방
blog.naver.com/martinseon', 'thumbnail_studio_1680488519970_마틴가죽공방.png', 'studio_1680488519970_마틴가죽공방.png');
    
INSERT INTO li_studio(s_no, ct_bizno, s_title, s_content, s_thumb, s_file)
    VALUES(14, '8961600886', '달래리 홍보', '인스타 : https://www.instagram.com/dallaeri/

몸과 마음을 건강하게 좋은 사람과 함께 나누는 달래리입니다.
좋은 재료만을 엄선하여 만든 홈메이드 과일청 전문 공방으로깨끗하게
세척한 재료를 안전하게 담아유기농 원당과 자일로스 설탕을 이용하여
각종 영양소가 풍부한 과일청으로과일 본연의 맛과 향을 살린
너무 달지 않은 수제 과일청 전문 달래리입니다.

식품제조업
카페 납품 문의
수제청. 수제고. 코디얼 전문점
건강한 수제청을 만드는 달래리
010-2875-1993
전국 택배 가능 7만원이상 무료
smartstore.naver.com/dallaerifood', 'thumbnail_studio_1680488646034_달래리.png', 'studio_1680488646034_달래리.png');

INSERT INTO li_studio(s_no, ct_bizno, s_title, s_content, s_thumb, s_file)
    VALUES(15, '1112050905', '꿈을담은틀 홍보', '인스타 : https://www.instagram.com/ggumtle_embroidery/

동화속의 한장면을 담아내는 듯한 일러스트 자수를 수놓는 꿈을담은틀 공방입니다.
소수정예로만 이루어지는 클래스로 프랑스자수에 대해서 깊게 배워볼 수 있는
커리큘럼으로 이루어져있습니다.
주로 아기자기한 이미지를 수놓아 다양한 소품과 액자를 만들고
클래스를 통해 즐거움을 공유하는 공간입니다.

자수로 일상을 보내요
spend daily life with embroidery
?
꽃이 피어나는 사계절 자수 도서 저자
linktr.ee/ggumtle',
    'thumbnail_studio_1680488672251_꿈을담은틀.png', 'studio_1680488672251_꿈을담은틀.png');
    
    

INSERT INTO li_studio(s_no, ct_bizno, s_title, s_content, s_thumb, s_file)
    VALUES(16, '4140693656', '이숲 홍보', '인스타 : https://www.instagram.com/this.forest/

직조공방 이숲입니다.
수직기를 이용하여 직접 직조한 핸드메이드 직물을 선보입니다.
러그  쿠션  테이블매트  목도리  스카프 등 다양한 핸드메이드 제품을 선보입니다.

다양하게 천을 짭니다
천 짜러 오세요
linktr.ee/thisforest', 'thumbnail_studio_1680488725436_이숲.png', 'studio_1680488725436_이숲.png');
    
INSERT INTO li_studio(s_no, ct_bizno, s_title, s_content, s_thumb, s_file)
    VALUES(17, '6072666671', '바실공방 홍보', '인스타 : https://www.instagram.com/basil0306/

핸드메이드 소품 및 가방 등 제작등을 주로 하며직장인 대상
평일반  야간반  주말반 등 취미반 위주로 수업을 하고 있으며
재봉틀 수업을 하고 있는 개인공방입니다.

온라인으로는 창작 수제에코백을 제작 판매하고 있고 현재 블로그 및 스토어팜도 운영하고 있어요^^

수제가방제작과 클래스를 진행해요
#포천시지정체험처
#포천교육지원청협약기관
#포천학교밖청소년지원센터협약기관
link.inpock.co.kr/basil0306
https://blog.naver.com/wktmals1035', 'thumbnail_studio_1680488773768_바실공방.png', 'studio_1680488773768_바실공방.png');

INSERT INTO li_studio(s_no, ct_bizno, s_title, s_content, s_thumb, s_file)
    VALUES(18, '1101194683', 'mogiwood 홍보', '인스타 : https://www.instagram.com/woodstudio_mogi/


경기 고양시 행신동에 위치한 목공방으로 2006년부터 현재까지 목가구 작가로써의 전시 활동과 목가구 주문제작
심도 깊은 1년 과정의 목공 교육과정을 중심으로  단기 과정의 취미반과 속성반등 다양한 교육과정을 운영하는 목공방입니다.

since2006 / 목이공방 [woodstudio mogi]
원목가구주문제작 + 목공아카데미
방문 및 문의
010 3757 1086
경기도와 경기컨텐츠진흥원이 선장한 경기 대표공방
www.mogiwood.com',
    'thumbnail_studio_1680488974738_mogiwood.png', 'studio_1680488974738_mogiwood.png');
    
    
INSERT INTO li_studio(s_no, ct_bizno, s_title, s_content, s_thumb, s_file)
    VALUES(19, '2299012336', '꿈블룸 홍보', '인스타 : https://www.instagram.com/kkooomblooom/

경기도 성남시 중원구 금광동에 위치한 세라믹, 아트 스튜디오 입니다.
소수정예의 도자기 수강과 미술 수업이 이루어지며  예술감성을 나누는 공간입니다. ;)', 'thumbnail_studio_1680489007993_꿈블룸.png', 'studio_1680489007993_꿈블룸.png');
    
INSERT INTO li_studio(s_no, ct_bizno, s_title, s_content, s_thumb, s_file)
    VALUES(20, '6670500768', '수수케이크 홍보', '인스타 : https://www.instagram.com/soosoo_cake/

수수케이크 / 광명떡케이크 / 광명앙금플라워 / 광명답례떡

Gwangmyeong, Korea (경기도 광명 7호선 철산역)
KFDA 1급 수료
앙금플라워 정규/원데이 클래스 운영 및 판매
떡 원데이클래스 운영
문의 : 카카오톡 플러스친구 수수케이크 (dm X)
pf.kakao.com/_xiDAxlxl', 'thumbnail_studio_1680489056159_수수케이크.png', 'studio_1680489056159_수수케이크.png');



--스튜디오 테이블 시퀀스
create sequence li_studio_seq
start with 21
increment by 1
minvalue 1
nocycle
nocache;


select * from li_studio;