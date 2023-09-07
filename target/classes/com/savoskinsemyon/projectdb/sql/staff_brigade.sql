select staff_name
from staff
join brigade on staff.brigade_id_FK=brigade.brigade_id
join departments_and_staff on staff.staff_id=departments_and_staff.staff_id_FK
join departments on departments.department_id=departments_and_staff.department_id_FK
where brigade_name="??" and department_name="Отдел справочной службы";