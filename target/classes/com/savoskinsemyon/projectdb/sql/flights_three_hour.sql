select p1.places_name as "Место вылета", p2.places_name as "Место посадки", depature_datetime,arrival_datetime
from flights
left join places p1 on p1.places_id=flights.depature_place_id_FK 
left join places p2 on p2.places_id=flights.arrival_place_id_FK
where p1.places_name="??" and p2.places_name="??" and arrival_datetime-depature_datetime<"30000";