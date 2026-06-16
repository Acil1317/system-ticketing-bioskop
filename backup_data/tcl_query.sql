-- --------------------------------------------------
-- transaction savepoint rollback dan commit
-- --------------------------------------------------
-- 1. Mulai transaksi (Database menahan semua perubahan agar belum permanen)
START TRANSACTION;

-- 2. Eksekusi input data ke tabel pemesanan
INSERT INTO pemesanan (pemesanan_id, screening_id, pelanggan_id, harga_tiket, status_pemesanan)
VALUES ('PMN099', 'SC001', 'C001', 50000.00, 'Lunas');

-- 3. Buat batas aman (SAVEPOINT) di titik ini
SAVEPOINT setelah_pemesanan;

-- 4. case salah input kode kursi (misal kursinya ga ada: 'S999')
INSERT INTO reservasi (reservasi_id, pemesanan_id, seat_id)
VALUES ('RES099', 'PMN099', 'S999');

-- 5. tahu nih kalau salah Kembalikan data ke batas aman lagi
-- (Data kursi 'S999' otomatis dihapus, tapi data pemesanan 'PMN099' di langkah 2 tetap aman)
ROLLBACK TO setelah_pemesanan;

-- 6. Sekarang input kode kursi yang benar (misal: 'S001')
INSERT INTO reservasi (reservasi_id, pemesanan_id, seat_id)
VALUES ('RES099', 'PMN099', 'S001');

-- 7. Semua data sudah valid? Simpan permanen ke dalam database!
COMMIT;
-- --------------------------------------------------
-- transaction savepoint rollback dan commit
-- --------------------------------------------------
-- 1. Mulai transaksi
START TRANSACTION;

-- 2. Masukkan data pemesanan baru
INSERT INTO pemesanan (pemesanan_id, screening_id, pelanggan_id, harga_tiket, status_pemesanan)
VALUES ('PMN100', 'SC002', 'C002', 60000.00, 'Lunas');

-- 3. Pelanggan tiba-tiba cancel. Batalkan semuanya!
ROLLBACK;

-- Cek hasilnya: Data 'PMN100' di atas tidak akan pernah masuk ke tabel pemesanan.