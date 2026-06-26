-- --------------------------------------------------
-- DATABASE CINEMA TICKETING SYSTEM (FINAL 3NF)
-- --------------------------------------------------
CREATE DATABASE cinema_ticketing; 
USE cinema_ticketing;

-- 1. Tabel Film
CREATE TABLE films (
    film_id VARCHAR(10) NOT NULL,
    judul VARCHAR(100) NOT NULL,
    genre VARCHAR(50) NOT NULL, 
    durasi_menit INT NOT NULL,
    sutradara VARCHAR(100) NOT NULL,  
    deskripsi TEXT NOT NULL,    
    CONSTRAINT pk_films PRIMARY KEY (film_id) 
);

-- 2. Tabel Studio 
CREATE TABLE studio (
    studio_id VARCHAR(10) NOT NULL,
    nama VARCHAR(50) NOT NULL,
    capacity INT NOT NULL,
    CONSTRAINT pk_studio PRIMARY KEY (studio_id)
);

-- 3. Tabel Screening
CREATE TABLE screenings (
    screening_id VARCHAR(10) NOT NULL,
    film_id VARCHAR(10) NOT NULL,
    studio_id VARCHAR(10) NOT NULL,
    waktu_mulai DATETIME NOT NULL,
    CONSTRAINT pk_screenings PRIMARY KEY (screening_id),
    CONSTRAINT fk_screenings_film FOREIGN KEY (film_id) REFERENCES films (film_id),
    CONSTRAINT fk_screenings_studio FOREIGN KEY (studio_id) REFERENCES studio (studio_id)
);

-- 4. Tabel Alamat 
CREATE TABLE alamat (
    alamat_id VARCHAR(10) NOT NULL,
    jalan VARCHAR(100) NOT NULL,
    kota VARCHAR(100) NOT NULL,
    provinsi VARCHAR(100) NOT NULL,
    kodepos VARCHAR(10),
    CONSTRAINT pk_alamat PRIMARY KEY (alamat_id)
);

-- 5. Tabel Pelanggan
CREATE TABLE pelanggan (
    pelanggan_id VARCHAR(10) NOT NULL,
    nama_depan VARCHAR(50) NOT NULL,
    nama_belakang VARCHAR(50) NOT NULL,
    gender ENUM('P', 'L') NOT NULL,
    email VARCHAR(50) NOT NULL,
    no_telp VARCHAR(13) NOT NULL,
    alamat_id VARCHAR (10),
    CONSTRAINT pk_pelanggan PRIMARY KEY (pelanggan_id),
    CONSTRAINT fk_alamat_pelanggan FOREIGN KEY (alamat_id) REFERENCES alamat (alamat_id)
);

-- 6. Tabel Pemesanan 
CREATE TABLE pemesanan (
    pemesanan_id VARCHAR(10) NOT NULL,
    screening_id VARCHAR(10) NOT NULL,
    pelanggan_id VARCHAR(10) NOT NULL,
    harga_tiket DECIMAL (10,2) NOT NULL,
    status_pemesanan ENUM('Belum Bayar', 'Lunas', 'Dibatalkan') NOT NULL, 
    CONSTRAINT pk_pemesanan PRIMARY KEY (pemesanan_id),
    CONSTRAINT fk_pemesanan_screening FOREIGN KEY (screening_id) REFERENCES screenings (screening_id),
    CONSTRAINT fk_pemesanan_pelanggan FOREIGN KEY (pelanggan_id) REFERENCES pelanggan (pelanggan_id)
);

-- 7. Tabel Kursi
CREATE TABLE seats (
    seat_id VARCHAR(10) NOT NULL,
    baris_kursi CHAR(1) NOT NULL,
    no_kursi INT(11) NOT NULL,
    studio_id VARCHAR(10) NOT NULL,
    CONSTRAINT pk_seats PRIMARY KEY (seat_id),
    CONSTRAINT fk_seats_studio FOREIGN KEY (studio_id) REFERENCES studio (studio_id)
);

-- 8. Tabel Reservasi 
CREATE TABLE reservasi (
    reservasi_id VARCHAR(10) NOT NULL,
    pemesanan_id VARCHAR(10) NOT NULL,
    seat_id VARCHAR(10) NOT NULL,
    CONSTRAINT pk_reservasi PRIMARY KEY (reservasi_id),
    CONSTRAINT fk_reservasi_pemesanan FOREIGN KEY (pemesanan_id) REFERENCES pemesanan (pemesanan_id),
    CONSTRAINT fk_reservasi_seat FOREIGN KEY (seat_id) REFERENCES seats (seat_id)
);

-- 9. Tabel Pembayaran 
CREATE TABLE pembayaran (
    pembayaran_id VARCHAR(10) NOT NULL,
    pemesanan_id VARCHAR(10) NOT NULL,
    metode_pembayaran ENUM('QRIS', 'Transfer Bank', 'Kartu Kredit', 'Tunai') NOT NULL,
    total_bayar DECIMAL(10,2) NOT NULL,
    waktu_pembayaran DATETIME NOT NULL,
    status_pembayaran ENUM('Pending', 'Sukses', 'Gagal') NOT NULL,
    CONSTRAINT pk_pembayaran PRIMARY KEY (pembayaran_id),
    CONSTRAINT fk_pembayaran_pemesanan FOREIGN KEY (pemesanan_id) REFERENCES pemesanan (pemesanan_id)
);