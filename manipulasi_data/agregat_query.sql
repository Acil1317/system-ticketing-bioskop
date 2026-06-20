-- --------------------------------------------------
-- COUNT (Menghitung berapa banyak sesi tayang (screening) untuk film tertentu)
-- --------------------------------------------------
SELECT 
    film_id, 
    COUNT(*) AS total_tayang 
FROM screenings 
WHERE film_id = 'F014'
GROUP BY film_id;

-- --------------------------------------------------
-- SUM (Menghitung total kapasitas kursi yang dikelompokkan per studio)
-- --------------------------------------------------
SELECT 
    nama,
    SUM(capacity) AS total_kursi_studio 
FROM studio
GROUP BY studio_id;

-- --------------------------------------------------
-- MIN, MAX & AVERAGE (Melihat statistik pengeluaran tiket per pelanggan)
-- --------------------------------------------------
SELECT 
    pelanggan_id, 
    MAX(harga_tiket) AS tiket_termahal_dibeli, 
    MIN(harga_tiket) AS tiket_termurah_dibeli, 
    AVG(harga_tiket) AS rata_rata_pengeluaran_tiket
FROM pemesanan
GROUP BY pelanggan_id;

-- --------------------------------------------------
-- GROUP BY dengan ROLLUP + COALESCE (Tampilan Total Lebih Rapi)
-- --------------------------------------------------
SELECT 
    COALESCE(pemesanan_id, ' TOTAL KESELURUHAN ') AS pemesanan_id, 
    COUNT(seat_id) AS jumlah_kursi_dipesan
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
-- -- SUBQUERY: Mengambil total tayang film berdasarkan film_id
-- --------------------------------------------------
SELECT 
    (SELECT judul FROM films WHERE film_id = "F016" LIMIT 1) AS judul_film,
    COUNT(*) AS total_tayang 
FROM screenings 
WHERE film_id = (
    SELECT film_id 
    FROM films 
    WHERE film_id = "F016" 
    LIMIT 1
);
