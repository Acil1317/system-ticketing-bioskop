-- 1. Index di Tabel Pemesanan (Sering di-filter dan di-join)
ALTER TABLE pemesanan ADD INDEX idx_pelanggan (pelanggan_id);
ALTER TABLE pemesanan ADD INDEX idx_screening (screening_id);
ALTER TABLE pemesanan ADD INDEX idx_status (status_pemesanan);

-- 2. Index di Tabel Reservasi (Sering di-join)
ALTER TABLE reservasi ADD INDEX idx_pemesanan (pemesanan_id);
ALTER TABLE reservasi ADD INDEX idx_seat (seat_id);

-- 3. Index di Tabel Screenings (Sering dicari berdasarkan studio atau film)
ALTER TABLE screenings ADD INDEX idx_studio (studio_id);
ALTER TABLE screenings ADD INDEX idx_film (film_id);