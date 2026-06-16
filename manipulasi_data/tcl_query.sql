-- --------------------------------------------------
-- transaction savepoint rollback dan commit
-- --------------------------------------------------
-- 1. Mulai transaksi
START TRANSACTION;

-- 2. Input data ke tabel pemesanan (Aman)
INSERT INTO pemesanan (pemesanan_id, screening_id, pelanggan_id, harga_tiket, status_pemesanan)
VALUES ('PMN105', 'SC001', 'C001', 50000.00, 'Lunas');

-- 3. Buat batas aman (SAVEPOINT) setelah pemesanan berhasil
SAVEPOINT setelah_pemesanan;

-- 4. Kasus salah input kursi (Kursi 'S002' ada di database, tapi salah pilih)
INSERT INTO reservasi (reservasi_id, pemesanan_id, seat_id)
VALUES ('RES099', 'PMN105', 'S002'); 

-- 5. Pelanggan komplain: "Eh bukan kursi itu mbak!". 
-- Kita Rollback ke batas aman tadi. Data 'S002' otomatis dihapus secara instan.
ROLLBACK TO setelah_pemesanan;

-- 6. Sekarang input kode kursi yang benar sesuai kemauan pelanggan ('S001')
INSERT INTO reservasi (reservasi_id, pemesanan_id, seat_id)
VALUES ('RES099', 'PMN105', 'S001');

-- 7. Semua sudah sesuai? Simpan permanen!
COMMIT;
-- --------------------------------------------------
-- transaction savepoint rollback dan commit
-- --------------------------------------------------
-- 1. Mulai transaksi
START TRANSACTION;

-- 2. Masukkan data pemesanan baru
INSERT INTO pemesanan (pemesanan_id, screening_id, pelanggan_id, harga_tiket, status_pemesanan)
VALUES ('PMN107', 'SC002', 'C002', 60000.00, 'Lunas');

-- 3. Pelanggan tiba-tiba cancel. Batalkan semuanya!
ROLLBACK;

-- Cek hasilnya: Data 'PMN100' di atas tidak akan pernah masuk ke tabel pemesanan.