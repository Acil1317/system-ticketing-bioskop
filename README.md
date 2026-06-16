# Sistem Pangkalan Data Bioskop (Cinema Ticketing Database)

Repositori ini berisi proyek pengembangan sistem pangkalan data (*database*) untuk manajemen tiket bioskop secara menyeluruh. Proyek ini mencakup perancangan skema relasional yang ternormalisasi, penyediaan data sampling (*dummy*), otomatisasi logika bisnis berbasis transaksi yang aman (ACID), optimasi performa kueri, hingga pengaturan tingkat keamanan akses pengguna (*Role-Based Access Control*).

---

## Fitur Utama Sistem

1. **Normalisasi Skema Database**: Struktur tabel yang kokoh (`pelanggan`, `pemesanan`, `reservasi`, `seats`, `studio`, `screenings`, `films`) untuk mencegah redundansi data.
2. **Otomatisasi Audit Log**: *Trigger* sistem terpasang untuk mencatat secara otomatis setiap riwayat perubahan penempatan kursi penonton.
3. **Logika Transaksi Aman (TCL)**: Implementasi kontrol transaksi menggunakan `START TRANSACTION`, `SAVEPOINT`, dan `ROLLBACK TO` untuk menjamin integritas data (anti *double-booking* atau data korup jika terjadi kegagalan input).
4. **Analitik & Pelaporan Tingkat Lanjut**: Menyediakan kueri pelaporan kompleks menggunakan fungsi agregat, pengelompokan tingkat lanjut (`ROLLUP` & `HAVING`), multi-table `JOIN`, serta `SUBQUERY` dinamis untuk pencarian lintas tabel.
5. **Optimasi Performa**: Pemasangan database `INDEX` pada kolom-kolom yang sering dicari guna mempercepat waktu respons kueri (*query execution time*).
6. **Keamanan Multi-User (Security Access Control)**: Pemisahan hak akses nyata antara akun `kasir_bioskop` (hak akses minimum/least privilege) dan `manager_bioskop` (all privileges).

---

## Struktur Repositori

Berikut adalah fungsi dari masing-masing berkas dan folder di dalam repositori ini:

* **`create db.sql`** : Skema utama database, pembuatan seluruh tabel, *Foreign Key constraint*, beserta konfigurasi *Trigger Audit Log*.
* **`view_struk.sql`** : Pembuatan database *View* khusus untuk keperluan cetak struk atau nota transaksi pelanggan secara terformat.
* **`record_data/`** : Berisi kumpulan data *dummy* awal yang siap dieksekusi untuk mengisi seluruh tabel dalam database.
* **`manipulasi_data/`** : Berisi kumpulan kueri pelaporan (DML), agregasi, pengelompokan data, *subquery*, serta script simulasi penanganan transaksi (TCL).
* **`optimasi_data/`** : Berisi script SQL untuk pembuatan indeks (*indexing*) guna mengoptimalkan kecepatan pencarian data.
* **`security/`** : Berisi script pengaturan pengguna, pembuatan user account baru, dan pembagian hak akses (*privileges*).
* **`backup_data/`** : Folder cadangan data/SQL dump untuk pemulihan (*recovery*) pangkalan data jika diperlukan.

---

## Urutan Implementasi & Eksekusi Query

Untuk mereplikasi atau menjalankan ulang database ini tanpa mengalami kendala *Foreign Key Constraint Error*, pastikan Anda mengikuti langkah-langkah berikut secara berurutan:

* **Langkah 1: Inisialisasi Pondasi Database** – Jalankan file `create db.sql` untuk membentuk skema utama database, tabel-tabel kosong, serta konfigurasi *Trigger Audit Log*.
* **Langkah 2: Pengisian Data Master & Transaksi** – Eksekusi file SQL di dalam folder `record_data/` untuk mengisi seluruh tabel dengan data sampling/dummy sebelum menguji kueri lainnya.
* **Langkah 3: Pengujian Kueri Manipulasi & Transaksi (TCL)** – Jalankan file SQL di dalam folder `manipulasi_data/` untuk melihat simulasi laporan analitik dan pengujian pembatalan transaksi menggunakan `SAVEPOINT` dan `ROLLBACK TO`.
* **Langkah 4: Pembuatan View Struk Transaksi** – Jalankan file `view_struk.sql` untuk membuat tabel virtual (*View*) yang memformat tampilan nota pembayaran pelanggan.
* **Langkah 5: Optimasi Performa Database** – Eksekusi file SQL di dalam folder `optimasi_data/` untuk memasang indeks pada kolom kunci agar proses pembacaan data menjadi lebih cepat.
* **Langkah 6: Konfigurasi Keamanan Pengguna** – Terakhir, jalankan file SQL di dalam folder `security/` untuk membuat akun pengguna baru sekaligus membagikan hak akses masing-masing (Manager dan Kasir).

---
*Proyek ini dikembangkan sebagai pemenuhan tugas kelompok pemrograman sql kelas D.*
