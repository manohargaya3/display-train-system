----------------------------------------------------------------------------------------------
#Table - Train containing Train details
-----------------------------------------------------------------------------------------------
show databases;
create table train (train_id integer not null, from_station varchar(255), to_station varchar(255), train_class_type_train_id integer, train_name varchar(255), train_schedule_train_id varchar(255), train_type decimal(19,2), primary key (train_id));
select * from train;
create table Train
(
train_id int not null,
train_name varchar(50) not null,
train_type varchar(50) not null,
from_station varchar(50),
to_Station varchar(50),
train_class_type_train_id int not null,
train_schedule_train_id int not null,
primary key(train_id),
foreign key (train_class_type_train_id) references train_class_type(train_id),
foreign key (train_schedule_train_id) references train_schedule(train_id)
);

INSERT IGNORE INTO train (train_id,train_name,train_type,from_station,to_Station,train_class_type_train_id,train_schedule_train_id) VALUES (10,"North Express","Super Fast","Bangalore","Chruchgate",8,5);
INSERT IGNORE INTO train (train_id,train_name,train_type,from_station,to_Station,train_class_type_train_id,train_schedule_train_id) VALUES (3,"Jammu Tawi Express","Super Fast","Mumbai","Hyderabad",4,7);
INSERT IGNORE INTO train (train_id,train_name,train_type,from_station,to_Station,train_class_type_train_id,train_schedule_train_id) VALUES (2,"August Kranti Express","Duronto","Goa","Chruchgate",2,7);
INSERT IGNORE INTO train (train_id,train_name,train_type,from_station,to_Station,train_class_type_train_id,train_schedule_train_id) VALUES (9,"West Express","Super Fast","Hyderabad","Delhi",6,10);
INSERT IGNORE INTO train (train_id,train_name,train_type,from_station,to_Station,train_class_type_train_id,train_schedule_train_id) VALUES (8,"East Express","Shatabdi","Hyderabad","Bangalore",7,9);
INSERT IGNORE INTO train (train_id,train_name,train_type,from_station,to_Station,train_class_type_train_id,train_schedule_train_id) VALUES (6,"Udyan Express","Super Fast","Bandra","Mumbai",10,5);
INSERT IGNORE INTO train (train_id,train_name,train_type,from_station,to_Station,train_class_type_train_id,train_schedule_train_id) VALUES (7,"Chennai Mail","Duronto","Howrah","Surat",10,10);
INSERT IGNORE INTO train (train_id,train_name,train_type,from_station,to_Station,train_class_type_train_id,train_schedule_train_id) VALUES (5,"Mumbai Mail","Shatabdi","Bandra","Howrah",4,7);
INSERT IGNORE INTO train (train_id,train_name,train_type,from_station,to_Station,train_class_type_train_id,train_schedule_train_id) VALUES (4,"Deccan Express","Express","Goa","Punjab",5,3);
INSERT IGNORE INTO train (train_id,train_name,train_type,from_station,to_Station,train_class_type_train_id,train_schedule_train_id) VALUES (1,"Shatabdi Express","Express","Pune","Hyderabad",10,7);



----------------------------------------------------------------------------------------------
#Table - Station containing station details
----------------------------------------------------------------------------------------------
create table station
(
station_id int not null,
station_name varchar(50),
primary key(station_id)
);

select * from station;

INSERT IGNORE INTO station (station_id,station_name) VALUES (2,"Goa");
INSERT IGNORE INTO station (station_id,station_name) VALUES (6,"Hyderabad");
INSERT IGNORE INTO station (station_id,station_name) VALUES (8,"Punjab");
INSERT IGNORE INTO station (station_id,station_name) VALUES (1,"Chruchgate");
INSERT IGNORE INTO station (station_id,station_name) VALUES (5,"Pune");
INSERT IGNORE INTO station (station_id,station_name) VALUES (4,"Howrah");
INSERT IGNORE INTO station (station_id,station_name) VALUES (3,"Surat");
INSERT IGNORE INTO station (station_id,station_name) VALUES (10,"Bandra");
INSERT IGNORE INTO station (station_id,station_name) VALUES (9,"Bangalore");
INSERT IGNORE INTO station (station_id,station_name) VALUES (11,"Mumbai");
INSERT IGNORE INTO station (station_id,station_name) VALUES (7,"Delhi");

----------------------------------------------------------------------------------------------
#Table - Route containing route details
----------------------------------------------------------------------------------------------
create table route
(
train_id int not null,
stop_id int not null,
station_id varchar(10) not null,
arrival_time time not null,
depart_time time not null,
source_distance int not null,
primary key (train_id,stop_id),
foreign key (train_id) references train(train_id) on update cascade on delete cascade
);

select * from route;
insert  into route values (1,'Pune', 'Hyderabad', 10, 200, '09:15:40');
insert  into route values (2,'Goa', 'Chruchgate', 15, 500, '08:15:40');
insert  into route values (3,'Mumbai', 'Hyderabad', 20, 800, '15:15:40');
insert  into route values (4,'Goa', 'Punjab', 30, 1200, '22:15:40');
insert  into route values (5,'Bandra', 'Howrah', 21, 2300, '22:15:40');
insert  into route values (6,'Bandra', 'Howrah', 15, 2000, '15:15:40');
insert  into route values (7,'Howrah', 'Surat', 20, 2100, '18:15:40');
insert  into route values (8,'Hyderabad', 'Bangalore', 10, 500, '09:15:40');
insert  into route values (9,'Hyderabad', 'Delhi', 20, 2200, '20:15:40');
insert  into route values (10,'Bangalore', 'Chruchgate', 15, 900, '21:15:40');
insert  into route values (11,'Mumbai', 'Delhi', 25, 2500, '22:15:40');

-----------------------------------------------------------------------------------------------
#Table - Train_Class_type containing class types and fare associated with each class types
-----------------------------------------------------------------------------------------------
create table train_class_type
(
train_id int not null,
class_type1 varchar(10) not null,
fare_type1 float not null,
class_type2 varchar(10) not null,
fare_type2 float not null,
class_type3 varchar(10) not null,
fare_type3 float not null,
primary key (train_id)
);

SELECT * FROM train_class_type;

INSERT IGNORE INTO train_class_type (train_id,class_type1,fare_type1,class_type2,fare_type2,class_type3,fare_type3) VALUES (4,"First Class","100","Business Class","200","Second Class","300");
INSERT IGNORE INTO train_class_type (train_id,class_type1,fare_type1,class_type2,fare_type2,class_type3,fare_type3) VALUES (6,"First Class","100","Business Class","200","Second Class","300");
INSERT IGNORE INTO train_class_type (train_id,class_type1,fare_type1,class_type2,fare_type2,class_type3,fare_type3) VALUES (2,"First Class","100","Business Class","200","Second Class","300");
INSERT IGNORE INTO train_class_type (train_id,class_type1,fare_type1,class_type2,fare_type2,class_type3,fare_type3) VALUES (9,"First Class","100","Business Class","200","Second Class","300");
INSERT IGNORE INTO train_class_type (train_id,class_type1,fare_type1,class_type2,fare_type2,class_type3,fare_type3) VALUES (1,"First Class","100","Business Class","200","Second Class","300");
INSERT IGNORE INTO train_class_type (train_id,class_type1,fare_type1,class_type2,fare_type2,class_type3,fare_type3) VALUES (5,"First Class","100","Business Class","200","Second Class","300");
INSERT IGNORE INTO train_class_type (train_id,class_type1,fare_type1,class_type2,fare_type2,class_type3,fare_type3) VALUES (10,"First Class","100","Business Class","200","Second Class","300");
INSERT IGNORE INTO train_class_type (train_id,class_type1,fare_type1,class_type2,fare_type2,class_type3,fare_type3) VALUES (8,"First Class","100","Business Class","200","Second Class","300");
INSERT IGNORE INTO train_class_type (train_id,class_type1,fare_type1,class_type2,fare_type2,class_type3,fare_type3) VALUES (7,"First Class","100","Business Class","200","Second Class","300");
INSERT IGNORE INTO train_class_type (train_id,class_type1,fare_type1,class_type2,fare_type2,class_type3,fare_type3) VALUES (3,"First Class","100","Business Class","200","Second Class","300");


--------------------------------------------------------------------------------------------------
#Table - Train_Schedule containing details of schedule of each train
--------------------------------------------------------------------------------------------------
create table train_schedule
(
train_id int not null,
train_name varchar(50) not null,
days_running_on varchar(10) not null,
start_time time not null,
primary key (train_id)
);
commit;

INSERT IGNORE INTO train_schedule (train_id,train_name,days_running_on,start_time) VALUES (9,"August Kranti Express","Friday","19:49:15");
INSERT IGNORE INTO train_schedule (train_id,train_name,days_running_on,start_time) VALUES (4,"Deccan Express","Friday","19:54:11");
INSERT IGNORE INTO train_schedule (train_id,train_name,days_running_on,start_time) VALUES (6,"North Express","Friday","10:27:20");
INSERT IGNORE INTO train_schedule (train_id,train_name,days_running_on,start_time) VALUES (3,"Mumbai Mail","Monday","02:07:17");
INSERT IGNORE INTO train_schedule (train_id,train_name,days_running_on,start_time) VALUES (5,"East Express","Monday","17:24:13");
INSERT IGNORE INTO train_schedule (train_id,train_name,days_running_on,start_time) VALUES (1,"Shatabdi Express","Sunday","13:25:51");
INSERT IGNORE INTO train_schedule (train_id,train_name,days_running_on,start_time) VALUES (2,"Chennai Mail","Tuesday","12:18:58");
INSERT IGNORE INTO train_schedule (train_id,train_name,days_running_on,start_time) VALUES (10,"West Express","Monday","05:23:58");
INSERT IGNORE INTO train_schedule (train_id,train_name,days_running_on,start_time) VALUES (8,"Udyan Express","All","16:57:03");
INSERT IGNORE INTO train_schedule (train_id,train_name,days_running_on,start_time) VALUES (7,"Jammu Tawi Express","All","23:58:58");

--------------------------------------------------------------------------------------------------
#Table - station_on_route contains details of stations present on a particular route
--------------------------------------------------------------------------------------------------
create table station_on_route
(
train_id int not null,
station_id varchar(20) not null,
stop_number int not null,
primary key (Train_id, station_id)
);

--------------------------------------------------------------------------------------------------
#Table - time_table_for_station contains details of stations and trains present on a particular route
--------------------------------------------------------------------------------------------------
create table time_table_for_station
(
train_id int not null,
train_timings time not null,
station_id int not null,
primary key (Train_id, station_id)
);
drop table time_table_for_station;
INSERT IGNORE INTO time_table_for_station (train_id,train_timings,station_id) VALUES (3,"06:44:12",6);
INSERT IGNORE INTO time_table_for_station (train_id,train_timings,station_id) VALUES (4,"06:24:11",6);
INSERT IGNORE INTO time_table_for_station (train_id,train_timings,station_id) VALUES (4,"09:36:58",6);
INSERT IGNORE INTO time_table_for_station (train_id,train_timings,station_id) VALUES (7,"20:56:15",8);
INSERT IGNORE INTO time_table_for_station (train_id,train_timings,station_id) VALUES (8,"04:10:16",1);
INSERT IGNORE INTO time_table_for_station (train_id,train_timings,station_id) VALUES (2,"19:31:06",2);
INSERT IGNORE INTO time_table_for_station (train_id,train_timings,station_id) VALUES (9,"00:45:34",4);
INSERT IGNORE INTO time_table_for_station (train_id,train_timings,station_id) VALUES (3,"02:23:08",1);
INSERT IGNORE INTO time_table_for_station (train_id,train_timings,station_id) VALUES (5,"06:53:13",2);
INSERT IGNORE INTO time_table_for_station (train_id,train_timings,station_id) VALUES (1,"11:46:17",3);
INSERT IGNORE INTO time_table_for_station (train_id,train_timings,station_id) VALUES (4,"20:56:39",4);
INSERT IGNORE INTO time_table_for_station (train_id,train_timings,station_id) VALUES (4,"12:46:00",8);
INSERT IGNORE INTO time_table_for_station (train_id,train_timings,station_id) VALUES (7,"13:35:29",3);
INSERT IGNORE INTO time_table_for_station (train_id,train_timings,station_id) VALUES (9,"18:38:38",10);
INSERT IGNORE INTO time_table_for_station (train_id,train_timings,station_id) VALUES (9,"19:23:44",2);
INSERT IGNORE INTO time_table_for_station (train_id,train_timings,station_id) VALUES (5,"10:52:11",6);
INSERT IGNORE INTO time_table_for_station (train_id,train_timings,station_id) VALUES (8,"21:06:32",4);
INSERT IGNORE INTO time_table_for_station (train_id,train_timings,station_id) VALUES (2,"07:36:54",3);
INSERT IGNORE INTO time_table_for_station (train_id,train_timings,station_id) VALUES (3,"08:01:06",3);
INSERT IGNORE INTO time_table_for_station (train_id,train_timings,station_id) VALUES (10,"14:48:28",9);
INSERT IGNORE INTO time_table_for_station (train_id,train_timings,station_id) VALUES (5,"08:27:48",9);
INSERT IGNORE INTO time_table_for_station (train_id,train_timings,station_id) VALUES (5,"07:25:07",4);
INSERT IGNORE INTO time_table_for_station (train_id,train_timings,station_id) VALUES (8,"17:13:23",4);
INSERT IGNORE INTO time_table_for_station (train_id,train_timings,station_id) VALUES (9,"20:16:47",10);
INSERT IGNORE INTO time_table_for_station (train_id,train_timings,station_id) VALUES (10,"02:46:52",9);
INSERT IGNORE INTO time_table_for_station (train_id,train_timings,station_id) VALUES (1,"09:30:40",8);
INSERT IGNORE INTO time_table_for_station (train_id,train_timings,station_id) VALUES (3,"07:26:52",5);
INSERT IGNORE INTO time_table_for_station (train_id,train_timings,station_id) VALUES (6,"13:45:42",6);
INSERT IGNORE INTO time_table_for_station (train_id,train_timings,station_id) VALUES (3,"13:01:55",4);
INSERT IGNORE INTO time_table_for_station (train_id,train_timings,station_id) VALUES (2,"07:07:33",10);
INSERT IGNORE INTO time_table_for_station (train_id,train_timings,station_id) VALUES (2,"23:23:29",2);
INSERT IGNORE INTO time_table_for_station (train_id,train_timings,station_id) VALUES (5,"22:03:40",6);
INSERT IGNORE INTO time_table_for_station (train_id,train_timings,station_id) VALUES (5,"21:46:41",1);
INSERT IGNORE INTO time_table_for_station (train_id,train_timings,station_id) VALUES (5,"18:51:23",7);
INSERT IGNORE INTO time_table_for_station (train_id,train_timings,station_id) VALUES (1,"23:03:48",9);
INSERT IGNORE INTO time_table_for_station (train_id,train_timings,station_id) VALUES (8,"16:36:23",7);
INSERT IGNORE INTO time_table_for_station (train_id,train_timings,station_id) VALUES (1,"07:57:04",8);
INSERT IGNORE INTO time_table_for_station (train_id,train_timings,station_id) VALUES (3,"19:00:09",3);
INSERT IGNORE INTO time_table_for_station (train_id,train_timings,station_id) VALUES (10,"00:37:00",7);
INSERT IGNORE INTO time_table_for_station (train_id,train_timings,station_id) VALUES (4,"11:36:48",2);
INSERT IGNORE INTO time_table_for_station (train_id,train_timings,station_id) VALUES (3,"03:07:34",2);
INSERT IGNORE INTO time_table_for_station (train_id,train_timings,station_id) VALUES (4,"07:14:22",7);
INSERT IGNORE INTO time_table_for_station (train_id,train_timings,station_id) VALUES (2,"19:54:48",10);
INSERT IGNORE INTO time_table_for_station (train_id,train_timings,station_id) VALUES (5,"02:55:00",3);
INSERT IGNORE INTO time_table_for_station (train_id,train_timings,station_id) VALUES (9,"22:29:41",3);
INSERT IGNORE INTO time_table_for_station (train_id,train_timings,station_id) VALUES (8,"18:17:32",10);
INSERT IGNORE INTO time_table_for_station (train_id,train_timings,station_id) VALUES (7,"19:24:49",2);
INSERT IGNORE INTO time_table_for_station (train_id,train_timings,station_id) VALUES (6,"02:37:41",7);
INSERT IGNORE INTO time_table_for_station (train_id,train_timings,station_id) VALUES (1,"21:16:59",4);
INSERT IGNORE INTO time_table_for_station (train_id,train_timings,station_id) VALUES (3,"03:34:52",8);
INSERT IGNORE INTO time_table_for_station (train_id,train_timings,station_id) VALUES (4,"20:52:37",10);
INSERT IGNORE INTO time_table_for_station (train_id,train_timings,station_id) VALUES (1,"08:46:25",7);
INSERT IGNORE INTO time_table_for_station (train_id,train_timings,station_id) VALUES (3,"12:25:09",5);
INSERT IGNORE INTO time_table_for_station (train_id,train_timings,station_id) VALUES (6,"09:55:41",8);
INSERT IGNORE INTO time_table_for_station (train_id,train_timings,station_id) VALUES (6,"07:30:51",3);
INSERT IGNORE INTO time_table_for_station (train_id,train_timings,station_id) VALUES (7,"13:53:46",10);
INSERT IGNORE INTO time_table_for_station (train_id,train_timings,station_id) VALUES (7,"11:13:21",3);
INSERT IGNORE INTO time_table_for_station (train_id,train_timings,station_id) VALUES (1,"14:51:15",2);
INSERT IGNORE INTO time_table_for_station (train_id,train_timings,station_id) VALUES (10,"08:24:01",7);
INSERT IGNORE INTO time_table_for_station (train_id,train_timings,station_id) VALUES (7,"02:25:30",4);
INSERT IGNORE INTO time_table_for_station (train_id,train_timings,station_id) VALUES (5,"23:01:01",10);
INSERT IGNORE INTO time_table_for_station (train_id,train_timings,station_id) VALUES (3,"10:59:48",10);
INSERT IGNORE INTO time_table_for_station (train_id,train_timings,station_id) VALUES (9,"20:27:50",2);
INSERT IGNORE INTO time_table_for_station (train_id,train_timings,station_id) VALUES (7,"04:02:02",10);
INSERT IGNORE INTO time_table_for_station (train_id,train_timings,station_id) VALUES (2,"22:05:05",2);
INSERT IGNORE INTO time_table_for_station (train_id,train_timings,station_id) VALUES (7,"01:12:39",3);
INSERT IGNORE INTO time_table_for_station (train_id,train_timings,station_id) VALUES (8,"03:05:26",10);
INSERT IGNORE INTO time_table_for_station (train_id,train_timings,station_id) VALUES (10,"06:50:44",4);
INSERT IGNORE INTO time_table_for_station (train_id,train_timings,station_id) VALUES (6,"09:11:26",3);
INSERT IGNORE INTO time_table_for_station (train_id,train_timings,station_id) VALUES (3,"00:49:10",7);
INSERT IGNORE INTO time_table_for_station (train_id,train_timings,station_id) VALUES (7,"09:43:31",9);
INSERT IGNORE INTO time_table_for_station (train_id,train_timings,station_id) VALUES (2,"16:20:37",3);
INSERT IGNORE INTO time_table_for_station (train_id,train_timings,station_id) VALUES (1,"14:56:55",4);
INSERT IGNORE INTO time_table_for_station (train_id,train_timings,station_id) VALUES (10,"13:11:10",5);
INSERT IGNORE INTO time_table_for_station (train_id,train_timings,station_id) VALUES (2,"03:08:58",1);
INSERT IGNORE INTO time_table_for_station (train_id,train_timings,station_id) VALUES (7,"20:36:27",7);
INSERT IGNORE INTO time_table_for_station (train_id,train_timings,station_id) VALUES (9,"04:36:12",10);
INSERT IGNORE INTO time_table_for_station (train_id,train_timings,station_id) VALUES (5,"09:44:07",6);
INSERT IGNORE INTO time_table_for_station (train_id,train_timings,station_id) VALUES (7,"08:41:25",9);
INSERT IGNORE INTO time_table_for_station (train_id,train_timings,station_id) VALUES (7,"21:15:45",2);
INSERT IGNORE INTO time_table_for_station (train_id,train_timings,station_id) VALUES (4,"19:14:20",3);
INSERT IGNORE INTO time_table_for_station (train_id,train_timings,station_id) VALUES (6,"04:24:53",7);
INSERT IGNORE INTO time_table_for_station (train_id,train_timings,station_id) VALUES (10,"19:05:34",8);
INSERT IGNORE INTO time_table_for_station (train_id,train_timings,station_id) VALUES (6,"03:19:24",7);
INSERT IGNORE INTO time_table_for_station (train_id,train_timings,station_id) VALUES (1,"11:14:40",5);
INSERT IGNORE INTO time_table_for_station (train_id,train_timings,station_id) VALUES (8,"19:25:10",2);
INSERT IGNORE INTO time_table_for_station (train_id,train_timings,station_id) VALUES (2,"22:54:57",10);
INSERT IGNORE INTO time_table_for_station (train_id,train_timings,station_id) VALUES (2,"06:15:31",10);
INSERT IGNORE INTO time_table_for_station (train_id,train_timings,station_id) VALUES (5,"18:33:52",10);
INSERT IGNORE INTO time_table_for_station (train_id,train_timings,station_id) VALUES (4,"07:52:47",7);
INSERT IGNORE INTO time_table_for_station (train_id,train_timings,station_id) VALUES (1,"08:51:05",1);
INSERT IGNORE INTO time_table_for_station (train_id,train_timings,station_id) VALUES (7,"02:13:52",1);
INSERT IGNORE INTO time_table_for_station (train_id,train_timings,station_id) VALUES (2,"09:50:00",9);
INSERT IGNORE INTO time_table_for_station (train_id,train_timings,station_id) VALUES (9,"23:44:38",8);
INSERT IGNORE INTO time_table_for_station (train_id,train_timings,station_id) VALUES (10,"14:45:36",8);
INSERT IGNORE INTO time_table_for_station (train_id,train_timings,station_id) VALUES (3,"11:43:58",9);
INSERT IGNORE INTO time_table_for_station (train_id,train_timings,station_id) VALUES (7,"07:16:00",9);
INSERT IGNORE INTO time_table_for_station (train_id,train_timings,station_id) VALUES (8,"10:46:48",6);
INSERT IGNORE INTO time_table_for_station (train_id,train_timings,station_id) VALUES (1,"19:01:27",2);
INSERT IGNORE INTO time_table_for_station (train_id,train_timings,station_id) VALUES (5,"07:22:22",5);
