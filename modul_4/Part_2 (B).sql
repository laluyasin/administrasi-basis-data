-- nama ; Muh. Haeril Rapli
-- nim ; 23241069
-- kelas ; B 
-- modul ; ORDER BY,FUNGSI AGREGASI, GROUP BY, HAVING

-- mengunakan database
use pti_mart;

-- order by
-- ambil nama produk dan qty dari tabel penjualan urutan qty (quantity)
select nama_produk, qty from tr_penjualan ORDER by qty;

-- ambil nama produk dan qty dari tr penjualan urutan qty dan nama produk
select nama_produk, qty from tr_penjualan order by qty, nama_produk;


-- latihan mandiri 1
-- menampilkan semua kolom dari tabel tr_pejualan dengan mengurutkan  berdasarkan qty dan tgl_transaksi
select * from tr_penjualan order by qty, tgl_transaksi;
-- menampilkan semua kolom dari table ms_pelanggan dengan mengurutkan berdasarkan nama_pelanggan
select * from ms_pelanggan order by nama_pelanggan;
-- menampilkan semua kolom dari tabel ms_pelanggan dengan mengurutkan berdasarkan alamat
select * from ms_pelanggan order by alamat;
select database();
-- order by asc dan desc
-- ambil nama produk, qty dari tb penjualan urutkan qty besar ke kecil
select nama_produk, qty from tr_penjualan order by qty desc;

-- ambil nama produk, qty dari tabel penjualan urutan qty dan nama produk besar ke kecil
select nama_produk, qty from tr_penjualan order by qty desc, nama_produk desc;

-- latihan mandiri 2
-- menampilkan semua kolom dari tabel tr_pejualan dengan mengurutkan  berdasarkan qty dan tgl_transaksi secara descanding
select * from tr_penjualan order by qty, tgl_transaksi desc;
-- menampilkan semua kolom dari table ms_pelanggan dengan mengurutkan berdasarkan nama_pelanggan secara descanding
select * from ms_pelanggan order by nama_pelanggan desc;
-- menampilkan semua kolom dari tabel ms_pelanggan dengan mengurutkan berdasarkan alamat secara descanding
select * from ms_pelanggan order by alamat desc;

-- order by dari hasil perhitungan
-- ambil nama produk, qty, harga, harga*qty dari table penjualan urutkan total besar ke kecil
select nama_produk, harga, qty,harga*qty AS total 
from tr_penjualan 
order by qty desc, total desc;


-- latihan mandiri 3 ( jika total tidak bisa, maka harus mengunakan qty*harga)
select nama_produk, harga, qty, diskon_persen, qty*harga AS total_harga, ((qty*harga) - ((diskon_persen/100)*harga))
As total_bayar 
from tr_penjualan
order by qty*harga desc;

-- pengunaan where (hanya menampilkan yang memiliki diskon dan di urutkan dari yang tertinggi
SELECT *FROM tr_penjualan
WHERE diskon_persen > 0
ORDER BY harga DESC;

show table status like 'tr_penjualan';

-- latihan mandiri 4
-- 1. Tampilkan semua kolom dari transaksi penjualan yang memiliki diskon dan diurutkan berdasarkan harga tertinggi.
SELECT *
FROM tr_penjualan
WHERE diskon_persen > 0
ORDER BY harga DESC;

-- 2. Tampilkan kolom nama_produk, kuantitas pembelian (qty), dan harga 
-- dari transaksi penjualan yang memiliki harga minimal 100.000 dan diurutkan berdasarkan harga tertinggi.
SELECT nama_produk, qty, harga
FROM tr_penjualan
WHERE harga >= 100000
ORDER BY harga DESC;

-- 3. Tampilkan kolom nama_produk, kuantitas pembelian dan harga 
-- dari transaksi penjualan yang memiliki harga minimal 100.000, dan nama_produk berawalan huruf 'T', 
-- serta diurutkan berdasarkan diskon tertinggi.
SELECT nama_produk, qty, harga
FROM tr_penjualan
WHERE harga >= 100000
  AND nama_produk LIKE 'T%'
ORDER BY diskon_persen DESC;





-- fungsi agregasi 
-- digunakan untuk mengolah beberapa  baris/row data untuk menghasilkan nilai baru
-- praktek 7

SELECT qty FROM tr_penjualan;
SELECT SUM(qty) FROM tr_penjualan;

-- praktek 8
-- hitung seluruh baris pada tabel penjualan
SELECT * FROM tr_penjualan;
SELECT COUNT(*) FROM tr_penjualan;

-- prakter 9 
-- menggunakan 2 fungsi agregasi dalam satu query sql
SELECT SUM(qty), COUNT(*) FROM tr_penjualan;

-- praktek 10
-- menghitung rata-rata pejualan penjualan tertinggi per transaksi dan penjualan terendah per transaksi
SELECT AVG(qty), MAX(qty), MIN(qty)
FROM tr_penjualan;

-- praktek 11
-- mengkombinasikan fungsi agregasi dengan kolom tertentu (nama produk, kolom tgl transaksi)
SELECT nama_produk, MAX(qty) FROM tr_penjualan;
SELECT tgl_transaksi, nama_produk, MAX(qty) FROM tr_penjualan;

-- praktek 12
-- COUNT(DISTINCT)
-- digunakan untuk menghitung nilai yang unik aja
-- menghitung nilai unik yang ada pada produk di tabel penjualan
SELECT COUNT(nama_produk) FROM tr_penjualan;

-- praktek 13
-- dengan distinct
SELECT COUNT(distinct nama_produk) FROM tr_penjualan;


-- Group BY ( mengelompokan isi data dari satu atau beberapa kolom, biasanya di gabung pada fungsi agregasi
-- group by 1 kolom
-- praktek 14
-- menegelompokan nilai nama produk pada tabel penjualan
select nama_produk from tr_penjualan group by nama_produk;

-- praktek 15
-- mengelompokan nilai nama produk dan qty pada tabel penjualan
select nama_produk, qty from tr_penjualan group by nama_produk, qty;

-- praktek 16
-- ambil namaproduk qty dari nama produk berdasarkan hasil pengelompokan nama produk
select nama_produk, SUM(qty) from tr_penjualan  group by nama_produk order by sum(qty) desc;



-- having (diguanakan sebagai filtering untuk group by dan fungsi agregasi
-- praktek 17
-- Digunakan untuk melakukan filtering setelah data dikelompokkan (GROUP BY).
SELECT nama_produk, SUM(qty) AS total_terjual
FROM tr_penjualan
GROUP BY nama_produk
HAVING SUM(qty) > 3;

-- praktek 18
SELECT nama_produk, SUM(qty) AS total_qty
FROM tr_penjualan
GROUP BY nama_produk
HAVING SUM(qty) > 2;





-- 1. Melihat daftar nama produk yang total jumlah produk terjual per kelompok nama produk adalah di atas nilai 4.
SELECT nama_produk, SUM(qty) AS total_terjual
FROM tr_penjualan
GROUP BY nama_produk
HAVING SUM(qty) > 4;


-- 2. Melihat daftar nama produk yang total jumlah produk terjual per kelompok nama produk sama dengan 9.
SELECT nama_produk, SUM(qty) AS total_terjual
FROM tr_penjualan
GROUP BY nama_produk
HAVING SUM(qty) = 9;


-- 3. Melihat daftar kelompok nama produk dan total nilai penjualan (harga dikalikan jumlah dikurangi diskon) 
-- dengan dan urutan berdasarkan nilai penjualan terbesar.
SELECT nama_produk, SUM(qty * harga - (diskon_persen / 100 * harga)) AS total_penjualan
FROM tr_penjualan
GROUP BY nama_produk
ORDER BY total_penjualan DESC;



-- konsul gagal
-- ambil nama produ dan qty dari tabel penjualan yang nama produknya berawalan huruf g dan qty lebih dari  2 urutkan berdasarkan qty 
SELECT nama_produk, qty
FROM tr_penjualan
WHERE nama_produk LIKE 'g%' AND qty > 2
ORDER BY qty;

