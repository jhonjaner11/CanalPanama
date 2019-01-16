--Comandos Funcionales:


#Lista todos los usuarios
select username from DBA_USERS;


select username, granted_role  from user_role_privs;

#Lista todas las tablas
select table_name from user_tables order by table_name;



#Aprovecho para recordar algunas sentencias útiles para consultar los roles 
#y privilegios generales del usuario que tiene abierta la sesión:

#este mira los grantROLE que tiene la sesion
select * from user_role_privs;
select * from user_sys_privs;

#listar todas las tablas
select table_name from user_tables order by table_name;


