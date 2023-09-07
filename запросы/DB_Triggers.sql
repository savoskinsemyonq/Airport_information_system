DROP TABLE if exists   sequence_staff_types;
DROP TABLE if exists   sequence_departments;
DROP TABLE if exists   sequence_brigade;
DROP TABLE if exists   sequence_staff;
DROP TABLE if exists   sequence_medical_examination;
DROP TABLE if exists   sequence_airplanes_model;
DROP TABLE if exists   sequence_airplanes;
DROP TABLE if exists   sequence_airplanes_repair;
DROP TABLE if exists   sequence_airplanes_technical_inspection;
DROP TABLE if exists   sequence_flight_type;
DROP TABLE if exists   sequence_places;
DROP TABLE if exists   sequence_flights_state;
DROP TABLE if exists   sequence_flights;
DROP TABLE if exists   sequence_tickets_status;
DROP TABLE if exists   sequence_passport;
DROP TABLE if exists   sequence_international_passport;
DROP TABLE if exists   sequence_passengers;


CREATE TABLE sequence_staff_types (
  id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY NOT NULL
);

CREATE TABLE sequence_departments (
  id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY NOT NULL
);

CREATE TABLE sequence_brigade (
  id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY NOT NULL
);

CREATE TABLE sequence_staff (
  id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY NOT NULL
);

CREATE TABLE sequence_medical_examination (
  id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY NOT NULL
);

CREATE TABLE sequence_airplanes_model (
  id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY NOT NULL
);

CREATE TABLE sequence_airplanes (
  id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY NOT NULL
);

CREATE TABLE sequence_airplanes_repair (
  id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY NOT NULL
);

CREATE TABLE sequence_airplanes_technical_inspection (
  id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY NOT NULL
);

CREATE TABLE sequence_flight_type (
  id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY NOT NULL
);

CREATE TABLE sequence_places (
  id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY NOT NULL
);

CREATE TABLE sequence_flights_state (
  id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY NOT NULL
);

CREATE TABLE sequence_flights (
  id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY NOT NULL
);

CREATE TABLE sequence_tickets_status (
  id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY NOT NULL
);

CREATE TABLE sequence_passport (
  id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY NOT NULL
);

CREATE TABLE sequence_international_passport (
  id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY NOT NULL
);


CREATE TABLE sequence_passengers (
  id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY NOT NULL
);


DELIMITER $$
	CREATE TRIGGER autoincrement_trigger_staff_types
	  BEFORE INSERT ON 
		staff_types
	  FOR EACH ROW
	BEGIN
	  INSERT INTO sequence_staff_types SET id=DEFAULT;
	  SET NEW.staff_type_id = LAST_INSERT_ID();
	END $$ 
DELIMITER;

DELIMITER $$
	CREATE TRIGGER autoincrement_trigger_departments
	  BEFORE INSERT ON 
		departments
	  FOR EACH ROW
	BEGIN
	  INSERT INTO sequence_departments SET id=DEFAULT;
	  SET NEW.department_id = LAST_INSERT_ID();
	END $$ 
DELIMITER;


DELIMITER $$
	CREATE TRIGGER autoincrement_trigger_brigade
	  BEFORE INSERT ON 
		brigade
	  FOR EACH ROW
	BEGIN
	  INSERT INTO sequence_brigade SET id=DEFAULT;
	  SET NEW.brigade_id = LAST_INSERT_ID();
	END $$ 
DELIMITER;

DELIMITER $$
	CREATE TRIGGER autoincrement_trigger_staff
	  BEFORE INSERT ON 
		staff
	  FOR EACH ROW
	BEGIN
	  INSERT INTO sequence_staff SET id=DEFAULT;
	  SET NEW.staff_id = LAST_INSERT_ID();
	END $$ 
DELIMITER;

DELIMITER $$
	CREATE TRIGGER autoincrement_medical_examination
	  BEFORE INSERT ON 
		medical_examination
	  FOR EACH ROW
	BEGIN
	  INSERT INTO sequence_medical_examination SET id=DEFAULT;
	  SET NEW.medical_examination_id = LAST_INSERT_ID();
	END $$ 
DELIMITER;

DELIMITER $$
	CREATE TRIGGER autoincrement_trigger_airplanes_model
	  BEFORE INSERT ON 
		airplanes_model
	  FOR EACH ROW
	BEGIN
	  INSERT INTO sequence_airplanes_model SET id=DEFAULT;
	  SET NEW.airplane_model_id = LAST_INSERT_ID();
	END $$ 
DELIMITER;

DELIMITER $$
	CREATE TRIGGER autoincrement_trigger_airplanes
	  BEFORE INSERT ON 
		airplanes
	  FOR EACH ROW
	BEGIN
	  INSERT INTO sequence_airplanes SET id=DEFAULT;
	  SET NEW.airplane_id = LAST_INSERT_ID();
	END $$ 
DELIMITER;

DELIMITER $$
	CREATE TRIGGER autoincrement_trigger_airplanes_repair
	  BEFORE INSERT ON 
		airplanes_repair
	  FOR EACH ROW
	BEGIN
	  INSERT INTO sequence_airplanes_repair SET id=DEFAULT;
	  SET NEW.airplanes_repair_id = LAST_INSERT_ID();
	END $$
DELIMITER;

DELIMITER $$
	CREATE TRIGGER autoincrement_trigger_airplanes_technical_inspection
	  BEFORE INSERT ON 
		airplanes_technical_inspection
	  FOR EACH ROW
	BEGIN
	  INSERT INTO sequence_airplanes_technical_inspection SET id=DEFAULT;
	  SET NEW.airplanes_technical_inspection_id = LAST_INSERT_ID();
	END $$ 
DELIMITER;

DELIMITER $$
	CREATE TRIGGER autoincrement_trigger_flight_type
	  BEFORE INSERT ON 
		flight_type
	  FOR EACH ROW
	BEGIN
	  INSERT INTO sequence_flight_type  SET id=DEFAULT;
	  SET NEW.flight_type_id = LAST_INSERT_ID();
	END $$
DELIMITER;

DELIMITER $$
	CREATE TRIGGER autoincrement_trigger_places
	  BEFORE INSERT ON 
		places
	  FOR EACH ROW
	BEGIN
	  INSERT INTO sequence_places SET id=DEFAULT;
	  SET NEW.places_id = LAST_INSERT_ID();
	END $$ 
DELIMITER;

DELIMITER $$
	CREATE TRIGGER autoincrement_trigger_flights_state
	  BEFORE INSERT ON 
		flights_state
	  FOR EACH ROW
	BEGIN
	  INSERT INTO sequence_flights_state SET id=DEFAULT;
	  SET NEW.flights_state_id = LAST_INSERT_ID();
	END $$ 
DELIMITER;

DELIMITER $$
	CREATE TRIGGER autoincrement_trigger_flights
	  BEFORE INSERT ON 
		flights
	  FOR EACH ROW
	BEGIN
	  INSERT INTO sequence_flights SET id=DEFAULT;
	  SET NEW.flight_id = LAST_INSERT_ID();
	END $$ 
DELIMITER;

DELIMITER $$
	CREATE TRIGGER autoincrement_trigger_tickets_status
	  BEFORE INSERT ON 
		tickets_status
	  FOR EACH ROW
	BEGIN
	  INSERT INTO sequence_tickets_status SET id=DEFAULT;
	  SET NEW.ticket_status_id = LAST_INSERT_ID();
	END $$ 
DELIMITER ;

DELIMITER $$
	CREATE TRIGGER autoincrement_passport
	  BEFORE INSERT ON 
		passport
	  FOR EACH ROW
	BEGIN
	  INSERT INTO sequence_passport SET id=DEFAULT;
	  SET NEW.passport_id = LAST_INSERT_ID();
	END $$ 
DELIMITER ;

DELIMITER $$
	CREATE TRIGGER autoincrement_trigger_international_passport
	  BEFORE INSERT ON 
		international_passport
	  FOR EACH ROW
	BEGIN
	  INSERT INTO sequence_international_passport SET id=DEFAULT;
	  SET NEW.international_passport_id = LAST_INSERT_ID();
	END $$ 
DELIMITER ;

DELIMITER $$
	CREATE TRIGGER autoincrement_trigger_passengers
	  BEFORE INSERT ON 
		passengers
	  FOR EACH ROW
	BEGIN
	  INSERT INTO sequence_passengers SET id=DEFAULT;
	  SET NEW.passenger_id = LAST_INSERT_ID();
	END $$ 
DELIMITER ;

DELIMITER $$
	CREATE TRIGGER trigger_is_number_of_airplane_seats_positive
	  BEFORE INSERT ON 
		airplanes
	  FOR EACH ROW
	IF NEW.airplane_seats_number < 0 
      THEN SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Airplane cant have negative number of seats';
	END IF $$ 
DELIMITER ;

DELIMITER $$
	CREATE TRIGGER trigger_is_good_dates_of_flight
	  BEFORE INSERT ON 
		flights
	  FOR EACH ROW
	IF NEW.arrival_datetime < NEW.depature_datetime 
      THEN SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Airplane couldn`t arrive before depature';
	END IF $$ 
DELIMITER ;

DELIMITER $$
	CREATE TRIGGER trigger_delete_staff
		BEFORE DELETE ON
			staff
		for each row
        begin
		delete from departments_and_staff where staff_id_FK=OLD.staff_id;
		delete from medical_examination_and_staff where staff_id_FK=OLD.staff_id;
        end
$$ 
DELIMITER ;

DELIMITER $$
	CREATE TRIGGER trigger_delete_airplane
		BEFORE DELETE ON
			airplanes
		for each row
        begin
		delete from airplanes_technical_inspection where airplane_id_FK=OLD.airplane_id;
        delete from airplanes_repair where airplane_id_FK=OLD.airplane_id;
        end
$$ 
DELIMITER ;