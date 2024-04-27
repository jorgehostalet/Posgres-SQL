"""Crear una tabla llamada "Clientes" con las columnas: id (entero, clave primaria),
nombre (texto) y email (texto)"""
CREATE TABLE IF NOT EXISTS CLIENTESEJERCICIO( 
ID SERIAL PRIMARY KEY, 
NOMBRE VARCHAR(20), 
EMAIL VARCHAR (20)
)

"""Insertar un nuevo cliente en la tabla "Clientes" con id=1, nombre="Juan" y
email="juan@example.com"."""

INSERT INTO public.clientesejercicio(id, nombre, email)
VALUES ('1', 'Alberto', 'juan@example.com')

""
UPDATE public.clientesejercicio
SET email= 'juan@mgail.com'
WHERE ID=1

"""4. Eliminar el cliente con id=1 de la tabla "Clientes"."""

DELETE FROM public.clientesejercicio
WHERE ID=1

""" Crear una tabla llamada "Pedidos" con las columnas: id (entero, clave primaria),
cliente_id (entero, clave externa referenciando a la tabla "Clientes"), producto
(texto) y cantidad (entero)."""
CREATE TABLE pedidosejercicio(
id SERIAL PRIMARY KEY,
cliente_id INT, 
producto VARCHAR (20),
CANTIDAD INT,
CONSTRAINT fk_cliente_id FOREIGN KEY (cliente_id) REFERENCES clientesejercicio(ID)
)

""" Insertar un nuevo pedido en la tabla "Pedidos" con id=1, cliente_id=1,
producto="Camiseta" y cantidad=2.."""
INSERT INTO public.pedidosejercicio(id, cliente_id, producto, cantidad)
VALUES ('1', '1', 'Camiseta', '2')

"""7. Actualizar la cantidad del pedido con id=1 a 3."""
UPDATE public.pedidosejercicio
SET cantidad=3
WHERE id=1

"""8. Eliminar el pedido con id=1 de la tabla "Pedidos"."""
DELETE FROM public.pedidosejercicio 
WHERE id=1

"""9. Crear una tabla llamada "Productos" con las columnas: id (entero, clave
primaria), nombre (texto) y precio (decimal)."""

CREATE TABLE productosejercicio(
id SERIAL PRIMARY KEY, 
NOMBRE VARCHAR (20),
PRECIO INT NOT NULL
)

"""10. Insertar varios productos en la tabla "Productos" con diferentes valores."""
INSERT INTO public.productosejercicio(id, NOMBRE, PRECIO)
VALUES ('1', 'Jorge', '35'), 
VALUES ('2', 'Luis', '80'),
VALUES ('3', 'Adriana', '90')

"""13. Consultar los productos de la tabla "Productos" cuyo precio sea mayor a $50."""
SELECT * FROM public.productosejercicio
WHERE PRECIO > 50

""" Consultar los clientes de la tabla "Clientes" cuyo nombre empiece con la letra
"A"."""
SELECT * FROM public.clientesejercicio
WHERE nombre ILIKE 'A%'

"""Realizar una consulta que muestre el nombre del cliente y el total de pedidos
realizados por cada cliente.
"""

SELECT*FROM public.clientesejercicio
LEFT JOIN public.pedidosejercicio
ON public.clientesejercicio.id = public.pedidosejercicio.cliente_id



