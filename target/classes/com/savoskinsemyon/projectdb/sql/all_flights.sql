select p1.places_name, depature_datetime, arrival_datetime,p2.places_name, airplane_model_name, flights_state_name
from flights
left join airplanes on flights.airplane_id=airplanes.airplane_id
left join airplanes_model on airplanes.airplane_model_id_FK=airplanes_model.airplane_model_id
left join places p1 on p1.places_id=flights.depature_place_id_FK 
left join places p2 on p2.places_id=flights.arrival_place_id_FK
left join flights_state on flights_state.flights_state_id=flights.flights_state_id_FK