-- --------------------------------------------------
-- membuat akun kasir dan privilage nya
-- --------------------------------------------------
CREATE USER 'kasir_bioskop'@'localhost' IDENTIFIED BY 'kasirHebat';

GRANT SELECT, INSERT ON cinema_ticketing.pemesanan TO 'kasir_bioskop'@'localhost';
GRANT SELECT, INSERT ON cinema_ticketing.reservasi TO 'kasir_bioskop'@'localhost';
GRANT SELECT ON cinema_ticketing.screenings TO 'kasir_bioskop'@'localhost';
GRANT SELECT ON cinema_ticketing.seats TO 'kasir_bioskop'@'localhost';

FLUSH PRIVILEGES;

-- cek grants aktif atau gak
SHOW GRANTS FOR 'kasir_bioskop'@'localhost';
