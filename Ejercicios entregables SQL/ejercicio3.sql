"""Crea una tabla llamada "Productos" con las columnas: "id" (entero, clave
primaria), "nombre" (texto) y "precio" (numérico)."""

CREATE TABLE IF NOT EXISTS Productos(
id SERIAL PRIMARY KEY, 
nombre VARCHAR (20),
precio INT
)

"""2. Inserta al menos cinco registros en la tabla "Productos"."""
INSERT INTO public.productos(id,nombre,precio)
VALUES ('1', 'Victor', '20'),
('2', 'Raul', '15'),
('3', 'Miguel', '20'),
('4', 'Juan','40'),
('5', 'Luis', '33')

"""3. Actualiza el precio de un producto en la tabla "Productos"."""
UPDATE public.productos
SET precio = 20
WHERE id=2 

"""4. Elimina un producto de la tabla "Productos"."""
DELETE FROM public.productos
WHERE id=5

"""5. Realiza una consulta que muestre los nombres de los usuarios junto con los
nombres de los productos que han comprado (utiliza un INNER JOIN con la
tabla "Productos")."""
#antes he alterado la tabla para el foreign key y he tenido que añadir dos ids para que hayan los mismos ids 

SELECT * FROM public.usuarios
LEFT JOIN public.productos
ON public.usuarios.id = public.productos.id