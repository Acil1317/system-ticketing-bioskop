-- --------------------------------------------------
-- TRANSACTION PART 1: Savepoint & Rollback To (Kasus Salah Input)
-- --------------------------------------------------
-- 1. Mulai transaksi
START TRANSACTION;

-- 2. Input data ke tabel pemesanan (Aman)
INSERT INTO pemesanan (pemesanan_id, screening_id, pelanggan_id, harga_tiket, status_pemesanan)
VALUES ('PMN101', 'SC001', 'C001', 50000.00, 'Lunas');

-- 3. Buat batas aman (SAVEPOINT) setelah pemesanan berhasil
SAVEPOINT setelah_pemesanan;

-- 4. Kasus salah input kursi (Pelanggan salah pilih / Kasir salah input)
INSERT INTO reservasi (reservasi_id, pemesanan_id, seat_id)
VALUES ('RES051', 'PMN101', 'S002'); 

-- 5. Pelanggan komplain: "Eh bukan kursi itu mbak!". 
-- Kita Rollback ke batas aman tadi. Data kursi 'S002' otomatis dibatalkan secara instan.
ROLLBACK TO setelah_pemesanan;

-- 6. Sekarang input kode kursi yang benar sesuai kemauan pelanggan ('S001')
INSERT INTO reservasi (reservasi_id, pemesanan_id, seat_id)
VALUES ('RES051', 'PMN101', 'S001');

-- 7. Semua sudah sesuai? Simpan permanen!
COMMIT;
-- --------------------------------------------------
-- TRANSACTION PART 2: Full Rollback (Kasus Pembatalan Total)
-- --------------------------------------------------
-- 1. Mulai transaksi
START TRANSACTION;

-- 2. Masukkan data pemesanan baru
INSERT INTO pemesanan (pemesanan_id, screening_id, pelanggan_id, harga_tiket, status_pemesanan)
VALUES ('PMN105', 'SC002', 'C002', 60000.00, 'Lunas');

-- 3. Pelanggan tiba-tiba cancel sebelum cetak tiket. Batalkan semuanya!
ROLLBACK;

-- Catatan Cek Hasil: Data 'PMN105' di atas tidak akan pernah masuk ke database.

-- --------------------------------------------------
-- TRANSACTION PART 3: Direct Commit (Kasus Alur Transaksi Sukses)
-- --------------------------------------------------
-- 1. Mulai transaksi
START TRANSACTION;

-- 2. Input data pemesanan pelanggan yang datanya sudah valid
INSERT INTO pemesanan (pemesanan_id, screening_id, pelanggan_id, harga_tiket, status_pemesanan)
VALUES ('PMN102', 'SC003', 'C003', 50000.00, 'Lunas');

-- 3. Input data kursi yang dipesan oleh pelanggan tersebut
INSERT INTO reservasi (reservasi_id, pemesanan_id, seat_id)
VALUES ('RES052', 'PMN102', 'S003');

-- 4. Karena tidak ada kesalahan atau interupsi, langsung kunci secara permanen
COMMIT;

-- Catatan Cek Hasil: Data 'PMN102' dan 'RES052' resmi tersimpan dan aman di database.
