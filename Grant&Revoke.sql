create database test_01;

use test_01;

create user 'Maprang'@'localhost' identified by '1234';

grant select, insert on customers to 'Maprang'@'localhost';

revoke select, insert on customers from 'Maprang'@'localhost';