-- Nama  : Lalu Mas'ud Yasin
-- Kelas : B
-- Modul : Modul 5 : JOIN, UNION, LIMIT

-- menggunakan database 
USE PTI_mart;

-- JOIN 
-- Menghubungkan dua buah tabel berasarkan kolom yang sama 

-- Praktek 1
-- Ambil nama pelanggan yang pernah bertransaksi beserta qty nya 
-- artinya ambil kolom kode_pelanggan, nama_pelanggan, dan qty dari 
-- penggabungan tabel pennualan dan tabel pelangan 

SELECT tp.kode_pelanggan, mp.nama_pelanggan, tp.qty
FROM tr_penjualan as tp
JOIN ms_pelanggan as mp
ON tp.kode_pelanggan = mp.kode_pelanggan;

-- Praktek 2
-- menggunakan dua tabel tanpa memperhatikan relatioal keys
-- Ambil nama pelanggan yang pernah bertransaksi beserta qty
-- mengabungan tabel penjualan dan tabel pelanggan tanpa memperhatikan kolom yang menjadi primery key

SELECT tp.kode_pelanggan, mp.nama_pelanggan, tp.qty 
FROM tr_penjualan as tp
JOIN ms_pelanggan as mp
ON TRUE;

-- INER JOIN
-- join yang mengambil data dari dua sisi tabel yang berhubungan 
-- Praktek 3
-- Ambil kode pelnggan, nama roduk, qty
-- Dari hasil join tanel penjualan dan tabel pelanggan

SELECT tp.kode_pelanggan, mp.nama_pelanggan, tp.nama_produk, tp.qty
FROM tr_penjualan as tp
INNER JOIN ms_pelanggan as mp
ON TRUE; 



-- 1. INNER JOIN ke-3 tabel  Buatlah join untuk ketiga table yang terdapat pada dqlabmartbasic dengan INNER JOIN
SELECT 
    p.nama_pelanggan,
    pr.nama_produk,
    t.qty,
    t.harga,
    t.diskon_persen
FROM 
    tr_penjualan AS t
INNER JOIN 
    ms_pelanggan AS p ON t.kode_pelanggan = p.kode_pelanggan
INNER JOIN 
    ms_produk AS pr ON t.kode_produk = pr.kode_produk;

-- 2. LEFT JOIN + IS NOT NULL Buatlah join untuk ketiga table dengan urutan ms_pelanggan, tr_penjualan, dan ms_produk... filter untuk qty yang tidak bernilai NULL
SELECT 
    p.nama_pelanggan,
    t.kode_transaksi,
    pr.nama_produk,
    t.qty
FROM 
    ms_pelanggan AS p
LEFT JOIN 
    tr_penjualan AS t ON p.kode_pelanggan = t.kode_pelanggan
LEFT JOIN 
    ms_produk AS pr ON t.kode_produk = pr.kode_produk
WHERE 
    t.qty IS NOT NULL;
 --  3. INNER JOIN + GROUP BY kategori produk + SUM qty INNER JOIN, kemudian tampilkan grouping untuk kolom kategori produk dan penjumlahan qty
 SELECT 
    pr.kategori_produk,
    SUM(t.qty) AS total_qty
FROM 
    tr_penjualan AS t
INNER JOIN 
    ms_produk AS pr ON t.kode_produk = pr.kode_produk
GROUP BY 
    pr.kategori_produk;

 -- 4. Latihan Khusus – JOIN ms_produk dengan ms_produk JOIN ms_produk dengan dirinya sendiri lewat kode_produk, gunakan alias
 SELECT 
    p1.kode_produk,
    p1.nama_produk AS produk_asli,
    p2.nama_produk AS produk_join
FROM 
    ms_produk AS p1
JOIN 
    ms_produk AS p2 ON p1.kode_produk = p2.kode_produk;






