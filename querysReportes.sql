select f.nombre,e.nombre,e.apellido,e.ci,p.institucion,p.f_final 
from farmaciatst.empleados e inner join farmaciatst.farmacias f on e.id_farmacia=f.id
inner join farmaciatst.pasantias p on e.ci=p.ci 
where p.activo=1 order by f.nombre;



select l.nombre,c.vencimiento, sum(m.precio)
from farmaciatst.compras c inner join farmaciatst.compra_medicamento cm on c.id=cm.id_compra
inner join farmaciatst.pedidos p on c.id_pedido=p.id 
inner join farmaciatst.laboratorios l on p.id_laboratorio=l.id
inner join farmaciatst.medicamentos m on cm.id_medicamento=m.id
inner join farmaciatst.farmacias f on p.id_farmacia=f.id
where c.cancelado=0 and f.nombre="farmacia1" and f.ubicacion="valencia" group by c.id order by l.nombre;


select l.nombre,c.vencimiento, sum(m.precio)
from farmaciatst.compras c inner join farmaciatst.compra_medicamento cm on c.id=cm.id_compra
inner join farmaciatst.pedidos p on c.id_pedido=p.id 
inner join farmaciatst.laboratorios l on p.id_laboratorio=l.id
inner join farmaciatst.medicamentos m on cm.id_medicamento=m.id
inner join farmaciatst.farmacias f on p.id_farmacia=f.id
where c.cancelado=0 and f.nombre="farmacia2" group by c.id order by l.nombre;

select m.id,m.monodroga,l.nombre,i.cantidad
from farmaciatst.inventario i inner join farmaciatst.farmacias f on i.id_farmacia=f.id
inner join farmaciatst.medicamentos m on i.id_medicamento=m.id
inner join farmaciatst.laboratorio_medicamento ml on m.id=ml.id_medicamento
inner join farmaciatst.laboratorios l on ml.id_laboratorio=l.id
where f.nombre="farmacia1" and m.accion="curar";
