-- DDL Queries
-- 1. Create database

create database railway_management_system;
use railway_management_system;

-- 2. Create tables

create table users(user_id int primary key auto_increment, fullname varchar(50) not null,username varchar(50) not null,
passcode varchar(50) not null, Gender char(2), age int,email varchar(80), city varchar(20),state varchar(20), adhar_no numeric not null,
contact numeric not null);
desc users;

create table train(Train_no numeric primary key, Train_name varchar(60) not null, Start_station varchar(50),Destination varchar(50),
Departure_time time, Arrival_time time, Seat_availability numeric);
desc train;

desc passengers;
create table station(station_no numeric,station_name varchar(50), Train_no numeric, arrival_time time, hault int, departure_time time,
constraint foreign key (Train_no) references train (Train_no));
desc station;

create table ticket(ticket_id int primary key auto_increment, Train_no numeric, user_id int, status varchar(50),no_of_passengers int, 
Booked_on date, Travel_date date, 
constraint foreign key(Train_no) references train(Train_no), 
constraint foreign key(user_id) references users(user_id) );
desc ticket;

create table passengers(passenger_id  int primary key auto_increment,user_id int, name varchar(50),Train_no numeric, Pnr_no varchar(70),
Seat_no varchar(10),reservation_status varchar(50),ticket_id int,
constraint foreign key(ticket_id) references ticket(ticket_id),
constraint foreign key(Train_no) references train(Train_no),
constraint foreign key(user_id) references users (user_id));

-- 3)	Check the structure of table users.
	desc users;

-- 4)	List all the tables
     show tables;

-- 5)	Change the name of table “train” into “train_details”.
rename table train to train_details;
-- 6)	Delete all the details of passengers table.
truncate table passengers;

-- 7)	Delete the entire table of passengers.
drop table passengers;

-- 8)	Change the datatype of column passcode in users table to char(50).
	alter table users modify column passcode char(50);

-- 9)	Remove column “name” from passengers table.
	alter table passengers drop column name;

-- 10)	Add column name to passengers table after user_id column.
	alter table passengers add column name varchar(50)  after user_id;

-- 11)	Change column name of contact from users table to “phone_no”.
	alter table users rename column contact to phone_no;

-- 12)	Add a column at first position in table train as “train_id”.
alter table train add column trian_id int first;

-- DML Queries
-- 13) inserting records into tables.

insert into train(Train_no,Train_name,Start_station,Destination,
Departure_time,Arrival_time,Seat_availability)values
(16345,"Netravati Express","Lokmanya Tilak Terminus","Trivandrum Central",
"11:40:00","19:35:00",2000),
(13020,"Bagh Express","Kathgodam","Howrah Junction",
"09:50:00","23:10:00",1000),
(12577,"Baghmati Express","Darbhanga Junction","Mysuru City Junction",
"03:45:00","08:00:00",1300),
(15119,"Banaras Dehradun Express","Banaras","Dehradun",
"20:20:00","06:25:00",2200),
(18612,"Banaras Ranchi Express","Banaras","Ranchi",
"03:00:00","23:35:00",900),
(22923,"Bandra Jamanagar Humsafar Express","Bandra Terminus","Jamnagar",
"11:55:00","02:55:00",500),
(14320,"Bareilly Indore Weekly Express","Bareilly Junction","Indore Junction",
"11:25:00","08:55:00",1800),
(16616,"Chemmozhi Express","Coimbatore Junction","Mannargudi",
"12:30:00","07:40:00",700),
(12264,"Hazrat Nizamuddin Pune AC Duronto Express","Hazrat Nizamuddin","Pune Junction",
"06:16:00","02:10:00",1160),
(20953,"MGR Chennai-Tiruvallur EMU","Chennai Central Surburban","Tiruvallur",
"15:35:00","04:50:00",1350)
;

insert into users(fullname, username, passcode, Gender, age, email, city, state, adhar_no, contact) values
("Murlidharan Thampi","Murli123","murlithampi","M",50,"murlithampi@gmail.com","Badlapur","Maharashtra",5673883927,9093382890);

insert into users(fullname, username, passcode, Gender, age, email, city, state, adhar_no, contact) values
("Sheeba Devi","Sheeba30","sheebadevi","F",46,"sheebad@gmail.com","Trivandrum","Kerala",5695478956,8899778899),
("Geeta Nair","geeta01","geetanair1","F",60,"geetn@gmail.com","Kollamcode","Tamil Nadu",6581237022,7789564896),
("Anadalakshmi Iyer","anandi19","anadiiyer","F",21,"anandi@gmail.com","Kolkata","West Bengal",8854692236,9812305896),
("Samir Paradhi","Samirpardhi30","samirp","M",22,"samirp@gmail.com","Ahmednagar","Maharashtra",7410258963,8945123678),
("Mark Dsouza","markdsouza30","markdsouza","M",21,"markd@gmail.com","Trihekko","Goa",2569846317,7784591023),
("Tirumal Nadar","tirumalnad28","nadartirumal","M",25,"nadarthiru@gmail.com","Thengapatanam","Tamil Nadu",4410122566,7854961036);

insert into station(station_no, station_name, Train_no, arrival_time, hault, departure_time)
value
(001,"Lokmanya Tilak Terminus",16345,"11:40:00",15,"11:55:00"),
(002,"Kathgodam",13020,"09:50:00",20,"10:10:00"),
(003,"Darbhanga Junction",12577,"03:45:00",10,"03:55:00"),
(004,"Banaras",15119,"20:20:00",15,"20:35:00"),
(005,"Bandra Terminus",22923,"11:55:00",10,"12:00:00"),
(006,"Bareilly Junction",14320,"11:25:00",11,"11:36:00"),
(018,"Coimbatore Junction",16616,"12:30:00",13,"12:43:00"),
(020,"Hazrat Nizamuddin",12264,"06:16:00",10,"06:26:00"),
(021,"Chennai Central Surburban",20953,"15:35:00",15,"15:50:00"),
(022,"Pune Junction",12264,"02:10:00",20,"02:30:00");

insert into ticket(Train_no, user_id, status, no_of_passengers, Booked_on, Travel_date)
values
(16345,2,"RESERVED",1,"2023-08-12","2023-09-18"),
(13020,3,"RAC",3,"2023-08-15","2023-09-01"),
(12577,7,"RESERVED",4,"2023-08-12","2023-09-11"),
(15119,4,"RESERVED",1,"2023-08-18","2023-09-12"),
(22923,6,"RESERVED",1,"2023-08-20","2023-09-22"),
(14320,1,"WL",3,"2023-08-22","2023-09-03"),
(16616,4,"RESERVED",1,"2023-08-22","2023-09-09"),
(12264,5,"RESERVED",1,"2023-08-12","2023-09-19"),
(20953,3,"WL",3,"2023-08-15","2023-09-12"),
(12264,1,"RESERVED",1,"2023-08-22","2023-09-06");

insert into passengers(user_id, name,Train_no, Pnr_no, Seat_no, reservation_status, ticket_id)
values
(2,"Sheeba Devi",16345,"Q93478383","B15","RESERVED",1),
(3,"Geeta Nair",13020,"P68482335","C35","RAC",2),
(7,"Tirumal Nadar",12577,"R88763256","C23","RESERVED",3),
(4,"Anadalakshmi Iyer",15119,"T85469712","H10","RESERVED",4),
(6,"Mark Dsouza",22923,"R78895412","B09","RESERVED",5),
(1,"Murlidharan Thampi",14320,"W99658447","C18","WL",6),
(4,"Anadalakshmi Iyer",16616,"S36547812","A50","RESERVED",7),
(5,"Samir Paradhi",12264,"C78894562","D72","RESERVED",8),
(3,"Geeta Nair",20953,"F12546989","E80","WL",9),
(1,"Murlidharan Thampi",12264,"G78569631","H44","RESERVED",10);

#14)	Change the name of Train to “Humsafar express” where train no is 22923.
update train set train_name="Humsafar Express" where train_no=22923;

#15)	Change username of sheeba devi to sheebu123 frm users table.
update users set username="sheebu123" where name="Sheeba Devi";

#16)	Change name to Sarala Thampi , username =sara123, email is sarathampi@gmail.com and passcode sarat where name is Geeta nair from users table.
update users set name="Sarala Thampi",username="sara123" , email="sarathampi@gmail.com", passcode="sarat" where name="Geeta Nair";

#17)	Delete records where  from station where station_no is 022.
delete from station where station_no="022";
#18)	Delete all the records from passengers table.
	delete from passengers ;

#DQL Queries

#19)	Display the records of passengers whose age is below 40 from passengers table.
select * from users where age<=40;

#20)	Display the records of users whose belongs to Tamil Nadu from passengers table.
select * from users where state="Tamil Nadu";
#21)	Display all train name and their seat availability from train table.
select train_name, seat_availability from train;
#22)	Display the passenger name whose booking status is in waiting list from passengers table.
select * from passengers where reservation_status="WL";
#23)	Display records of seat no whose seat is in C section from passengers table.
select * from passengers where seat_no like "C%";
#24)	Display name as firstname from users table.
	select fullname as first_name from users;
#25)	Display status as booking_status from ticket table.
select status as booking_status from ticket;

#26)	Display unique names of the trains.
select distinct(train_name) from train;

#27)	Display PNR no and seat no of passengers.
select pnr_no,seat_no from passengers;

#Operators
#28)	 Display records of ticket table whose  status is not RESERVED.
select * from ticket where status !="RESERVED";

#29)	Display records whose status is not WL and RAC.
select * from ticket where status not in("WL","RAC");

#30)	Display train details whose destination is indore junction.
select * from train where destination="Indore Junction";

#31)	Display station details where the train haults for more than 15 minutes.
select * from station where hault>15;
#32)	Display train details whose starting stations are either banaras or bandra terminus.
select * from train where Start_station in("Banaras", "Bandra Terminus");
#33)	Display records of users where age greater than equal to 60 and less than 30.
select * from users where age>60 or age<30;
#34)	Display the average age of the users.
select avg(age) from users;
#35)	Display unique user id from passengers table.
select distinct(user_id) from passengers;
#36)	Display users whose age lies between  40 to 70.
select * from users where age between 40 and 70;
#37)	Display users whose age does not lies between 40 to 70.
select * from users where not age between 40 and 70;
#38)	Display users who lives in Maharashtra, Tamil Nadu, Kerala.
select * from users where state in("Maharashtra","Tamil Nadu","Kerala");
#39)	Display records whose name starts with a and s.
select * from users where fullname like "s%" or fullname like "a%";
#40)	Display records where second letter is a.
select * from users where fullname like "_a%";
#41)	Display only first five records of ticket table.
select * from ticket limit 5;
#42)	Display from 5th record to 10th record in train table.
select * from ticket limit 4,10;
#43)	Display records of users in increasing order of their age.
Select * from users order by age;
#44)	Display the record of the person who is the eldest in users table.
select * from users order by age desc limit 1;




#46)	Display how many total male and female users are present in users table.
select gender, count(gender) from users group by gender;



#48)	Display the count of total passengers who booked the ticket.
select count(*) as total_People_booked from passengers;
#49)	Display statewise count of users.
select state, count(state) from users group by state;
#50)	Display first 5 characters of names of users.
select left(fullname,5) from users;
select substr(fullname,1,5) from users;
#51)	Display the characters from 4th to 9th of train names.
select substr(train_name,4,6) from train;
#52)	Replace the WL to RAC in tickets table.
select replace(status,"WL","RAC") from ticket;
#53)	Display the train name in uppercase.
select upper(train_name) from train;


#Subqueries:
#54)	Display records of passengers whose reservation status is same as status of Sheeba Devi.
select * from passengers where reservation_status=(select reservation_status from passengers where name="Sheeba Devi");
#55)	Display records of train who has the same start station as of train no 18612.
select * from train where Start_station=(select Start_station from train where train_no=18612);
#56)	Display records of people whose age is less than people who live in Tamil Nadu.
select * from users where age<ALL(select age from users where state="TamilNadu");
#57)	 Display records of person who booked ticket on same date as the user id 1.
select * from ticket where booked_on=ALL(select booked_on from ticket where user_id=1);

#58)	Display records of person who has minimum age.
select * from users where age=(select min(age) from users);

#59)	Display city and the name of user  who has the minimum age.
select fullname,city from users where age=(select min(age) from users);

#Joins:
#58)	Display the records of users whose status is in WL.
select * from users u join passengers p where u.user_id=p.user_id and p.reservation_status="WL";
#59)	Display records of train whose hault time is 15 minutes.
select * from train t join station s where t.train_no=s.train_no and s.hault=15;
#60)	Display records of passengers along with their train names.
select p.*,t.train_name from passengers p join train t where p.train_no=t.train_no;

















