select airplane_model_name, airplane_seats_number, airplane_start_work_data, technical_inspection_start_date, technical_inspection_end_date
from airplanes
left join airplanes_technical_inspection on airplanes_technical_inspection.airplane_id_FK=airplanes.airplane_id
left join airplanes_model on airplanes.airplane_model_id_FK=airplanes_model.airplane_model_id
where technical_inspection_start_date > "??" and technical_inspection_end_date < "??";