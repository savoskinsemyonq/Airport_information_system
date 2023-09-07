select airplane_model_name, ticket_price
from flights
join passengers on passengers.flights_id_FK=flights.flight_id
left join airplanes on flights.airplane_id=airplanes.airplane_id
left join airplanes_model on airplanes.airplane_model_id_FK=airplanes_model.airplane_model_id
where airplane_model_name="??" and ticket_price>'??';