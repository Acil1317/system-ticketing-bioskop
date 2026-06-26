-- 1. INDEX TABEL PEMESANAN
ALTER TABLE pemesanan ADD INDEX idx_pelanggan (pelanggan_id);
ALTER TABLE pemesanan ADD INDEX idx_screening (screening_id);
ALTER TABLE pemesanan ADD INDEX idx_status (status_pemesanan);

-- 2. INDEX TABEL RESERVASI
ALTER TABLE reservasi ADD INDEX idx_pemesanan (pemesanan_id);
ALTER TABLE reservasi ADD INDEX idx_seat (seat_id);

-- 3. INDEX TABEL SCREENINGS
ALTER TABLE screenings ADD INDEX idx_studio (studio_id);
ALTER TABLE screenings ADD INDEX idx_film (film_id);

-- 4. INDEX TABEL PEMBAYARAN
ALTER TABLE pembayaran ADD INDEX idx_pembayaran_pemesanan (pemesanan_id);
ALTER TABLE pembayaran ADD INDEX idx_waktu_bayar (waktu_pembayaran);
ALTER TABLE pembayaran ADD INDEX idx_status_bayar (status_pembayaran);