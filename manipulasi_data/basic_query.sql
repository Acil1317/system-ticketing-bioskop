-- --------------------------------------------------
-- INSERT, UPDATE, DELETE
-- --------------------------------------------------
INSERT INTO pelanggan (pelanggan_id, nama_depan, nama_belakang, gender, email, no_telp, alamat_id) VALUES
('C051', 'Bihlal', 'Subianto', 'L', 'minyak.sawit@email.com', '085267677676', 'A009');
SELECT * FROM cinema_ticketing.pelanggan;

UPDATE reservasi 
SET seat_id = 'S005' 
WHERE reservasi_id = 'RES001';
SELECT * FROM cinema_ticketing.reservasi;

DELETE from pelanggan
WHERE pelanggan_id = "C051";
SELECT * FROM cinema_ticketing.pelanggan; 

-- --------------------------------------------------
-- Seletcing data queries
-- --------------------------------------------------
SELECT film_id, CONCAT(judul, " (", genre, ")") AS film_info 
FROM films
WHERE judul LIKE '%a%'
AND genre IN ('Aksi', 'Komedi', 'Petualangan','Fantasi')
OR durasi_menit BETWEEN 90 AND 150
ORDER BY film_id DESC
LIMIT 8;
