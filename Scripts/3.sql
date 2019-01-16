CREATE PUBLIC SYNONYM RESERVA FOR CANAL.RESERVA;
CREATE PUBLIC SYNONYM VALOR_RESERVA FOR CANAL.VALOR_RESERVA;
CREATE PUBLIC SYNONYM PERIODO FOR CANAL.PERIODO;
CREATE PUBLIC SYNONYM ESCLUSA FOR CANAL.ESCLUSA;
CREATE PUBLIC SYNONYM TRANSITO FOR CANAL.TRANSITO;
CREATE PUBLIC SYNONYM PASO FOR CANAL.PASO;
CREATE PUBLIC SYNONYM PENALIZACION FOR CANAL.PENALIZACION;
CREATE PUBLIC SYNONYM INTERCAMBIO FOR CANAL.INTERCAMBIO;
CREATE PUBLIC SYNONYM CANCELACION FOR CANAL.CANCELACION;
CREATE PUBLIC SYNONYM BUQUE FOR CANAL.BUQUE;
CREATE PUBLIC SYNONYM CARGA FOR CANAL.CARGA;
CREATE PUBLIC SYNONYM CLASIFICACION FOR CANAL.CLASIFICACION;
CREATE PUBLIC SYNONYM VALOR_INTERCAMBIO FOR CANAL.VALOR_INTERCAMBIO;
CREATE PUBLIC SYNONYM VALOR_CANCELACION FOR CANAL.VALOR_CANCELACION;
CREATE PUBLIC SYNONYM PAIS FOR CANAL.PAIS;
CREATE PUBLIC SYNONYM OPERADOR FOR CANAL.OPERADOR;
CREATE ROLE ADMINISTRADOR;
---CREATE USER ___ DEFAULT TABLESPACE ADMCANAL TEMPORARY TABLESPACE TMPCANAL QUOTA 2M ON ADMCANAL;
GRANT CONNECT,RESOURCE,CREATE USER TO ADMINISTRADOR;
GRANT SELECT ON RESERVA TO ADMINISTRADOR;
GRANT SELECT,UPDATE,INSERT,DELETE ON VALOR_RESERVA TO ADMINISTRADOR;
GRANT SELECT,UPDATE,INSERT,DELETE ON PERIODO TO ADMINISTRADOR;
GRANT SELECT,UPDATE,INSERT,DELETE ON ESCLUSA TO ADMINISTRADOR;
GRANT SELECT,UPDATE,INSERT,DELETE ON TRANSITO TO ADMINISTRADOR;
GRANT SELECT,UPDATE,INSERT,DELETE ON PASO TO ADMINISTRADOR;
GRANT SELECT,UPDATE,INSERT,DELETE ON PENALIZACION TO ADMINISTRADOR;
GRANT SELECT ON INTERCAMBIO TO ADMINISTRADOR;
GRANT SELECT ON CANCELACION TO ADMINISTRADOR;
GRANT SELECT ON BUQUE TO ADMINISTRADOR;
GRANT SELECT,UPDATE,INSERT,DELETE ON CARGA TO ADMINISTRADOR;
GRANT SELECT,UPDATE,INSERT,DELETE ON CLASIFICACION TO ADMINISTRADOR;
GRANT SELECT,UPDATE,INSERT,DELETE ON VALOR_INTERCAMBIO TO ADMINISTRADOR;
GRANT SELECT,UPDATE,INSERT,DELETE ON VALOR_CANCELACION TO ADMINISTRADOR;
GRANT SELECT,UPDATE,INSERT,DELETE ON PAIS TO ADMINISTRADOR;
GRANT SELECT ON OPERADOR TO ADMINISTRADOR;
CREATE USER ADMIN01 IDENTIFIED BY adm01 DEFAULT TABLESPACE ADMCANAL TEMPORARY TABLESPACE TMPCANAL QUOTA 2M ON ADMCANAL;
GRANT ADMINISTRADOR TO ADMIN01;
CREATE ROLE ADMBUQUE;
---CREATE USER ___ DEFAULT TABLESPACE ADMCANAL TEMPORARY TABLESPACE TMPCANAL QUOTA 2M ON ADMCANAL;
GRANT CONNECT TO ADMBUQUE;
GRANT SELECT,UPDATE,INSERT,DELETE ON BUQUE TO ADMBUQUE;
GRANT SELECT,UPDATE,INSERT,DELETE ON RESERVA TO ADMBUQUE;
GRANT SELECT ON VALOR_RESERVA TO ADMBUQUE;
GRANT SELECT ON PERIODO TO ADMBUQUE;
GRANT SELECT ON TRANSITO TO ADMBUQUE;
GRANT SELECT ON PASO TO ADMBUQUE;
GRANT SELECT ON PENALIZACION TO ADMBUQUE;
GRANT SELECT,INSERT,DELETE ON INTERCAMBIO TO ADMBUQUE;
GRANT SELECT,INSERT,DELETE ON CANCELACION TO ADMBUQUE;
GRANT SELECT,UPDATE,INSERT,DELETE ON BUQUE TO ADMBUQUE;
GRANT SELECT ON CARGA TO ADMBUQUE;
GRANT SELECT ON CLASIFICACION TO ADMBUQUE;
GRANT SELECT ON VALOR_INTERCAMBIO TO ADMBUQUE;
GRANT SELECT ON VALOR_CANCELACION TO ADMBUQUE;
GRANT SELECT,UPDATE,INSERT,DELETE ON OPERADOR TO ADMBUQUE;
CREATE USER ADMBUQUE01 IDENTIFIED BY admbuque01 DEFAULT TABLESPACE ADMCANAL TEMPORARY TABLESPACE TMPCANAL QUOTA 2M ON ADMCANAL;
GRANT ADMBUQUE TO ADMBUQUE01;
CREATE ROLE USUARIOF;
---CREATE USER ___ DEFAULT TABLESPACE ADMCANAL TEMPORARY TABLESPACE TMPCANAL QUOTA 2M ON ADMCANAL;
GRANT CONNECT TO USUARIOF;
GRANT SELECT ON RESERVA TO USUARIOF;
GRANT SELECT ON BUQUE TO USUARIOF;
CREATE USER USERF01 IDENTIFIED BY userf01 DEFAULT TABLESPACE ADMCANAL TEMPORARY TABLESPACE TMPCANAL QUOTA 2M ON ADMCANAL;
GRANT USUARIOF TO USERF01;