CREATE DATABASE IF NOT EXISTS jasa_kirim_amma CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
USE jasa_kirim_amma;
SET FOREIGN_KEY_CHECKS=0;
DROP TABLE IF EXISTS rating,chat,pengiriman,kurir,users;
SET FOREIGN_KEY_CHECKS=1;

CREATE TABLE users(
 id INT AUTO_INCREMENT PRIMARY KEY, nama VARCHAR(100) NOT NULL, username VARCHAR(50) UNIQUE NOT NULL,
 password VARCHAR(255) NOT NULL, role ENUM('admin','customer','kurir') NOT NULL DEFAULT 'customer', aktif TINYINT(1) NOT NULL DEFAULT 1, created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
CREATE TABLE kurir(
 id INT AUTO_INCREMENT PRIMARY KEY, user_id INT NOT NULL, nama VARCHAR(100) NOT NULL, telepon VARCHAR(30),
 foto VARCHAR(255) DEFAULT 'default.svg', kendaraan VARCHAR(50), plat_nomor VARCHAR(30),
 lat DECIMAL(10,7) NULL, lng DECIMAL(10,7) NULL, last_location_at DATETIME NULL, tersedia TINYINT(1) DEFAULT 1, aktif TINYINT(1) DEFAULT 1,
 rating_avg DECIMAL(3,2) DEFAULT 5.00, rating_count INT DEFAULT 0, created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
 INDEX(user_id), INDEX(lat,lng), INDEX(tersedia,aktif)
);
CREATE TABLE pengiriman(
 id INT AUTO_INCREMENT PRIMARY KEY, kode VARCHAR(30) UNIQUE NOT NULL, customer_id INT NOT NULL, kurir_id INT NULL,
 nama_pengirim VARCHAR(100), telepon_pengirim VARCHAR(30), alamat_asal TEXT, lat_asal DECIMAL(10,7), lng_asal DECIMAL(10,7),
 nama_penerima VARCHAR(100), telepon_penerima VARCHAR(30), alamat_tujuan TEXT, lat_tujuan DECIMAL(10,7), lng_tujuan DECIMAL(10,7),
 jarak_km DECIMAL(10,2) DEFAULT 0, berat DECIMAL(10,2) DEFAULT 1, layanan ENUM('Motor','Mobil') DEFAULT 'Motor',
 harga_dasar DECIMAL(14,2) DEFAULT 0, biaya_jarak DECIMAL(14,2) DEFAULT 0, biaya_berat DECIMAL(14,2) DEFAULT 0, harga DECIMAL(14,2) DEFAULT 0,
 estimasi_menit INT DEFAULT 0, metode_bayar ENUM('Cash','Transfer','QRIS') DEFAULT 'Cash',
 status ENUM('Menunggu','Mencari Kurir','Diproses','Diambil','Dalam Perjalanan','Selesai','Dibatalkan') DEFAULT 'Menunggu', catatan TEXT, created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
 INDEX(customer_id), INDEX(kurir_id), INDEX(status)
);
CREATE TABLE chat(
 id INT AUTO_INCREMENT PRIMARY KEY, pengiriman_id INT NOT NULL, user_id INT NOT NULL, nama_pengirim VARCHAR(100), pesan TEXT NOT NULL, created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP, INDEX(pengiriman_id)
);
CREATE TABLE rating(
 id INT AUTO_INCREMENT PRIMARY KEY, pengiriman_id INT NOT NULL UNIQUE, customer_id INT NOT NULL, kurir_id INT NOT NULL, nilai TINYINT NOT NULL, komentar VARCHAR(255), created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

INSERT INTO users(nama,username,password,role) VALUES
('Administrator','admin','$2y$12$07N5pvOQpKkTLlDjQAEQaukwDHMknll9wpQy6DRfyrs8bnAnXl7zy','admin'),
('Pelanggan Demo','pelanggan','$2y$12$0rcHK9djBqnBV2Tx2EFcG.es/rNwoMcLG7OBbGUiX7yVuaH0Qpk5C','customer'),
('Kurir Demo','kurir','$2y$12$rNFHxtzn3fA54STnBBUSI.hoeulz1c8iDF5WD8FTZw5fUKBC6t6.q','kurir');
INSERT INTO kurir(user_id,nama,telepon,foto,kendaraan,plat_nomor,lat,lng,tersedia,aktif,rating_avg,rating_count) VALUES(3,'Kurir Demo','081234567890','default.svg','Motor','BA 1234 AM',-0.9471,100.4172,1,1,5,0);
