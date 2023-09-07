select airplane_start_work_data as "Начало работы самолёта", airplane_seats_number as "Количество сидений в самолёте", airplane_model_name
from airplanes
left join airplanes_model on airplanes.airplane_model_id_FK=airplanes_model.airplane_model_id