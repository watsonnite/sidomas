-- ============================================================
-- Migration: Tabel Riwayat Status Pengaduan + Kolom Skor Prioritas
-- Jalankan SQL ini di phpMyAdmin
-- ============================================================

CREATE TABLE IF NOT EXISTS `pengaduan_history` (
    `history_id` INT(11) UNSIGNED NOT NULL AUTO_INCREMENT,
    `pengaduan_id` INT(11) UNSIGNED NOT NULL,
    `status_lama` VARCHAR(20) NULL DEFAULT NULL,
    `status_baru` VARCHAR(20) NOT NULL,
    `keterangan` TEXT NULL DEFAULT NULL,
    `diubah_oleh` VARCHAR(100) NOT NULL DEFAULT 'sistem',
    `created_at` DATETIME NULL DEFAULT NULL,
    PRIMARY KEY (`history_id`),
    KEY `idx_pengaduan_id` (`pengaduan_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Kolom skor prioritas untuk poin 6
ALTER TABLE `pengaduan` ADD COLUMN `skor_prioritas` INT NOT NULL DEFAULT 0 AFTER `status`;
