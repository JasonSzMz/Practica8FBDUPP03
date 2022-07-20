use empresa 


/*------------------------------------------------1--------------------------------------------*/
select count(b) as "Total de medicos", nombre
from(Select h.cod_hospital as "codigo hospital", m.cod_hospital as b, h.nombre
from hospitales h
left outer join medicos m
on h.cod_hospital=m.cod_hospital)
t1 group by b;


/*-----------------------------------------------------2----------------------------------*/
select distinct m.especialidad as "Especialidades", h.nombre as "Hospital"
from medicos m, hospitales h
where m.cod_hospital=h.cod_hospital;



/*--------------------------------------------------3---------------------------------------*/ /*Puedes escoger uno de los codigos (son diferentes) si quieres*/
select distinct m.especialidad, count(m.cod_hospital), h.nombre
from medicos m, hospitales h
where m.cod_hospital=h.cod_hospital
group by m.cod_hospital,m.especialidad order by h.nombre asc;
/*-------------------Alternativa a 3-------------------*/
select distinct m.especialidad, count(m.cod_hospital) as "Numero de empleados", h.nombre as "Hospital"
from hospitales h
left outer join medicos m
on h.cod_hospital=m.cod_hospital
group by m.cod_hospital,m.especialidad order by h.nombre asc;



/*------------------------------------------------4----------------------------------------*/
select count(p.cod_hospital) as "Total de empleados", h.nombre as "Hospital"
from personal p, hospitales h
where p.cod_hospital=h.cod_hospital
group by h.nombre;

    
/*------------------------------------------------5----------------------------------------*/ /*Puedes escoger uno de los codigos (son diferentes) si quieres*/
select count(*) as "Total de trabajadores", funcion as "Especialidad"
from personal
group by funcion;
/* only medico table*/
select count(dni) as "Total de trabajadores", especialidad
from medicos
group by especialidad;
/* through personal table*/
select count(m.dni) as "Total de trabajadores", m.especialidad
from medicos m, personal p
where m.dni=p.dni and p.funcion="medico"
group by m.especialidad;


/*------------------------------------------------6----------------------------------------*/  /*Puedes escoger uno de los codigos (son diferentes) si quieres*/
select count(*) as "Total de medicos", m.especialidad
from medicos m, personal p
where m.dni=p.dni and p.funcion="medico"
group by m.especialidad;
/*---alter--*/
select max(b) as "Total de medicos", especialidad
from(select count(*) as b, m.especialidad
from medicos m, personal p
where m.dni=p.dni and p.funcion="medico"
group by m.especialidad) t1;

/*------------------------------------------------7----------------------------------------*/   /*Puedes escoger uno de los codigos (son diferentes) si quieres*/
select max(num_plazas) as "Numero de plazas", nombre as "Hospital"
from hospitales;

/*-----------------------alternativa 7 ----------------------*/    
select nombre as "Hospital"
from hospitales
where num_plazas=(select max(num_plazas) from hospitales);


/*------------------------------------------------8----------------------------------------*/
select h.cod_hospital as "Codigo del hospital", h.nombre as "Hospital", count(h.cod_hospital) as "Total de medicos"
from hospitales h, personal p
where h.cod_hospital=p.cod_hospital and p.funcion="medico"
group by h.nombre;


/*------------------------------------------------9----------------------------------------*/  /*Puedes escoger uno de los codigos (son diferentes) si quieres*/
/* Group by Funcion or specialty*/
 select avg(salario) as "Media del salario", funcion
from personal
group by funcion;
/* Group by hopsital */
select avg(salario) as "Media del salario", h.nombre as "Hospital"
from personal p, hospitales h
where p.cod_hospital=h.cod_hospital
group by h.nombre;


/*------------------------------------------------10----------------------------------------*/
select distinct p.funcion, count(p.cod_hospital) as "Total de personal", h.nombre as "Hospital"

from personal p, hospitales h
where p.cod_hospital=h.cod_hospital
group by p.cod_hospital,p.funcion order by h.nombre asc;


/*------------------------------------------------11----------------------------------------*/
select count(m.dni) as "Total de trabajadores", m.especialidad
from medicos m, personal p
where m.dni=p.dni and p.funcion="medico"
group by m.especialidad;



/*------------------------------------------------12----------------------------------------*/
select p.apellidos, p.funcion, m.especialidad
from personal p, medicos m
where p.cod_hospital = (select cod_hospital
from (select max(b), cod_hospital
from (select sum(p.salario) as b, h.cod_hospital
from personal p, hospitales h
where p.cod_hospital=h.cod_hospital
group by h.nombre)t1)t2)
and p.funcion="Medico"
and p.dni=m.dni;
