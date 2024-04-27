""". Crea una tabla llamada "Usuarios" con las columnas: "id" (entero, clave
primaria), "nombre" (texto) y "edad" (entero)."""

CREATE TABLE IF NOT EXISTS Usuarios(
id SERIAL PRIMARY KEY, 
nombre VARCHAR (20),
edad INT
)

"""3. Inserta dos registros en la tabla "Usuarios"."""

INSERT INTO public.Usuarios (id, nombre, edad)
VALUES ('1', 'Jorge', '30'),
('2', 'Oscar', '28')

"""1. Crea una tabla llamada "Ciudades" con las columnas: "id" (entero, clave
primaria), "nombre" (texto) y "pais" (texto)."""

CREATE TABLE IF NOT EXISTS Ciudades(
id SERIAL PRIMARY KEY,
nombre VARCHAR(20), 
pais VARCHAR (20)
)

"""2. Inserta al menos tres registros en la tabla "Ciudades"."""
INSERT INTO public.Ciudades(id, nombre, pais)
VALUES ('1', 'Jose', 'España'),
('2', 'Carlos', 'Italia'),
('3', 'Manu', 'Marruecos')

"""Crea una foreign key en la tabla "Usuarios" que se relacione con la columna "id"
de la tabla "Ciudades"."""

ALTER TABLE public.Usuarios
ADD CONSTRAINT fk_ciudades_id FOREIGN KEY (ciudades_visitadas_id) REFERENCES Ciudades(id)

4. Realiza una consulta que muestre los nombres de los usuarios junto con el
nombre de su ciudad y país (utiliza un LEFT JOIN).


SELECT * FROM public.Usuarios
LEFT JOIN public.Ciudades
ON public.ciudades.id = public.usuarios.ciudades_visitadas_id