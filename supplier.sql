create database supply;
use supply;
create table supplier(sid int,sname varchar(20),address varchar(20),primary key(sid));
create table parts(pid int,pname varchar(20),color varchar(20),primary key(pid));
create table catalog(sid int,pid int,cost real,foreign key(sid) references supplier(sid),
foreign key(pid) references parts(pid),
primary key(sid,pid));

INSERT INTO  supplier VALUES ('1', 'acme', 'BANGALORE');
INSERT INTO  supplier VALUES ('2', 'maruthi', 'MADRAS');
INSERT INTO  supplier VALUES ('3', 'alto', 'BANGALORE');
INSERT INTO  supplier VALUES ('4', 'audi', 'BOMBAY');


INSERT INTO  parts  VALUES ('11', 'tshirt', 'red');
INSERT INTO  parts  VALUES ('22', 'shirt', 'red');
INSERT INTO  parts  VALUES ('33', 'pant', 'blue');
INSERT INTO  parts  VALUES ('44', 'shorts', 'black');

INSERT INTO  catalog VALUES ('1', '11', '11.0');
INSERT INTO  catalog VALUES ('2', '22', '22.0');
INSERT INTO  catalog VALUES ('3', '33', '33.0');
INSERT INTO  catalog VALUES ('4', '44', '44.0');

select * from catalog;
SELECT DISTINCT P.pname
FROM Parts P, Catalog C
WHERE P.pid = C.pid;

SELECT parts.pname
FROM ((supplier
INNER JOIN catalog ON supplier.sid = catalog.sid)
INNER JOIN parts ON parts.pid = catalog.pid);

SELECT  C.sid
  FROM  Catalog C
  WHERE NOT EXISTS (
     SELECT  P.pid
       FROM  Parts P
       WHERE NOT EXISTS (
         SELECT  C1.sid
           FROM  Catalog C1
           WHERE C1.sid = C.sid
             AND C1.pid = P.pid
         )
     );
     
SELECT DISTINCT P.pname
 FROM Parts P, Catalog C
WHERE P.pid = C.pid;
