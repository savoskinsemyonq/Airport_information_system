select count(passenger_id) as "Количество забронированных мест на выбранном рейсе"
from passengers
left join tickets_status on tickets_status.ticket_status_id=passengers.ticket_status_id_FK
left join flights on flights.flight_id=passengers.flights_id_FK
left join airplanes on flights.airplane_id=airplanes.airplane_id
where flight_id='??' and ticket_status_name='Забронирован';