-- --------------------------------------------------
-- Mengisi Data Tabel Pemesanan (100 Baris Data)
-- Dibagi dalam 10 Batch eksekusi
-- --------------------------------------------------
-- BATCH 1 (Januari - Fokus Film Laris Avatar & Agak Laen)
INSERT INTO pemesanan (pemesanan_id, screening_id, pelanggan_id, harga_tiket, status_pemesanan) VALUES
('PMN001', 'SC001', 'C005', 150000, 'Lunas'),
('PMN002', 'SC001', 'C012', 150000, 'Lunas'),
('PMN003', 'SC001', 'C023', 150000, 'Lunas'),
('PMN004', 'SC002', 'C041', 150000, 'Lunas'),
('PMN005', 'SC002', 'C008', 150000, 'Dibatalkan'),
('PMN006', 'SC003', 'C033', 100000, 'Lunas'),
('PMN007', 'SC004', 'C019', 100000, 'Lunas'),
('PMN008', 'SC001', 'C050', 150000, 'Belum Bayar'),
('PMN009', 'SC007', 'C021', 100000, 'Lunas'),
('PMN010', 'SC007', 'C002', 100000, 'Lunas');

-- BATCH 2 (Januari akhir - Lanjutan Film Gelombang 1)
INSERT INTO pemesanan (pemesanan_id, screening_id, pelanggan_id, harga_tiket, status_pemesanan) VALUES
('PMN011', 'SC007', 'C038', 100000, 'Lunas'),
('PMN012', 'SC007', 'C011', 100000, 'Dibatalkan'),
('PMN013', 'SC008', 'C044', 100000, 'Lunas'),
('PMN014', 'SC008', 'C015', 100000, 'Lunas'),
('PMN015', 'SC005', 'C029', 50000, 'Lunas'), 
('PMN016', 'SC006', 'C003', 50000, 'Lunas'),
('PMN017', 'SC009', 'C047', 150000, 'Lunas'),
('PMN018', 'SC009', 'C014', 150000, 'Belum Bayar'),
('PMN019', 'SC001', 'C027', 150000, 'Lunas'),
('PMN020', 'SC002', 'C009', 150000, 'Lunas');

-- BATCH 3 (Februari - Transisi ke Demon Slayer)
INSERT INTO pemesanan (pemesanan_id, screening_id, pelanggan_id, harga_tiket, status_pemesanan) VALUES
('PMN021', 'SC010', 'C022', 150000, 'Lunas'),
('PMN022', 'SC011', 'C035', 100000, 'Lunas'),
('PMN023', 'SC012', 'C048', 100000, 'Lunas'),
('PMN024', 'SC013', 'C004', 50000, 'Dibatalkan'),
('PMN025', 'SC014', 'C018', 50000, 'Lunas'),
('PMN026', 'SC015', 'C031', 150000, 'Lunas'), 
('PMN027', 'SC015', 'C007', 150000, 'Lunas'),
('PMN028', 'SC015', 'C042', 150000, 'Lunas'),
('PMN029', 'SC015', 'C016', 150000, 'Belum Bayar'),
('PMN030', 'SC016', 'C025', 150000, 'Lunas');

-- BATCH 4 (Maret - Fokus Gelombang 2)
INSERT INTO pemesanan (pemesanan_id, screening_id, pelanggan_id, harga_tiket, status_pemesanan) VALUES
('PMN031', 'SC017', 'C010', 100000, 'Lunas'),
('PMN032', 'SC018', 'C039', 100000, 'Lunas'),
('PMN033', 'SC019', 'C001', 50000, 'Lunas'),
('PMN034', 'SC020', 'C026', 50000, 'Dibatalkan'),
('PMN035', 'SC022', 'C045', 150000, 'Lunas'), 
('PMN036', 'SC022', 'C013', 150000, 'Lunas'),
('PMN037', 'SC022', 'C030', 150000, 'Lunas'),
('PMN038', 'SC023', 'C049', 100000, 'Lunas'),
('PMN039', 'SC024', 'C006', 100000, 'Belum Bayar'),
('PMN040', 'SC022', 'C020', 150000, 'Lunas');

-- BATCH 5 (April - Gelombang 2 menuju akhir)
INSERT INTO pemesanan (pemesanan_id, screening_id, pelanggan_id, harga_tiket, status_pemesanan) VALUES
('PMN041', 'SC025', 'C034', 50000, 'Lunas'),
('PMN042', 'SC025', 'C043', 50000, 'Lunas'),
('PMN043', 'SC026', 'C017', 50000, 'Dibatalkan'),
('PMN044', 'SC027', 'C028', 150000, 'Lunas'),
('PMN045', 'SC027', 'C005', 150000, 'Lunas'),
('PMN046', 'SC027', 'C037', 150000, 'Lunas'),
('PMN047', 'SC028', 'C012', 150000, 'Lunas'),
('PMN048', 'SC029', 'C024', 100000, 'Lunas'), 
('PMN049', 'SC029', 'C040', 100000, 'Belum Bayar'),
('PMN050', 'SC029', 'C008', 100000, 'Lunas');

-- BATCH 6 (April - Memasuki Gelombang 3)
INSERT INTO pemesanan (pemesanan_id, screening_id, pelanggan_id, harga_tiket, status_pemesanan) VALUES
('PMN051', 'SC030', 'C033', 100000, 'Lunas'),
('PMN052', 'SC031', 'C019', 50000, 'Lunas'),
('PMN053', 'SC032', 'C046', 50000, 'Lunas'), 
('PMN054', 'SC032', 'C002', 50000, 'Lunas'),
('PMN055', 'SC032', 'C021', 50000, 'Dibatalkan'),
('PMN056', 'SC033', 'C038', 150000, 'Lunas'),
('PMN057', 'SC034', 'C011', 150000, 'Lunas'),
('PMN058', 'SC035', 'C044', 100000, 'Lunas'),
('PMN059', 'SC035', 'C015', 100000, 'Belum Bayar'),
('PMN060', 'SC035', 'C029', 100000, 'Lunas');

-- BATCH 7 (Mei - Pertengahan Gelombang 3)
INSERT INTO pemesanan (pemesanan_id, screening_id, pelanggan_id, harga_tiket, status_pemesanan) VALUES
('PMN061', 'SC036', 'C003', 100000, 'Lunas'),
('PMN062', 'SC037', 'C047', 50000, 'Lunas'),
('PMN063', 'SC038', 'C014', 50000, 'Dibatalkan'),
('PMN064', 'SC039', 'C027', 100000, 'Lunas'),
('PMN065', 'SC040', 'C009', 150000, 'Lunas'), 
('PMN066', 'SC040', 'C022', 150000, 'Lunas'),
('PMN067', 'SC040', 'C035', 150000, 'Lunas'),
('PMN068', 'SC040', 'C048', 150000, 'Belum Bayar'),
('PMN069', 'SC039', 'C004', 100000, 'Lunas'),
('PMN070', 'SC038', 'C018', 50000, 'Lunas');

-- BATCH 8 (Mei Akhir)
INSERT INTO pemesanan (pemesanan_id, screening_id, pelanggan_id, harga_tiket, status_pemesanan) VALUES
('PMN071', 'SC041', 'C031', 150000, 'Lunas'),
('PMN072', 'SC041', 'C007', 150000, 'Lunas'),
('PMN073', 'SC042', 'C042', 150000, 'Dibatalkan'),
('PMN074', 'SC043', 'C016', 100000, 'Lunas'),
('PMN075', 'SC044', 'C025', 100000, 'Lunas'), 
('PMN076', 'SC044', 'C010', 100000, 'Lunas'),
('PMN077', 'SC044', 'C039', 100000, 'Lunas'),
('PMN078', 'SC044', 'C001', 100000, 'Belum Bayar'),
('PMN079', 'SC045', 'C026', 50000, 'Lunas'),
('PMN080', 'SC046', 'C045', 50000, 'Lunas');

-- BATCH 9 (Juni - Akhir Periode)
INSERT INTO pemesanan (pemesanan_id, screening_id, pelanggan_id, harga_tiket, status_pemesanan) VALUES
('PMN081', 'SC047', 'C013', 150000, 'Lunas'),
('PMN082', 'SC048', 'C030', 150000, 'Lunas'), 
('PMN083', 'SC048', 'C049', 150000, 'Lunas'),
('PMN084', 'SC048', 'C006', 150000, 'Dibatalkan'),
('PMN085', 'SC048', 'C020', 150000, 'Lunas'),
('PMN086', 'SC049', 'C034', 100000, 'Lunas'),
('PMN087', 'SC050', 'C043', 100000, 'Lunas'), 
('PMN088', 'SC050', 'C017', 100000, 'Lunas'),
('PMN089', 'SC050', 'C028', 100000, 'Lunas'),
('PMN090', 'SC050', 'C005', 100000, 'Lunas');

-- BATCH 10 (Juni - Pemesanan Terakhir)
INSERT INTO pemesanan (pemesanan_id, screening_id, pelanggan_id, harga_tiket, status_pemesanan) VALUES
('PMN091', 'SC050', 'C037', 100000, 'Belum Bayar'),
('PMN092', 'SC050', 'C012', 100000, 'Lunas'),
('PMN093', 'SC048', 'C024', 150000, 'Lunas'),
('PMN094', 'SC045', 'C040', 50000, 'Lunas'),
('PMN095', 'SC044', 'C008', 100000, 'Dibatalkan'),
('PMN096', 'SC042', 'C033', 150000, 'Lunas'),
('PMN097', 'SC040', 'C019', 150000, 'Lunas'),
('PMN098', 'SC035', 'C046', 100000, 'Lunas'),
('PMN099', 'SC029', 'C002', 100000, 'Lunas'),
('PMN100', 'SC015', 'C021', 150000, 'Lunas');