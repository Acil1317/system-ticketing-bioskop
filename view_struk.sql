-- ==================================================
-- MEMBUAT VIEW UNTUK STRUK TRANSAKSI (TABEL VIRTUAL)
-- ==================================================
CREATE OR REPLACE VIEW view_struk_transaksi AS
SELECT 
    p.pemesanan_id AS 'NOMOR NOTA',
    pb.pembayaran_id AS 'NO REFERENSI', 
    CONCAT(pl.nama_depan, ' ', pl.nama_belakang) AS 'NAMA PELANGGAN', 
    f.judul AS 'JUDUL FILM',
    s.waktu_mulai AS 'JAM TAYANG',
    st.nama AS 'STUDIO',
    GROUP_CONCAT(CONCAT(k.baris_kursi, k.no_kursi) SEPARATOR ', ') AS 'NOMOR KURSI',
    pb.total_bayar AS 'TOTAL BAYAR', 
    pb.metode_pembayaran AS 'METODE BAYAR', 
    pb.waktu_pembayaran AS 'WAKTU BAYAR', 
    pb.status_pembayaran AS 'STATUS FINANSIAL', 
    p.status_pemesanan AS 'STATUS OPERASIONAL' 
FROM pemesanan p
JOIN pelanggan pl ON p.pelanggan_id = pl.pelanggan_id
JOIN screenings s ON p.screening_id = s.screening_id
JOIN films f ON s.film_id = f.film_id
JOIN studio st ON s.studio_id = st.studio_id
JOIN reservasi r ON p.pemesanan_id = r.pemesanan_id
JOIN seats k ON r.seat_id = k.seat_id
LEFT JOIN pembayaran pb ON p.pemesanan_id = pb.pemesanan_id 
GROUP BY p.pemesanan_id, pb.pembayaran_id;