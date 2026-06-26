## Panduan Tutorial Implementasi

Ikuti langkah-langkah di bawah ini untuk memasang database ke dalam MySQL (XAMPP / phpMyAdmin / MySQL CLI).

### Langkah 1: Eksekusi Struktur Utama (`create db.sql`)
Lu **TIDAK PERLU** membuat database manual lewat phpMyAdmin terlebih dahulu. Perintah pembuatan database sudah ditanam langsung di dalam *script*.

1. Buka phpMyAdmin atau MySQL Client lu.
2. Masuk ke menu **Import** atau buka tab **SQL**.
3. Pilih atau salin isi file `create db.sql`.
4. Klik **Go** / **Execute**.

### Langkah 2: Sampling Data dari Folder `record_data`
Untuk mensimulasikan beban kerja nyata, lu wajib meng-input data secara berurutan sesuai urutan table untuk menghindari *error Foreign Key constraint*.

1. **Data Film**
   * Eksekusi file `films.sql`.
   * Di dalam file ini akan mengisi data film_id, judul, genre, durasi_menit, sutradara, dan deskripsi. 
2. **Data Studio**
   * Eksekusi file `studio.sql`.
   * Di dalam file ini akan mengisi data studio_id, nama, dan capacity.
3. **Data Screenings**
   * Eksekusi file `screenings.sql`.
   * Di dalam file ini akan mengisi data screening_id, film_id, studio_id, dan waktu_mulai. 
4. **Data Alamat**
   * Eksekusi file `alamat.sql`.
   * Di dalam file ini akan mengisi data alamat_id, jalan, kota, provinsi, dan kodepos.
5. **Data Pelanggan**
   * Eksekusi file `pelanggan.sql`.
   * Di dalam file ini akan mengisi data pelanggan_id, nama_depan, nama_belakang, gender, email, no_telp dan alamat_id. 
6. **Data Pemesanan**
   * Eksekusi file `pemesanan.sql`.
   * Di dalam file ini akan mengisi data pemesanan_id, screening_id, pelanggan_id, harga_tiket, dan status_pemesanan.
7. **Data Seats**
   * Eksekusi file `seats.sql`.
   * Di dalam file ini akan mengisi data seats_id, baris_kursi, no_kursi, dan studio_id.
8. **Data Reservasi**
   * Eksekusi file `reservasi.sql`.
   * Di dalam file ini akan mengisi data reservasi_id, pemesanan_id, dan seat_id.
9. **Data Pembayaran**
   * Eksekusi file `pembayaran.sql`.
   * Di dalam file ini akan mengisi data pembayaran_id, pemesanan_id, metode_pembayaran, total_bayar, waktu_pembayaran dan status_pembayaran.

### Langkah 3: meningkatkan optimasi query `optimasi_data`
untuk menghemat waktu dan db tak terlalu berat saat mengolah data diperlukan index denan cara mengeksekusi file `index.sql` lalu
untuk mengetahui rekam jejak perubahan dari suatu atribut misal perubahan kursi maka eksekusi file `trigger.sql`

### Langkah 4: Verifikasi Implementasi View transaksi
pertama eksekusi file `view_struk.sql` setelah itu
Jalankan query ini di SQL editor lu:
```sql
SELECT * FROM view_struk_transaksi;
```
Setelah seluruh skema dan sampling data berhasil di-import, lu bisa memvalidasi keberhasilan sistem dengan memanggil virtual tabel (View) struk transaksi yang hanya akan menampilkan transaksi sah (**Sukses** & **Lunas**).

### Output yang Diharapkan:
Sistem akan menampilkan tabel virtual dengan kolom bersih berisi: `NOMOR NOTA`, `NO REFERENSI`, `NAMA PELANGGAN`, `JUDUL FILM`, `JAM TAYANG`, `STUDIO`, `NOMOR KURSI` (tergabung rapi jika membeli lebih dari 1 kursi), `TOTAL BAYAR`, hingga status operasional dan finansialnya.

### Langkah 5: Menjaga Kredensial data `security`
untuk menjaga keamanan data maka dibuatkan user account untuk manager dan kasir yang mana memilki akses izin yang berbeda?
1. **Akun Manager**
   * Eksekusi file `manager_account.sql`.
   * Di dalam file ini akan membuat user account baru dengan nama "manager_bioskop" serta password didalamnya, server localhost serta mendapati All Privilages.
2. **Akun Kasir**
   * Eksekusi file `kasir_account.sql`.
   * Di dalam file ini akan membuat user account baru dengan nama "kasir_bioskop" serta password didalamnya, server localhost tetapi hanya mendapati grant select dan insert pada tabel tabel tertentu

### Langkah 6: Penggolahan Data `manipulasi_data`
Query-query pada folder ini disiapkan untuk demonstrasi project 
   
