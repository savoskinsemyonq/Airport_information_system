-- 1 запрос 
select staff_name
from staff
join departments_and_staff on staff.staff_id=departments_and_staff.staff_id_FK
join departments on departments.department_id=departments_and_staff.department_id_FK
where staff_gender='m' and staff_number_children >1 and department_name='Отдел диспетчеров';

-- 2 запрос
select staff_name
from staff
join brigade on staff.brigade_id_FK=brigade.brigade_id
join departments_and_staff on staff.staff_id=departments_and_staff.staff_id_FK
join departments on departments.department_id=departments_and_staff.department_id_FK
where brigade_name="Бригада 2" and department_name="Отдел справочной службы";

-- 3 запрос
select staff_name
from staff
join departments_and_staff on staff.staff_id=departments_and_staff.staff_id_FK
join departments on departments.department_id=departments_and_staff.department_id_FK
left join medical_examination_and_staff on staff.staff_id=medical_examination_and_staff.staff_id_FK
left join medical_examination on medical_examination.medical_examination_id=medical_examination_and_staff.medical_examination_id_FK
where department_name='Отдел пилотов' and medical_examination_id is not null
group by staff_id;

-- 4 zapros кол-во рейсов для самолёта
select airplane_model_name, airplane_seats_number, airplane_start_work_data,count(airplane_model_name) as "Количество рейсов данного самолёта"
from flights
left join airplanes on flights.airplane_id=airplanes.airplane_id
left join airplanes_model on airplanes.airplane_model_id_FK=airplanes_model.airplane_model_id
group by (flights.airplane_id);

-- 5 zapros 
select airplane_model_name, airplane_seats_number, airplane_start_work_data, technical_inspection_start_date, technical_inspection_end_date
from airplanes
left join airplanes_technical_inspection on airplanes_technical_inspection.airplane_id_FK=airplanes.airplane_id
left join airplanes_model on airplanes.airplane_model_id_FK=airplanes_model.airplane_model_id
where technical_inspection_start_date > "2020-02-27" and technical_inspection_end_date < "2023-02-24";

-- 6 zapros меньше 3 часов
select flight_id, p1.places_name as "Место вылета", p2.places_name as "Место посадки", depature_datetime,arrival_datetime
from flights
left join places p1 on p1.places_id=flights.depature_place_id_FK 
left join places p2 on p2.places_id=flights.arrival_place_id_FK
where p1.places_name="Novosibirsk" and p2.places_name="Omsk" and arrival_datetime-depature_datetime<"30000";

-- 7 zapros
select flight_id, p1.places_name as "Место вылета", p2.places_name as "Место посадки", flights_state_name
from flights
left join flights_state on flights_state.flights_state_id=flights.flights_state_id_FK
left join places p1 on p1.places_id=flights.depature_place_id_FK 
left join places p2 on p2.places_id=flights.arrival_place_id_FK
where p1.places_name="Novosibirsk" and flights_state_name="canceled";

-- 8 zapros
select flight_id, p1.places_name as "Место вылета", p2.places_name as "Место посадки", flights_state_name
from flights
left join flights_state on flights_state.flights_state_id=flights.flights_state_id_FK
left join places p1 on p1.places_id=flights.depature_place_id_FK 
left join places p2 on p2.places_id=flights.arrival_place_id_FK
where p1.places_name="Novosibirsk" and (flights_state_name = "delayed(weather)" or flights_state_name = "delayed(technical_reason)");

-- 9 zapros
select flight_id,airplane_model_name, ticket_price
from flights
join passengers on passengers.flights_id_FK=flights.flight_id
left join airplanes on flights.airplane_id=airplanes.airplane_id
left join airplanes_model on airplanes.airplane_model_id_FK=airplanes_model.airplane_model_id
where airplane_model_name="Airbus_A220" and ticket_price>15000;

-- 10 zapros на тип рейса
select flight_id, flight_type_name,p2.places_name,airplane_model_name
from flights
left join flight_type on flight_type.flight_type_id=flights.flight_type_id
left join airplanes on flights.airplane_id=airplanes.airplane_id
left join places p1 on p1.places_id=flights.depature_place_id_FK 
left join places p2 on p2.places_id=flights.arrival_place_id_FK
left join airplanes_model on airplanes.airplane_model_id_FK=airplanes_model.airplane_model_id
where flight_type_name="Внутренний" and p2.places_name="Omsk" and airplane_model_name="Airbus_A220";

-- 11 zapros
select passenger_name , flight_type_name, depature_datetime
from passengers
left join flights on flights.flight_id=passengers.flights_id_FK
left join flight_type on flight_type.flight_type_id=flights.flight_type_id
where flight_type_name="Международный" and DATE(depature_datetime) ="2021-12-11" and passenger_international_passport_id_FK is not null;

-- 12 zapros
select count(passenger_id) as "Количество забронированных мест на выбранном рейсе"
from passengers
left join tickets_status on tickets_status.ticket_status_id=passengers.ticket_status_id_FK
left join flights on flights.flight_id=passengers.flights_id_FK
left join airplanes on flights.airplane_id=airplanes.airplane_id
where flight_id=1 and ticket_status_name='Забронирован';

-- 13 zapros рейсы с багажом и диап для средней ценой
select flights_id_FK, avg(ticket_price)
from passengers
where passenger_baggage='y'
group by flights_id_FK
having avg(ticket_price)>25000;


