-- 1. Buat database
CREATE DATABASE IF NOT EXISTS gojek;
USE gojek;

-- 2. Tabel DRIVER
CREATE TABLE Driver (
    NIK VARCHAR(20) PRIMARY KEY,
    Nama VARCHAR(100),
    TTL DATE,
    Alamat TEXT,
    No_Hp VARCHAR(15),
    Email VARCHAR(100)
);

-- 3. Tabel PENGGUNA
CREATE TABLE Pengguna (
    NIK VARCHAR(20) PRIMARY KEY,
    Nama VARCHAR(100),
    TTL DATE,
    Alamat TEXT,
    No_Hp VARCHAR(15),
    Email VARCHAR(100)
);

-- 4. Tabel TRANSPORTASI
CREATE TABLE Transportasi (
    Plat VARCHAR(15) PRIMARY KEY,
    Jenis_Kendaraan VARCHAR(50),
    Warna VARCHAR(30)
);

-- 5. Tabel LAYANAN_GOFOOD
CREATE TABLE Layanan_GOFOOD (
    No_Pemesanan VARCHAR(20) PRIMARY KEY,
    Nama_Pelanggan VARCHAR(100),
    Alamat_Pengiriman TEXT,
    Tanggal_Pemesanan DATE
);

-- 6. Tabel PEMBAYARAN
CREATE TABLE Pembayaran (
    ID_Pembayaran VARCHAR(20) PRIMARY KEY,
    No_Pemesanan VARCHAR(20),
    Metode VARCHAR(50),
    Total INT
);

-- 7. Tabel BEKERJA (relasi Driver - Transportasi)
CREATE TABLE Bekerja (
    NIK_Driver VARCHAR(20),
    Plat VARCHAR(15),
    PRIMARY KEY (NIK_Driver, Plat)
);

-- 8. Tabel PEKERJAAN (relasi Driver - Layanan_GOFOOD)
CREATE TABLE Pekerjaan (
    NIK_Driver VARCHAR(20),
    No_Pemesanan VARCHAR(20),
    PRIMARY KEY (NIK_Driver, No_Pemesanan)
);

-- 9. Tabel MEMBAYAR (relasi Pengguna - Pembayaran)
CREATE TABLE Membayar (
    NIK_Pengguna VARCHAR(20),
    ID_Pembayaran VARCHAR(20),
    PRIMARY KEY (NIK_Pengguna, ID_Pembayaran)
);

-- 10. Tabel JASA (relasi Transportasi - Layanan_GOFOOD)
CREATE TABLE Jasa (
    No_Pemesanan VARCHAR(20),
    Plat VARCHAR(15),
    PRIMARY KEY (No_Pemesanan, Plat)
);

-- 11. ALTER TABLE: Foreign Key Constraints
ALTER TABLE Pembayaran
    ADD CONSTRAINT fk_pembayaran_pesanan
    FOREIGN KEY (No_Pemesanan) REFERENCES Layanan_GOFOOD(No_Pemesanan);

ALTER TABLE Bekerja
    ADD CONSTRAINT fk_bekerja_driver
    FOREIGN KEY (NIK_Driver) REFERENCES Driver(NIK),
    ADD CONSTRAINT fk_bekerja_transportasi
    FOREIGN KEY (Plat) REFERENCES Transportasi(Plat);

ALTER TABLE Pekerjaan
    ADD CONSTRAINT fk_pekerjaan_driver
    FOREIGN KEY (NIK_Driver) REFERENCES Driver(NIK),
    ADD CONSTRAINT fk_pekerjaan_pesanan
    FOREIGN KEY (No_Pemesanan) REFERENCES Layanan_GOFOOD(No_Pemesanan);

ALTER TABLE Membayar
    ADD CONSTRAINT fk_membayar_pengguna
    FOREIGN KEY (NIK_Pengguna) REFERENCES Pengguna(NIK),
    ADD CONSTRAINT fk_membayar_pembayaran
    FOREIGN KEY (ID_Pembayaran) REFERENCES Pembayaran(ID_Pembayaran);

ALTER TABLE Jasa
    ADD CONSTRAINT fk_jasa_pesanan
    FOREIGN KEY (No_Pemesanan) REFERENCES Layanan_GOFOOD(No_Pemesanan),
    ADD CONSTRAINT fk_jasa_transportasi
    FOREIGN KEY (Plat) REFERENCES Transportasi(Plat);

-- 12. INSERT DATA DRIVER
INSERT INTO Driver VALUES
('DRV001', 'Budi Santoso', '1990-01-01', 'Jl. Mawar 1', '081234567890', 'budi@gojek.com'),
('DRV002', 'Siti Aminah', '1991-02-02', 'Jl. Melati 2', '081234567891', 'siti@gojek.com'),
('DRV003', 'Agus Salim', '1992-03-03', 'Jl. Kamboja 3', '081234567892', 'agus@gojek.com'),
('DRV004', 'Dewi Lestari', '1993-04-04', 'Jl. Kenanga 4', '081234567893', 'dewi@gojek.com'),
('DRV005', 'Joko Widodo', '1994-05-05', 'Jl. Anggrek 5', '081234567894', 'joko@gojek.com');

-- 13. INSERT DATA PENGGUNA
INSERT INTO Pengguna VALUES
('PGN001', 'Andi Saputra', '1995-06-06', 'Jl. Cemara 1', '081234561111', 'andi@user.com'),
('PGN002', 'Rina Marlina', '1996-07-07', 'Jl. Duku 2', '081234562222', 'rina@user.com'),
('PGN003', 'Tono Suprapto', '1997-08-08', 'Jl. Salak 3', '081234563333', 'tono@user.com'),
('PGN004', 'Maya Sari', '1998-09-09', 'Jl. Pisang 4', '081234564444', 'maya@user.com'),
('PGN005', 'Doni Ramadhan', '1999-10-10', 'Jl. Manggis 5', '081234565555', 'doni@user.com');

-- 14. INSERT DATA TRANSPORTASI
INSERT INTO Transportasi VALUES
('B1234AA', 'Motor', 'Merah'),
('B2234BB', 'Motor', 'Hitam'),
('B3234CC', 'Motor', 'Putih'),
('B4234DD', 'Mobil', 'Biru'),
('B5234EE', 'Mobil', 'Silver');

-- 15. INSERT DATA LAYANAN_GOFOOD
INSERT INTO Layanan_GOFOOD VALUES
('ORD001', 'Andi Saputra', 'Jl. Cemara 1', '2025-04-01'),
('ORD002', 'Rina Marlina', 'Jl. Duku 2', '2025-04-02'),
('ORD003', 'Tono Suprapto', 'Jl. Salak 3', '2025-04-03'),
('ORD004', 'Maya Sari', 'Jl. Pisang 4', '2025-04-04'),
('ORD005', 'Doni Ramadhan', 'Jl. Manggis 5', '2025-04-05');

-- 16. INSERT DATA PEMBAYARAN
INSERT INTO Pembayaran VALUES
('PAY001', 'ORD001', 'Gopay', 45000),
('PAY002', 'ORD002', 'Tunai', 50000),
('PAY003', 'ORD003', 'Gopay', 47000),
('PAY004', 'ORD004', 'Kartu Kredit', 60000),
('PAY005', 'ORD005', 'Gopay', 52000);

-- 17. INSERT DATA RELASI BEKERJA
INSERT INTO Bekerja VALUES
('DRV001', 'B1234AA'),
('DRV002', 'B2234BB'),
('DRV003', 'B3234CC'),
('DRV004', 'B4234DD'),
('DRV005', 'B5234EE');

-- 18. INSERT DATA RELASI PEKERJAAN
INSERT INTO Pekerjaan VALUES
('DRV001', 'ORD001'),
('DRV002', 'ORD002'),
('DRV003', 'ORD003'),
('DRV004', 'ORD004'),
('DRV005', 'ORD005');

-- 19. INSERT DATA RELASI MEMBAYAR
INSERT INTO Membayar VALUES
('PGN001', 'PAY001'),
('PGN002', 'PAY002'),
('PGN003', 'PAY003'),
('PGN004', 'PAY004'),
('PGN005', 'PAY005');

-- 20. INSERT DATA RELASI JASA
INSERT INTO Jasa VALUES
('ORD001', 'B1234AA'),
('ORD002', 'B2234BB'),
('ORD003', 'B3234CC'),
('ORD004', 'B4234DD'),
('ORD005', 'B5234EE');

SELECT * FROM Driver;
SELECT * FROM Pengguna;
SELECT * FROM Transportasi;
SELECT * FROM Layanan_GOFOOD;
SELECT * FROM Pembayaran;
