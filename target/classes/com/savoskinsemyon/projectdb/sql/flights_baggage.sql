select avg(ticket_price)
from passengers
group by flights_id_FK
having avg(ticket_price)>'??';