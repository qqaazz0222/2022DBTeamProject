-- MySQL dump 10.13  Distrib 8.0.28, for macos11 (x86_64)
--
-- Host: 127.0.0.1    Database: mydb
-- ------------------------------------------------------
-- Server version	8.0.29

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `sessions`
--

DROP TABLE IF EXISTS `sessions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sessions` (
  `session_id` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `expires` int unsigned NOT NULL,
  `data` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin,
  PRIMARY KEY (`session_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sessions`
--

LOCK TABLES `sessions` WRITE;
/*!40000 ALTER TABLE `sessions` DISABLE KEYS */;
INSERT INTO `sessions` VALUES ('7MuwiCo2L4QfMxYw6Q8P4HRs9DgUZx77',1671134986,'{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"uid\":\"user1\",\"isLogined\":true}');
/*!40000 ALTER TABLE `sessions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `공동코드`
--

DROP TABLE IF EXISTS `공동코드`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `공동코드` (
  `코드` int NOT NULL,
  `코드유형` varchar(45) DEFAULT NULL,
  `상세코드` varchar(45) DEFAULT NULL,
  `코드명` varchar(45) DEFAULT NULL,
  `사용여부` tinyblob,
  PRIMARY KEY (`코드`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `공동코드`
--

LOCK TABLES `공동코드` WRITE;
/*!40000 ALTER TABLE `공동코드` DISABLE KEYS */;
/*!40000 ALTER TABLE `공동코드` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `공유장바구니`
--

DROP TABLE IF EXISTS `공유장바구니`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `공유장바구니` (
  `공유장바구니식별번호` int NOT NULL AUTO_INCREMENT,
  `공유장바구니이름` varchar(45) NOT NULL,
  `생성자` varchar(10) NOT NULL,
  `결제자` varchar(10) NOT NULL,
  `생성일자` date DEFAULT NULL,
  `도서총수량` int DEFAULT NULL,
  `구매예정일` date DEFAULT NULL,
  `공유된회원수` int DEFAULT NULL,
  `결제확인회원수` int DEFAULT NULL,
  PRIMARY KEY (`공유장바구니식별번호`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `공유장바구니`
--

LOCK TABLES `공유장바구니` WRITE;
/*!40000 ALTER TABLE `공유장바구니` DISABLE KEYS */;
INSERT INTO `공유장바구니` VALUES (1,'공유장바구니1','user1','user1','2022-12-04',100,'2022-12-14',20,20),(2,'공유장바구니2','user2','user2','2022-12-05',70,'2022-12-15',25,19),(3,'공유장바구니3','user1','user2','2022-12-08',200,'2022-12-18',5,5),(4,'공유장바구니4','user1','user3','2022-12-10',10,'2022-12-20',4,2),(5,'공유장바구니5','user2','user4','2022-12-11',22,'2022-12-21',30,15),(6,'공유장바구니6','user3','user1','2022-12-12',34,'2022-12-22',22,7),(7,'공유장바구니7','user2','user3','2022-12-13',15,'2022-12-23',2,2),(8,'공유장바구니8','user3','user2','2022-12-15',30,'2022-12-25',10,10),(9,'공유장바구니9','user1','user4','2022-12-17',22,'2022-12-27',4,3),(10,'공유장바구니10','user2','user4','2022-12-19',10,'2022-12-29',12,5),(11,'데이터베이스 101분반','user1','user2','2022-12-15',NULL,'2022-12-30',NULL,NULL),(16,'마멘수의꿀단지','user1','user1','2022-12-15',NULL,'2022-12-12',NULL,NULL);
/*!40000 ALTER TABLE `공유장바구니` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `공유장바구니항목`
--

DROP TABLE IF EXISTS `공유장바구니항목`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `공유장바구니항목` (
  `회원아이디` varchar(10) NOT NULL,
  `공유장바구니식별번호` int NOT NULL,
  `도서식별번호` int NOT NULL,
  `도서추가수량` int DEFAULT NULL,
  `추가날짜` date DEFAULT NULL,
  PRIMARY KEY (`회원아이디`,`공유장바구니식별번호`,`도서식별번호`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `공유장바구니항목`
--

LOCK TABLES `공유장바구니항목` WRITE;
/*!40000 ALTER TABLE `공유장바구니항목` DISABLE KEYS */;
INSERT INTO `공유장바구니항목` VALUES ('user1',11,1,10,'2022-11-11');
/*!40000 ALTER TABLE `공유장바구니항목` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `공유회원항목`
--

DROP TABLE IF EXISTS `공유회원항목`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `공유회원항목` (
  `회원아이디` varchar(10) NOT NULL,
  `공유장바구니식별번호` int NOT NULL,
  `접근권한여부` tinyint DEFAULT NULL,
  `결제수락여부` tinyint DEFAULT NULL,
  `초대수락여부` tinyint DEFAULT NULL,
  PRIMARY KEY (`회원아이디`,`공유장바구니식별번호`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `공유회원항목`
--

LOCK TABLES `공유회원항목` WRITE;
/*!40000 ALTER TABLE `공유회원항목` DISABLE KEYS */;
INSERT INTO `공유회원항목` VALUES ('st20181468',11,1,0,0),('user1',11,1,1,1),('user1',16,1,0,1),('user2',11,1,0,0),('user6',11,1,0,0);
/*!40000 ALTER TABLE `공유회원항목` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `답변`
--

DROP TABLE IF EXISTS `답변`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `답변` (
  `문의식별번호` int NOT NULL,
  `답변식별번호` int NOT NULL,
  `회원아이디` varchar(10) NOT NULL,
  `답변 내용` varchar(200) DEFAULT NULL,
  `답변 날짜` datetime DEFAULT NULL,
  PRIMARY KEY (`문의식별번호`,`답변식별번호`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `답변`
--

LOCK TABLES `답변` WRITE;
/*!40000 ALTER TABLE `답변` DISABLE KEYS */;
INSERT INTO `답변` VALUES (1,1,'user1','고객님께서 주문하신 내용은 22년 12월 13일 안에 도착할 예정입니다.','2022-12-10 00:00:00'),(2,2,'user2','공유 장바구니 페이지에서 초대하기에 아이디를 입력하면 이용하고 있는 공유 장바구니에 초대를 할 수 있습니다.','2022-12-05 00:00:00'),(3,3,'user3','공유 장바구니 결제자는 결제자 바꾸기 팝업을 통해 바꿀 수 있습니다.','2022-12-06 00:00:00'),(4,4,'user1','문의 주신 도서의 할인 계획은 아직 예정되지 않았습니다.','2022-12-08 00:00:00'),(5,5,'user4','도서의 최대 구매 수량은 따로 없습니다.','2022-12-10 00:00:00'),(6,6,'user2','교환 진행해드리겠습니다.','2022-12-11 00:00:00'),(7,7,'user3','교환 진행해드리겠습니다.','2012-12-12 00:00:00');
/*!40000 ALTER TABLE `답변` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `도서`
--

DROP TABLE IF EXISTS `도서`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `도서` (
  `도서식별번호` int NOT NULL,
  `카테고리` varchar(45) DEFAULT NULL,
  `도서명` varchar(45) DEFAULT NULL,
  `도서설명` varchar(2000) DEFAULT NULL,
  `도서가격` int DEFAULT NULL,
  `저자` varchar(45) DEFAULT NULL,
  `출판사` varchar(45) DEFAULT NULL,
  `재고량` int DEFAULT NULL,
  `등록일자` datetime DEFAULT NULL,
  `판매가능상태` tinyint DEFAULT NULL,
  `도서평점` int DEFAULT NULL,
  `평점개수` int DEFAULT NULL,
  `도서할인율` int DEFAULT NULL,
  PRIMARY KEY (`도서식별번호`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `도서`
--

LOCK TABLES `도서` WRITE;
/*!40000 ALTER TABLE `도서` DISABLE KEYS */;
INSERT INTO `도서` VALUES (1,'수학','수학 잘하는 아이를 만드는 초등수학 심화 공부법','《수학 잘하는 아이는 이렇게 공부합니다》의 저자 류승재의 두 번째 책으로 전작에서 하고 싶은 말이 너무 많아서 미처 알려 주지 못했던 것들을 모두 알려 준다. 초중등 때 수학 잘하다가 고등 때 무너지는 아이들의 예시와 그 이유를 제시했는데, 지나친 선행학습과 양치기식 문제풀이를 반복하는 ‘가짜 수학 공부’를 한 아이들이 무너지는 이유를 심화능력 부족과 수동적 공부 습관으로 지적했다.',22000,'김기훈','한빛출판사',1000,'2019-08-04 00:00:00',1,10,99,0),(2,'인문','흔한남매 이상한 나라의 고전 읽기 1','어린이들에게 익숙한 ‘흔한남매’ 캐릭터가 등장하여 고전 소설에 대한 거부감을 없애고, 고전을 처음 접하는 어린이들도 쉽게 읽을 수 있도록 구성한 책이다. 기존의 고전 스토리에 지금 우리 아이들에게 익숙한 반읽기물의 형식을 빌려 이야기를 새롭고 재미있게 구성하였다. 기존의 고전 스토리에 상상력이 가미된 재미있는 이야기를 읽다 보면 상상력, 창의력도 키울 수 있고, 고전에 대해 친근감을 갖게 되어 추후 더 깊이 있는 독서로 이어질 수 있을 것이다.',14000,'김현수','우리출판사',1000,'2020-06-04 00:00:00',1,10,99,0),(3,'인문','당신의 마음에 이름을 붙인다면','누구나 살다 보면 말로는 설명하기 힘든 감정을 느낄 때가 있다. 그런데 모국어로도 표현하기 힘든 이 미묘한 감정을 정확히 나타내는 외국어가 있다면? 영어 ‘히라이스’는 다시는 돌아갈 수 없는 곳에 대한 그리움을, 네덜란드어 ‘헤젤리흐’는 사랑하는 이들과 함께 보내는 시간이 주는 고양감을, 독일어 ‘토아슈루스파니크’는 잃어버린 기회와 흘러가는 시간에 대한 두려움을 나타낸다. 이렇듯 다른 언어권에서는 한 단어로 설명할 수 없는 감정이나 상황을 정확히 나타내는 세계 17개국의 71개 단어가 당신의 감정에 이름을 달아 준다.',19000,'전탁준','달빛출판사',888,'2021-06-12 00:00:00',1,10,60,0),(4,'외국어','올리버쌤의 미국식 아이 영어 습관 365','일상생활에서 자연스럽게 영어를 알려주며 209만 구독자에게 사랑받는 올리버쌤이 아이를 위한 일력을 출간했다. 매일 한 장씩 아이와 함께 넘겨 보며 영어 자신감을 키울 수 있는 만년 일력이다. 미국 가정집에서 매일 사용하는 쉽고 간단하면서도 일상을 모두 표현할 수 있는 필수 영어 문장과 단어를 엄선했다.',14000,'김미래','하늘출판사',999,'2020-05-04 00:00:00',1,2,20,10),(5,'수학','어서 오세요, 이야기 수학 클럽에','“덧셈, 뺄셈, 곱셈, 나눗셈만 알아도 세상을 잘 사는데 왜 굳이 복잡한 수학 공부가 필요할까?” 수학을 공부하면서 학생들이 가장 많이 품는 의문일지도 모르겠다. 김민형 교수는 수업마다 늘 따라붙는 이 질문에 대해 ‘세상을 더 잘 이해하기 위해서’라고 답한다.',12000,'유재석','번개출판사',1000,'2019-09-06 00:00:00',0,5,20,0),(6,'인문','모두 다 꽃이야','국악 동요 그림책 시리즈. 천만 회가 넘는 유튜브 조회 수, 많은 부모와 아이에게 사랑받는 국악 동요 \'모두 다 꽃이야\'가 그림책으로 새롭게 탄생했다. 이 노래는 아름다운 노랫말과 고운 선율로 유명하다. 특히 아이들의 자존감을 키우는 노랫말 때문에 어린이집은 물론 초등학교에서도 인기 있는 노래이다.',6000,'노홍철','대영출판사',1000,'2014-05-07 00:00:00',1,4,68,0),(7,'역사','한 컷 한국사','<한 컷 한국사>를 집필한 열 명의 역사 교사들은 고등학교 한국사 교과서를 공동 집필한 경험이 있다. 집필진은 한 컷의 역사 사진에 담겨 있는 시대상을 역사 교사의 시선으로 풀어쓴 책이 있으면 좋겠다는 데 의견을 모은 뒤, 145컷의 한국사 사진을 선정하고 2년의 공부와 집필을 거쳐 <한 컷 한국사>를 완성했다.',15400,'최연성','검은출판사',1000,'2020-08-08 00:00:00',1,7,54,30),(8,'인문','초등 맞춤법 50일 완주 따라쓰기 : 기초 편','글의 기본은 문장이고, 문장의 기본은 맞춤법이다. 맞춤법을 잘 알지 못하면 좋은 문장을 쓸 수 없고, 내 생각이나 주장을 글로 써서 올바르게 표현하기도 어렵다. 이렇게 맞춤법 실력이 제대로 갖추어지지 않으면 문장을 읽어도 제대로 이해하지 못해 문해력과 독해력까지 떨어진다.',21500,'이수빈','WE출판사',1000,'2021-04-01 00:00:00',1,8,10,50),(9,'자연과학','도시 식물 탐험대','대학에서 함께 식물을 전공하고 수목원, 국립공원 등 식물로 둘러싸인 세계에서 일해 온 세 명의 저자는 어린이들이 주변에서 쉽게 발견할 수 있는 식물들을 그냥 지나치지 않기를, 당차게 자신만의 삶을 살아내는 식물들에 관심을 가지기를, 자연의 변화와 신비로움을 눈과 손과 발로 몸소 느끼기를 바라는 마음을 담아 재미있고, 쉽고, 무엇보다 끝까지 읽을 수 있는 식물도감 <도시 식물 탐험대>를 기획했다.',3900,'박해일','영민출판사',1000,'2018-01-17 00:00:00',1,6,32,40),(10,'인문','내가 알던 것보다 사연이 많아! K-요괴 도감','우리 나라 고대 문헌 속 요괴부터 현대의 도시 전설 속 요괴까지, 요즘 스타일로 새롭게 탄생한 한국 요괴 35종. 그들의 구구절절한 사연과 요괴력, 필살기와 MBTI, 물리치는 방법 등을 싹싹 털어 탐구해 보자.',12500,'김용민','기역출판사',1000,'2022-02-06 00:00:00',1,5,4887,20),(11,'인문','레이디스','족쇄 같은 일상을 탈출해 낯선 세계로 뛰어든 사람들이 있다. \"미친 듯 돌아가는\" 뉴욕의 직장을 그만두고 숲으로 둘러싸인 소도시에서 아침을 맞는 남자, 폭력적인 남편을 떠나 유년이 고스란히 잠든 고향으로 도망친 여자, 수녀원에서 여자로 키워지다 마침내 진실을 알게 된 소년, 처음으로 직장을 결근해버린 중년 여성과, 대도시로 이사 와서 학교에 갈 걱정에 시달리는 아이, 그리고 고향을 탈출한 거미까지.',12000,'퍼트리샤 하이스미스','북하우스',3200,'2022-10-07 00:00:00',1,9,1154,0),(12,'인문','돌봄과 작업','아이를 낳은 적도, 낳을 계획도 없는데 여러 저자의 글 곳곳에서 울컥한다. 심지어 슬픈 내용도 아닌데. 이 책은 창조적인 일을 하는 여자 열한 명의 잉태와 양육 경험에 대한 이야기를 담고 있다. 과학기술학 연구자 임소연은 이렇게 말한다. \"양육 이야기 없이 인간의 본질에 대한 깊이 있는 통찰과 이해가 가능하다고? 말도 안 된다.\" 아마도 나의 울컥은 이 이야기들에 담긴 인간 본질에 대한 깊이 있는 통찰과 이해에 대한 감동으로부터 온 것 같다. 출산은 전과 후를 완전하게 갈라놓는 사건이고, 양육은 농도가 짙을 수밖에 없는 경험이므로 저자들이 통과한 깨달음들이 너무나 절절하다.',7800,'정서경','돌고래',2200,'2021-06-04 00:00:00',1,5,658,0),(13,'어린이','흔한남매 12','개성 만점 으뜸이 채널, 공포의 버스 안내 방송, 떡볶이 뷔페에 간 흔한남매, 으뜸이의 최악의 생일 파티, 상상 속 방학과 현실 속 방학의 차이, 엄지의 비밀 일상 등 흔한남매의 일상 속엔 생기 넘치는 공감과 웃음이 가득하다.',14500,'흔한남매','미래앤아이세움',1000,'2021-02-14 00:00:00',1,8,44,0),(14,'사회과학','경제 뉴스가 그렇게 어렵습니까? ','2020년 1월 6일 한 일간지는 “종부세 늘리고 1년 미만 보유 주택엔 양도세 징벌 과세 검토”라는 제목의 기사를 통해 정부의 양도세 인상을 비판했다. 비판의 요지는 “문재인 정부는 출범 이후 ‘‘보유세 인상(종부세·재산세), 거래세(양도소득세, 취득세) 인하’와 같은 원칙을 여러 차례 밝혔다. ···하지만 이런 원칙은 유야무야되고 있다”는 것이다. 이 기사는 양도세를 취득세와 같은 거래세로 표현했다. 취득세가 취득(매입)이라는 거래에 발생하는 세금이고 양도세가 양도(매각)라는 거래에 부과되는 세금이라면, 양도세는 거래세가 맞다. 그러나 양도세는 거래세가 아니다. 양도세의 본말(풀네임)은 ‘양도소득세’다. 양도세라는 줄임말만 보면 양도할 때 부과되는 세금처럼 느껴지지만, 양도‘소득세’라는 본말을 들으면 거래세가 아닌 소득세의 하나라는 느낌이 전달된다. 그러므로 양도세 강화는 거래세 강화가 아니다. 양도세 인상이 ‘보유세 인상, 거래세 인하’라는 정부의 부동산 정책에 어긋난다는 이 기사의 논리는 잘못이다.',16000,'이상민','빨간소금',200,'2021-06-21 00:00:00',1,4,127,10),(15,'에세이','연이와 버들 도령','백희나 작가가 <나는 개다> 이후 3년 만에 새 그림책을 내어놓았다. 그동안 작가에게는 좋은 일도, 나쁜 일도 있었다. 매년 3월 새 책을 내오던 작가는 잠시 작업을 쉬었다. 지친 몸과 마음을 다독이면서, 다시 일어날 힘을 모으면서, 그리고 이제 일어나 다음으로 넘어가는 길목에서 작가는 옛이야기, 연이와 버들 도령을 생각했다.',13000,'백희나','책읽는 곰',600,'2021-09-14 00:00:00',1,10,121,0),(16,'사회과학','The Earthian Tales 어션 테일즈 No.1','지구에서 지구인들이, 계절마다 만들어낼 경이로운 이야기. The Earthian Tales 어션 테일즈가 항해를 위해 닻을 올린다. 왜 \'잡지\'인가 하는 질문에서 이 기획은 출발한다. \'어메이징 스토리즈\'와 같은 시도를 통해 메리 셸리와 쥘 베른의 작품이 조명되고, 동시대와 공명하며 장르의 판이 커졌듯, 1960년대 한낙원의 작품은 잡지 <학원>을 통해 연재되며 꿈 많은 독자를 만났다. (한낙원과학소설상을 통해 2020년대 남유하, 문이소 등의 작가가 소개되고 있다는 점도 재미있다.) PC통신 동호회와 웹진과 무크지로 모이고 흩어졌던 이들이 한 제호 아래 다시 모여 자신의 이야기로 밤을 밝힌다. 첫 호의 \'느슨한\' 주제는 \'홀로\'. 팬데믹을 지나며 홀로 이 우주에 존재하는 단독자들은 어떤 생각을 하며 연결을 꿈꾸게 될까.',19400,'김보영','아작',1700,'2022-11-17 00:00:00',1,6,214,0),(17,'에세이','어떻게 경제적 자유를 얻을 것인가','나이가 30대든 50대든, 명예 퇴직을 하든 정년 때까지 다니든, 경제적 자유를 달성해야 한다는 것은 노년에 더이상 일할 수 없는 처지에 놓일 우리 모두에게 주어진 숙제와도 같다. 그런데 그 숙제를 빠르게 끝마친 사람들의 사례가 점점 더 우리를 옥죄어 오고 있다. 이른바 파이어족이라 불리는, 일찌감치 경제적 자유를 달성한 사람들의 이야기는 책이나 뉴스에서 토픽처럼 다뤄졌으나 이제는 아주 가까운 곳에서도 심심치 않게 들려오고 있다. 부러우면 지는 거라지만 직장인이라면 부럽지 않을 수가 없다. 그러한 마음은 FOMO 증후군, 벼락거지 등의 표현 속에 메아리치며 우리를 더욱 불안하게 만든다.',14500,'이동훈','해냄',1000,'2022-10-23 00:00:00',1,5,854,0),(18,'어린이','검피 아저씨의 코뿔소','<지각대장 존>, <크리스마스 선물> 등 아이의 마음을 있는 그대로 표현하고 어루만져 주었던 작가 존 버닝햄의 유작. 아이들, 동물들과 함께 뱃놀이나 드라이브를 즐기며, 짜증 한번 내지 않고 \'다음에 또 오라\'던 검피 아저씨는, 평생 다섯 살 아이의 마음을 간직했던 존 버닝햄 그 자체였을 것이다. 존 버닝햄의 마지막 그림책은 그래서 역시 \'검피 아저씨\'와 아이들, 그리고 동물들의 이야기다.',7800,'존 버닝햄','시공주니어',120,'2021-04-21 00:00:00',1,8,99,30),(19,'에세이','농경의 배신','인류가 수렵, 채취 경제에서 곡류의 재배 및 가축 사육에 성공하여 농업 사회로 이행한 문명사의 획기적 사건. \'농업 혁명\'을 검색해 보면 나오는 대략의 내용이다. 그리고 농업 혁명은 국가라는 커다란 공동체를 탄생시키기에 이른다. 농경, 정착, 국가로 이어지는 그 자연스럽고 연속적인 진보와 문명의 서사는 인류를 매혹시켜 왔다. 우리 모두가 그렇게 배워 왔음은 물론이다. 그것은 마치 코페르니쿠스 시대의 천동설처럼, 정설을 넘어 하나의 진리로 받아들여진 듯하다. 이 책은 바로 그 국가의 기원에 대한 천동설을 전면 부정한다. 코페르니쿠스 역을 맡은 이는 정치 및 인류학의 대가 제임스 스콧이다.',13000,'제임스 C. 스콧','책과함께',470,'2021-05-07 00:00:00',1,7,40,50),(20,'에세이','주식투자 절대 원칙','기름진 땅과 좋은 씨앗을 갖춘 농부는 해당 작물에 맞는 계절과 시기를 선택해 파종을 시작한다. 병충해와 자연재해를 피해 작물이 잘 자랄 수 있도록 살피고 또 살핀다. 그렇게 정성을 다해 오래 기다린 끝에, 수확의 계절이 다가온다. 그야말로 결실이라는 말이 딱 어울린다. 주식 투자는 이런 농사에 곧잘 비유되곤 한다. 투자자들 역시 투자할 시장과 종목을 고르고 매수 타이밍을 고민한다. 농부가 작물을 보살피듯 매일매일 시장 상황을 살핀다. 그런데 투자자들에게 수확의 계절은 따로 없어 보인다. 기다리는 일은 농부가 몇 수 위인 것 같다.',18500,'박영옥','센시오',750,'2022-04-17 00:00:00',1,7,50,20),(21,'기술과학','데이터베이스개론','데이터베이스 개론입니다',29000,'김기훈','디비와',100,'2022-04-17 00:00:00',1,10,500,0),(22,'기술과학','Node.js교과서','노드js교과서 입니다.',25000,'김현수','노드노드',100,'2022-04-17 00:00:00',1,10,500,0);
/*!40000 ALTER TABLE `도서` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `리뷰`
--

DROP TABLE IF EXISTS `리뷰`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `리뷰` (
  `리뷰식별번호` int NOT NULL,
  `도서식별번호` int NOT NULL,
  `작성자` varchar(10) NOT NULL,
  `리뷰제목` varchar(45) DEFAULT NULL,
  `리뷰평점` int DEFAULT NULL,
  `리뷰날짜` datetime DEFAULT NULL,
  `리뷰내용` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`리뷰식별번호`,`도서식별번호`,`작성자`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `리뷰`
--

LOCK TABLES `리뷰` WRITE;
/*!40000 ALTER TABLE `리뷰` DISABLE KEYS */;
INSERT INTO `리뷰` VALUES (1,1,'user1','올해 최고의 책',10,'2022-11-15 00:00:00','올해 읽었던 책 중에 가장 재밌는 책입니다.'),(2,4,'user2','우리 아이가 달라졌어요',10,'2022-12-14 00:00:00','이 책을 읽고 우리 아이가 달라졌어요. 아이를 키우는 부모님들에게 추천합니다.'),(3,7,'user3','사진으로 보는 한국사',7,'2022-12-18 00:00:00','♚♚히어로즈 오브 더 스☆톰♚♚가입시$$전원 카드팩☜☜뒷면100%증정※ ♜월드오브 워크래프트♜펫 무료증정￥ 특정조건 §§디아블로3§§★공허의유산★초상화획득기회@@@ 즉시이동 지금바로 시작하세요!http://kr.battle.net/heroes/ko/'),(4,2,'user4','흔한 리뷰',1,'2022-12-22 00:00:00','흔한 남매를 보고 쓰는 흔한 리뷰'),(5,8,'user1','이 책을 읽고 맞춤법을 꺠달았습니다.',8,'2022-08-15 00:00:00','맞춤법을 잘 지킵시다.'),(6,6,'user1','꽃 같은 인생',9,'2022-12-14 00:00:00','인생은 꽃이다');
/*!40000 ALTER TABLE `리뷰` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `문의`
--

DROP TABLE IF EXISTS `문의`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `문의` (
  `문의식별번호` int NOT NULL,
  `회원아이디` varchar(10) NOT NULL,
  `문의유형` varchar(45) DEFAULT NULL,
  `문의내용` varchar(200) DEFAULT NULL,
  `문의날짜` datetime DEFAULT NULL,
  PRIMARY KEY (`문의식별번호`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `문의`
--

LOCK TABLES `문의` WRITE;
/*!40000 ALTER TABLE `문의` DISABLE KEYS */;
INSERT INTO `문의` VALUES (1,'user1','배송','책 주문한지 하루가 지났는데 언제 오나요?','2022-12-09 00:00:00'),(2,'user2','공유 장바구니 ','공유 장바구니에 초대를 하고 싶은데 어떻게 하면 되나요?','2022-12-04 00:00:00'),(3,'user3','공유 장바구니','공유 장바구니 결제자를 바꾸고 싶습니다.','2022-12-05 00:00:00'),(4,'user1','도서','모두 다 꽃이야 언제 할인 하나요?','2022-12-07 00:00:00'),(5,'user4','주문','한 책당 최대 몇 권까지 주문할 수 있나요?','2022-12-09 00:00:00'),(6,'user2','교환/환불','책 페이지에 얼룩이 있네요 바꿔주세요','2022-12-10 00:00:00'),(7,'user3','교환/환불','다른 책이 배송됐어요 교환해주세요','2012-12-11 00:00:00');
/*!40000 ALTER TABLE `문의` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `배송지`
--

DROP TABLE IF EXISTS `배송지`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `배송지` (
  `배송지식별번호` varchar(30) NOT NULL,
  `회원아이디` varchar(10) NOT NULL,
  `배송지명칭` varchar(45) DEFAULT NULL,
  `기본주소` varchar(45) DEFAULT NULL,
  `상세주소` varchar(45) DEFAULT NULL,
  `우편번호` int DEFAULT NULL,
  `주배송지여부` tinyint DEFAULT NULL,
  PRIMARY KEY (`배송지식별번호`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `배송지`
--

LOCK TABLES `배송지` WRITE;
/*!40000 ALTER TABLE `배송지` DISABLE KEYS */;
INSERT INTO `배송지` VALUES ('user1','user1','김기훈의 집','부산광역시 114-24','101동 1402호',22451,1),('user2','user2','김현수의 집','부산광역시 441-54','',44574,1),('user3','user3','전탁준의 집','부산광역시 441-57','202동 707호',34513,1),('user4','user4','UIT','부산광역시 415-74','304',75487,1);
/*!40000 ALTER TABLE `배송지` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `북스터디내용`
--

DROP TABLE IF EXISTS `북스터디내용`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `북스터디내용` (
  `내용식별번호` int NOT NULL AUTO_INCREMENT,
  `상위내용식별번호` int DEFAULT NULL,
  `주제여부` tinyint DEFAULT NULL,
  `북스터디방식별번호` int NOT NULL,
  `회차` int NOT NULL,
  `회원아이디` varchar(10) NOT NULL,
  `시간` datetime DEFAULT NULL,
  `내용` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`내용식별번호`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `북스터디내용`
--

LOCK TABLES `북스터디내용` WRITE;
/*!40000 ALTER TABLE `북스터디내용` DISABLE KEYS */;
INSERT INTO `북스터디내용` VALUES (1,NULL,NULL,2,2,'user2','2022-12-12 00:00:00','병인양요는 1866년 병인박해 때 프랑스인 신부가 처형된 것에 대한 보복으로 프랑스가 조선의 강화도를 공격한 사건이지'),(2,NULL,NULL,2,2,'user2','2022-12-12 16:21:23','병인박해는 1866년 조선 조정에서 가톨릭 교도를 대량 학살한 사건이야'),(3,NULL,NULL,2,2,'user3','2022-12-13 18:17:21','신미양요는 1871년(고종 8) 미국이 1866년의 제너럴 셔먼호 사건을 빌미로 조선을 개항시키고자 강화도를 공격한 사건이야 '),(4,NULL,NULL,2,2,'user3','2022-12-14 13:37:47','맹꽁이 서당도 재미 있어요'),(5,NULL,NULL,2,2,'user2','2022-12-14 19:24:23','맹꽁이 서당 띵장이죠'),(6,NULL,NULL,2,2,'user3','2022-12-15 00:00:00','역사 공부를 열심히 하자'),(7,NULL,NULL,2,2,'user3','2022-12-16 00:00:00','조선 왕조 실록은 조선 태조에서 철종까지 472년간의 역사적 사실을 각 왕 별로 기록한 편년체 사서야'),(8,NULL,NULL,2,2,'user3','2022-12-17 00:00:00','동학 농민 운동은 1894년 전봉준을 중심으로 김기범 손화중 김개남 등의 동학 지도자들이 고부 군수 조병갑의 횡포에 대항하여 탐관오리의 숙청과 보국 안민을 목적으로 시작되었지'),(9,NULL,NULL,3,1,'user4','2022-12-13 00:00:00','책과 함께 여행을 떠나보아요'),(10,NULL,NULL,3,1,'user4','2022-12-14 00:00:00','나 홀로 하는 독서'),(11,NULL,1,6,1,'user1','2022-12-14 00:00:00','책에 대한 각자 소감을 말해볼까요? 자유롭게 대화해주세요.'),(12,11,0,6,1,'user2','2022-12-14 00:00:00','데이터베이스너무 어려워요...'),(13,11,0,6,1,'user3','2022-12-14 00:00:00','저도 그렇게 생각해요'),(14,11,0,6,1,'user4','2022-12-14 00:00:00','저도 너무 어려워요 ㅠㅠㅠㅠㅠ'),(15,NULL,1,6,1,'user1','2022-12-14 00:00:00','다음주 도서 투표'),(19,NULL,1,6,1,'user2','2022-12-15 03:48:34','ㅁㄴㅇㅁㅇㅁㄴ'),(20,NULL,1,6,1,'user2','2022-12-15 03:49:03','책책'),(21,NULL,0,6,1,'user2','2022-12-15 04:08:28','마망'),(22,NULL,0,6,1,'user2','2022-12-15 04:08:34','롤롤롤');
/*!40000 ALTER TABLE `북스터디내용` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `북스터디방`
--

DROP TABLE IF EXISTS `북스터디방`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `북스터디방` (
  `북스터디방식별번호` int NOT NULL AUTO_INCREMENT,
  `카테고리` varchar(45) DEFAULT NULL,
  `북스터디이름` varchar(200) DEFAULT NULL,
  `참가인원수` int DEFAULT NULL,
  `제한인원수` int DEFAULT NULL,
  `진행상태여부` tinyint DEFAULT NULL,
  `진행회차` int DEFAULT NULL,
  `방생성일자` date DEFAULT NULL,
  `방비밀번호` int DEFAULT NULL,
  PRIMARY KEY (`북스터디방식별번호`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `북스터디방`
--

LOCK TABLES `북스터디방` WRITE;
/*!40000 ALTER TABLE `북스터디방` DISABLE KEYS */;
INSERT INTO `북스터디방` VALUES (1,'철학','소크라테스의 변명',1,6,0,1,'2022-12-08',NULL),(2,'역사','역사 속으로',2,6,1,2,'2022-12-10',NULL),(3,'여행','책과 함께 떠나는 여행',1,6,0,1,'2022-12-12',1234),(4,'철학','가벼운 철학',2,6,1,1,'2022-12-15',1234),(5,'기술과학','데이터베이스여행',1,6,0,1,'2022-12-15',NULL),(6,'기술과학','Node.js 야헹',1,6,0,1,'2022-12-15',NULL);
/*!40000 ALTER TABLE `북스터디방` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `북스터디방회원`
--

DROP TABLE IF EXISTS `북스터디방회원`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `북스터디방회원` (
  `북스터디방식별번호` int NOT NULL,
  `회원아이디` varchar(10) NOT NULL,
  `안읽은채팅의개수` int DEFAULT NULL,
  `마지막으로읽은채팅번호` datetime DEFAULT NULL,
  PRIMARY KEY (`북스터디방식별번호`,`회원아이디`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `북스터디방회원`
--

LOCK TABLES `북스터디방회원` WRITE;
/*!40000 ALTER TABLE `북스터디방회원` DISABLE KEYS */;
INSERT INTO `북스터디방회원` VALUES (1,'user1',0,NULL),(2,'user3',0,'2022-12-20 00:00:00'),(3,'user4',0,NULL),(4,'user5',5,'2022-12-16 00:00:00'),(4,'user6',0,'2022-12-17 00:00:00'),(6,'user2',10,'2022-12-15 00:00:00');
/*!40000 ALTER TABLE `북스터디방회원` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `신고내역`
--

DROP TABLE IF EXISTS `신고내역`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `신고내역` (
  `리뷰식별번호` int NOT NULL,
  `도서식별번호` int NOT NULL,
  `신고한회원` varchar(10) NOT NULL,
  `신고받은회원` varchar(10) NOT NULL,
  `신고받은날짜` datetime DEFAULT NULL,
  `신고사유내용` varchar(200) DEFAULT NULL,
  `신고확인상태` tinyint DEFAULT NULL,
  PRIMARY KEY (`리뷰식별번호`,`도서식별번호`,`신고한회원`,`신고받은회원`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `신고내역`
--

LOCK TABLES `신고내역` WRITE;
/*!40000 ALTER TABLE `신고내역` DISABLE KEYS */;
INSERT INTO `신고내역` VALUES (1,1,'user2','user1','2022-12-01 00:00:00','부적절한 리뷰 신고합니다.',0),(2,4,'user1','user2','2022-12-15 16:24:21','저는 이 책에 1점을 주고 싶습니다.',0),(3,7,'user1','user3','2022-12-19 00:00:00','책 내용과는 상관 없는 광고성 리뷰 신고합니다.',1),(4,2,'user3','user4','2022-12-23 00:00:00','재미 없는 리뷰 신고합니다!',0);
/*!40000 ALTER TABLE `신고내역` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `장바구니`
--

DROP TABLE IF EXISTS `장바구니`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `장바구니` (
  `장바구니식별번호` int NOT NULL,
  `회원아이디` varchar(10) NOT NULL,
  `생성일자` datetime DEFAULT NULL,
  PRIMARY KEY (`장바구니식별번호`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `장바구니`
--

LOCK TABLES `장바구니` WRITE;
/*!40000 ALTER TABLE `장바구니` DISABLE KEYS */;
INSERT INTO `장바구니` VALUES (1,'user1','2019-03-17 00:00:00'),(2,'user2','2020-07-06 00:00:00'),(3,'user3','2022-10-30 00:00:00'),(4,'user4','2021-04-07 00:00:00');
/*!40000 ALTER TABLE `장바구니` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `장바구니항목`
--

DROP TABLE IF EXISTS `장바구니항목`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `장바구니항목` (
  `장바구니식별번호` int NOT NULL,
  `도서식별번호` int NOT NULL,
  `도서수량` int DEFAULT NULL,
  PRIMARY KEY (`장바구니식별번호`,`도서식별번호`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `장바구니항목`
--

LOCK TABLES `장바구니항목` WRITE;
/*!40000 ALTER TABLE `장바구니항목` DISABLE KEYS */;
INSERT INTO `장바구니항목` VALUES (1,1,12),(1,4,12),(1,5,2),(2,4,1),(2,7,1),(3,12,1),(3,15,2),(4,2,60),(4,6,40);
/*!40000 ALTER TABLE `장바구니항목` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `주문`
--

DROP TABLE IF EXISTS `주문`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `주문` (
  `주문식별번호` int NOT NULL AUTO_INCREMENT,
  `회원아이디` varchar(10) NOT NULL,
  `주문일자` datetime DEFAULT NULL,
  `주문수량` int DEFAULT NULL,
  `주문카드번호` int DEFAULT NULL,
  `주문카드유형` varchar(45) DEFAULT NULL,
  `주문기본주소` varchar(45) DEFAULT NULL,
  `주문상세주소` varchar(45) DEFAULT NULL,
  `주문금액합계` int DEFAULT NULL,
  `주문상태코드` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`주문식별번호`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `주문`
--

LOCK TABLES `주문` WRITE;
/*!40000 ALTER TABLE `주문` DISABLE KEYS */;
INSERT INTO `주문` VALUES (1,'user1','2022-11-11 00:00:00',10,1125487,'신용카드','부산광역시 114-24','101동 1402호',100000,NULL),(2,'user2','2022-12-04 00:00:00',5,22568547,'신용카드','부산광역시 441-54',NULL,54600,NULL),(3,'user3','2022-12-08 00:00:00',1,44875547,'체크카드','부산광역시 441-57','202동 707호',21000,NULL),(4,'user4','2022-12-12 12:00:00',160,115448554,'법인카드','부산광역시 415-74','304',9865400,NULL),(5,'user1','2020-04-21 00:00:00',1,1125487,'신용카드','부산광역시 114-24','101동 1402호',21100,NULL),(6,'user1','2019-08-04 00:00:00',1,1125487,'신용카드','부산광역시 114-24','101동 1402호',16500,NULL),(7,'user1','2021-06-28 00:00:00',1,1125487,'신용카드','부산광역시 114-24','101동 1402호',15400,NULL),(8,'user2','2022-11-11 00:00:00',2,22568547,'신용카드','부산광역시 441-54',NULL,24000,NULL),(9,'user2','2022-11-23 00:00:00',1,22568547,'신용카드','부산광역시 441-54',NULL,14500,NULL),(10,'user3','2022-11-27 00:00:00',1,44875547,'체크카드','부산광역시 441-57','202동 707호',15400,NULL),(11,'user4','2022-11-30 00:00:00',100,115448554,'법인카드','부산광역시 415-74','304',600000,NULL),(12,'user3','2022-12-01 00:00:00',1,44875547,'체크카드','부산광역시 441-57','202동 707호',15000,NULL),(13,'user1','2022-12-15 00:00:00',10,4212100,'체크카드','부산광역시 114-24','101동 1402호',290000,'000');
/*!40000 ALTER TABLE `주문` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `주문항목`
--

DROP TABLE IF EXISTS `주문항목`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `주문항목` (
  `도서식별번호` int NOT NULL,
  `주문식별번호` int NOT NULL,
  `주문항목수량` int DEFAULT NULL,
  `주문항목금액` int DEFAULT NULL,
  PRIMARY KEY (`도서식별번호`,`주문식별번호`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `주문항목`
--

LOCK TABLES `주문항목` WRITE;
/*!40000 ALTER TABLE `주문항목` DISABLE KEYS */;
INSERT INTO `주문항목` VALUES (1,1,10,100000),(2,4,160,9865400),(4,2,5,54600),(4,12,1,15000),(5,8,2,24000),(6,11,100,600000),(7,3,1,21000),(7,10,1,15400),(9,6,1,16500),(13,5,1,21100),(13,9,1,14500),(17,7,1,15400),(21,13,10,290000);
/*!40000 ALTER TABLE `주문항목` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `카드`
--

DROP TABLE IF EXISTS `카드`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `카드` (
  `카드식별번호` int NOT NULL,
  `회원아이디` varchar(10) NOT NULL,
  `카드명칭` varchar(45) DEFAULT NULL,
  `카드번호` int DEFAULT NULL,
  `유효기간` date DEFAULT NULL,
  `비밀번호` varchar(45) DEFAULT NULL,
  `CVC` int DEFAULT NULL,
  `주카드여부` tinyint DEFAULT NULL,
  PRIMARY KEY (`카드식별번호`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='		';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `카드`
--

LOCK TABLES `카드` WRITE;
/*!40000 ALTER TABLE `카드` DISABLE KEYS */;
INSERT INTO `카드` VALUES (1,'user1','김기훈의 카드',1125487,'2027-05-04','1111',123,1),(2,'user2','김현수의 카드',22568547,'2029-07-04','2222',224,1),(3,'user3','전탁준의 카드',44875547,'2026-06-12','3333',554,1),(4,'user4','UIT의 카드',115448554,'2028-03-15','4444',332,1);
/*!40000 ALTER TABLE `카드` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `투표도서`
--

DROP TABLE IF EXISTS `투표도서`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `투표도서` (
  `북스터디방식별번호` int NOT NULL,
  `회차` int NOT NULL,
  `회원아이디` varchar(10) NOT NULL,
  `주문식별번호` int NOT NULL,
  `도서식별번호` int NOT NULL,
  `선택여부` tinyint DEFAULT NULL,
  PRIMARY KEY (`북스터디방식별번호`,`회차`,`회원아이디`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `투표도서`
--

LOCK TABLES `투표도서` WRITE;
/*!40000 ALTER TABLE `투표도서` DISABLE KEYS */;
INSERT INTO `투표도서` VALUES (2,2,'user2',2,4,1),(2,2,'user3',12,4,0),(3,1,'user4',11,6,1),(6,1,'user2',1,22,1);
/*!40000 ALTER TABLE `투표도서` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `포인트사용내역`
--

DROP TABLE IF EXISTS `포인트사용내역`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `포인트사용내역` (
  `사용내역식별번호` int NOT NULL,
  `사용날짜` datetime DEFAULT NULL,
  `사용금액` int DEFAULT NULL,
  `회원아이디` varchar(10) NOT NULL,
  PRIMARY KEY (`사용내역식별번호`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `포인트사용내역`
--

LOCK TABLES `포인트사용내역` WRITE;
/*!40000 ALTER TABLE `포인트사용내역` DISABLE KEYS */;
INSERT INTO `포인트사용내역` VALUES (1,'2022-11-11 00:00:00',1000,'user1'),(2,'2022-12-04 00:00:00',3000,'user2'),(3,'2022-12-08 00:00:00',5000,'user3'),(4,'2022-12-12 12:00:00',3000,'user4');
/*!40000 ALTER TABLE `포인트사용내역` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `회원`
--

DROP TABLE IF EXISTS `회원`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `회원` (
  `회원아이디` varchar(10) NOT NULL,
  `추천인아이디` varchar(10) DEFAULT NULL,
  `비밀번호` varchar(1000) DEFAULT NULL,
  `이름` varchar(45) DEFAULT NULL,
  `닉네임` varchar(45) DEFAULT NULL,
  `전화번호` int DEFAULT NULL,
  `결제비밀번호` varchar(45) DEFAULT NULL,
  `포인트` int DEFAULT NULL,
  `신고누적횟수` int DEFAULT NULL,
  `읽은도서의수` int DEFAULT NULL,
  PRIMARY KEY (`회원아이디`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `회원`
--

LOCK TABLES `회원` WRITE;
/*!40000 ALTER TABLE `회원` DISABLE KEYS */;
INSERT INTO `회원` VALUES ('st20181468',NULL,'7777','신찬휘','신쓰',1044448888,'1234',500,0,0),('user1',NULL,'1111','김기훈','킹기훈',1012345678,'1111',99999,0,100),('user2',NULL,'2222','김현수','마맨수',1098765432,'2222',99999,0,100),('user3',NULL,'3333','전탁준','JTJ',1045879856,'3333',99999,0,100),('user4',NULL,'4444','유아이티','UIT',516534514,'4444',0,2,10),('user5',NULL,'5555','뉴밀레니엄','NM',514516525,'5555',0,1,2),('user6',NULL,'6666','조규성','규성짱짱맨',1045855232,'6666',0,0,0);
/*!40000 ALTER TABLE `회원` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-12-15 11:01:44
