INSERT INTO staff_types (staff_type_name) VALUES
('Пилот'),
('Диспетчеp'),
('Техник'),
('Кассир'),
('Работник службы безопасности'),
('Работник справочной службы'),
('Обслуживающего пеpсонала');

INSERT INTO departments (department_name,staff_type_id_FK) VALUES
("Отдел пилотов",1),
("Отдел диспетчеров",2),
("Отдел техников",3),
("Отдел кассиров",4),
("Отдел службы безопасности",5),
("Отдел справочной службы",6),
("Отдел обслуживающего персонала",7);

INSERT INTO brigade (brigade_name) VALUES
("Бригада 1"),
("Бригада 2"),
("Бригада 3"),
("Бригада 4"),
("Бригада 5"),
("Бригада 6");

INSERT INTO staff (staff_name, staff_gender, staff_birthday, staff_number_children, staff_salary, staff_start_work_date, brigade_id_FK) VALUES
("Anna Bochkina","f","1983-08-22",1,39000,"2004-11-29",1),
("Boris Salin","m","1985-05-23",1,49003,"2005-11-29",1),
("Sergey Koshkin","m","1967-05-23",2,59003,"1990-07-19",2),
("Anna Kostina","f","1969-03-22",2,69803,"1990-08-23",2),
("Sergey Kukushkin","m","1988-01-21",2,58003,"1990-03-23",3),
("Anatoly Golubev","m","1989-02-13",2,75603,"2007-02-23",3),
("Elena Lipina","f","1978-12-03",1,24403,"1999-11-29",4),
("Daria Dubina","f","1979-11-30",1,23403,"1990-05-19",4),
("Sergey Dolin","m","1967-10-23",3,99903,"1990-12-19",5),
("Maxim Verevkin","m","1990-09-23",3,99903,"2016-09-29",5),
("Alexandr Vasin","m","1999-05-23",0,44403,"2018-11-29",6),
("Arina Koshkina","f","1998-05-23",0,55553,"2018-12-10",6);

INSERT INTO departments_and_staff (department_id_FK,staff_id_FK) VALUES
(1,9),
(1,10),
(2,9),
(2,8),
(3,11),
(3,2),
(4,8),
(4,7),
(5,2),
(5,3),
(6,1),
(6,4),
(7,5),
(7,6),
(7,12);

INSERT INTO medical_examination (medical_examination_date) VALUES
("2021-03-20"),
("2019-12-17"),
("2022-03-23"),
("2021-09-15"),
("2020-02-12");


INSERT INTO medical_examination_and_staff (staff_id_FK, medical_examination_id_FK) VALUES
(1,1),
(1,2),
(3,2),
(2,4),
(4,4),
(5,5),
(9,2),
(10,1),
(9,3);



  
INSERT INTO airplanes_model (airplane_model_name) VALUES
("Airbus_A220"),
("Cessna_408"),
("Ту_204"),
("Boeing_777");


INSERT INTO airplanes (airplane_start_work_data, airplane_seats_number,airplane_model_id_FK) VALUES
("2010-12-17",124,1),
("2011-11-13",122,1),
("2010-12-14",234,2),
("2010-03-23",246,3),
("2010-05-30",334,4),
("2010-10-17",234,2),
("2010-02-23",246,3);

-- INSERT INTO airplanes (airplane_start_work_data, airplane_seats_number,airplane_model_id_FK) VALUES
-- ("2010-02-21",-2,3);

INSERT INTO airplanes_and_brigade (brigade_id_FK, airplane_id_FK) VALUES
(1,1),
(1,3),
(1,4),
(2,2),
(3,4),
(4,3),
(5,5),
(6,6),
(1,7);

INSERT INTO airplanes_repair (repair_start_date, repair_end_date, airplane_id) VALUES
("2021-01-15","2022-02-23",1),
("2019-12-15","2021-01-23",4);

INSERT INTO airplanes_technical_inspection (technical_inspection_start_date, technical_inspection_end_date, airplane_id_FK) VALUES
("2021-11-15","2022-05-29",2),
("2018-10-28","2020-02-29",3);

INSERT INTO flight_type (flight_type_name) VALUES
("Внутренний"),
("Международный"),
("Чартерный"),
("Грузоперевозка"),
("Специальный рейс");

INSERT INTO places (places_name) VALUES
('Omsk'),
('London'),
('Moscow'),
('Novosibirsk'),
('Baranul'),
('Volgograd'),
('Vladivastok'),
('Samara'),
('Paris');

INSERT INTO flights_state (flights_state_name) VALUES
("normal"),
("delayed(weather)"),
("delayed(technical_reason)"),
("canceled");

INSERT INTO flights (airplane_id, flight_type_id, depature_place_id_FK, depature_datetime, arrival_datetime, arrival_place_id_FK, flights_state_id_FK) VALUES
(1,1,4,"2020-12-12 12:05:00","2020-12-12 14:05:00",1,3),
(4,2,4,"2021-12-11 12:05:00","2021-12-11 17:05:00",2,4),
(4,4,4,"2021-12-11 12:06:00","2021-12-11 17:05:00",5,1),
(1,1,3,"2018-12-11 12:07:00","2018-12-11 17:05:00",2,4),
(2,3,4,"2019-12-11 12:08:00","2019-12-11 17:05:00",1,3),
(1,2,3,"2021-12-11 12:09:00","2021-12-11 18:05:00",9,4),
(2,1,8,"2021-12-11 12:10:00","2021-12-11 15:05:00",5,2),
(5,2,6,"2021-12-11 12:11:00","2021-12-11 16:05:00",9,1),
(3,3,7,"2021-12-11 12:12:00","2021-12-11 17:05:00",1,2),
(6,2,4,"2021-11-11 12:05:00","2021-11-11 18:13:00",2,1),
(3,4,4,"2021-10-11 12:05:00","2021-10-11 16:05:00",3,4),
(7,5,3,"2021-09-11 12:05:00","2021-09-11 17:15:00",4,1);

-- INSERT INTO flights (airplane_id, flight_type_id, depature_place_id_FK, depature_datetime, arrival_datetime, arrival_place_id_FK, flights_state_id_FK) VALUES
-- (4,2,6,"2021-12-11 12:11:00","2020-12-11 16:05:00",9,1);

INSERT INTO tickets_status (ticket_status_name) VALUES
("Куплен"),
("Забронирован");

INSERT INTO passport (passport_info) VALUES
("945323"),
("845322"),
("242223"),
("132333"),
("345323"),
("544323"),
("645323"),
("745323");

INSERT INTO international_passport (international_passport_info) VALUES
("34532322"),
("34532211"),
("21342223"),
("12345323");

INSERT INTO passengers (passenger_name, passenger_gender, passenger_birthday, flights_id_FK, passenger_baggage, passport_id_FK, passenger_international_passport_id_FK, ticket_status_id_FK, ticket_price) VALUES
("Timur Agapov", "m", "1989-11-21",1,'y',1,null,1,10000),
("Anna Agapova", "f", "1980-12-22",2,'y',2,1,1,35000),
("Maxim Dubov", "m", "1998-10-22",1,'n',3,null,2,10300),
("Elena Lisina", "f", "1978-09-11",6,'y',4,3,1,34000),
("Marat Malinin", "m", "1974-08-13",6,'y',5,2,2,23000),
("Timur Petin", "m", "1966-06-21",4,'n',6,null,1,13000),
("Irina Utkina", "f", "1946-11-22",1,'y',7,4,2,32000),
("Maxim Kirillov", "m", "1977-02-11",4,'y',8,null,1,12310);


