select passenger_name , flight_type_name, depature_datetime
from passengers
left join flights on flights.flight_id=passengers.flights_id_FK
left join flight_type on flight_type.flight_type_id=flights.flight_type_id
where flight_type_name="Международный" and DATE(depature_datetime) ="??" and passenger_international_passport_id_FK is not null;