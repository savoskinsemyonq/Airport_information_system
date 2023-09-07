select airplane_model_name, airplane_seats_number, airplane_start_work_data,count(airplane_model_name) as "Количество рейсов данного самолёта"
from flights
left join airplanes on flights.airplane_id=airplanes.airplane_id
left join airplanes_model on airplanes.airplane_model_id_FK=airplanes_model.airplane_model_id
group by (flights.airplane_id);