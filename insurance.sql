create database insurance_016;
use insurance_016;
create table person(driver_id varchar(10), d_name varchar(25), address varchar(30), PRIMARY KEY(driver_id));
create table car(Regno varchar(10), model varchar(15), year int, PRIMARY KEY(Regno));
create table accident(report_number int, a_date date, location varchar(30), PRIMARY KEY(report_number));
create table participated(driver_id varchar(10), Regno varchar(10), report_number int, damage_amount int, PRIMARY KEY(driver_id,Regno), FOREIGN KEY(driver_id) REFERENCES person(driver_id), FOREIGN KEY(Regno) REFERENCES car(Regno), FOREIGN KEY(report_number) REFERENCES accident(report_number));
create table owns(driver_id varchar(10), Regno varchar(10), PRIMARY KEY(driver_id, Regno), FOREIGN KEY(driver_id) REFERENCES person(driver_id), FOREIGN KEY(Regno) REFERENCES car(Regno));
desc person;
desc car;
desc accident;
desc owns;
desc participated;

insert into person(driver_id, d_name, address) values("DID123","Anirudh","Basavanagudi"),("DID570","Arnav","Belandur"),("DID284","Venu","Tarnaka"),("DID173","Pranav","Rajajinagar"),("DID990","Tarun","Nagarbhavi");
ALTER table car
DROP COLUMN year;
ALTER table car
ADD c_year int;
desc car;
insert into car(Regno, model, c_year) values("KA01MT3456","Civic",2001),("KA21YU9301","Swift",2005),("TS12QW1002","Bolero",2007),("KA67ST1256","Brezza",1998),("KA45AC7891","Indica",2008);
insert into accident(report_number,a_date,location) values(51,"2010-08-08","M.G.Road"),(52,"2006-09-30","Majestic"),(63,"2005-06-09","Nagole"),(71,"2002-10-10","Malleswaram"),(75,"2008-12-10","Jakkur");
insert into owns values("DID123","KA01MT3456");
insert into owns values("DID570","KA21YU9301");
insert into owns values("DID284","TS12QW1002");
insert into owns values("DID173","KA67ST1256");
insert into owns values("DID990","KA45AC7891");

insert into participated values("DID123","KA01MT3456",51,4000);
insert into participated values("DID570","KA21YU9301",52,6000);
insert into participated values("DID284","TS12QW1002",63,3000);
insert into participated values("DID173","KA67ST1256",71,10000);
insert into participated values("DID990","KA45AC7891",75,15000);

select * from person;
select * from car;
select * from accident;
select * from owns;
select * from participated;

update participated set damage_amount=30000 where Regno="KA45AC7891" AND report_number=75;
insert into accident values(89,"2020-07-29","Hebbal");
SELECT count(distinct driver_id) from participated , accident WHERE participated.report_number = accident.report_number and a_date like '%08';
SELECT count(participated.report_number) as count FROM participated,car WHERE participated.Regno = car.Regno AND car.model="Brezza";
