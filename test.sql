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
