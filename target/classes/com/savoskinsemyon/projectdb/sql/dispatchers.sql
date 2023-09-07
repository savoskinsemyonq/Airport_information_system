select staff_name
from staff
join departments_and_staff on staff.staff_id=departments_and_staff.staff_id_FK
join departments on departments.department_id=departments_and_staff.department_id_FK
where staff_gender='??' and staff_number_children >'??' and department_name='Отдел диспетчеров';