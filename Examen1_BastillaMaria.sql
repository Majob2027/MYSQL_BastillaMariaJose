-- ######################
-- ###### Examen1 #######
-- ######################


show databases;

create database ExamenMAJO;

use ExamenMAJO;

-- tabla departamento
create table departamento (
id int(19) primary key,
nombre varchar(50) not null
);

 -- tabla grado
create table grado (
id INT(19) PRIMARY KEY,
nombre VARCHAR(100) NOT NULL
);

-- tabla curso_escolar
create table curso_escolar(
id int(10) primary key,
anyo_inicio year(4) not null,
anyo_fin year(4) not null
);

-- tabla alumno
create table alumno(
id int(10) primary key,
nif varchar(9),
nombre varchar(25) not null,
apellido1 varchar(50) not null,
apelldio2 varchar(50),
ciudad varchar(25) not null,
direccion varchar(50) not null,
telefono varchar(9) ,
fecha_nacimiento date not null,
sexo enum('H','M') not null

);

-- tabla profesor
create table profesor (
id int (10) primary key,
nif varchar(9),
nombre varchar(25) not null,
apellido1 varchar(50) not null,
apellido2 varchar(50) ,
ciudad varchar(25) not null,
direccion varchar(50) not null,
telefono varchar(9),
fecha_nacimiento date not null,
sexo enum('H','M'),
id_departamento int(10) not null,
foreign key (id_departamento) references departamento(id)
);

-- tabla asignatura

create table asignatura (
id int(10) primary key,
nombre varchar(100) not null,
creditos float not null,
tipo enum('basica','optatoria','obligatoria') not null,
curso tinyint(3) not null,
cuatrimestre tinyint(3) not null,
id_profesor int(10),
id_grado int(10) not null,
foreign key (id_profesor) references profesor(id),
foreign key (id_grado) references grado(id)
);
 
 -- tabla alumno se matricula asignatura
create table alumno_se_matricula_asignatura (
id_alumno int(10),
id_asignatura int(10),
id_curso_escolar int(10),
foreign key (id_alumno) references alumno(id),
foreign key (id_asignatura) references asignatura(id),
foreign key (id_curso_escolar) references curso_escolar(id)
);

show tables ;



 /* Departamento */
INSERT INTO departamento VALUES (1, 'Informática');
INSERT INTO departamento VALUES (2, 'Matemáticas');
INSERT INTO departamento VALUES (3, 'Economía y Empresa');
INSERT INTO departamento VALUES (4, 'Educación');
INSERT INTO departamento VALUES (5, 'Agronomía');
INSERT INTO departamento VALUES (6, 'Química y Física');
INSERT INTO departamento VALUES (7, 'Filología');
INSERT INTO departamento VALUES (8, 'Derecho');
INSERT INTO departamento VALUES (9, 'Biología y Geología');
 
 /* Persona */
INSERT INTO alumno VALUES (1, '89542419S', 'Juan', 'Saez', 'Vega', 'Almería', 'C/ Mercurio', '618253876', '1992/08/08', 'H');
INSERT INTO alumno VALUES (2, '26902806M', 'Salvador', 'Sánchez', 'Pérez', 'Almería', 'C/ Real del barrio alto', '950254837', '1991/03/28', 'H');
INSERT INTO alumno VALUES (4, '17105885A', 'Pedro', 'Heller', 'Pagac', 'Almería', 'C/ Estrella fugaz', NULL, '2000/10/05', 'H');
INSERT INTO alumno VALUES (6, '04233869Y', 'José', 'Koss', 'Bayer', 'Almería', 'C/ Júpiter', '628349590', '1998/01/28', 'H');
INSERT INTO alumno VALUES (7, '97258166K', 'Ismael', 'Strosin', 'Turcotte', 'Almería', 'C/ Neptuno', NULL, '1999/05/24', 'H');
INSERT INTO alumno VALUES (9, '82842571K', 'Ramón', 'Herzog', 'Tremblay', 'Almería', 'C/ Urano', '626351429', '1996/11/21', 'H');
INSERT INTO alumno VALUES (11, '46900725E', 'Daniel', 'Herman', 'Pacocha', 'Almería', 'C/ Andarax', '679837625', '1997/04/26', 'H');
INSERT INTO alumno VALUES (19, '11578526G', 'Inma', 'Lakin', 'Yundt', 'Almería', 'C/ Picos de Europa', '678652431', '1998/09/01', 'M');
INSERT INTO alumno VALUES (21, '79089577Y', 'Juan', 'Gutiérrez', 'López', 'Almería', 'C/ Los pinos', '678652431', '1998/01/01', 'H');
INSERT INTO alumno VALUES (22, '41491230N', 'Antonio', 'Domínguez', 'Guerrero', 'Almería', 'C/ Cabo de Gata', '626652498', '1999/02/11', 'H');
INSERT INTO alumno VALUES (23, '64753215G', 'Irene', 'Hernández', 'Martínez', 'Almería', 'C/ Zapillo', '628452384', '1996/03/12', 'M');
INSERT INTO alumno VALUES (24, '85135690V', 'Sonia', 'Gea', 'Ruiz', 'Almería', 'C/ Mercurio', '678812017', '1995/04/13', 'M');


/* Profesor */
INSERT INTO profesor VALUES (3, '11105554G', 'Zoe', 'Ramirez', 'Gea', 'Almería', 'C/ Marte', '618223876', '1979/08/19', 'M', 1);
INSERT INTO profesor VALUES (5, '38223286T', 'David', 'Schmidt', 'Fisher', 'Almería', 'C/ Venus', '678516294', '1978/01/19', 'H', 2);
INSERT INTO profesor VALUES (8, '79503962T', 'Cristina', 'Lemke', 'Rutherford', 'Almería', 'C/ Saturno', '669162534', '1977/08/21', 'M', 3);
INSERT INTO profesor VALUES (10, '61142000L', 'Esther', 'Spencer', 'Lakin', 'Almería', 'C/ Plutón', NULL, '1977/05/19', 'M', 4);
INSERT INTO profesor VALUES (12, '85366986W', 'Carmen', 'Streich', 'Hirthe', 'Almería', 'C/ Almanzora', NULL, '1971-04-29', 'M', 4);
INSERT INTO profesor VALUES (13, '73571384L', 'Alfredo', 'Stiedemann', 'Morissette', 'Almería', 'C/ Guadalquivir', '950896725', '1980/02/01', 'H', 6);
INSERT INTO profesor VALUES (14, '82937751G', 'Manolo', 'Hamill', 'Kozey', 'Almería', 'C/ Duero', '950263514', '1977/01/02', 'H', 1);
INSERT INTO profesor VALUES (15, '80502866Z', 'Alejandro', 'Kohler', 'Schoen', 'Almería', 'C/ Tajo', '668726354', '1980/03/14', 'H', 2);
INSERT INTO profesor VALUES (16, '10485008K', 'Antonio', 'Fahey', 'Considine', 'Almería', 'C/ Sierra de los Filabres', NULL, '1982/03/18', 'H', 3);
INSERT INTO profesor VALUES (17, '85869555K', 'Guillermo', 'Ruecker', 'Upton', 'Almería', 'C/ Sierra de Gádor', NULL, '1973/05/05', 'H', 4);
INSERT INTO profesor VALUES (18, '04326833G', 'Micaela', 'Monahan', 'Murray', 'Almería', 'C/ Veleta', '662765413', '1976/02/25', 'H', 5);
INSERT INTO profesor VALUES (20, '79221403L', 'Francesca', 'Schowalter', 'Muller', 'Almería', 'C/ Quinto pino', NULL, '1980/10/31', 'H', 6);
INSERT INTO profesor VALUES (21, '13175769N', 'Pepe', 'Sánchez', 'Ruiz', 'Almería', 'C/ Quinto pino', NULL, '1980/10/16', 'H', 1);
INSERT INTO profesor VALUES (22, '98816696W', 'Juan', 'Guerrero', 'Martínez', 'Almería', 'C/ Quinto pino', NULL, '1980/11/21', 'H', 1);
INSERT INTO profesor VALUES (23, '77194445M', 'María', 'Domínguez', 'Hernández', 'Almería', 'C/ Quinto pino', NULL, '1980/12/13', 'M', 2);

/* Grado */
INSERT INTO grado VALUES (1, 'Grado en Ingeniería Agrícola (Plan 2015)');
INSERT INTO grado VALUES (2, 'Grado en Ingeniería Eléctrica (Plan 2014)');
INSERT INTO grado VALUES (3, 'Grado en Ingeniería Electrónica Industrial (Plan 2010)');
INSERT INTO grado VALUES (4, 'Grado en Ingeniería Informática (Plan 2015)');
INSERT INTO grado VALUES (5, 'Grado en Ingeniería Mecánica (Plan 2010)');
INSERT INTO grado VALUES (6, 'Grado en Ingeniería Química Industrial (Plan 2010)');
INSERT INTO grado VALUES (7, 'Grado en Biotecnología (Plan 2015)');
INSERT INTO grado VALUES (8, 'Grado en Ciencias Ambientales (Plan 2009)');
INSERT INTO grado VALUES (9, 'Grado en Matemáticas (Plan 2010)');
INSERT INTO grado VALUES (10, 'Grado en Química (Plan 2009)');
 
/* Asignatura */
INSERT INTO asignatura VALUES (1, 'Álgegra lineal y matemática discreta', 6, 'básica', 1, 1, NULL, 4);
INSERT INTO asignatura VALUES (2, 'Cálculo', 6, 'básica', 1, 1, NULL, 4);
INSERT INTO asignatura VALUES (3, 'Física para informática', 6, 'básica', 1, 1, NULL, 4);
INSERT INTO asignatura VALUES (4, 'Introducción a la programación', 6, 'básica', 1, 1, NULL, 4);
INSERT INTO asignatura VALUES (5, 'Organización y gestión de empresas', 6, 'básica', 1, 1, NULL, 4);
INSERT INTO asignatura VALUES (6, 'Estadística', 6, 'básica', 1, 2, NULL, 4);
INSERT INTO asignatura VALUES (7, 'Estructura y tecnología de computadores', 6, 'básica', 1, 2, NULL, 4);
INSERT INTO asignatura VALUES (8, 'Fundamentos de electrónica', 6, 'básica', 1, 2, NULL, 4);
INSERT INTO asignatura VALUES (9, 'Lógica y algorítmica', 6, 'básica', 1, 2, NULL, 4);
INSERT INTO asignatura VALUES (10, 'Metodología de la programación', 6, 'básica', 1, 2, NULL, 4);
INSERT INTO asignatura VALUES (11, 'Arquitectura de Computadores', 6, 'básica', 2, 1, 3, 4);
INSERT INTO asignatura VALUES (12, 'Estructura de Datos y Algoritmos I', 6, 'obligatoria', 2, 1, 3, 4);
INSERT INTO asignatura VALUES (13, 'Ingeniería del Software', 6, 'obligatoria', 2, 1, 14, 4);
INSERT INTO asignatura VALUES (14, 'Sistemas Inteligentes', 6, 'obligatoria', 2, 1, 3, 4);
INSERT INTO asignatura VALUES (15, 'Sistemas Operativos', 6, 'obligatoria', 2, 1, 14, 4);
INSERT INTO asignatura VALUES (16, 'Bases de Datos', 6, 'básica', 2, 2, 14, 4);
INSERT INTO asignatura VALUES (17, 'Estructura de Datos y Algoritmos II', 6, 'obligatoria', 2, 2, 14, 4);
INSERT INTO asignatura VALUES (18, 'Fundamentos de Redes de Computadores', 6 ,'obligatoria', 2, 2, 3, 4);
INSERT INTO asignatura VALUES (19, 'Planificación y Gestión de Proyectos Informáticos', 6, 'obligatoria', 2, 2, 3, 4);
INSERT INTO asignatura VALUES (20, 'Programación de Servicios Software', 6, 'obligatoria', 2, 2, 14, 4);
INSERT INTO asignatura VALUES (21, 'Desarrollo de interfaces de usuario', 6, 'obligatoria', 3, 1, 14, 4);
INSERT INTO asignatura VALUES (22, 'Ingeniería de Requisitos', 6, 'optativa', 3, 1, NULL, 4);
INSERT INTO asignatura VALUES (23, 'Integración de las Tecnologías de la Información en las Organizaciones', 6, 'optativa', 3, 1, NULL, 4);
INSERT INTO asignatura VALUES (24, 'Modelado y Diseño del Software 1', 6, 'optativa', 3, 1, NULL, 4);
INSERT INTO asignatura VALUES (25, 'Multiprocesadores', 6, 'optativa', 3, 1, NULL, 4);
INSERT INTO asignatura VALUES (26, 'Seguridad y cumplimiento normativo', 6, 'optativa', 3, 1, NULL, 4);
INSERT INTO asignatura VALUES (27, 'Sistema de Información para las Organizaciones', 6, 'optativa', 3, 1, NULL, 4); 
INSERT INTO asignatura VALUES (28, 'Tecnologías web', 6, 'optativa', 3, 1, NULL, 4);
INSERT INTO asignatura VALUES (29, 'Teoría de códigos y criptografía', 6, 'optativa', 3, 1, NULL, 4);
INSERT INTO asignatura VALUES (30, 'Administración de bases de datos', 6, 'optativa', 3, 2, NULL, 4);
INSERT INTO asignatura VALUES (31, 'Herramientas y Métodos de Ingeniería del Software', 6, 'optativa', 3, 2, NULL, 4);
INSERT INTO asignatura VALUES (32, 'Informática industrial y robótica', 6, 'optativa', 3, 2, NULL, 4);
INSERT INTO asignatura VALUES (33, 'Ingeniería de Sistemas de Información', 6, 'optativa', 3, 2, NULL, 4);
INSERT INTO asignatura VALUES (34, 'Modelado y Diseño del Software 2', 6, 'optativa', 3, 2, NULL, 4);
INSERT INTO asignatura VALUES (35, 'Negocio Electrónico', 6, 'optativa', 3, 2, NULL, 4);
INSERT INTO asignatura VALUES (36, 'Periféricos e interfaces', 6, 'optativa', 3, 2, NULL, 4);
INSERT INTO asignatura VALUES (37, 'Sistemas de tiempo real', 6, 'optativa', 3, 2, NULL, 4);
INSERT INTO asignatura VALUES (38, 'Tecnologías de acceso a red', 6, 'optativa', 3, 2, NULL, 4);
INSERT INTO asignatura VALUES (39, 'Tratamiento digital de imágenes', 6, 'optativa', 3, 2, NULL, 4);
INSERT INTO asignatura VALUES (40, 'Administración de redes y sistemas operativos', 6, 'optativa', 4, 1, NULL, 4);
INSERT INTO asignatura VALUES (41, 'Almacenes de Datos', 6, 'optativa', 4, 1, NULL, 4);
INSERT INTO asignatura VALUES (42, 'Fiabilidad y Gestión de Riesgos', 6, 'optativa', 4, 1, NULL, 4);
INSERT INTO asignatura VALUES (43, 'Líneas de Productos Software', 6, 'optativa', 4, 1, NULL, 4);
INSERT INTO asignatura VALUES (44, 'Procesos de Ingeniería del Software 1', 6, 'optativa', 4, 1, NULL, 4);
INSERT INTO asignatura VALUES (45, 'Tecnologías multimedia', 6, 'optativa', 4, 1, NULL, 4);
INSERT INTO asignatura VALUES (46, 'Análisis y planificación de las TI', 6, 'optativa', 4, 2, NULL, 4);
INSERT INTO asignatura VALUES (47, 'Desarrollo Rápido de Aplicaciones', 6, 'optativa', 4, 2, NULL, 4);
INSERT INTO asignatura VALUES (48, 'Gestión de la Calidad y de la Innovación Tecnológica', 6, 'optativa', 4, 2, NULL, 4);
INSERT INTO asignatura VALUES (49, 'Inteligencia del Negocio', 6, 'optativa', 4, 2, NULL, 4);
INSERT INTO asignatura VALUES (50, 'Procesos de Ingeniería del Software 2', 6, 'optativa', 4, 2, NULL, 4);
INSERT INTO asignatura VALUES (51, 'Seguridad Informática', 6, 'optativa', 4, 2, NULL, 4);
INSERT INTO asignatura VALUES (52, 'Biologia celular', 6, 'básica', 1, 1, NULL, 7);
INSERT INTO asignatura VALUES (53, 'Física', 6, 'básica', 1, 1, NULL, 7);
INSERT INTO asignatura VALUES (54, 'Matemáticas I', 6, 'básica', 1, 1, NULL, 7);
INSERT INTO asignatura VALUES (55, 'Química general', 6, 'básica', 1, 1, NULL, 7);
INSERT INTO asignatura VALUES (56, 'Química orgánica', 6, 'básica', 1, 1, NULL, 7);
INSERT INTO asignatura VALUES (57, 'Biología vegetal y animal', 6, 'básica', 1, 2, NULL, 7);
INSERT INTO asignatura VALUES (58, 'Bioquímica', 6, 'básica', 1, 2, NULL, 7);
INSERT INTO asignatura VALUES (59, 'Genética', 6, 'básica', 1, 2, NULL, 7);
INSERT INTO asignatura VALUES (60, 'Matemáticas II', 6, 'básica', 1, 2, NULL, 7);
INSERT INTO asignatura VALUES (61, 'Microbiología', 6, 'básica', 1, 2, NULL, 7);
INSERT INTO asignatura VALUES (62, 'Botánica agrícola', 6, 'obligatoria', 2, 1, NULL, 7);
INSERT INTO asignatura VALUES (63, 'Fisiología vegetal', 6, 'obligatoria', 2, 1, NULL, 7);
INSERT INTO asignatura VALUES (64, 'Genética molecular', 6, 'obligatoria', 2, 1, NULL, 7);
INSERT INTO asignatura VALUES (65, 'Ingeniería bioquímica', 6, 'obligatoria', 2, 1, NULL, 7);
INSERT INTO asignatura VALUES (66, 'Termodinámica y cinética química aplicada', 6, 'obligatoria', 2, 1, NULL, 7);
INSERT INTO asignatura VALUES (67, 'Biorreactores', 6, 'obligatoria', 2, 2, NULL, 7);
INSERT INTO asignatura VALUES (68, 'Biotecnología microbiana', 6, 'obligatoria', 2, 2, NULL, 7);
INSERT INTO asignatura VALUES (69, 'Ingeniería genética', 6, 'obligatoria', 2, 2, NULL, 7);
INSERT INTO asignatura VALUES (70, 'Inmunología', 6, 'obligatoria', 2, 2, NULL, 7);
INSERT INTO asignatura VALUES (71, 'Virología', 6, 'obligatoria', 2, 2, NULL, 7);
INSERT INTO asignatura VALUES (72, 'Bases moleculares del desarrollo vegetal', 4.5, 'obligatoria', 3, 1, NULL, 7);
INSERT INTO asignatura VALUES (73, 'Fisiología animal', 4.5, 'obligatoria', 3, 1, NULL, 7);
INSERT INTO asignatura VALUES (74, 'Metabolismo y biosíntesis de biomoléculas', 6, 'obligatoria', 3, 1, NULL, 7);
INSERT INTO asignatura VALUES (75, 'Operaciones de separación', 6, 'obligatoria', 3, 1, NULL, 7);
INSERT INTO asignatura VALUES (76, 'Patología molecular de plantas', 4.5, 'obligatoria', 3, 1, NULL, 7);
INSERT INTO asignatura VALUES (77, 'Técnicas instrumentales básicas', 4.5, 'obligatoria', 3, 1, NULL, 7);
INSERT INTO asignatura VALUES (78, 'Bioinformática', 4.5, 'obligatoria', 3, 2, NULL, 7);
INSERT INTO asignatura VALUES (79, 'Biotecnología de los productos hortofrutículas', 4.5, 'obligatoria', 3, 2, NULL, 7);
INSERT INTO asignatura VALUES (80, 'Biotecnología vegetal', 6, 'obligatoria', 3, 2, NULL, 7);
INSERT INTO asignatura VALUES (81, 'Genómica y proteómica', 4.5, 'obligatoria', 3, 2, NULL, 7);
INSERT INTO asignatura VALUES (82, 'Procesos biotecnológicos', 6, 'obligatoria', 3, 2, NULL, 7);
INSERT INTO asignatura VALUES (83, 'Técnicas instrumentales avanzadas', 4.5, 'obligatoria', 3, 2, NULL, 7);

/* Curso escolar */
INSERT INTO curso_escolar VALUES (1, 2014, 2015);
INSERT INTO curso_escolar VALUES (2, 2015, 2016);
INSERT INTO curso_escolar VALUES (3, 2016, 2017);
INSERT INTO curso_escolar VALUES (4, 2017, 2018);

/* Alumno se matricula en asignatura */
INSERT INTO alumno_se_matricula_asignatura VALUES (1, 1, 1);
INSERT INTO alumno_se_matricula_asignatura VALUES (1, 2, 1);
INSERT INTO alumno_se_matricula_asignatura VALUES (1, 3, 1);
INSERT INTO alumno_se_matricula_asignatura VALUES (1, 4, 1);
INSERT INTO alumno_se_matricula_asignatura VALUES (1, 5, 1);
INSERT INTO alumno_se_matricula_asignatura VALUES (1, 6, 1);
INSERT INTO alumno_se_matricula_asignatura VALUES (1, 7, 1);
INSERT INTO alumno_se_matricula_asignatura VALUES (1, 8, 1);
INSERT INTO alumno_se_matricula_asignatura VALUES (1, 9, 1);
INSERT INTO alumno_se_matricula_asignatura VALUES (1, 10, 1);

INSERT INTO alumno_se_matricula_asignatura VALUES (1, 1, 2);
INSERT INTO alumno_se_matricula_asignatura VALUES (1, 2, 2);
INSERT INTO alumno_se_matricula_asignatura VALUES (1, 3, 2);

INSERT INTO alumno_se_matricula_asignatura VALUES (1, 1, 3);
INSERT INTO alumno_se_matricula_asignatura VALUES (1, 2, 3);
INSERT INTO alumno_se_matricula_asignatura VALUES (1, 3, 3);

INSERT INTO alumno_se_matricula_asignatura VALUES (1, 1, 4);
INSERT INTO alumno_se_matricula_asignatura VALUES (1, 2, 4);
INSERT INTO alumno_se_matricula_asignatura VALUES (1, 3, 4);

INSERT INTO alumno_se_matricula_asignatura VALUES (2, 1, 1);
INSERT INTO alumno_se_matricula_asignatura VALUES (2, 2, 1);
INSERT INTO alumno_se_matricula_asignatura VALUES (2, 3, 1);

INSERT INTO alumno_se_matricula_asignatura VALUES (4, 1, 1);
INSERT INTO alumno_se_matricula_asignatura VALUES (4, 2, 1);
INSERT INTO alumno_se_matricula_asignatura VALUES (4, 3, 1);

INSERT INTO alumno_se_matricula_asignatura VALUES (4, 1, 2);
INSERT INTO alumno_se_matricula_asignatura VALUES (4, 2, 2);
INSERT INTO alumno_se_matricula_asignatura VALUES (4, 3, 2);
INSERT INTO alumno_se_matricula_asignatura VALUES (4, 4, 2);
INSERT INTO alumno_se_matricula_asignatura VALUES (4, 5, 2);
INSERT INTO alumno_se_matricula_asignatura VALUES (4, 6, 2);
INSERT INTO alumno_se_matricula_asignatura VALUES (4, 7, 2);
INSERT INTO alumno_se_matricula_asignatura VALUES (4, 8, 2);
INSERT INTO alumno_se_matricula_asignatura VALUES (4, 9, 2);
INSERT INTO alumno_se_matricula_asignatura VALUES (4, 10, 2);


-- consultas 

## Consultas sobre una tabla

-- 1. Devuelve un listado con el primer apellido, segundo apellido y el nombre de todos los alumnos. El listado deberá estar ordenado alfabéticamente de menor a mayor por el primer apellido,
--  segundo apellido y nombre.

select apellido1 , apelldio2 , nombre
from alumno ;


-- 2. Averigua el nombre y los dos apellidos de los alumnos que no han dado de alta su número de teléfono en la base de datos.

select apellido1 , apelldio2 , nombre
from alumno 
where alumno.telefono is null;

-- 3. Devuelve el listado de los alumnos que nacieron en 1999.

select apellido1 , apelldio2 , nombre
from alumno 
WHERE YEAR(fecha_nacimiento) = 1999;

-- 4. Devuelve el listado de profesores que no han dado de alta su número de teléfono en la base de datos y además su nif termina en K.

select nombre , apellido1
from profesor
where profesor.telefono is null;


-- 5. Devuelve el listado de las asignaturas que se imparten en el primer cuatrimestre, en el tercer curso del grado que tiene el identificador 7.

select nombre
from asignatura 
where cuatrimestre = 1;


##


## Consultas multitabla

-- 1. Devuelve un listado con los datos de todas las alumnos que se han matriculado alguna vez en el Grado en Ingeniería Informática (Plan 2015).

select nombre , apellido1 
from alumno;


-- 2. Devuelve un listado con todas las asignaturas ofertadas en el Grado en Ingeniería Informática (Plan 2015).


-- 3. Devuelve un listado de los profesores junto con el nombre del departamento al que están vinculados. 

-- El listado debe devolver cuatro columnas, primer apellido, segundo apellido, nombre y nombre del departamento. 


-- El resultado estará ordenado alfabéticamente de menor a mayor por los apellidos y el nombre.

select  apellido1.p , apellido2.p , nombre.p , nombre.d
from profesor p 
inner join departamento d on id_departamento.p = id.d;



-- 4. Devuelve un listado con el nombre de las asignaturas, año de inicio y año de fin del curso escolar del alumno con nif 26902806M.




-- 5. Devuelve un listado con el nombre de todos los departamentos que tienen profesores que imparten alguna asignatura en el Grado en Ingeniería Informática (Plan 2015).


-- 6. Devuelve un listado con todos los alumnos que se han matriculado en alguna asignatura durante el curso escolar 2018/2019.


## Consultas multitabla (Composición externa)

-- 1. Devuelve un listado con los nombres de todos los profesores y los departamentos que tienen vinculados. 
-- El listado también debe mostrar aquellos profesores que no tienen ningún departamento asociado. El listado debe devolver cuatro columnas, 
-- nombre del departamento, primer apellido, segundo apellido y nombre del profesor. El resultado estará ordenado alfabéticamente de menor a mayor por el nombre del departamento,
--  apellidos y el nombre.




-- 2. Devuelve un listado con los profesores que no están asociados a un departamento.

select nombre , apellido1 
from profesor
where id not in (
select id
from departamento
);

-- 3. Devuelve un listado con los departamentos que no tienen profesores asociados.

select nombre 
from departamento
where id not in (
select id
from profesor
);

-- 4. Devuelve un listado con los profesores que no imparten ninguna asignatura.

select nombre , apellido1 
from profesor 
where id not in(
select id
from asignatura
);

-- 5. Devuelve un listado con las asignaturas que no tienen un profesor asignado.

select nombre 
from asignatura 
where id not in (
select id
from profesor
);

-- 6. Devuelve un listado con todos los departamentos que tienen alguna asignatura que no se haya impartido en ningún curso escolar.
--  El resultado debe mostrar el nombre del departamento y el nombre de la asignatura que no se haya impartido nunca.





## Consultas resúmen

-- 1. Devuelve el número total de alumnos que hay.

SELECT COUNT(*) AS numero_alumno
FROM alumno;

-- 2. Calcula cuántos alumnos nacieron en 1999.

SELECT COUNT(*) AS numero_alumno
FROM alumno
WHERE YEAR(fecha_nacimiento) = 1999;



-- 3. Calcula cuántos profesores hay en cada departamento. El resultado sólo debe mostrar dos columnas, una con el nombre del departamento y otra con el número de profesores 
-- que hay en ese departamento. El resultado sólo debe incluir los departamentos que tienen profesores asociados y deberá estar ordenado de mayor a menor por el número de profesores.



select nombre , count(*) as numero_profesor
from profesor 
group by nombre;


-- 4. Devuelve un listado con todos los departamentos y el número de profesores que hay en cada uno de ellos. Tenga en cuenta que pueden existir departamentos 
-- que no tienen profesores asociados. Estos departamentos también tienen que aparecer en el listado.


-- 5. Devuelve un listado con el nombre de todos los grados existentes en la base de datos y el número de asignaturas que tiene cada uno. 
-- Tenga en cuenta que pueden existir grados que no tienen asignaturas asociadas. Estos grados también tienen que aparecer en el listado.
--  El resultado deberá estar ordenado de mayor a menor por el número de asignaturas.

-- 6. Devuelve un listado con el nombre de todos los grados existentes en la base de datos y el número de asignaturas que tiene cada uno,
--  de los grados que tengan más de 40 asignaturas asociadas.
-- 7. Devuelve un listado que muestre el nombre de los grados y la suma del número total de créditos que hay para cada tipo de asignatura. 
-- El resultado debe tener tres columnas: nombre del grado, tipo de asignatura y la suma de los créditos de todas las asignaturas que hay de ese tipo. 
-- Ordene el resultado de mayor a menor por el número total de crédidos.
-- 8. Devuelve un listado que muestre cuántos alumnos se han matriculado de alguna asignatura en cada uno de los cursos escolares. 

SELECT COUNT(*) AS numero_alumno
FROM alumno a;
inner join asignatura s on 

-- El resultado deberá mostrar dos columnas, una columna con el año de inicio del curso escolar y otra con el número de alumnos matriculados.
-- 9. Devuelve un listado con el número de asignaturas que imparte cada profesor. El listado debe tener en cuenta aquellos profesores que no imparten ninguna asignatura. 
-- El resultado mostrará cinco columnas: id, nombre, primer apellido, segundo apellido y número de asignaturas. El resultado estará ordenado de mayor a menor por el número de asignaturas.


