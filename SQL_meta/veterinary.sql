CREATE DATABASE veterinary;
USE veterinary;

#Point -1
SELECT * FROM cliente;

#Point -2
SELECT * FROM medico 
WHERE medico.med_profesion = "Veterinario";

#Point -3
SELECT * FROM medicamentos
WHERE medicamentos.med_nombre LIKE "%m%";

#Point -4
SELECT * FROM medicamentos
WHERE medicamentos.med_valor BETWEEN 10 AND 15;

#Point -5
SELECT med_nombre AS nombre_medicamento FROM medicamentos
WHERE CHAR_LENGTH(medicamentos.med_nombre) BETWEEN 1 AND 10;

#Point -6
SELECT COUNT(*) AS numero_de_mascotas FROM mascotas;

#Point -7
SELECT distinct especializacion.esp_nombre FROM especializacion;

#Point -8
SELECT * FROM medicamentos
ORDER BY medicamentos.med_valor DESC;

#Point -9
SELECT * FROM citas 
WHERE citas.cit_fecha BETWEEN "2024-04-01" and "2024-04-30";

#Point -10 
SELECT mascotas.mas_nombre, cliente.cli_nombre FROM mascotas
INNER JOIN cliente ON mascotas.cliente_cli_id = cliente.cli_id;

SELECT mascotas.mas_nombre, cliente.cli_nombre
FROM mascotas,cliente WHERE mascotas.cliente_cli_id = cliente.cli_id;

#Point -11
SELECT * FROM mascotas
LEFT JOIN historias_clinicas 
ON  historias_clinicas.his_id = mascotas.historias_clinicas_his_id;

#Point -12
SELECT * FROM servicio;
SELECT especializacion.esp_nombre,SUM(servicio.ser_costo) AS precio_total FROM servicio
INNER JOIN especializacion 
ON especializacion.esp_id = servicio.especializacion_esp_id
GROUP BY servicio.especializacion_esp_id;

#Point -13
SELECT citas.cit_fecha, 
CASE 	
	WHEN citas.cit_estado = 0 THEN "Pendiente"
	WHEN citas.cit_estado = 1 THEN "Realizado"
END AS estado_cita
FROM citas;

#Point -14
SELECT citas.cit_fecha, 
mascotas.mas_nombre, 
servicio.ser_procedimiento,
medico.med_nombre
FROM citas
INNER JOIN mascotas ON mascotas.mas_id = citas.mascotas_mas_id
INNER JOIN servicio ON servicio.ser_id = citas.servicio_ser_id
INNER JOIN medico ON medico.med_id = citas.medico_med_id;

#Point -15
SELECT * FROM servicio;
SELECT especializacion.esp_nombre,AVG(servicio.ser_costo) AS promedio FROM servicio
INNER JOIN especializacion 
ON especializacion.esp_id = servicio.especializacion_esp_id
GROUP BY servicio.especializacion_esp_id
HAVING promedio > 100;

#Point -16
SELECT concat(cliente.cli_nombre," ,",cliente.cli_correo," ,",cliente.cli_telefono) AS informacion_cliente FROM cliente;

#Point -17
SELECT  mascotas.mas_nombre, max(historias_clinicas.his_fecha) AS reciente_historia_clinica  FROM mascotas
INNER JOIN historias_clinicas ON mascotas.mas_id = historias_clinicas.mascotas_mas_id
GROUP BY mascotas.mas_id;

#Point -18
SELECT * FROM medicamentos 
INNER JOIN historias_clinicas_has_medicamentos ON medicamentos.med_id = historias_clinicas_has_medicamentos.medicamentos_med_id;

#Point -19
SELECT citas.cit_fecha, 
mascotas.mas_nombre, 
servicio.ser_procedimiento,
sede.sed_nombre
FROM citas
INNER JOIN mascotas ON mascotas.mas_id = citas.mascotas_mas_id
INNER JOIN servicio ON servicio.ser_id = citas.servicio_ser_id
INNER JOIN sede ON sede.sed_id = citas.sede_sed_id
ORDER BY citas.cit_fecha DESC;

