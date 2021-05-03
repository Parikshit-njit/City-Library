# City-Library
<h1>Database and Triggers Initialization</h1>
<b>Copy and Paste the following in MySql Workbench</b><br><br>
drop database lbms;
create database lbms;
use lbms;

create table PUBLISHER(
	publisherid int not null, 
    pubname varchar(40), 
    address varchar(80), 
    primary key(publisherid));
    
insert into PUBLISHER
values(1, 'PUBLISHER-1','PUB-ADDRESS-1');  

insert into PUBLISHER
values(2, 'PUBLISHER-2','PUB-ADDRESS-2');      

insert into PUBLISHER
values(3, 'PUBLISHER-3','PUB-ADDRESS-3');  

insert into PUBLISHER
values(4, 'PUBLISHER-4', 'PUB-ADDRESS-4');

insert into PUBLISHER
values(5, 'PUBLISHER-5', 'PUB-ADDRESS-5');

insert into PUBLISHER
values(6, 'PUBLISHER-6', 'PUB-ADDRESS-6');

insert into PUBLISHER
values(7, 'PUBLISHER-7', 'PUB-ADDRESS-7');

insert into PUBLISHER
values(8, 'PUBLISHER-8', 'PUB-ADDRESS-8');

insert into PUBLISHER
values(9, 'PUBLISHER-9', 'PUB-ADDRESS-9');

insert into PUBLISHER
values(10, 'PUBLISHER-10', 'PUB-ADDRESS-10');
select * from PUBLISHER;
  
create table DOCUMENT(
	docid int not null, 
    title varchar(50), 
    pdate datetime, 
    publisherid int, 
    primary key(docid), 
    foreign key(publisherid) references PUBLISHER(publisherid));   
    
insert into DOCUMENT
values(1, 'DOC-TITLE-1','1997-01-30', 1);  

insert into DOCUMENT
values(2, 'DOC-TITLE-2','1967-11-30', 2);

insert into DOCUMENT
values(3, 'DOC-TITLE-3','1987-12-30', 2);  

insert into DOCUMENT
values(4, 'DOC-TITLE-4', '1999-06-10', 3);

insert into DOCUMENT
values(5, 'DOC-TITLE-5', '1999-06-11', 3);

insert into DOCUMENT
values(6, 'DOC-TITLE-6', '1999-06-12', 9);

insert into DOCUMENT
values(7, 'DOC-TITLE-7', '1999-06-13', 9);

insert into DOCUMENT
values(8, 'DOC-TITLE-8', '1999-06-14', 8);

insert into DOCUMENT
values(9, 'DOC-TITLE-9', '1999-06-15', 8);

insert into DOCUMENT
values(10, 'DOC-TITLE-10', '1999-06-16', 7);

insert into DOCUMENT
values(11, 'DOC-TITLE-11', '1999-06-17', 7);

insert into DOCUMENT
values(12, 'DOC-TITLE-12', '1999-06-18', 6);

insert into DOCUMENT
values(13, 'DOC-TITLE-13', '1999-06-19', 6);

insert into DOCUMENT
values(14, 'DOC-TITLE-14', '1999-06-20', 5);

insert into DOCUMENT
values(15, 'DOC-TITLE-15', '1999-06-21', 5);

insert into DOCUMENT
values(16, 'DOC-TITLE-15', '1999-06-22', 1);

insert into DOCUMENT
values(17, 'DOC-TITLE-15', '1999-06-25', 2);

select * from DOCUMENT;    
   
create table BRANCH(
	bid int not null, 
    lname varchar(20), 
    location varchar(80),
    primary key(bid));
    
insert into BRANCH
values(1, 'BRANCH-LNAME-1', 'BRANCH-LOC-1');   

insert into BRANCH
values(2, 'BRANCH-LNAME-2', 'BRANCH-LOC-2');   

insert into BRANCH
values(3, 'BRANCH-LNAME-3', 'BRANCH-LOC-3');   

select * from BRANCH;
    
create table COPY(
	docid int not null, 
    copyno int not null, 
    bid int not null, 
    position varchar(6), 
    primary key(docid, copyno, bid), 
    foreign key(docid) references DOCUMENT(docid), 
    foreign key(bid) references BRANCH(bid));  
    
insert into COPY
values(1, 1, 1, 'POS-1');  

insert into COPY
values(1, 1, 2, 'POS-2');

insert into COPY
values(1, 1, 3, 'POS-3');

insert into COPY
values(1, 2, 1, 'POS-1');  

insert into COPY
values(1, 2, 2, 'POS-2');

insert into COPY
values(1, 2, 3, 'POS-3');

insert into COPY
values(2, 1, 1, 'POS-4');  

insert into COPY
values(2, 1, 2, 'POS-1'); 

insert into COPY
values(2, 1, 3, 'POS-2');  

insert into COPY
values(2, 2, 1, 'POS-4');  

insert into COPY
values(2, 2, 2, 'POS-1'); 

insert into COPY
values(2, 2, 3, 'POS-2');  

insert into COPY
values(3, 2, 1, 'POS-4');  

insert into COPY
values(3, 2, 2, 'POS-1'); 

insert into COPY
values(3, 2, 3, 'POS-2');  

insert into COPY
values(5, 1, 1, 'POS-2');  

insert into COPY
values(5, 1, 2, 'POS-2');  

insert into COPY
values(5, 1, 3, 'POS-2');  

select * from COPY;  
  
create table READER(
	rid int not null, 
    rtype varchar(20), 
    rname varchar(30), 
    raddress varchar(80), 
    phone_no int(10),
    primary key(rid));   
    
insert into READER
values(1, 'RTYPE-1', 'RNAME-1', 'RADDRESS-1', 1111111111);    

insert into READER
values(2, 'RTYPE-2', 'RNAME-2', 'RADDRESS-2', 222222222);  

insert into READER
values(3, 'RTYPE-3', 'RNAME-3', 'RADDRESS-3', 333333333);

insert into READER
values(4, 'RTYPE-4', 'RNAME-4', 'RADDRESS-4', 444444444);    

insert into READER
values(5, 'RTYPE-5', 'RNAME-5', 'RADDRESS-5', 333333333);

insert into READER
values(6, 'RTYPE-6', 'RNAME-6', 'RADDRESS-6', 444444444);    

insert into READER
values(7, 'RTYPE-7', 'RNAME-7', 'RADDRESS-7', 333333333);

insert into READER
values(8, 'RTYPE-8', 'RNAME-8', 'RADDRESS-8', 444444444);    

insert into READER
values(9, 'RTYPE-9', 'RNAME-9', 'RADDRESS-9', 333333333);

insert into READER
values(10, 'RTYPE-10', 'RNAME-10', 'RADDRESS-10', 444444444);    

insert into READER
values(11, 'RTYPE-11', 'RNAME-11', 'RADDRESS-11', 333333333);

insert into READER
values(12, 'RTYPE-12', 'RNAME-12', 'RADDRESS-12', 444444444);    
 
select * from READER;
 
create table BORROWING(
	bor_no int not null, 
	bdtime datetime, 
    rdtime datetime, 
    primary key(bor_no));  

insert into BORROWING
values(1, '2021-01-01', '2021-01-14');

insert into BORROWING
values(2, '2021-01-03', '2021-01-15');

insert into BORROWING
values(3, '2021-01-04', '2021-01-17');

insert into BORROWING
values(4, '2021-01-05', '2021-01-02');     
  
-- insert into BORROWING
-- values(5, '2021-01-06', '2021-01-01');  

-- insert into BORROWING
-- values(6, '2021-01-07', '2021-01-06'); 

-- insert into BORROWING
-- values(7, '2021-01-08', '2021-01-05'); 

-- insert into BORROWING
-- values(8, '2021-01-09', '2021-01-04'); 

select * from BORROWING;  
 
create table BORROWS(
	bor_no int not null, 
	docid int not null, 
    copyno int not null, 
    bid int not null, 
    rid int not null, 
    primary key(bor_no, docid, copyno, bid), 
    foreign key(rid) references READER(rid),
    foreign key(bor_no) references BORROWING(bor_no), 
    foreign key(docid, copyno, bid) references COPY(docid, copyno, bid));    

insert into BORROWS
values(1, 1, 1, 1, 1);

insert into BORROWS
values(2, 1, 1, 2, 2);

insert into BORROWS
values(3, 1, 1, 3, 2);

insert into BORROWS
values(4, 2, 1, 1, 3);

-- insert into BORROWS
-- values(5, 2, 2, 1, 5);

-- insert into BORROWS
-- values(6, 5, 1, 1, 5);

-- insert into BORROWS
-- values(7, 5, 1, 2, 5);

-- insert into BORROWS
-- values(8, 5, 1, 3, 8);

select * from borrows;
  
create table RESERVATION(
	res_no int not null, 
    dtime datetime, 
    primary key(res_no)); 
    
insert into RESERVATION
values(1, '2021-01-01');

insert into RESERVATION
values(2, '2021-01-02');

insert into RESERVATION
values(3, '2021-01-03');

insert into RESERVATION
values(4, '2021-01-04');   

select * from RESERVATION; 
  
create table RESERVES(
	rid int not null, 
    reservation_no int not null, 
    docid int not null, 
    copyno int not null, 
    bid int not null, 
    primary key(rid, reservation_no, docid, copyno, bid), 
--     foreign key(rid) references READER(rid), 
    foreign key(docid, copyno, bid) references COPY(docid, copyno, bid), 
    foreign key(reservation_no) references RESERVATION(res_no));     
    
insert into RESERVES 
values(1, 1, 1, 1, 1);

insert into RESERVES 
values(2, 2, 1, 1, 2);

insert into RESERVES 
values(3, 3, 1, 1, 3);

insert into RESERVES 
values(4, 4, 2, 1, 1);

select * from reserves;

create table PERSON(
	pid int not null, 
    pname varchar(20), 
    primary key(pid)); 
 
insert into PERSON 
values(1, 'PERSON-1');

insert into PERSON 
values(2, 'PERSON-2');

insert into PERSON 
values(3, 'PERSON-3');

insert into PERSON 
values(4, 'PERSON-4');

SELECT * FROM PERSON;


create table BOOK(
	docid int, 
    isbn int, 
    foreign key(docid) references DOCUMENT(docid)); 
    
insert into BOOK 
values(1, 1001);

insert into BOOK 
values(2, 1002);

insert into BOOK 
values(3, 1003);

insert into BOOK 
values(4, 1004);

SELECT * FROM BOOK;

create table AUTHORS(
	pid int not null, 
    docid int not null, 
    foreign key(pid) references PERSON(pid),
    foreign key(docid) references BOOK(docid),
    primary key(pid, docid));  
    
insert into AUTHORS 
values(1, 4);

insert into AUTHORS 
values(2, 3);

insert into AUTHORS 
values(3, 2);

insert into AUTHORS 
values(4, 1);

SELECT * FROM AUTHORS;

create table JOURNAL_VOLUME(
	docid int not null, 
    volume_no int, 
    editor int not null,
    primary key(docid, editor),
    foreign key(editor) references PERSON(pid),
    foreign key(docid) references DOCUMENT(docid));    
    
insert into JOURNAL_VOLUME 
values(1, 1, 1);

insert into JOURNAL_VOLUME 
values(2, 2, 2);

insert into JOURNAL_VOLUME 
values(3, 3, 3);

insert into JOURNAL_VOLUME 
values(4, 4, 4);

SELECT * FROM JOURNAL_VOLUME;
    
create table JOURNAL_ISSUE(
	docid int, 
    issue_no int, 
    scope varchar(200), 
    primary key(docid, issue_no), 
    foreign key(docid) references JOURNAL_VOLUME(docid));  
    
insert into JOURNAL_ISSUE 
values(1, 1, 'SCOPE-1');

insert into JOURNAL_ISSUE 
values(2, 2, 'SCOPE-2');

insert into JOURNAL_ISSUE 
values(3, 3, 'SCOPE-3');

insert into JOURNAL_ISSUE 
values(4, 4, 'SCOPE-4');

SELECT * FROM JOURNAL_ISSUE;
        
create table GEDITS(
	docid int not null, 
    issue_no int not null, 
    pid int not null, 
    primary key(docid, issue_no, pid), 
	foreign key(pid) references PERSON(pid),
    foreign key(docid, issue_no) references JOURNAL_ISSUE(docid, issue_no));   
    
insert into GEDITS 
values(1, 1, 1);

insert into GEDITS 
values(2, 2, 2);

insert into GEDITS 
values(3, 3, 3);

insert into GEDITS 
values(4, 4, 4);

SELECT * FROM GEDITS;

create table PROCEEDINGS(
	docid int not null, 
    cdate datetime, 
    clocation varchar(100), 
    ceditor int not null, 
    foreign key(docid) references DOCUMENT(docid), 
    foreign key(ceditor) references PERSON(pid),
    primary key(docid, ceditor)); 
    
insert into PROCEEDINGS 
values(1, '2021-01-01', 'CLOC-1', 1);

insert into PROCEEDINGS 
values(2, '2021-01-02', 'CLOC-2', 2);

insert into PROCEEDINGS 
values(3, '2021-01-03', 'CLOC-3', 3);

insert into PROCEEDINGS 
values(4, '2021-01-04', 'CLOC-4', 4);

SELECT * FROM PROCEEDINGS;
 
create table CHAIRS(
	pid int not null, 
    docid int not null, 
    primary key(pid, docid), 
    foreign key(pid) references PERSON(pid), 
    foreign key(docid) references PROCEEDINGS(docid));
    
insert into CHAIRS 
values(1, 1);

insert into CHAIRS 
values(2, 2);

insert into CHAIRS 
values(3, 3);

insert into CHAIRS 
values(4, 4);

SELECT * FROM CHAIRS;

create table ADMINS(
	adminid int not null, 
    pwd int not null,
    primary key(adminid)
    );
insert into ADMINS 
values(1234, 1234);   


drop trigger if exists check_borrowing_capacity ;
DELIMITER $$
create trigger check_borrowing_capacity 
before insert on borrows
for each row
begin
if (select count(*) from borrows where rid = new.rid group by rid) >= 10 
then 
signal sqlstate '45000';
end if;
end$$;
DELIMITER ;

drop trigger if exists check_reservation_capacity ;
DELIMITER $$
create trigger check_reservation_capacity 
before insert on reserves
for each row
begin
if (select count(*) from reserves where rid = new.rid group by rid) >= 10 
then 
signal sqlstate '45000';
end if;
end$$;
DELIMITER ;




