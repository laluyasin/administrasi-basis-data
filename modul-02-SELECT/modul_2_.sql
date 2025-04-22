-- Nama : lalu mas'ud yasin --
-- Nim  : 23241068 --
-- Kelas : IV B --
-- modul : 2 (SELECT) --

-- membuat database --
CREATE DATABASE PTI_Mart;

-- menggunakan database --
USE pti_mart;

-- cek kolom dalam setiap tabel --
DESCRIBE ms_pelanggan;
DESCRIBE ms_produk;
DESCRIBE tr_penjualan;

-- SELECT 
-- menggunakan SELECT untuk 1 tabel
-- mengambil kolom nama produk dari tabel produk
SELECT nama_produk FROM ms_produk;

-- mengambil lebih dari satu kolom dari sebuah tabel
SELECT nama_produk, harga FROM ms_produk;

-- mengambil semua kolom dari sebuah tabel
SELECT * FROM ms_produk;

-- latihan 
-- mengambil kode produk dan nama produk dari tabel produk
SELECT kode_produk, nama_produk FROM ms_produk;

-- mengambil seluruh kolom dari tabel pemjualan 
SELECT * FROM tr_penjualan; 

-- PREFIX dan ALIAS
-- PREFIX , bagian objek database yang hirarkinya lebih tinggi
-- menggunakan PREFIX nama tabel untuk kolom nama_produk dari tabel produk
SELECT ms_produk. nama_produk FROM ms_produk;

-- menggunakan nama database dan tabel sebagai prefix untuk kolom nama_produk
SELECT pti_mart. ms_produk. nama_produk FROM ms_produk;

-- ALIAS, nama sementara pengganti nama objek database asli 
-- mengganti nama sementara kolom nama_produk dengan ALIAS
SELECT nama_produk AS np FROM ms_produk;
SELECT nama_produk np FROM ms_produk;

-- mengganti sementara tabel dengan alias 
SELECT nama_poduk FROM ms_produk AS msp;

-- kombinasi prefix dan alias
SELECT msp.nama_produk from ms_produk AS msp;


-- case 1
SELECT nama_pelanggan, alamat from ms_pelanggan;

-- case 2
SELECT nama_produk, harga from ms_produk;
