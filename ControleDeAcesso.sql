#CREATE USER 'Lucas'@'200.200.190.190' IDENTIFIED BY '1234';
CREATE USER 'Barbara'@'localhost' IDENTIFIED BY '1234';
#pode se conectar ao banco a partir de qualquer enderço IP
#CREATE USER 'Lucas'@'%' IDENTIFIED BY '1234';

GRANT ALL ON BancoCurso.* TO 'Barbara'@'localhost';

CREATE USER 'Barbara'@'%' IDENTIFIED BY 'abc1234';
GRANT ALL ON BancoCurso.* TO 'Barbara'@'%';

#só pode realizar os comandos select
GRANT SELECT ON BancoCurso.* TO 'Barbara'@'%';
#só pode realizar os comando insert na tabela funcionarios
GRANT INSERT ON BancoCurso.funcionarios TO 'Barbara'@'%';

REVOKE INSERT ON BancoCurso.funcionarios FROM 'Barbara'@'%';
#REVOKE ALL ON BancoCurso.* FROM 'Barbara'@'%';
DROP USER 'Barbara'@'%';
DROP USER 'Barbara'@'localhost';

SELECT User FROM mysql.user;
SHOW GRANTS FOR 'Barbara'@'localhost';