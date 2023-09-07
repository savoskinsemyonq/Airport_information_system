select  flight_type_name,p2.places_name,airplane_model_name
from flights
left join flight_type on flight_type.flight_type_id=flights.flight_type_id
left join airplanes on flights.airplane_id=airplanes.airplane_id
left join places p1 on p1.places_id=flights.depature_place_id_FK 
left join places p2 on p2.places_id=flights.arrival_place_id_FK
left join airplanes_model on airplanes.airplane_model_id_FK=airplanes_model.airplane_model_id
where flight_type_name="Внутренний" and p2.places_name="??" and airplane_model_name="??";