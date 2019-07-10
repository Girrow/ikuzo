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

CREATE TABLE `notice` (
	`no` INT(11) NOT NULL AUTO_INCREMENT COMMENT '글번호',
	`writeType` INT(11) UNSIGNED NOT NULL COMMENT '글유형',
	`subtitle` VARCHAR(10) NULL DEFAULT NULL COMMENT '말머리',
	`title` VARCHAR(50) NULL DEFAULT NULL COMMENT '제목',
	`content` VARCHAR(200) NULL DEFAULT NULL COMMENT '내용',
	`views` INT(11) NOT NULL COMMENT '조회수',
	`delYn` INT(11) NOT NULL COMMENT '삭제여부',
	`register` VARCHAR(50) NULL DEFAULT NULL COMMENT '등록인',
	`registDate` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '등록일시',
	`modifier` VARCHAR(20) NULL DEFAULT NULL COMMENT '수정인',
	`modifyDate` TIMESTAMP NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '수정일시',
	PRIMARY KEY (`no`)
)
COMMENT='공지사항'
COLLATE='utf8_general_ci'
ENGINE=InnoDB
AUTO_INCREMENT=3
;


CREATE TABLE `noticeCo` (
	`no` INT(11) NOT NULL AUTO_INCREMENT COMMENT '번호',
	`noticeNo` INT(11) NOT NULL COMMENT '글번호',
	`content` VARCHAR(200) NOT NULL COMMENT '내용',
	`delYn` INT(11) NOT NULL COMMENT '삭제여부',
	`register` VARCHAR(50) NULL DEFAULT NULL COMMENT '등록인',
	`registDate` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '등록일시',
	`modifier` VARCHAR(20) NULL DEFAULT NULL COMMENT '수정인',
	`modifyDate` TIMESTAMP NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '수정일시',
	PRIMARY KEY (`no`)
)
COMMENT='공지 댓글'
COLLATE='utf8_general_ci'
ENGINE=InnoDB
;


CREATE TABLE `returnList` (
	`no` INT(11) NOT NULL AUTO_INCREMENT COMMENT '번호',
	`registerNo` INT(11) NOT NULL COMMENT '등록번호',
	`content` VARCHAR(200) NOT NULL COMMENT '반품사유',
	`delYn` INT(11) NOT NULL COMMENT '삭제여부',
	`register` VARCHAR(50) NULL DEFAULT NULL COMMENT '등록인',
	`registDate` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '등록일시',
	`modifier` VARCHAR(50) NULL DEFAULT NULL COMMENT '수정인',
	`modifyDate` TIMESTAMP NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '수정일시',
	PRIMARY KEY (`no`)
)
COMMENT='반품목록'
COLLATE='utf8_general_ci'
ENGINE=InnoDB
;


CREATE TABLE `returnListDetail` (
	`no` INT(11) NOT NULL AUTO_INCREMENT COMMENT '번호',
	`returnNo` INT(11) NOT NULL COMMENT '반품번호',
	`itemCode` VARCHAR(200) NOT NULL COMMENT '품목코드',
	`quantity` INT(11) NOT NULL COMMENT '수량',
	`delYn` INT(11) NOT NULL COMMENT '삭제여부',
	PRIMARY KEY (`no`)
)
COMMENT='반품 상세목록'
COLLATE='utf8_general_ci'
ENGINE=InnoDB
;

CREATE TABLE `message` (
	`no` INT(11) NOT NULL AUTO_INCREMENT COMMENT '번호',
	`returnNo` INT(11) NOT NULL COMMENT '사업자등록번호',
	`itemCode` VARCHAR(200) NOT NULL COMMENT '사원번호',
	`quantity` INT(11) NOT NULL COMMENT '내용',
	`delYn` INT(11) NOT NULL COMMENT '수신여부',
	`registerDate` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '등록일시',
	PRIMARY KEY (`no`)
)
COMMENT='메세지'
COLLATE='utf8_general_ci'
ENGINE=InnoDB
;
