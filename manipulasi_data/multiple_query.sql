-- --------------------------------------------------
-- INNER JOIN Analitik (Menampilkan Total Tiket per Pelanggan dengan Nama Lengkap & Judul Film)
-- --------------------------------------------------
SELECT 
    p.pelanggan_id, 
    CONCAT_WS(' ', p.nama_depan, p.nama_belakang) AS nama_lengkap, 
    f.judul AS judul_film, 
    st.nama AS nama_studio,
    COUNT(res.seat_id) AS total_tiket_dipesan
FROM pelanggan p
INNER JOIN pemesanan pem ON p.pelanggan_id = pem.pelanggan_id
INNER JOIN reservasi res ON pem.pemesanan_id = res.pemesanan_id
INNER JOIN seats s ON s.seat_id = res.seat_id
INNER JOIN studio st ON st.studio_id = s.studio_id
INNER JOIN screenings scr ON scr.screening_id = pem.screening_id
INNER JOIN films f ON scr.film_id = f.film_id
WHERE st.nama = 'Regular B'
GROUP BY 
    p.pelanggan_id, 
    p.nama_depan,     -- Masuk GROUP BY karena bagian dari nama_lengkap
    p.nama_belakang,  -- Masuk GROUP BY karena bagian dari nama_lengkap
    f.judul, 
    st.nama
ORDER BY total_tiket_dipesan DESC;

-- --------------------------------------------------
-- LEFT JOIN: Menghitung total tayang per film (Termasuk film yang belum pernah tayang)
-- --------------------------------------------------
SELECT 
    f.film_id, 
    f.judul AS judul_film, 
    COUNT(s.screening_id) AS total_jadwal_tayang
FROM films f
LEFT JOIN screenings s ON f.film_id = s.film_id
GROUP BY f.film_id, f.judul
ORDER BY total_jadwal_tayang DESC;