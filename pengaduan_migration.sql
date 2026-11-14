-- ============================================================
-- Migration: Tabel Pengaduan Ormas
-- Jalankan SQL ini di phpMyAdmin
-- ============================================================

CREATE TABLE IF NOT EXISTS `pengaduan` (
    `pengaduan_id` INT(11) UNSIGNED NOT NULL AUTO_INCREMENT,
    `kode_pengaduan` VARCHAR(20) NOT NULL,
    `nama_pengadu` VARCHAR(100) NOT NULL,
    `alamat_pengadu` TEXT NOT NULL,
    `no_hp_pengadu` VARCHAR(20) NOT NULL,
    `email_pengadu` VARCHAR(100) NULL DEFAULT NULL,
    `ormas_id` INT(11) UNSIGNED NULL DEFAULT NULL,
    `nama_ormas_dilaporkan` VARCHAR(255) NOT NULL,
    `isi_pengaduan` TEXT NOT NULL,
    `bukti_pengaduan` VARCHAR(255) NULL DEFAULT NULL,
    `status` ENUM('masuk','diproses','selesai','ditolak') NOT NULL DEFAULT 'masuk',
    `tanggapan_admin` TEXT NULL DEFAULT NULL,
    `tanggapan_ormas` TEXT NULL DEFAULT NULL,
    `tanggal_tanggapan_admin` DATETIME NULL DEFAULT NULL,
    `tanggal_tanggapan_ormas` DATETIME NULL DEFAULT NULL,
    `created_at` DATETIME NULL DEFAULT NULL,
    `updated_at` DATETIME NULL DEFAULT NULL,
    `deleted_at` DATETIME NULL DEFAULT NULL,
    PRIMARY KEY (`pengaduan_id`),
    UNIQUE KEY `kode_pengaduan_unique` (`kode_pengaduan`),
    KEY `idx_ormas_id` (`ormas_id`),
    KEY `idx_status` (`status`),
    KEY `idx_kode` (`kode_pengaduan`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
