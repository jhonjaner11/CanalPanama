CREATE TABLESPACE ADMCANAL DATAFILE 'D:\ADMCANAL.DBF' SIZE 5M AUTOEXTEND ON;
CREATE TEMPORARY TABLESPACE TMPCANAL TEMPFILE 'D:\TMPCANAL.DBF' SIZE 2M AUTOEXTEND ON;
CREATE USER CANAL IDENTIFIED BY canal DEFAULT TABLESPACE ADMCANAL TEMPORARY TABLESPACE TMPCANAL;
CREATE ROLE ADMINSEGURIDAD;
---CREATE USER ___ DEFAULT TABLESPACE DATAFILE TEMPORARY TABLESPACE TMPCANAL;
GRANT DBA TO ADMINSEGURIDAD;
GRANT ADMINSEGURIDAD TO CANAL;
CONN CANAL/canal;