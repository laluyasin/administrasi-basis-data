-- Nama     : lalu mas'ud ysain
-- NIM		: 23241068
-- Kelas	: B
-- Modul	: ORDER BY, FUNGSI AGREGASI, GROUP BY,HAVING

-- Membuat Database
USE pti_mart;

-- ORDER BY
-- Ambil nama produk dan qty dari tabel penjualan urutkan qty
SELECT nama_produk, qty FROM tr_penjualan ORDER BY qty;

-- Ambil
SELECT nama_produk, qty FROM tr_penjualan ORDER BY qty, nama_produk;

-- Latihan
-- tampilkan semua kolom dari tabel tr_penjualan dengan mengurutkan berdasarkan qty dan tgl transaksi
SELECT * FROM tr_penjualan ORDER BY qty, tgl_transaksi;

-- latihan
-- tampilkan semua kolom dari tabel ms pelanggan dengan mengurutkan berdasarkan nama pelanggan
SELECT * FROM ms_pelanggan ORDER BY nama_pelanggan;

-- latihan
-- tampilkan semua kolom dari tabel ms pelanggan dengan mengurutkan berdasarkan alamat
SELECT * FROM ms_pelanggan ORDER BY alamat;

-- ASC
-- Ambil
SELECT nama_produk, qty FROM tr_penjualan ORDER BY qty DESC;

-- Ambil nama produk, qty dari
SELECT nama_produk, qty FROM tr_penjualan ORDER BY qty DESC, nama_produk DESC;

-- LATIHAN 2 ASC DAN DSC
SELECT * FROM tr_penjualan ORDER BY tgl_transaksi DESC, qty ASC;
SELECT * FROM ms_pelanggan ORDER BY nama_pelanggan DESC;
SELECT * FROM ms_pelanggan ORDER BY alamat DESC;

-- ORDER BY dari hasil perhitungan
-- Ambil nama produk, qty , harga, harga*qty dari tb penjualan urutan harga*qty besar-kecil
SELECT nama_produk, harga, qty, harga*qty AS total 
FROM tr_penjualan
ORDER BY total DESC;
-- bisa pakai total atau harga*qty 

-- latihan 3
-- cobalah pengurutan dengan ekspresi total harga menggunakan rumusan jumlah barang dikali harga barang dikurangi diskon
SELECT nama_produk, harga, qty, diskon_persen, 
(harga * qty) AS total_harga, (harga * qty) - ((diskon_persen / 100) * (harga * qty)) AS total_bayar
FROM tr_penjualan
WHERE diskon_persen > 0
ORDER BY diskon_persen DESC,
  (harga * qty) * (1 - diskon_persen / 100) DESC;

-- order by menggunakan WHERE
-- ambil nama produk, qty dari tb penjualan yang nama produk bermasalah 'F' urut qty
SELECT nama_produk, qty
FROM tr_penjualan
WHERE nama_produk LIKE 'F'
ORDER BY qty DESC;

-- Tambahan dari Latihan Mandiri:
-- 1. Tampilkan semua kolom dari transaksi penjualan yang memiliki diskon dan diurutkan berdasarkan harga tertinggi
SELECT *
FROM tr_penjualan
WHERE diskon_persen IS NOT NULL
ORDER BY harga DESC;

-- 2. Tampilkan kolom nama produk, kuantitas pembelian dan harga dari transaksi penjualan 
--    yang memiliki harga minimal seratus ribu rupiah dan diurutkan berdasarkan harga tertinggi
SELECT nama_produk, qty AS kuantitas_pembelian, harga
FROM tr_penjualan
WHERE harga >= 100000
ORDER BY harga DESC;

-- 3. Tampilkan kolom nama produk, kuantitas pembelian dan harga dari transaksi penjualan 
--    yang memiliki harga minimal seratus ribu rupiah atau nama produk berawalan karakter 'T'
--    dan diurutkan berdasarkan diskon tertinggi
SELECT nama_produk, qty AS kuantitas_pembelian, harga
FROM tr_penjualan
WHERE harga >= 100000 OR nama_produk LIKE 'T%'
ORDER BY diskon_persen DESC;

-- Cek data pelanggan
SELECT * FROM ms_pelanggan;
