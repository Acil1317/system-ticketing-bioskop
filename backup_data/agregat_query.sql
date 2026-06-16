-- --------------------------------------------------
-- COUNT (Menghitung berapa banyak sesi tayang (screening) untuk film tertentu)
-- --------------------------------------------------
SELECT COUNT(*) AS total_tayang 
FROM screenings 
WHERE film_id = 'F014';

-- --------------------------------------------------
-- SUM (Menghitung total kapasitas semua studio yang ada di bioskop)
-- --------------------------------------------------
SELECT SUM(capacity) AS total_seluruh_kursi 
FROM studio;

-- --------------------------------------------------
-- MIN, MAX & AVERAGE (Melihat harga tiket tertinggi, terendah, dan rata-rata pendapatan dari tiket yang terjual)
-- --------------------------------------------------
SQL
SELECT 
    MAX(harga_tiket) AS tiket_termahal, 
    MIN(harga_tiket) AS tiket_termurah, 
    AVG(harga_tiket) AS rata_rata_harga
FROM pemesanan;

-- --------------------------------------------------
-- GROUP BY dengan ROLLUP (Melihat jumlah kursi yang direservasi oleh setiap pemesanan, lengkap dengan total keseluruhan di baris paling bawah)
-- --------------------------------------------------
SELECT pemesanan_id, COUNT(seat_id) AS jumlah_kursi_dipesan
FROM reservasi
GROUP BY pemesanan_id WITH ROLLUP;

-- --------------------------------------------------
-- HAVING (Menampilkan daftar film beserta jumlah tayangnya, tetapi hanya untuk film yang tayang lebih dari 3 kali)
-- --------------------------------------------------
SELECT f.judul AS film_name, COUNT(s.screening_id) AS jumlah_tayang
FROM screenings s
JOIN films f ON s.film_id = f.film_id
GROUP BY f.judul, s.film_id
HAVING COUNT(s.screening_id) > 3;

-- --------------------------------------------------
-- -- SUBQUERY: Mengambil total tayang film 'Avatar' berdasarkan film_id
-- --------------------------------------------------
SELECT COUNT(*) AS total_tayang
FROM screenings
WHERE film_id = (
    SELECT film_id 
    FROM films 
    WHERE judul = '%Avatar%' 
    LIMIT 1
);