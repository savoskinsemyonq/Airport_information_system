drop TABLE if exists  departments_and_staff ;
drop TABLE if exists  medical_examination_and_staff ;
drop TABLE if exists  medical_examination ;
drop TABLE if exists  departments ;
drop table if exists  staff ;
drop TABLE if exists  staff_types ;
drop TABLE if exists  airplanes_and_brigade ;
drop TABLE if exists  brigade ;
drop TABLE if exists  passengers ;
drop TABLE if exists  passport ;
drop TABLE if exists  international_passport ;
drop TABLE if exists  tickets_status ;
drop TABLE if exists  flights ;
drop TABLE if exists  airplanes_repair ;
drop TABLE if exists  airplanes_technical_inspection ;
drop TABLE if exists  airplanes ;
drop TABLE if exists  flight_type ;
drop TABLE if exists  places ;
drop TABLE if exists  flights_state ;
drop TABLE if exists  airplanes_model ;



CREATE TABLE  staff_types  (
	 staff_type_id  INT NOT NULL,
	 staff_type_name  varchar(100) NOT NULL UNIQUE,
	PRIMARY KEY ( staff_type_id )
);

CREATE TABLE  departments  (
	 department_id  INT NOT NULL,
	 department_name  varchar(100) NOT NULL UNIQUE,
	 staff_type_id_FK  INT NOT NULL,
	PRIMARY KEY ( department_id ),
    FOREIGN KEY ( staff_type_id_FK ) REFERENCES  staff_types ( staff_type_id )
);

CREATE TABLE  brigade  (
	 brigade_id  INT NOT NULL,
	 brigade_name  varchar(100) NOT NULL UNIQUE,
	PRIMARY KEY ( brigade_id )
);

CREATE TABLE  staff  (
	 staff_id  INT NOT NULL,
	 staff_name  varchar(100) NOT NULL,
	 staff_gender  varchar(1) NOT NULL,
	 staff_birthday  DATE NOT NULL,
	 staff_number_children  INT,
	 staff_salary  FLOAT NOT NULL,
	 staff_start_work_date  DATE NOT NULL,
	 brigade_id_FK  INT NOT NULL,
	PRIMARY KEY ( staff_id ),
    FOREIGN KEY ( brigade_id_FK ) REFERENCES  brigade ( brigade_id )
);

CREATE TABLE  medical_examination  (
	 medical_examination_id  INT NOT NULL,
	 medical_examination_date  DATE NOT NULL,
	PRIMARY KEY ( medical_examination_id )
);

CREATE TABLE  medical_examination_and_staff  (
	 staff_id_FK  INT NOT NULL,
	 medical_examination_id_FK  INT NOT NULL,
	FOREIGN KEY ( staff_id_FK ) REFERENCES  staff ( staff_id ),
    FOREIGN KEY ( medical_examination_id_FK ) REFERENCES  medical_examination ( medical_examination_id )
);


CREATE TABLE  airplanes_model  (
	 airplane_model_id  INT NOT NULL,
	 airplane_model_name  varchar(100) NOT NULL UNIQUE,
	PRIMARY KEY ( airplane_model_id )
);

CREATE TABLE  airplanes  (
	 airplane_id  INT NOT NULL,
	 airplane_start_work_data  DATE NOT NULL,
	 airplane_seats_number  INT NOT NULL,
	 airplane_model_id_FK  INT NOT NULL,
	PRIMARY KEY ( airplane_id ),
    FOREIGN KEY ( airplane_model_id_FK ) REFERENCES  airplanes_model ( airplane_model_id )
);

CREATE TABLE  airplanes_and_brigade  (
	 brigade_id_FK  INT NOT NULL,
	 airplane_id_FK  INT NOT NULL,
    FOREIGN KEY ( brigade_id_FK ) REFERENCES  brigade ( brigade_id ),
    FOREIGN KEY ( airplane_id_FK ) REFERENCES  airplanes ( airplane_id )
);

CREATE TABLE  airplanes_repair  (
	 airplanes_repair_id  INT NOT NULL,
	 repair_start_date  DATE NOT NULL,
	 repair_end_date  DATE NOT NULL,
	 airplane_id  INT NOT NULL,
	PRIMARY KEY ( airplanes_repair_id ),
    FOREIGN KEY ( airplane_id ) REFERENCES  airplanes ( airplane_id )
);

CREATE TABLE  airplanes_technical_inspection  (
	 airplanes_technical_inspection_id  INT NOT NULL,
	 technical_inspection_start_date  DATE NOT NULL,
	 technical_inspection_end_date  DATE NOT NULL,
	 airplane_id_FK  INT NOT NULL,
	PRIMARY KEY ( airplanes_technical_inspection_id ),
    FOREIGN KEY ( airplane_id_FK ) REFERENCES  airplanes ( airplane_id )
);

CREATE TABLE  flight_type  (
	 flight_type_id  INT NOT NULL,
	 flight_type_name  varchar(100) NOT NULL UNIQUE,
	PRIMARY KEY ( flight_type_id )
);

CREATE TABLE  places  (
	 places_id  INT NOT NULL,
	 places_name  varchar(255) NOT NULL UNIQUE,
	PRIMARY KEY ( places_id )
);

CREATE TABLE  flights_state  (
	 flights_state_id  INT NOT NULL,
	 flights_state_name  varchar(255) NOT NULL UNIQUE,
	PRIMARY KEY ( flights_state_id )
);

CREATE TABLE  flights  (
	 flight_id  INT NOT NULL,
	 airplane_id  INT NOT NULL,
	 flight_type_id  INT NOT NULL,
	 depature_place_id_FK  INT NOT NULL,
	 depature_datetime  DATETIME NOT NULL,
	 arrival_datetime  DATETIME NOT NULL,
	 arrival_place_id_FK  INT NOT NULL,
	 flights_state_id_FK  INT NOT NULL,
	PRIMARY KEY ( flight_id ),
    FOREIGN KEY ( airplane_id ) REFERENCES  airplanes ( airplane_id ),
    FOREIGN KEY ( flight_type_id ) REFERENCES  flight_type ( flight_type_id ),
    FOREIGN KEY ( depature_place_id_FK ) REFERENCES  places ( places_id ),
    FOREIGN KEY ( arrival_place_id_FK ) REFERENCES  places ( places_id ),
    FOREIGN KEY ( flights_state_id_FK ) REFERENCES  flights_state ( flights_state_id )
);

CREATE TABLE  tickets_status  (
	 ticket_status_id  INT NOT NULL,
	 ticket_status_name  varchar(100) NOT NULL,
	PRIMARY KEY ( ticket_status_id )
);

CREATE TABLE  passport  (
	 passport_id  INT NOT NULL,
	 passport_info  varchar(255) NOT NULL UNIQUE,
	PRIMARY KEY ( passport_id )
);

CREATE TABLE  international_passport  (
	 international_passport_id  INT NOT NULL,
	 international_passport_info  varchar(255) NOT NULL UNIQUE,
	PRIMARY KEY ( international_passport_id )
);

CREATE TABLE  departments_and_staff  (
	 department_id_FK  INT NOT NULL,
	 staff_id_FK  INT NOT NULL,
    FOREIGN KEY ( department_id_FK ) REFERENCES  departments ( department_id ),
    FOREIGN KEY ( staff_id_FK ) REFERENCES  staff ( staff_id )
);

CREATE TABLE passengers (
	passenger_id INT NOT NULL,
	passenger_name varchar(100) NOT NULL,
	passenger_gender varchar(1) NOT NULL,
	passenger_birthday DATE NOT NULL,
	flights_id_FK INT NOT NULL,
	passenger_baggage varchar(1) NOT NULL,
	passport_id_FK INT NOT NULL UNIQUE,
	passenger_international_passport_id_FK INT UNIQUE,
	ticket_status_id_FK INT NOT NULL,
	ticket_price FLOAT NOT NULL,
	PRIMARY KEY ( passenger_id ),
    FOREIGN KEY ( flights_id_FK ) REFERENCES  flights ( flight_id ),
    FOREIGN KEY ( passport_id_FK ) REFERENCES  passport ( passport_id ),
    FOREIGN KEY ( passenger_international_passport_id_FK ) REFERENCES  international_passport ( international_passport_id ),
    FOREIGN KEY ( ticket_status_id_FK ) REFERENCES  tickets_status ( ticket_status_id )
);






















