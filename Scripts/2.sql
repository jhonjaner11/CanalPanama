/* ---------------------------------------------------- */
/*  Generated by Enterprise Architect Version 13.5 		*/
/*  Created On : 26-sept.-2018 8:10:16 p. m. 				*/
/*  DBMS       : Oracle 						*/
/* ---------------------------------------------------- */

/* Drop Tables */

begin
	EXECUTE IMMEDIATE 'DROP TABLE   Buque CASCADE CONSTRAINTS';
	EXCEPTION WHEN OTHERS THEN NULL;
end;  
/

begin
	EXECUTE IMMEDIATE 'DROP TABLE   Cancelacion CASCADE CONSTRAINTS';
	EXCEPTION WHEN OTHERS THEN NULL;
end;  
/

begin
	EXECUTE IMMEDIATE 'DROP TABLE   Carga CASCADE CONSTRAINTS';
	EXCEPTION WHEN OTHERS THEN NULL;
end;  
/

begin
	EXECUTE IMMEDIATE 'DROP TABLE   Clasificacion CASCADE CONSTRAINTS';
	EXCEPTION WHEN OTHERS THEN NULL;
end;  
/

begin
	EXECUTE IMMEDIATE 'DROP TABLE   Esclusa CASCADE CONSTRAINTS';
	EXCEPTION WHEN OTHERS THEN NULL;
end;  
/

begin
	EXECUTE IMMEDIATE 'DROP TABLE   Intercambio CASCADE CONSTRAINTS';
	EXCEPTION WHEN OTHERS THEN NULL;
end;  
/

begin
	EXECUTE IMMEDIATE 'DROP TABLE   Operador CASCADE CONSTRAINTS';
	EXCEPTION WHEN OTHERS THEN NULL;
end;  
/

begin
	EXECUTE IMMEDIATE 'DROP TABLE   Pais CASCADE CONSTRAINTS';
	EXCEPTION WHEN OTHERS THEN NULL;
end;  
/

begin
	EXECUTE IMMEDIATE 'DROP TABLE   Paso CASCADE CONSTRAINTS';
	EXCEPTION WHEN OTHERS THEN NULL;
end;  
/

begin
	EXECUTE IMMEDIATE 'DROP TABLE   Penalizacion CASCADE CONSTRAINTS';
	EXCEPTION WHEN OTHERS THEN NULL;
end;  
/

begin
	EXECUTE IMMEDIATE 'DROP TABLE   Periodo CASCADE CONSTRAINTS';
	EXCEPTION WHEN OTHERS THEN NULL;
end;  
/

begin
	EXECUTE IMMEDIATE 'DROP TABLE   Reserva CASCADE CONSTRAINTS';
	EXCEPTION WHEN OTHERS THEN NULL;
end;  
/

begin
	EXECUTE IMMEDIATE 'DROP TABLE   Tipo_Buque CASCADE CONSTRAINTS';
	EXCEPTION WHEN OTHERS THEN NULL;
end;  
/

begin
	EXECUTE IMMEDIATE 'DROP TABLE   Transito CASCADE CONSTRAINTS';
	EXCEPTION WHEN OTHERS THEN NULL;
end;  
/

begin
	EXECUTE IMMEDIATE 'DROP TABLE   Valor_Cancelacion CASCADE CONSTRAINTS';
	EXCEPTION WHEN OTHERS THEN NULL;
end;  
/

begin
	EXECUTE IMMEDIATE 'DROP TABLE   Valor_Intercambio CASCADE CONSTRAINTS';
	EXCEPTION WHEN OTHERS THEN NULL;
end;  
/

begin
	EXECUTE IMMEDIATE 'DROP TABLE   Valor_Reserva CASCADE CONSTRAINTS';
	EXCEPTION WHEN OTHERS THEN NULL;
end;  
/

/* Create Tables */

CREATE TABLE  Buque
(
	K_BUQUE NUMBER(8) NOT NULL,    -- Llave primaria del buque
	K_PAIS NUMBER(8) NOT NULL,    -- Llave foranea del pais al que est� asociado un buque
	K_OPERADOR NUMBER(8) NOT NULL,    -- Operador asociado
	K_CLASIFICACION NUMBER(8) NOT NULL,    -- Llave foranea a la clasificaci�n del buque
	K_TIPO_BUQUE NUMBER(8) NOT NULL,
	N_NOMBRE VARCHAR(50) NOT NULL,    -- Nombre del buque
	V_ESLORA NUMBER(6,2) NOT NULL,    -- Tama�o de la eslora(length (LOA)) en pies
	V_MANGA NUMBER(6,2) NOT NULL,    -- Tama�o de la manga (beam) en pies
	V_CALADO NUMBER(6,2) NOT NULL,    -- Tama�o del Calado en pies
	V_CAPACIDAD_MAXIMA_CARGA NUMBER(8,2) NOT NULL    -- Capacidad m�xima de carga en TEUs
)
;

CREATE TABLE  Cancelacion
(
	K_CANCELACION NUMBER(8) NOT NULL,    -- Llave primaria de la tabla Cancelacion
	K_RESERVA NUMBER(8) NOT NULL,    -- Llave foranea que me indica a que reserva est� asociada esa cancelacion
	K_VALOR_CANCELACION NUMBER(8) NOT NULL,    -- Llave foranea al valor de la cancelacion
	D_FECHA DATE NOT NULL,    -- Fecha en la que se hace la cancelacion
	V_VALOR NUMBER(8,2) NOT NULL    -- Valor de la cancelacion de una reserva de acuerdo a la carga especificada dependiendo de la fecha en la que se haga
)
;

CREATE TABLE  Carga
(
	K_CARGA NUMBER(8) NOT NULL,    -- Llave primaria de la carga
	N_TIPO VARCHAR(30) NOT NULL,    -- Tipo de carga para ese paso
	V_PESO NUMBER(8,2) NOT NULL    -- Peso de la carga en TEUs
)
;

CREATE TABLE  Clasificacion
(
	K_CLASIFICACION NUMBER(8) NOT NULL,    -- Llave primaria clasificacion buques
	N_TIPO VARCHAR(20) NOT NULL,    -- Tipo de buque (neopanamax, super, regular)
	V_ESLORA NUMBER(6,2) NULL,    -- Tama�o eslora (LOA) para ese tipo de buque
	V_MANGA NUMBER(6,2) NOT NULL    -- Tama�o manga (beam) para ese tipo de buque
)
;

CREATE TABLE  Esclusa
(
	K_ESCLUSA NUMBER(8) NOT NULL,    -- Llave primaria de la esclusa
	N_NOMBRE VARCHAR(50) NOT NULL,    -- Nombre de la esclusa
	V_ANCHO NUMBER(8,2) NOT NULL,    -- Ancho en pies
	V_LARGO NUMBER(8,2) NOT NULL,    -- Largo de la esclusa en pies
	V_PROFUNDIDAD NUMBER(8,2) NOT NULL,    -- Profundidad de la esclusa en pies
	I_DISPONIBILIDAD CHAR(1) NOT NULL    -- Disponibilidad (S)/(N)
)
;

CREATE TABLE  Intercambio
(
	K_INTERCAMBIO NUMBER(8) NOT NULL,    -- Llave primaria del intercambio
	D_FECHA DATE NOT NULL,    -- Fecha en la que se realiza
	K_RESERVA NUMBER(8) NOT NULL,    -- Reserva 1 a hacer el intercambio
	K_RESERVA2 NUMBER(8) NOT NULL,    -- Reserva 2 a hacer el intercambio
	K_VALOR_INTERCAMBIO NUMBER(8) NOT NULL    -- Llave foranea que referencia al valor para ese intercambio
)
;

CREATE TABLE  Operador
(
	K_OPERADOR NUMBER(8) NOT NULL,    -- Llave primaria del operador
	I_TIPO_IDENTIFICACION CHAR(2) NOT NULL,    -- Tipo de identificacion, de momento CC
	N_CC VARCHAR(10) NOT NULL,    -- numero de cedula
	N_NOMBRE1 VARCHAR(50) NOT NULL,    -- Primer nombre
	N_NOMBRE2 VARCHAR(50) NULL,    -- Segundo nombre (opcional)
	N_APELLIDO1 VARCHAR(50) NOT NULL,    -- Primer apellido
	N_APELLIDO2 VARCHAR(50) NULL    -- Segundo apellido (opcional)
)
;

CREATE TABLE  Pais
(
	K_PAIS NUMBER(8) NOT NULL,    -- Llave primaria del pa�s
	N_NOMBRE VARCHAR(50) NOT NULL    -- Nombre del pa�s
)
;

CREATE TABLE  Paso
(
	K_PASO NUMBER(8) NOT NULL,    -- Llave primaria del paso
	K_RESERVA NUMBER(8) NOT NULL,    -- Reserva asociada con la cual se realiza el paso
	K_CARGA NUMBER(8) NOT NULL,    -- Carga del buque asociada a ese paso
	D_FECHA DATE NOT NULL,    -- Fecha en la que se realiza el paso por el canal
	K_PENALIZACION NUMBER(8) NOT NULL    -- Llave foranea para aplicar penalizacion dependiendo la hora
)
;

CREATE TABLE  Penalizacion
(
	K_PENALIZACION NUMBER(8) NOT NULL,    -- Llave primaria de la Penalizacion
	Q_HORA_INI NUMBER(4) NOT NULL,    -- Rango inicial hora penalizaci�n
	Q_HORA_FIN NUMBER(4) NULL,    -- Rango final hora de penalizaci�n
	T_TASA_APLICADA NUMBER(2,2) NOT NULL    -- Tasa aplicada a la penalizacion
)
;

CREATE TABLE  Periodo
(
	K_PERIODO NUMBER(8) NOT NULL,    -- Llave primaria del periodo
	N_TIPO VARCHAR(50) NOT NULL,    -- tipo de periodo (Especial, Regular(1,2,3), Just in time)
	D_FECHA_INICIO DATE NOT NULL,    -- Fecha en la que inicia el periodo
	D_FECHA_FIN DATE NOT NULL,    -- Fecha en la que finaliza el periodo
	Q_CUPOS_NEOPANAMAX NUMBER(2) NOT NULL,    -- N�mero de cupos disponibles para buques clasificacion neopanamax en un periodo dado
	Q_CUPOS_SUPER NUMBER(2) NOT NULL,    -- N�mero de cupos disponibles para buques clasificacion super en un periodo dado
	Q_CUPOS_REGULAR NUMBER(2) NOT NULL    -- N�mero de cupos disponibles para buques clasificacion regular en un periodo dado
)
;

CREATE TABLE  Reserva
(
	K_RESERVA NUMBER(8) NOT NULL,    -- Llave primaria de la Reserva
	K_PERIODO NUMBER(8) NOT NULL,    -- Llave foranea para saber esa reserva a qu� periodo corresponde
	K_BUQUE NUMBER(8) NOT NULL,    -- Llave foranea del buque al cual est� asociada la reserva
	K_ESCLUSA NUMBER(8) NOT NULL,    -- Llave foranea asociada a la esclusa por donde pasar� el buque de la reserva
	K_VALOR_RESERVA NUMBER(8) NOT NULL,    -- Llave foranea asociada al valor de esa reserva
	K_TRANSITO NUMBER(8) NOT NULL,    -- Llave foranea al tipo de transito asociado a la reserva
	I_ESTADO_RESERVA CHAR(1) NOT NULL,    -- Estado de la reserva (C)ancelada, (P)endiente, (A)provada
	I_ESTADO_PAGO CHAR(1) NOT NULL,    -- Indica si la reserva esta (P)endiente por pagar o ya fue (C)ancelada en su totalidad
	I_DIRECCION_TRANSITO CHAR(1) NOT NULL,    -- Direccion de transito del buque (S)ur/(N)orte
	N_PUERTO_LLEGADA VARCHAR(50) NOT NULL,    -- Puerto por el cual cruza el buque
	D_FECHA_RESERVA DATE NOT NULL,    -- Fecha en la que se hizo esa reserva
	D_FECHA DATE NOT NULL    -- Fecha para la cual se har� la reserva
)
;

CREATE TABLE  Tipo_Buque
(
	K_TIPO_BUQUE NUMBER(8) NOT NULL,    -- Llave primaria tipo Buque
	N_NOMBRE VARCHAR(50) NOT NULL    -- El nombre que recibe ese tipo de buque (Ej: LOA, PORTACONTENEDOR)
)
;

CREATE TABLE  Transito
(
	K_TRANSITO NUMBER(8) NOT NULL,    -- Llave primaria
	K_CLASIFICACION NUMBER(8) NOT NULL,    -- Que clasificacion de buques aplica la restricci�n
	K_TIPO_BUQUE NUMBER(8) NULL,    -- Tipo de buque al que puede pertenecer esa restriccion
	N_TIPO VARCHAR(20) NOT NULL,    -- Tipo de transito (Diurno, Nocturno)
	I_RESTRINGIDO CHAR(1) NOT NULL,    -- Si el transito es restringido
	Q_HORA NUMBER(4) NULL    -- Indica si el transito es restringido, la hora
)
;

CREATE TABLE  Valor_Cancelacion
(
	K_VALOR_CANCELACION NUMBER(8) NOT NULL,    -- Llave primaria
	N_TIPOC VARCHAR(50) NOT NULL,    -- Tipo de cancelaci�n, diurna o de transito
	Q_DIAS_MIN NUMBER(3) NULL,    -- Dias minimos en el que aplican para ese valor de cancelacion
	Q_DIAS_MAX NUMBER(3) NULL,    -- Dias m�ximos en el que aplican para ese valor de cancelacion
	Q_HORAS_MIN NUMBER(4) NULL,    -- Horas minimas en el que aplican para ese valor de cancelacion
	Q_HORAS_MAX NUMBER(4) NULL,    -- Horas maximas en el que aplican para ese valor de cancelacion
	T_TASA_APLICADA NUMBER(2,2) NOT NULL    -- Tasa aplicada seg�n los d�as o horas de la cancelaci�n
)
;

CREATE TABLE  Valor_Intercambio
(
	K_VALOR_INTERCAMBIO NUMBER(8) NOT NULL,    -- Llave primaria valor intercambio
	V_NUMERO_INTERCAMBIOS NUMBER(1) NOT NULL,    -- Numero de intercambios para saber en cual intercambio va
	V_VALOR_NEOPANAMAX NUMBER(7,2) NOT NULL,    -- valor para buques clasificacion neopanamax del intercambio en el que va
	V_VALOR_REGULAR NUMBER(7,2) NOT NULL    -- valor para buques clasificacion regular del intercambio en el que va
)
;

CREATE TABLE  Valor_Reserva
(
	K_VALOR_RESERVA NUMBER(8) NOT NULL,
	V_TAMANIO_MANGA NUMBER(6,2) NOT NULL,    -- categoria segun el tama�o de la manga (beam) en pies
	V_TAMANIO_ESLORA NUMBER(6,2) NOT NULL,    -- categoria segun el tama�o de la eslora (LOA) en pies
	V_VALOR NUMBER(8,2) NOT NULL    -- Valor de la cuota a pagar por la reserva
)
;

/* Create Comments, Sequences and Triggers for Autonumber Columns */

COMMENT ON COLUMN  Buque.K_BUQUE IS 'Llave primaria del buque'
;

COMMENT ON COLUMN  Buque.K_PAIS IS 'Llave foranea del pais al que est� asociado un buque'
;

COMMENT ON COLUMN  Buque.K_OPERADOR IS 'Operador asociado'
;

COMMENT ON COLUMN  Buque.K_CLASIFICACION IS 'Llave foranea a la clasificaci�n del buque'
;

COMMENT ON COLUMN  Buque.N_NOMBRE IS 'Nombre del buque'
;

COMMENT ON COLUMN  Buque.V_ESLORA IS 'Tama�o de la eslora(length (LOA)) en pies'
;

COMMENT ON COLUMN  Buque.V_MANGA IS 'Tama�o de la manga (beam) en pies'
;

COMMENT ON COLUMN  Buque.V_CALADO IS 'Tama�o del Calado en pies'
;

COMMENT ON COLUMN  Buque.V_CAPACIDAD_MAXIMA_CARGA IS 'Capacidad m�xima de carga en TEUs'
;

COMMENT ON COLUMN  Cancelacion.K_CANCELACION IS 'Llave primaria de la tabla Cancelacion'
;

COMMENT ON COLUMN  Cancelacion.K_RESERVA IS 'Llave foranea que me indica a que reserva est� asociada esa cancelacion'
;

COMMENT ON COLUMN  Cancelacion.K_VALOR_CANCELACION IS 'Llave foranea al valor de la cancelacion'
;

COMMENT ON COLUMN  Cancelacion.D_FECHA IS 'Fecha en la que se hace la cancelacion'
;

COMMENT ON COLUMN  Cancelacion.V_VALOR IS 'Valor de la cancelacion de una reserva de acuerdo a la carga especificada dependiendo de la fecha en la que se haga'
;

COMMENT ON COLUMN  Carga.K_CARGA IS 'Llave primaria de la carga'
;

COMMENT ON COLUMN  Carga.N_TIPO IS 'Tipo de carga para ese paso'
;

COMMENT ON COLUMN  Carga.V_PESO IS 'Peso de la carga en TEUs'
;

COMMENT ON COLUMN  Clasificacion.K_CLASIFICACION IS 'Llave primaria clasificacion buques'
;

COMMENT ON COLUMN  Clasificacion.N_TIPO IS 'Tipo de buque (neopanamax, super, regular)'
;

COMMENT ON COLUMN  Clasificacion.V_ESLORA IS 'Tama�o eslora (LOA) para ese tipo de buque'
;

COMMENT ON COLUMN  Clasificacion.V_MANGA IS 'Tama�o manga (beam) para ese tipo de buque'
;

COMMENT ON COLUMN  Esclusa.K_ESCLUSA IS 'Llave primaria de la esclusa'
;

COMMENT ON COLUMN  Esclusa.N_NOMBRE IS 'Nombre de la esclusa'
;

COMMENT ON COLUMN  Esclusa.V_ANCHO IS 'Ancho en pies'
;

COMMENT ON COLUMN  Esclusa.V_LARGO IS 'Largo de la esclusa en pies'
;

COMMENT ON COLUMN  Esclusa.V_PROFUNDIDAD IS 'Profundidad de la esclusa en pies'
;

COMMENT ON COLUMN  Esclusa.I_DISPONIBILIDAD IS 'Disponibilidad (S)/(N)'
;

COMMENT ON COLUMN  Intercambio.K_INTERCAMBIO IS 'Llave primaria del intercambio'
;

COMMENT ON COLUMN  Intercambio.D_FECHA IS 'Fecha en la que se realiza'
;

COMMENT ON COLUMN  Intercambio.K_RESERVA IS 'Reserva 1 a hacer el intercambio'
;

COMMENT ON COLUMN  Intercambio.K_RESERVA2 IS 'Reserva 2 a hacer el intercambio'
;

COMMENT ON COLUMN  Intercambio.K_VALOR_INTERCAMBIO IS 'Llave foranea que referencia al valor para ese intercambio'
;

COMMENT ON COLUMN  Operador.K_OPERADOR IS 'Llave primaria del operador'
;

COMMENT ON COLUMN  Operador.I_TIPO_IDENTIFICACION IS 'Tipo de identificacion, de momento CC'
;

COMMENT ON COLUMN  Operador.N_CC IS 'numero de cedula'
;

COMMENT ON COLUMN  Operador.N_NOMBRE1 IS 'Primer nombre'
;

COMMENT ON COLUMN  Operador.N_NOMBRE2 IS 'Segundo nombre (opcional)'
;

COMMENT ON COLUMN  Operador.N_APELLIDO1 IS 'Primer apellido'
;

COMMENT ON COLUMN  Operador.N_APELLIDO2 IS 'Segundo apellido (opcional)'
;

COMMENT ON COLUMN  Pais.K_PAIS IS 'Llave primaria del pa�s'
;

COMMENT ON COLUMN  Pais.N_NOMBRE IS 'Nombre del pa�s'
;

COMMENT ON COLUMN  Paso.K_PASO IS 'Llave primaria del paso'
;

COMMENT ON COLUMN  Paso.K_RESERVA IS 'Reserva asociada con la cual se realiza el paso'
;

COMMENT ON COLUMN  Paso.K_CARGA IS 'Carga del buque asociada a ese paso'
;

COMMENT ON COLUMN  Paso.D_FECHA IS 'Fecha en la que se realiza el paso por el canal'
;

COMMENT ON COLUMN  Paso.K_PENALIZACION IS 'Llave foranea para aplicar penalizacion dependiendo la hora'
;

COMMENT ON COLUMN  Penalizacion.K_PENALIZACION IS 'Llave primaria de la Penalizacion'
;

COMMENT ON COLUMN  Penalizacion.Q_HORA_INI IS 'Rango inicial hora penalizaci�n'
;

COMMENT ON COLUMN  Penalizacion.Q_HORA_FIN IS 'Rango final hora de penalizaci�n'
;

COMMENT ON COLUMN  Penalizacion.T_TASA_APLICADA IS 'Tasa aplicada a la penalizacion'
;

COMMENT ON COLUMN  Periodo.K_PERIODO IS 'Llave primaria del periodo'
;

COMMENT ON COLUMN  Periodo.N_TIPO IS 'tipo de periodo (Especial, Regular(1,2,3), Just in time)'
;

COMMENT ON COLUMN  Periodo.D_FECHA_INICIO IS 'Fecha en la que inicia el periodo'
;

COMMENT ON COLUMN  Periodo.D_FECHA_FIN IS 'Fecha en la que finaliza el periodo'
;

COMMENT ON COLUMN  Periodo.Q_CUPOS_NEOPANAMAX IS 'N�mero de cupos disponibles para buques clasificacion neopanamax en un periodo dado'
;

COMMENT ON COLUMN  Periodo.Q_CUPOS_SUPER IS 'N�mero de cupos disponibles para buques clasificacion super en un periodo dado'
;

COMMENT ON COLUMN  Periodo.Q_CUPOS_REGULAR IS 'N�mero de cupos disponibles para buques clasificacion regular en un periodo dado'
;

COMMENT ON COLUMN  Reserva.K_RESERVA IS 'Llave primaria de la Reserva'
;

COMMENT ON COLUMN  Reserva.K_PERIODO IS 'Llave foranea para saber esa reserva a qu� periodo corresponde'
;

COMMENT ON COLUMN  Reserva.K_BUQUE IS 'Llave foranea del buque al cual est� asociada la reserva'
;

COMMENT ON COLUMN  Reserva.K_ESCLUSA IS 'Llave foranea asociada a la esclusa por donde pasar� el buque de la reserva'
;

COMMENT ON COLUMN  Reserva.K_VALOR_RESERVA IS 'Llave foranea asociada al valor de esa reserva'
;

COMMENT ON COLUMN  Reserva.K_TRANSITO IS 'Llave foranea al tipo de transito asociado a la reserva'
;

COMMENT ON COLUMN  Reserva.I_ESTADO_RESERVA IS 'Estado de la reserva (C)ancelada, (P)endiente, (A)provada'
;

COMMENT ON COLUMN  Reserva.I_ESTADO_PAGO IS 'Indica si la reserva esta (P)endiente por pagar o ya fue (C)ancelada en su totalidad'
;

COMMENT ON COLUMN  Reserva.I_DIRECCION_TRANSITO IS 'Direccion de transito del buque (S)ur/(N)orte'
;

COMMENT ON COLUMN  Reserva.N_PUERTO_LLEGADA IS 'Puerto por el cual cruza el buque'
;

COMMENT ON COLUMN  Reserva.D_FECHA_RESERVA IS 'Fecha en la que se hizo esa reserva'
;

COMMENT ON COLUMN  Reserva.D_FECHA IS 'Fecha para la cual se har� la reserva'
;

COMMENT ON COLUMN  Tipo_Buque.K_TIPO_BUQUE IS 'Llave primaria tipo Buque'
;

COMMENT ON COLUMN  Tipo_Buque.N_NOMBRE IS 'El nombre que recibe ese tipo de buque (Ej: LOA, PORTACONTENEDOR)'
;

COMMENT ON COLUMN  Transito.K_TRANSITO IS 'Llave primaria'
;

COMMENT ON COLUMN  Transito.K_CLASIFICACION IS 'Que clasificacion de buques aplica la restricci�n'
;

COMMENT ON COLUMN  Transito.K_TIPO_BUQUE IS 'Tipo de buque al que puede pertenecer esa restriccion'
;

COMMENT ON COLUMN  Transito.N_TIPO IS 'Tipo de transito (Diurno, Nocturno)'
;

COMMENT ON COLUMN  Transito.I_RESTRINGIDO IS 'Si el transito es restringido'
;

COMMENT ON COLUMN  Transito.Q_HORA IS 'Indica si el transito es restringido, la hora'
;

COMMENT ON COLUMN  Valor_Cancelacion.K_VALOR_CANCELACION IS 'Llave primaria'
;

COMMENT ON COLUMN  Valor_Cancelacion.N_TIPOC IS 'Tipo de cancelaci�n, diurna o de transito'
;

COMMENT ON COLUMN  Valor_Cancelacion.Q_DIAS_MIN IS 'Dias minimos en el que aplican para ese valor de cancelacion'
;

COMMENT ON COLUMN  Valor_Cancelacion.Q_DIAS_MAX IS 'Dias m�ximos en el que aplican para ese valor de cancelacion'
;

COMMENT ON COLUMN  Valor_Cancelacion.Q_HORAS_MIN IS 'Horas minimas en el que aplican para ese valor de cancelacion'
;

COMMENT ON COLUMN  Valor_Cancelacion.Q_HORAS_MAX IS 'Horas maximas en el que aplican para ese valor de cancelacion'
;

COMMENT ON COLUMN  Valor_Cancelacion.T_TASA_APLICADA IS 'Tasa aplicada seg�n los d�as o horas de la cancelaci�n'
;

COMMENT ON COLUMN  Valor_Intercambio.K_VALOR_INTERCAMBIO IS 'Llave primaria valor intercambio'
;

COMMENT ON COLUMN  Valor_Intercambio.V_NUMERO_INTERCAMBIOS IS 'Numero de intercambios para saber en cual intercambio va'
;

COMMENT ON COLUMN  Valor_Intercambio.V_VALOR_NEOPANAMAX IS 'valor para buques clasificacion neopanamax del intercambio en el que va'
;

COMMENT ON COLUMN  Valor_Intercambio.V_VALOR_REGULAR IS 'valor para buques clasificacion regular del intercambio en el que va'
;

COMMENT ON COLUMN  Valor_Reserva.V_TAMANIO_MANGA IS 'categoria segun el tama�o de la manga (beam) en pies'
;

COMMENT ON COLUMN  Valor_Reserva.V_TAMANIO_ESLORA IS 'categoria segun el tama�o de la eslora (LOA) en pies'
;

COMMENT ON COLUMN  Valor_Reserva.V_VALOR IS 'Valor de la cuota a pagar por la reserva'
;

/* Create Primary Keys, Indexes, Uniques, Checks, Triggers */

ALTER TABLE  Buque 
 ADD CONSTRAINT PK_Buque
	PRIMARY KEY (K_BUQUE) 
 USING INDEX
;

ALTER TABLE  Buque 
 ADD CONSTRAINT CK_V_ESLORA CHECK (V_ESLORA > 0)
;

ALTER TABLE  Buque 
 ADD CONSTRAINT CK_V_MANGA CHECK (V_MANGA > 0)
;

ALTER TABLE  Buque 
 ADD CONSTRAINT CK_CALADO CHECK (V_CALADO > 0)
;

ALTER TABLE  Buque 
 ADD CONSTRAINT CK_V_CAPACIDAD_MAXIMA CHECK (V_CAPACIDAD_MAXIMA_CARGA > 0)
;

ALTER TABLE  Cancelacion 
 ADD CONSTRAINT PK_Cancelacion
	PRIMARY KEY (K_CANCELACION) 
 USING INDEX
;

ALTER TABLE  Cancelacion 
 ADD CONSTRAINT CK_V_VALORC CHECK (V_VALOR >= 0)
;

ALTER TABLE  Carga 
 ADD CONSTRAINT PK_Carga
	PRIMARY KEY (K_CARGA) 
 USING INDEX
;

ALTER TABLE  Carga 
 ADD CONSTRAINT CK_V_PESO CHECK (V_PESO >= 0)
;

ALTER TABLE  Clasificacion 
 ADD CONSTRAINT PK_Clasificacio_01
	PRIMARY KEY (K_CLASIFICACION) 
 USING INDEX
;

ALTER TABLE  Clasificacion 
 ADD CONSTRAINT CK_NTIPO CHECK (N_TIPO IN('NEOPANAMAX','SUPER','REGULAR'))
;

ALTER TABLE  Clasificacion 
 ADD CONSTRAINT CK_V_ESLORAC CHECK (V_ESLORA > 0)
;

ALTER TABLE  Clasificacion 
 ADD CONSTRAINT CK_V_MANGAC CHECK (V_MANGA > 0)
;

ALTER TABLE  Esclusa 
 ADD CONSTRAINT PK_Exclusa
	PRIMARY KEY (K_ESCLUSA) 
 USING INDEX
;

ALTER TABLE  Esclusa 
 ADD CONSTRAINT CK_V_ANCHO CHECK (V_ANCHO > 0)
;

ALTER TABLE  Esclusa 
 ADD CONSTRAINT CK_IDISPONIBILIDAD CHECK (I_DISPONIBILIDAD IN ('S','N'))
;

ALTER TABLE  Esclusa 
 ADD CONSTRAINT CK_V_LARGO CHECK (V_LARGO > 0)
;

ALTER TABLE  Esclusa 
 ADD CONSTRAINT CK_V_PROFUNDIDAD CHECK (V_PROFUNDIDAD > 0)
;

ALTER TABLE  Intercambio 
 ADD CONSTRAINT PK_Intercambio
	PRIMARY KEY (K_INTERCAMBIO) 
 USING INDEX
;

ALTER TABLE  Operador 
 ADD CONSTRAINT PK_Operador
	PRIMARY KEY (K_OPERADOR) 
 USING INDEX
;

ALTER TABLE  Operador 
 ADD CONSTRAINT CK_ITIPO_IDENTIFICACION CHECK (I_TIPO_IDENTIFICACION IN ('CC'))
;

ALTER TABLE  Pais 
 ADD CONSTRAINT PK_Pais
	PRIMARY KEY (K_PAIS) 
 USING INDEX
;

ALTER TABLE  Paso 
 ADD CONSTRAINT PK_Paso
	PRIMARY KEY (K_PASO) 
 USING INDEX
;

ALTER TABLE  Penalizacion 
 ADD CONSTRAINT PK_Penalizacion
	PRIMARY KEY (K_PENALIZACION) 
 USING INDEX
;

ALTER TABLE  Penalizacion 
 ADD CONSTRAINT CK_QHORA_INI CHECK (Q_HORA_INI >= 0)
;

ALTER TABLE  Penalizacion 
 ADD CONSTRAINT CK_QHORA_FIN CHECK (Q_HORA_FIN >= 0)
;

ALTER TABLE  Penalizacion 
 ADD CONSTRAINT CK_TASA_APLICADA CHECK (T_TASA_APLICADA IN(0,0.25,0.5,0.75,1))
;

ALTER TABLE  Periodo 
 ADD CONSTRAINT PK_Periodo
	PRIMARY KEY (K_PERIODO) 
 USING INDEX
;

ALTER TABLE  Periodo 
 ADD CONSTRAINT CK_NTIPOP CHECK (N_TIPO IN ('ESPECIAL','PERIODO 1','PERIODO 2','PERIODO 3','JUST IN TIME'))
;

ALTER TABLE  Periodo 
 ADD CONSTRAINT CK_QCUPOS_NEOPANAMAX CHECK (Q_CUPOS_NEOPANAMAX >= 0)
;

ALTER TABLE  Periodo 
 ADD CONSTRAINT CK_QCUPOS_SUPER CHECK (Q_CUPOS_SUPER >= 0)
;

ALTER TABLE  Periodo 
 ADD CONSTRAINT CK_QCUPOS_REGULAR CHECK (Q_CUPOS_REGULAR >= 0)
;

ALTER TABLE  Reserva 
 ADD CONSTRAINT PK_Reserva
	PRIMARY KEY (K_RESERVA) 
 USING INDEX
;

ALTER TABLE  Reserva 
 ADD CONSTRAINT CK_IESTADO CHECK (I_ESTADO_RESERVA IN ('C','P','A'))
;

ALTER TABLE  Reserva 
 ADD CONSTRAINT CK_IDIRECCION_TRANSITO CHECK (I_DIRECCION_TRANSITO IN ('S','N'))
;

ALTER TABLE  Reserva 
 ADD CONSTRAINT CK_IESTADO_PAGO CHECK (I_ESTADO_PAGO IN ('C','P'))
;

ALTER TABLE  Tipo_Buque 
 ADD CONSTRAINT PK_Tipo_Buque
	PRIMARY KEY (K_TIPO_BUQUE) 
 USING INDEX
;

ALTER TABLE  Tipo_Buque 
 ADD CONSTRAINT CK_N_NOMBRE CHECK (N_NOMBRE IN ('PORTACONTENEDOR','GLP','GNL','GRANELERO','PORTAVEHICULO','TANQUERO/PETROLERO','PASAJEROS','MILITAR','CARGUERO'))
;

ALTER TABLE  Transito 
 ADD CONSTRAINT PK_Tipo_Transito
	PRIMARY KEY (K_TRANSITO) 
 USING INDEX
;

ALTER TABLE  Transito 
 ADD CONSTRAINT CK_NTIPOT CHECK (N_TIPO IN('DIURNO','NOCTURNO'))
;

ALTER TABLE  Transito 
 ADD CONSTRAINT CK_IRESTRINGIDO CHECK (I_RESTRINGIDO IN('S','N'))
;

ALTER TABLE  Transito 
 ADD CONSTRAINT CK_QHORA CHECK (Q_HORA >= 0)
;

ALTER TABLE  Valor_Cancelacion 
 ADD CONSTRAINT PK_Valor_Cancel_01
	PRIMARY KEY (K_VALOR_CANCELACION) 
 USING INDEX
;

ALTER TABLE  Valor_Cancelacion 
 ADD CONSTRAINT CK_NTIPOC CHECK (N_TIPOC IN('TRANSITO DIURNO','RESERVA'))
;

ALTER TABLE  Valor_Cancelacion 
 ADD CONSTRAINT CK_TASA_APLICADAC CHECK (T_TASA_APLICADA IN(0,0.1,0.2,0.4,0.5,0.6,0.7,0.8,1))
;

ALTER TABLE  Valor_Intercambio 
 ADD CONSTRAINT PK_Valor_Interc_01
	PRIMARY KEY (K_VALOR_INTERCAMBIO) 
 USING INDEX
;

ALTER TABLE  Valor_Intercambio 
 ADD CONSTRAINT CK_NUMERO_INTERCAMBIOS CHECK (V_NUMERO_INTERCAMBIOS IN(1,2,3,4,5))
;

ALTER TABLE  Valor_Intercambio 
 ADD CONSTRAINT CK_VALOR_NEOPANAMAX CHECK (V_VALOR_NEOPANAMAX >= 0)
;

ALTER TABLE  Valor_Intercambio 
 ADD CONSTRAINT CK_VALOR_REGULAR CHECK (V_VALOR_REGULAR >= 0)
;

ALTER TABLE  Valor_Reserva 
 ADD CONSTRAINT PK_Valor_Reserv_01
	PRIMARY KEY (K_VALOR_RESERVA) 
 USING INDEX
;

ALTER TABLE  Valor_Reserva 
 ADD CONSTRAINT CK_V_TAMANIO_MANGA CHECK (V_TAMANIO_MANGA >= 0)
;

ALTER TABLE  Valor_Reserva 
 ADD CONSTRAINT CK_V_TAMANIO_ESLORA CHECK (V_TAMANIO_ESLORA > 0)
;

ALTER TABLE  Valor_Reserva 
 ADD CONSTRAINT CK_V_VALOR CHECK (V_VALOR > 0)
;

/* Create Foreign Key Constraints */

ALTER TABLE  Buque 
 ADD CONSTRAINT FK_Buque_Clasificacion
	FOREIGN KEY (K_CLASIFICACION) REFERENCES  Clasificacion (K_CLASIFICACION)
;

ALTER TABLE  Buque 
 ADD CONSTRAINT FK_Buque_Operador
	FOREIGN KEY (K_OPERADOR) REFERENCES  Operador (K_OPERADOR)
;

ALTER TABLE  Buque 
 ADD CONSTRAINT FK_Buque_Pais
	FOREIGN KEY (K_PAIS) REFERENCES  Pais (K_PAIS)
;

ALTER TABLE  Buque 
 ADD CONSTRAINT FK_Buque_Tipo_Buque
	FOREIGN KEY (K_TIPO_BUQUE) REFERENCES  Tipo_Buque (K_TIPO_BUQUE)
;

ALTER TABLE  Cancelacion 
 ADD CONSTRAINT FK_Cancelacion_Reserva
	FOREIGN KEY (K_RESERVA) REFERENCES  Reserva (K_RESERVA)
;

ALTER TABLE  Cancelacion 
 ADD CONSTRAINT FK_Cancelacion_Valor_Cancel_01
	FOREIGN KEY (K_VALOR_CANCELACION) REFERENCES  Valor_Cancelacion (K_VALOR_CANCELACION)
;

ALTER TABLE  Intercambio 
 ADD CONSTRAINT FK_Intercambio_Reserva
	FOREIGN KEY (K_RESERVA) REFERENCES  Reserva (K_RESERVA)
;

ALTER TABLE  Intercambio 
 ADD CONSTRAINT FK_Intercambio_Reserva02
	FOREIGN KEY (K_RESERVA2) REFERENCES  Reserva (K_RESERVA)
;

ALTER TABLE  Intercambio 
 ADD CONSTRAINT FK_Intercambio_Valor_Interc_01
	FOREIGN KEY (K_VALOR_INTERCAMBIO) REFERENCES  Valor_Intercambio (K_VALOR_INTERCAMBIO)
;

ALTER TABLE  Paso 
 ADD CONSTRAINT FK_Paso_Carga
	FOREIGN KEY (K_CARGA) REFERENCES  Carga (K_CARGA)
;

ALTER TABLE  Paso 
 ADD CONSTRAINT FK_Paso_Penalizacion
	FOREIGN KEY (K_PENALIZACION) REFERENCES  Penalizacion (K_PENALIZACION)
;

ALTER TABLE  Paso 
 ADD CONSTRAINT FK_Paso_Reserva
	FOREIGN KEY (K_RESERVA) REFERENCES  Reserva (K_RESERVA)
;

ALTER TABLE  Reserva 
 ADD CONSTRAINT FK_Reserva_Esclusa
	FOREIGN KEY (K_ESCLUSA) REFERENCES  Esclusa (K_ESCLUSA)
;

ALTER TABLE  Reserva 
 ADD CONSTRAINT FK_Reserva_Buque
	FOREIGN KEY (K_BUQUE) REFERENCES  Buque (K_BUQUE)
;

ALTER TABLE  Reserva 
 ADD CONSTRAINT FK_Reserva_Periodo
	FOREIGN KEY (K_PERIODO) REFERENCES  Periodo (K_PERIODO)
;

ALTER TABLE  Reserva 
 ADD CONSTRAINT FK_Reserva_Transito
	FOREIGN KEY (K_TRANSITO) REFERENCES  Transito (K_TRANSITO)
;

ALTER TABLE  Reserva 
 ADD CONSTRAINT FK_Reserva_Valor_Reserva
	FOREIGN KEY (K_VALOR_RESERVA) REFERENCES  Valor_Reserva (K_VALOR_RESERVA)
;

ALTER TABLE  Transito 
 ADD CONSTRAINT FK_Transito_Clasificacion
	FOREIGN KEY (K_CLASIFICACION) REFERENCES  Clasificacion (K_CLASIFICACION)
;

ALTER TABLE  Transito 
 ADD CONSTRAINT FK_Transito_Tipo_Buque
	FOREIGN KEY (K_TIPO_BUQUE) REFERENCES  Tipo_Buque (K_TIPO_BUQUE)
;
