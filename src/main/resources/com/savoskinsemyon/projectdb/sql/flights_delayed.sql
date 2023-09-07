select  p1.places_name as "Место вылета", p2.places_name as "Место посадки", flights_state_name
from flights
left join flights_state on flights_state.flights_state_id=flights.flights_state_id_FK
left join places p1 on p1.places_id=flights.depature_place_id_FK 
left join places p2 on p2.places_id=flights.arrival_place_id_FK
where p1.places_name="??" and (flights_state_name = "delayed(weather)" or flights_state_name = "delayed(technical_reason)");