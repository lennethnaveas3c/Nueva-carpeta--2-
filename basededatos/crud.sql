USE mydb;

-- Insertar datos en la tabla usuarios
INSERT INTO usuarios (nombre, apellido, fecha_nacimiento) VALUES
('Juan', 'Pérez', '1985-06-15'),
('María', 'López', '1990-09-20'),
('Carlos', 'Gómez', '1982-03-10'),
('Ana', 'Martínez', '1995-07-25'),
('Pedro', 'Sánchez', '1988-11-05');

-- Insertar datos en la tabla tipo_de_usuario
INSERT INTO tipo_de_usuario (usuarios_id_usuarios) VALUES
(1), (2), (3), (4), (5);

-- Insertar datos en la tabla medicos
INSERT INTO medicos (consultorio, especialidad) VALUES
('101', 'Cardiología'),
('102', 'Pediatría'),
('103', 'Dermatología'),
('104', 'Neurología'),
('105', 'Ortopedia');

-- Insertar datos en la tabla administrativos
INSERT INTO administrativos (medicos_id_medicos, usuarios_id_usuarios) VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5);

-- Insertar datos en la tabla pacientes
INSERT INTO pacientes (numero_paciente, numero_habitacion, tratamiento, medicos_id_medicos, `numero de telefono`, administrativos_id_administrativos, usuarios_id_usuarios) VALUES
('P001', 'H101', 'Antibióticos', 1, '555-1001', 1, 1),
('P002', 'H102', 'Fisioterapia', 2, '555-1002', 2, 2),
('P003', 'H103', 'Cirugía menor', 3, '555-1003', 3, 3),
('P004', 'H104', 'Rehabilitación', 4, '555-1004', 4, 4),
('P005', 'H105', 'Tratamiento dermatológico', 5, '555-1005', 5, 5);

-- Insertar datos en la tabla citas_medicas
INSERT INTO citas_medicas (fecha, motivo) VALUES
('2025-03-10 10:00:00', 'Consulta general'),
('2025-03-15 15:30:00', 'Dolor de cabeza'),
('2025-03-20 09:00:00', 'Control postoperatorio'),
('2025-03-25 14:00:00', 'Revisión de terapia'),
('2025-03-30 11:00:00', 'Chequeo dermatológico');

-- Insertar datos en la tabla historial_medico
INSERT INTO historial_medico (medicacion, pacientes_id_pacientes) VALUES
('Paracetamol', 1),
('Ibuprofeno', 2),
('Amoxicilina', 3),
('Omeprazol', 4),
('Cetirizina', 5);

-- Insertar datos en la tabla pacientes_has_citas_medicas
INSERT INTO pacientes_has_citas_medicas (pacientes_id_pacientes, citas_medicas_id_citas_medicas) VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5);

SELECT * FROM pacientes;
SELECT * FROM citas_medicas;

SET FOREIGN_KEY_CHECKS=0;

SET FOREIGN_KEY_CHECKS=1;

-- Insertar datos en la tabla medicos_has_pacientes
INSERT INTO medicos_has_pacientes (medicos_id_medicos, pacientes_id_pacientes, usuarios_id_usuarios) VALUES
(1, 1, 1),
(2, 2, 2),
(3, 3, 3),
(4, 4, 4),
(5, 5, 5);



-- Seleccionar todos los usuarios
SELECT * FROM usuarios;

-- Seleccionar todos los tipos de usuario
SELECT * FROM tipo_de_usuario;

-- Seleccionar todos los médicos
SELECT * FROM medicos;

-- Seleccionar todos los administrativos
SELECT * FROM administrativos;

-- Seleccionar todos los pacientes
SELECT * FROM pacientes;

-- Seleccionar todas las citas médicas
SELECT * FROM citas_medicas;

-- Seleccionar todo el historial médico
SELECT * FROM historial_medico;

-- Seleccionar todas las relaciones entre pacientes y citas médicas
SELECT * FROM pacientes_has_citas_medicas;

-- Seleccionar todas las relaciones entre médicos y pacientes
SELECT * FROM medicos_has_pacientes;



-- Modificar el nombre y apellido de un usuario con ID 1
UPDATE usuarios 
SET nombre = 'Luis', apellido = 'Ramírez' 
WHERE id_usuarios = 1;

-- Modificar la especialidad de un médico con ID 2
UPDATE medicos 
SET especialidad = 'Ginecología' 
WHERE id_medicos = 2;

-- Modificar el número de habitación de un paciente con ID 3
UPDATE pacientes 
SET numero_habitacion = 'H205' 
WHERE id_pacientes = 3;

-- Modificar la fecha de una cita médica con ID 4
UPDATE citas_medicas 
SET fecha = '2025-04-10 12:00:00' 
WHERE id_citas_medicas = 4;

-- Modificar la medicación en el historial médico de un paciente con ID 5
UPDATE historial_medico 
SET medicacion = 'Antibiótico X' 
WHERE pacientes_id_pacientes = 5;




-- Eliminar un usuario con ID 1
DELETE FROM usuarios WHERE id_usuarios = 1;

-- Eliminar un médico con ID 2
DELETE FROM medicos WHERE id_medicos = 2;

-- Eliminar un paciente con ID 3
DELETE FROM pacientes WHERE id_pacientes = 3;



-- Primero eliminar registros dependientes en otras tablas
DELETE FROM tipo_de_usuario WHERE usuarios_id_usuarios = 1;
DELETE FROM administrativos WHERE usuarios_id_usuarios = 1;
DELETE FROM pacientes WHERE usuarios_id_usuarios = 1;
DELETE FROM medicos_has_pacientes WHERE usuarios_id_usuarios = 1;

-- Ahora eliminar el usuario
DELETE FROM usuarios WHERE id_usuarios = 1;


DELETE FROM Consulta_Tratamientos WHERE tratamiento_id = 1;
DELETE FROM Tratamientos WHERE id = 1;



-- Eliminar una cita médica con ID 4
DELETE FROM citas_medicas WHERE id_citas_medicas = 4;

-- Eliminar un historial médico de un paciente con ID 5
DELETE FROM historial_medico WHERE pacientes_id_pacientes = 5;
