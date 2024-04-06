CREATE DATABASE inscritos;

USE inscritos;

CREATE TABLE IF NOT EXISTS INSCRITOS (   id INT PRIMARY KEY AUTO_INCREMENT,
                                         cantidad INT,
                                         fecha DATE,
                                         fuente VARCHAR(100)
);



INSERT INTO INSCRITOS(cantidad, fecha, fuente)
VALUES
    (44, '2021-01-01', 'Blog'),
    (56, '2021-01-01', 'Página'),
    (39, '2021-02-01', 'Blog'),
    (81, '2021-02-01', 'Página'),
    (12, '2021-03-01', 'Blog'),
    (91, '2021-03-01', 'Página'),
    (48, '2021-04-01', 'Blog'),
    (45, '2021-04-01', 'Página'),
    (55, '2021-05-01', 'Blog'),
    (33, '2021-05-01', 'Página'),
    (18, '2021-06-01', 'Blog'),
    (12, '2021-06-01', 'Página'),
    (34, '2021-07-01', 'Blog'),
    (24, '2021-07-01', 'Página'),
    (83, '2021-08-01', 'Blog'),
    (99, '2021-08-01', 'Página');


-- Cantidad total de registros--
SELECT COUNT(cantidad) AS total_registros
FROM INSCRITOS;


-- Cantidad total de inscritos--
SELECT SUM(cantidad) AS total_inscritos
FROM INSCRITOS;

-- Registros de mayor antiguedad --

SELECT  ID, fecha
FROM INSCRITOS
WHERE fecha = (SELECT MIN(fecha) FROM INSCRITOS);

-- Cuantos inscritos por día
SELECT fecha, SUM(cantidad) AS inscritos_por_dia
FROM INSCRITOS
GROUP BY fecha;



-- ¿Qué día se inscribieron la mayor cantidad de personas y cuántas personas se inscribieron en ese día?--

SELECT fecha, SUM(cantidad) AS total_inscritos
FROM INSCRITOS
GROUP BY fecha
ORDER BY total_inscritos DESC
LIMIT 1;
