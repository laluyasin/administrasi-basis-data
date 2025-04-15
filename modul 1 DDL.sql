-- Nama : lalu mas'ud yasin
-- Nim : 23241068
-- kelas : B 

-- membuat database
CREATE DATABASE mandalika_mart;
USE mandalika_mart;






-- membbuat tabel dalam database mandalika mart
CREATE TABLE member (
	member_id varchar(10),
    username varchar(20),
    nama varchar(100),
    tanggal_lahir datetime,
    angka_favorit INT);
    
CREATE TABLE produk (
	id_produk varchar(10),
    nama_produk varchar(25),
    kategori varchar(15),
    harga int,
    qty int);
    
CREATE TABLE transaksi_penjualan (
	tgl_jual datetime,
    id_produk varchar(10),
    member_id varchar(10),
    nama_produk varchar(25),
    harga int,
    qty int);
    
-- mengupdate primary key table table member, produk
ALTER TABLE member
ADD PRIMARY KEY (member_id);

ALTER TABLE produk
ADD PRIMARY KEY (id_produk);

-- mengupdate foreign key table transaksi_penjualan
ALTER TABLE transaksi_penjualan
ADD CONSTRAINT FK_memberTransaksi
FOREIGN KEY (member_id) REFERENCES member (member_id);

ALTER TABLE transaksi_penjualan
ADD CONSTRAINT FK_memberTransaksi
FOREIGN KEY (id_produk) REFERENCES produk(id_produk);

-- mengisi data pada tabel
INSERT INTO member (member_id, username, nama, tanggal_lahir, angka_favorit)
VALUES ('ID-01' 'masud','lalu','2004-11-03','7');

-- mengakses isi data pada tabel member
SELECT 'FROM member';
