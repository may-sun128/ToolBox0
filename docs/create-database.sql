-- All of these commands were entered using the MariaDB/MySQL CLI

CREATE DATABASE tb0_test; 

CREATE USER 'mholmes'@'localhost' IDENTIFIED BY 'Redapple128@';

GRANT ALL PRIVILEGES ON tb0_test.* TO 'mholmes'@'localhost';

-- NOTE: the default directory the database is created in is
-- `/var/lib/mysql`
