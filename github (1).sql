

Create Database Department;
use Department;

CREATE TABLE Student(
  Stu_ID varchar(10) NOT NULL,
  FnameS varchar(100) NOT NULL,
  LnameS varchar(100) NOT NULL,
  Email_S varchar(100) NOT NULL,
  Date_of_Birth Date NOT NULL,
  Phone_Number varchar(10) NOT NULL,
  StdPassword varchar(20) not null,
  Advisor_ID VARCHAR(10) references Employee (Emp_ID ));
  
CREATE TABLE Employee(
  Emp_ID varchar(10) NOT NULL ,
  FNameE varchar(100) NOT NULL,
  LNameE varchar(100) NOT NULL,
  Admin_Email varchar(100) NOT NULL,
  EMPPassword varchar (20) NOT NULL,
  Phone_NumberE varchar(10) NOT NULL
);


INSERT INTO Student (Stu_ID, FnameS , LnameS, Email_S, Date_of_Birth,Phone_Number, StdPassword ,  Advisor_ID ) VALUES
('2210003510', 'Zainab ', 'AlRamdan', '2210003510@iau.edu.sa', '2002-10-17', '0505000003','Za3510' , '0000001235' ),
('2210003558', 'Relam ', 'AlKhaldi', '2210003558@iau.edu.sa', '2002-10-18', '0505000004','Re3558' , '0000001230'),
('2210003576', 'Hajer ', 'AlSaadan', '2210003576@iau.edu.sa', '2002-10-19', '0505000005','Ha3576' , '0000001231'),
('2210003577', 'Nora', 'AlJulaidan', '2210003577@iau.edu.sa', '2002-10-15', '0505000001', 'No3577' , '0000001232'),
('2210003594','Zomord','AlShihab','2210003594@iau.edu.sa','2002-10-16','0505000002', 'Zo3594' , '0000001233'),
('2210003712','Shaikha','AlHajri','2210003712@iau.edu.sa','2002-10-14','0505000000',  'Sh3712' , '0000001234'),
('2210003721','Lujain','AlBuainain','2210003721@iau.edu.sa','2002-10-20','0505000006',  'Lu3721'  , '0000001236'),
('2210004752','Khaznah','AlHajri','2210004752@iau.edu.sa','2002-10-21','0505000007',  'Kh4752' , '0000001237');

INSERT INTO Employee (Emp_ID, FnameE,LnameE ,Admin_Email, EMPPassword,Phone_NumberE) VALUES
('0000001230','Thowiba','Ahmed','teahmed@iau.edu.sa', 'Th1230','0505000010'),
('0000001231','Hind','AlSsayed','haaalssayed@iau.edu.sa', 'Hi1231','0505000011'),
('0000001232','Reem','Alshammari','ralshammari@iau.edu.sa', 'Re1232','0505000012'),
('0000001233','Tagreed ','Balhareth','tbalhareth@iau.edu.sa', 'Ta1233','0505000013'),
('0000001234','Maha ','AlGhamdi','msaalghamdi@iau.edu.sa', 'Ma1234','0505000014'),
('0000001235','Nourah ','alqahtani','nfqahtani@iau.edu.sa', 'No1235','0505000015'),
('0000001236','Huda','AlThemaly','hdalthemaly@iau.edu.sa', 'Hu1236','0505000016'),
('0000001237','Enas','Elsharawy','eeelsharawy@iau.edu.sa', 'En1237','0505000017');



drop table Employee;

ALTER TABLE Student
  ADD PRIMARY KEY (Stu_ID),
  ADD UNIQUE KEY Email_S (Email_S),
  ADD UNIQUE KEY Phone_Number (Phone_Number);

ALTER TABLE Employee
  ADD PRIMARY KEY (Emp_ID),
  ADD UNIQUE KEY Admin_Email(Admin_Email),
  ADD UNIQUE KEY Phone_NumberE(Phone_NumberE);

CREATE TABLE Appointment(
  Services_ID int(10) not null,
  Services_Name varchar(30) not null,
  Service_Check varchar(15) null,
  PRIMARY KEY (Services_ID)
);
  
  INSERT INTO Appointment (Services_ID,Services_Name,Service_Check) VALUES
  (1 , 'Office Houres' , 'Service 1' ),
  (2 , 'Peer Education'  , 'Service 2' ),
  (3 , 'Cummunity Partnership' , 'Service 3' ),
  (4 ,'Part Job Time' , 'Service 4' ) ,
  (5 , 'Entertainment' , 'Service 5' );
  
ALTER TABLE Appointment
add constraint Service_Check CHECK (Service_Check = 'Service 1' 
OR Service_Check = 'Service 2'
OR Service_Check = 'Service 3' 
OR Service_Check = 'Service 4'
OR Service_Check = 'Service 5'
 );
 
Create table Book ( 
Services_ID int references Appointment(Services_ID),
Stu_ID int references Student(Stu_ID));



CREATE TABLE OfficeHoures(
   Res_No int(2) not null, 
   Employee_Name varchar(20) not null,
   Course_Name varchar(100) not null,
   ChoosenDay date not null,
   ChoosenTime varchar(100) not null,
   
   PRIMARY KEY (Res_No),
   Course_ID varchar(10) references Course_ID (Cource_ID),
   ServicesNum int references Appointment (Service_ID)
);
  
INSERT INTO OfficeHoures (Res_No, Employee_Name, Course_ID , Course_name, ChoosenDay, ChoosenTime , ServicesNum) VALUES
(1 ,'Thowiba Ahmed'      , "CS-115", "Introduction to Problem Solving and Programming" ,'2023-02-1' , '11:00 am - 12:00 pm ' , '1'),
(2 ,'Hind AlSsayed '     , "CS-150","Computer Science I",'2023-02-2' , '12:00 pm - 01:00 pm ' , '1'),
(3 ,'Reem Alshammari'    ,"CS-151" , "Computer Science II",'2023-02-2' , '01:00 pm - 02:00 pm ' , '1'),
(4 ,'Tagreed Balharet'   , "CS-155" , "Computer Organization and Assembly Language",'2023-02-5' , '11:00 am - 12:00 pm ' , '1'),
(5 ,'Maha AlGhamdi'      , "CS-210" ,"Programming Languages",'2023-02-6' , '09:00 am - 10:00 am ' , '1'),
(6 ,'Nourah alqahtani '  , "CS-240", "Digital Logic" ,'2023-02-7' , '08:00 am - 09:00 am ' , '1'),
(7 ,'HudaAlThemaly'      , "CS-241" , "Computer Operating Systems",'2023-02-8' , '10:00 am - 11:00 am ' , '1'),
(8 ,'Enas Elsharawy'     , "CS-270", "System Software" ,'2023-02-9' , '01:00 pm - 02:00 pm ' , '1');



Create table Cources (
Course_ID varChar(40) REFERENCES Peer_Education (Course_ID),
PE_Session_No int REFERENCES Peer_Education (Session_No),
OH_Res_No int REFERENCES OfficeHoures (Res_No),
Course_Name varchar (100) not null,
Emp_Name varchar (40) not null
);

Create table Peer_Education (
Session_No int primary key NOT NULL,
Tutor_Name varchar(40) NOT NULL,
Course_ID varchar(40) NOT NULL ,
Course_Name varchar (100) not null,
ChoosenDay date not null,
ChoosenTime varchar(100) not null,
   
Stud_ID varchar(10) REFERENCES Student (Stu_ID),
Services_Num int REFERENCES Appoinment (Services_ID)
);

insert into Peer_Education VALUES 
(1,"Sare Ahmed" ,"CS-115","Introduction to Problem Solving and Programming", '2023-02-1' , ' 11:00 am - 12:00 pm '  , '2210003510' , 2),
(2,"Maryam Ali" ,"CS-150","Computer Science I",  '2023-02-2' , ' 12:00 pm - 01:00 pm ' , '2210003558', 2 ),
(3,"Kholaa Nahar" ,"CS-151","Computer Science II", '2023-02-2' , ' 01:00 pm - 02:00 pm ' , '2210003576', 2 ),
(4,"Massa Hussin" ,"CS-155","Computer Organization and Assembly Language", '2023-02-5' , ' 11:00 am - 12:00 pm '  , '2210003577',2 ),
(5,"Fatima Ramadan" ,"CS-210","Programming Languages", '2023-02-6' , ' 09:00 am - 10:00 am '  , '2210003594', 2 ),
(6,"Walla Hassan " ,"CS-240","Digital Logic", '2023-02-7' , ' 08:00 am -092:00 am ' ,'2210003712',2 ),
(7,"Reem Salem" ,"CS-241","Computer Operating Systems", '2023-02-8' , ' 10:00 am - 11:00 am ' ,'2210003721', 2 ),
(8,"Amena Adbuallah" ,"CS-270","System Software", '2023-02-9' , ' 01:00 pm - 02:00 pm '  , '2210004752', 2 );


insert into Cources 
(Course_ID,PE_Session_No,OH_Res_No,Course_Name,Emp_Name)VALUES
("CS-115", 1, 301, "Introduction to Problem Solving and Programming","Thowiba Ahmed"),
("CS-150", 2, 302, "Computer Science I","Hind AlSsayed"),
("CS-151", 3, 303, "Computer Science II","Reem Alshammari"),
("CS-155", 4, 304, "Computer Organization and Assembly Language","Tagreed Balhareth"),
("CS-210", 5, 305, "Programming Languages","Maha AlGhamdi"),
("CS-240", 6, 306, "Digital Logic","Nourah alqahtani"),
("CS-241", 7, 307, "Computer Operating Systems","Huda AlThemaly"),
("CS-270", 8, 308, "System Software","Enas Elsharawy");
 


/*
insert into CommunityPartnership (CP_ID, CP_Name, CP_type, CP_Titlle, CP_price, CP_Date , CP_location , ServicesNum ) values
( 1, 'STC', 'Course ' ,'Information Technology (Networking)', 350 , '2023-07-07', 'Jubail' , 3  ),
( 2, 'Droop', 'Work Shop ' , 'Blockchain', 215 , '2023-10-08', 'Qatif'  , 3),
( 3, 'IEEE', 'Work Shop' , 'Computer Architecture Education (WCAE)' , 100.18 , '2023-09-15 ' , 'Dammam'    , 3),
( 4, 'Tadreebak', 'Course' ,'IT courses', 150.10 , '2023-05-06',  'Jubail'  ,  3),
( 5, 'Hemam', 'Course ' , 'ASP.NET MVC From Scratch', 380.80 , '2023-07-04',  'Khobar'  , 3),
( 6, 'Droop', ' Work Shop ' ,'LINQ', 150.10 , '2023-03-9',  'Qatif'  ,  3),
( 7, 'Droop', ' Course' ,'Security awareness of malicious programs course', 150.10 ,'2023-05-13',  'Dammam' , 3);
*/

create table CommunityPartnership (
CP_ID int primary key auto_increment,
CP_Name char(30) not null, 
CP_type char (10) not null,
CP_Titlle char(100) not null,
CP_price double not null,
CP_Date date not null,
CP_location varchar(12) not null,
ServicesNum int references Appointment (Service_ID)
);

insert into CommunityPartnership (CP_ID, CP_Name, CP_type, CP_Titlle, CP_price, CP_Date , CP_location , ServicesNum ) values
( 1, 'STC', 'Course ' ,'Information Technology (Networking)', 350, '2023-07-07', 'Jubail' , 3  ),
( 2, 'Doroob', 'Work Shop ' , 'Blockchain',215, '2023-10-08', 'Qatif'  , 3),
( 3, 'IEEE', 'Work Shop' , 'Computer Architecture Education (WCAE)',100.18, '2023-09-15 ' , 'Dammam'    , 3),
( 4, 'Tadreebak', 'Course' ,'IT courses', 150.10, '2023-05-06',  'Jubail'  ,  3),
( 5, 'Hemam', 'Course ' , 'ASP.NET MVC From Scratch',380.80, '2023-07-04',  'Khobar'  , 3),
( 6, 'Doroob', ' Work Shop ' ,'LINQ', 150.10, '2023-03-9',  'Qatif'  ,  3),
( 7, 'Doroob', ' Course' ,'Security awareness of malicious programs course', 150.10,'2023-05-13',  'Dammam' , 3),
( 8, 'IEEE', ' Work Shop ' , 'Computer Architecture Education (WCAE)' , 100.18, '2023-09-23', 'Jubail'  ,  3 );




drop table CommunityPartnership;



CREATE TABLE OfficeHoures(
   Res_No int(2) not null, 
   Employee_Name varchar(20) not null,
   Course_Name varchar(100) not null,
   ChoosenDay date not null,
   ChoosenTime varchar(100) not null,
   PRIMARY KEY (Res_No),
   ServicesNum int references Appointment (Service_ID)
);
  
INSERT INTO OfficeHoures (Res_No, Employee_Name, Course_Name, ChoosenDay, ChoosenTime , ServicesNum) VALUES
(1 ,'Thowiba Ahmed'      , "Introduction to Problem Solving and Programming" ,'2023-02-1' , '11:00 am - 12:00 pm ' , '1'),
(2 ,'Hind AlSsayed '    ,"Computer Science I",'2023-02-2' , '12:00 pm - 01:00 pm ' , '1'),
(3 ,'Reem Alshammari'    , "Computer Science II",'2023-02-2' , '01:00 pm - 02:00 pm ' , '1'),
(4 ,'Tagreed Balharet'    , "Computer Organization and Assembly Language",'2023-02-5' , '11:00 am - 12:00 pm ' , '1'),
(5 ,'Maha AlGhamdi'    ,"Programming Languages",'2023-02-6' , '09:00 am - 10:00 am ' , '1'),
(6 ,'Nourah alqahtani ' , "Digital Logic" ,'2023-02-7' , '08:00 am - 09:00 am ' , '1'),
(7 ,'HudaAlThemaly'       , "Computer Operating Systems",'2023-02-8' , '10:00 am - 11:00 am ' , '1'),
(8 ,'Enas Elsharawy'     , "System Software" ,'2023-02-9' , '01:00 pm - 02:00 am ' , '1');













drop table CommunityPartnership;

drop table Part_Job_Time;

Create Table Part_Job_Time (
 Job_ID int primary key,
 Job_Name varchar(30) not null, 
 Job_Place varchar(30)not null,
 Start_From Date not null, 
 End_At Date not null, 
 Work_Hours varchar(10) not null,
 Salary int not null,
 Services_Num varchar(10) references Appointment(Services_ID) );

Truncate table Part_Job_Time;

Insert into Part_Job_Time (Job_ID, Job_Name,Job_Place,Start_From, End_At, Work_Hours, Salary, Services_Num) VALUES
( 1 , ' Bookstore Assistant ','Jubail', ' 2022-12-5', ' 2023-02-18', ' 2 ', ' 1500 ', 4),
( 2 , ' Help Student in C++ ','Dammam', ' 2022-12-5 ', ' 2023-02-18 ', ' 4 ', ' 2000 ', 4 ),
( 3 , ' Food Services Assistant ','Jubail',' 2022-12-5', ' 2023-02-18 ', ' 5 ', ' 2500 ', 4),
( 4 , ' Lab Assistant ','Qatif', ' 2022-12-5', ' 2023-02-18', ' 5 ', ' 2500 ',4),
( 5 , ' Registration Assistant ','Khobar', ' 2022-12-5', ' 2023-02-18 ', ' 6 ', ' 3000 ', 4 ),
( 6 , ' Help Student in OOP1  ','Dammam', ' 2022-12-5', ' 2023-02-18 ', ' 4 ', ' 2000 ', 4);

drop table Part_Job_Time;



 CREATE TABLE Entertainment(
 Trip_Num varchar (10) primary key,
 Trip_Name char(40) NOT NULL,
 Trip_Date date NULL,
 Trip_Place char(10) NOT NULL,
 Trip_Price double NOT NULL,
Services_Num int references Appointment(Services_ID)
);

drop table Entertainment;

INSERT INTO Entertainment (Trip_Num,Trip_Name,Trip_Date, Trip_Place, Trip_Price , Services_Num) VALUES
(1000, "IAU Beach", "2023-9-20", 'Internal', '0', 5),
(1001, "Ithra ", "2023-4-27", 'External', '23.25' , 5),
(1002, "scitech ", "2023-6-16", 'External', '20.50' ,5),
(1003, "International Book Fair", "2023-5-16", 'External', '30.50', 5),
(1004, "King Abdullah Cultural Center", "2023-8-10", 'External', '45.50', 5),
(1005, "Dhahran Expo", "2023-3-18", 'External', '40.50', 5)
;

/*
1)
SELECT * 
FROM Student 
ORDER BY Date_of_Birth ASC;

2)
SELECT Trip_Name , MIN(Trip_Price) AS LowestPrice
FROM Entertainment;

3) 
SELECT  CP_Name , MAX(CP_price) AS LargestPrice
FROM CommunityPartnership;

4)
Select CP_location, count(*) ,min(Cp_price) , max(Cp_price) 
From CommunityPartnership
Group by CP_location;

5)
Select *
From CommunityPartnership
order by Cp_price Asc;

6)
SELECT * FROM employee WHERE Phone_NumberE LIKE '%54';

7)
select Res_No , Session_No , Course_Name from Peer_Education inner join OfficeHoures on Peer_Education.Course_Name = OfficeHoures.Course_Name;

8)




9)
select CP_Name , count(*) as TypeOf_CP
from CommunityPartnership
group by CP_Name;

10)
set global log_bin_trust_function_creators = 1;

Delimiter $$ 
create function Discount_Price ( Trip_Price_ double ) returns double 
begin
declare After_Discount_Price double ;
if Trip_Price_> 0.0 then select Trip_Price_ - 0.20 into After_Discount_Price  from entertainment 
where Trip_Price = Trip_Price_;
return After_Discount_Price;
else 
return 0.0;
end if;
end $$ 
Delimiter ;
select Trip_Name , Discount_Price (  Trip_Price ) AS After_Discount_Price 
from entertainment
order by After_Discount_Price ;


drop function Discount_Price;


11)
Select * 
From Part_Job_Time 
Where Salary <= All 
( Select Salary 
From Part_Job_Time 
where Salary > 1000 )


12)
select *
From Entertainment 
Where Trip_price <= Any 
( select Trip_price 
From Entertainment 
Where Trip_price < 30 );


13)
SELECT COUNT(Trip_Place), Trip_Name  , Trip_Place
FROM Entertainment
GROUP BY Trip_Place
HAVING COUNT(Trip_Place)


14)
SELECT FnameS, LnameS, Phone_Number
FROM Student
WHERE Phone_Number IS NOT NULL;


15)
select Stu_ID, FnameS, LnameS
FROM  Student
WHERE
EXISTS (SELECT not NULL)
ORDER BY
FnameS, LnameS
 
 
16)
DELIMITER $$
CREATE PROCEDURE us_Student ()
BEGIN
SELECT Stu_ID, FnameS, LnameS
FROM Student 
WHERE Stu_ID ='2210003577';
END $$
DELIMITER ;

CALL us_Student();

*/

CREATE VIEW Job_View
AS SELECT Job_ID, Job_Name, Job_Place, Start_From, End_At,
Work_Hours, Salary, Services_Num
FROM Part_Job_Time
WHERE Work_Hours IN (6);
UPDATE Job_View 
SET Salary = 4000
WHERE Job_ID = 5;

drop view Job_View;




Truncate table community_partnership_appointment;

create table community_partnership_appointment (

C_P_A_Course_Name varchar(100) ,

C_P_A_Course_Price varchar(50)

);


drop table community_partnership_appointment;

Truncate table part_time_job_appointment;

create table part_time_job_appointment (

Job_Name varchar(100) ,

Job_Place varchar(100) ,

Job_Work_Hours int,

Job_Salary int

);

Truncate table Entertainment_appointment;

create table Entertainment_appointment (

E_A_Trip_Name varchar(100),

E_A_Trip_Place varchar(50),

E_A_Trip_Price varchar(20)

);


create table OfficeHours_appointment (
Appointment_ID int,
Person_Name varchar(100),
Course_Name varchar(100),
ChoosenDay varchar(100),
ChoosenTime varchar(100)
);



create table PeerEd_appointment (
Appointment_ID int,
Person_Name varchar(100),
Course_Name varchar(100),
Course_ID varchar(100),
ChoosenDay varchar(100),
ChoosenTime varchar(100)
);



Delimiter $$ 
create function Discount_Price ( Trip_Price_ double ) returns double 
begin
declare After_Discount_Price double ;
if Trip_Price_> 0.0 then select Trip_Price_ - 0.50 into After_Discount_Price from entertainment where Trip_Price = Trip_Price_; 
return After_Discount_Price; else return 0.0;
end if;
end $$ 
Delimiter ;
select Trip_Name , Discount_Price (  Trip_Price ) AS After_Discount_Price from entertainment order by After_Discount_Price ;


DELIMITER $$
CREATE PROCEDURE us_Student ()
BEGIN
SELECT Stu_ID, FnameS, LnameS
FROM Student
WHERE Advisor_ID ='0000001234';
END $$
DELIMITER ;
Call us_Student ();

drop procedure us_Student;



Create table Peer_Education_Tutor (
Session_No int primary key NOT NULL,
Tutor_Name varchar(100) NOT NULL,
Course_ID varchar(100) NOT NULL ,
Course_Name varchar (100) not null,
ChoosenDay varchar (100),
ChoosenTime varchar(100) not null
   );

insert into Peer_Education_Tutor VALUES 
(1,"Sare Ahmed" ,"CS-115","Introduction to Problem Solving and Programming", '2023-02-1' , ' 11:00 am - 12:00 pm ' ),
(2,"Maryam Ali" ,"CS-150","Computer Science I",  '2023-02-2' , ' 12:00 pm - 01:00 pm '  ),
(3,"Kholaa Nahar" ,"CS-151","Computer Science II", '2023-02-2' , ' 01:00 pm - 02:00 pm ' ),
(4,"Massa Hussin" ,"CS-155","Computer Organization and Assembly Language", '2023-02-5' , ' 11:00 am - 12:00 pm ' ),
(5,"Fatima Ramadan" ,"CS-210","Programming Languages", '2023-02-6' , ' 09:00 am - 10:00 am '   ),
(6,"Walla Hassan " ,"CS-240","Digital Logic", '2023-02-7' , ' 08:00 am -092:00 am ' ),
(7,"Reem Salem" ,"CS-241","Computer Operating Systems", '2023-02-8' , ' 10:00 am - 11:00 am '  ),
(8,"Amena Adbuallah" ,"CS-270","System Software", '2023-02-9' , ' 01:00 pm - 02:00 pm '  );

drop table Peer_Education_Tutor;

Delimiter //
CREATE TRIGGER Part_time_job_Salary BEFORE INSERT ON Part_Job_Time
FOR EACH ROW
IF NEW.Salary <1500
THEN SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = "SALARY SHOULD NOT BE LESS THAN 1500";
END IF;

Delimiter //
CREATE TRIGGER Part_time_job_Salary1 BEFORE UPDATE ON Part_Job_Time
FOR EACH ROW
IF NEW.Salary <1500
THEN SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = "SALARY SHOULD NOT BE LESS THAN 1500";
END IF;

drop TRIGGER Part_time_job_Salary1;