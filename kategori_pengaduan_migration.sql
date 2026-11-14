-- ============================================================
-- Migration: Kolom Kategori Pengaduan
-- Jalankan SQL ini di phpMyAdmin
-- ============================================================

ALTER TABLE `pengaduan` ADD COLUMN `kategori_pengaduan` VARCHAR(100) NULL DEFAULT NULL AFTER `isi_pengaduan`;
