-- --------------------------------------------------
-- INNER JOIN (Melihat daftar ID pelanggan, nama mereka, dan nama studio yang mereka pesan)
-- --------------------------------------------------
SELECT DISTINCT p.pelanggan_id, scr.film_name, st.nama AS nama_studio
FROM pelanggan p
INNER JOIN pemesanan pem ON p.pelanggan_id = pem.pelanggan_id
INNER JOIN reservasi res ON pem.pemesanan_id = res.pemesanan_id
INNER JOIN seats s ON s.seat_id = res.seat_id
INNER JOIN studio st ON st.studio_id = s.studio_id
INNER JOIN screenings scr ON scr.screening_id = pem.screening_id
WHERE st.nama = 'Imax A'
ORDER BY p.pelanggan_id;

-- --------------------------------------------------
-- LEFT JOIN 
-- --------------------------------------------------
SELECT p.pelanggan_id, COUNT(pem.pemesanan_id) AS total_pemesanan
FROM pelanggan p
LEFT JOIN pemesanan pem ON p.pelanggan_id = pem.pelanggan_id
GROUP BY p.pelanggan_id;