insert into delivery(inNo,writer) values(10002,"test-dump2");
INSERT INTO `hole`.`orderList` (`orderNo`, `registerNo`, `object`, `price`, `amount`, `reg_date`, `delY`) VALUES ('10002', '1', 'C1', '1200', '5', '2019-07-10', '0');
INSERT INTO `hole`.`orderList` (`orderNo`, `registerNo`, `object`, `price`, `amount`, `reg_date`, `delY`) VALUES ('10001', '1', 'B1', '700', '3', '2019-07-10', '0');

--

CREATE table faq(
	no int primary key auto_increment,
	question varchar(100),
	answer varchar(200),
	date timestamp
);
insert into faq(question,answer) values("배송조회는 어디에서 할 수 있나요?","여기요 여기!");
insert into faq(question,answer) values("로그인하지 않은 상태에서 배송확인이 가능한가요?","여기요 여기!");
insert into faq(question,answer) values("반품을 하려고 할때는 어떻게 하죠?","여기요 여기!");
insert into faq(question,answer) values("이 회사는 어떤 회사인가요?","여기요 여기!");
insert into faq(question,answer) values("반품신청 등등등?","여기요 여기!");

CREATE TABLE notice(
	no int primary key auto_increment,
	id varchar(20),
	subtitle varchar(10),
	views int not null,
	title varchar(50),
	content varchar(200),
	date timestamp
);

insert into notice(id,subtitle,views,title,content) values("harin","서비스뉴스","1","이 제목이 html에서 뜬다면","얼마나 좋아");
insert into notice(id,subtitle,views,title,content) values("harin","서비스뉴스","1","황인 2명이 같이 안나오면?","퇴갤이황");

create table inquiry(
	no int primary key auto_increment,
	id varchar(30),
	subtitle varchar(20),
	title varchar(50),
	content varchar(200),
	answerYn char(1),
	date datetime
);

insert into inquiry(id,subtitle,title,content,answerYn)
  values("harin","1대1문의","건전지가 사라졌어요","해결해주세요 힝","N");

create table deliveryConf(
	no int primary key auto_increment,
	id varchar(30),
	deliveryNo varchar(20),
	coupangMan varchar(50),
	nowStatus varchar(10),
	date dateTime
);

insert into deliveryConf(id,deliveryNo,coupangMan,nowStatus)
 values("기러우","1001","harinEE","101");

--
--


/*여기서부터 CREATE*/
CREATE TABLE `s_faqs` (
	`faq_id` INT(11) NOT NULL AUTO_INCREMENT COMMENT 'frequency answer question 번호',
	`question` VARCHAR(100) NULL DEFAULT NULL COMMENT '저장해놓은 질문',
	`answer` VARCHAR(200) NULL DEFAULT NULL COMMENT '저장해놓은 답변',
	`date` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '저장한 시간',
	PRIMARY KEY (`faq_id`)
)
COMMENT='정하린 FAQ // 추가 테이블 // 조인하지 않는 고정 데이터값'
COLLATE='utf8_general_ci'
ENGINE=InnoDB
AUTO_INCREMENT=11
;
CREATE TABLE `s_messages` (
	`message_id` INT(11) NOT NULL AUTO_INCREMENT COMMENT '메세지 번호',
	`return_id` INT(11) NOT NULL COMMENT '사업자등록번호',
	`item_code` VARCHAR(200) NOT NULL COMMENT '사원번호',
	`quantity` INT(11) NOT NULL COMMENT '수신 내용',
	`del_flag` INT(11) NOT NULL COMMENT '수신 여부',
	`regist_date` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '등록일시',
	PRIMARY KEY (`message_id`)
)
COMMENT='메세지'
COLLATE='utf8_general_ci'
ENGINE=InnoDB
;
CREATE TABLE `s_notices` (
	`notice_id` INT(11) NOT NULL AUTO_INCREMENT COMMENT '서비스 글 번호',
	`type_flag` INT(11) UNSIGNED NOT NULL COMMENT '글유형',
	`subtitle` VARCHAR(10) NULL DEFAULT NULL COMMENT '말머리',
	`title` VARCHAR(50) NULL DEFAULT NULL COMMENT '서비스 제목',
	`content` VARCHAR(200) NULL DEFAULT NULL COMMENT '서비스 내용',
	`views` INT(11) NOT NULL DEFAULT '0' COMMENT '조회수',
	`del_flag` INT(11) NOT NULL DEFAULT '0' COMMENT '삭제여부',
	`register` VARCHAR(20) NULL DEFAULT NULL COMMENT '등록인',
	`regist_date` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '등록일시',
	`modifier` VARCHAR(20) NULL DEFAULT NULL COMMENT '수정인',
	`modify_date` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '수정일시',
	PRIMARY KEY (`notice_id`)
)
COMMENT='공지사항'
COLLATE='utf8_general_ci'
ENGINE=InnoDB
AUTO_INCREMENT=19
;
CREATE TABLE `s_notices_comments` (
	`notice_comment_id` INT(11) NOT NULL AUTO_INCREMENT COMMENT '서비스 댓글 번호',
	`notice_id` INT(11) NOT NULL COMMENT '참조할 글번호',
	`content` VARCHAR(200) NOT NULL COMMENT '서비스 내용',
	`del_flag` INT(11) NOT NULL DEFAULT '0' COMMENT '삭제여부',
	`register` VARCHAR(50) NULL DEFAULT NULL COMMENT '등록인',
	`regist_date` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '등록일시',
	`modifier` VARCHAR(20) NULL DEFAULT NULL COMMENT '수정인',
	`modify_date` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '수정일시',
	PRIMARY KEY (`notice_comment_id`)
)
COMMENT='공지 댓글'
COLLATE='utf8_general_ci'
ENGINE=InnoDB
AUTO_INCREMENT=23
;
CREATE TABLE `s_returns` (
	`return_id` INT(11) NOT NULL AUTO_INCREMENT COMMENT '반품 번호',
	`register_id` INT(11) NOT NULL COMMENT '반품 등록번호',
	`content` VARCHAR(200) NOT NULL COMMENT '반품사유',
	`del_flag` INT(11) NOT NULL COMMENT '삭제여부',
	`register` VARCHAR(50) NULL DEFAULT NULL COMMENT '등록인',
	`regist_date` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '등록일시',
	`modifier` VARCHAR(50) NULL DEFAULT NULL COMMENT '수정인',
	`modify_date` TIMESTAMP NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '수정일시',
	PRIMARY KEY (`return_id`)
)f
COMMENT='반품목록'
COLLATE='utf8_general_ci'
ENGINE=InnoDB
;
CREATE TABLE `s_returns_details` (
	`return_detail_id` INT(11) NOT NULL AUTO_INCREMENT COMMENT '반품 상세 번호',
	`return_id` INT(11) NOT NULL COMMENT '반품번호',
	`item_Code` VARCHAR(200) NOT NULL COMMENT '반품 품목코드',
	`quantity` INT(11) NOT NULL COMMENT '반품수량',
	`del_flag` INT(11) NOT NULL COMMENT '삭제여부',
	PRIMARY KEY (`return_detail_id`)
)
COMMENT='반품 상세목록'
COLLATE='utf8_general_ci'
ENGINE=InnoDB
;

multipleStatements: true
