-- --------------------------------------------------
-- membuat akun manager dan privilage nya
-- --------------------------------------------------
CREATE USER 'manager_bioskop'@'localhost' IDENTIFIED BY 'managerHebat';
GRANT ALL PRIVILEGES ON cinema_ticketing.* TO 'manager_bioskop'@'localhost';
FLUSH PRIVILEGES;

-- cek grants aktif atau gak
SHOW GRANTS FOR 'manager_bioskop'@'localhost';