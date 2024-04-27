"""Crea una tabla llamada "Pedidos" con las columnas: "id" (entero, clave
primaria), "id_usuario" (entero, clave foránea de la tabla "Usuarios") y
"id_producto" (entero, clave foránea de la tabla "Productos")."""

CREATE TABLE Pedidos(
id SERIAL PRIMARY KEY, 
id_usuario INT, 
id_producto INT,
CONSTRAINT fk_id_usuario FOREIGN KEY (id_usuario) REFERENCES usuarios(id),
CONSTRAINT fk_id_producto FOREIGN KEY (id_producto)REFERENCES productos(id)
)

"""Realiza una consulta que muestre los nombres de los usuarios y los nombres de
los productos que han comprado, incluidos aquellos que no han realizado
ningún pedido (utiliza LEFT JOIN y COALESCE)."""

SELECT public.usuarios.nombre AS nombre_usuario,
COALESCE(public.productos.nombre, 'Ningún pedido realizado')
FROM public.usuarios
LEFT JOIN public.pedidos
ON public.usuarios.id = public.pedidos.id_usuario
LEFT JOIN public.productos
ON public.productos.id = public.pedidos.id_producto

"""Realiza una consulta que muestre los nombres de los usuarios que han
realizado un pedido, pero también los que no han realizado ningún pedido
(utiliza LEFT JOIN)."""

SELECT public.usuarios.nombre 
FROM public.usuarios
LEFT JOIN public.pedidos
ON public.usuarios.id = public.pedidos.id_usuario
WHERE public.pedidos.cantidad = 0 OR public.pedidos.cantidad = 1