-- ============================================================
-- Migration: Refactor Tabel Pengaduan
-- Gabungkan pengaduan_history, tambah jenis & tingkat pengaduan
-- Jalankan SQL ini di phpMyAdmin
-- ============================================================

-- 1. Tambah kolom jenis_pengaduan
ALTER TABLE `pengaduan`
  ADD COLUMN `jenis_pengaduan` ENUM('Pengaduan','Kritik','Saran') NOT NULL DEFAULT 'Pengaduan'
  AFTER `kategori_pengaduan`;

-- 2. Tambah kolom tingkat_pengaduan (counter bisnis, BUKAN auto_increment)
ALTER TABLE `pengaduan`
  ADD COLUMN `tingkat_pengaduan` INT UNSIGNED NOT NULL DEFAULT 1
  AFTER `jenis_pengaduan`;

-- 3. Ubah kolom tanggal dari DATETIME ke TIMESTAMP
ALTER TABLE `pengaduan`
  MODIFY COLUMN `created_at` TIMESTAMP NULL DEFAULT NULL,
  MODIFY COLUMN `updated_at` TIMESTAMP NULL DEFAULT NULL,
  MODIFY COLUMN `deleted_at` TIMESTAMP NULL DEFAULT NULL,
  MODIFY COLUMN `tanggal_tanggapan_admin` TIMESTAMP NULL DEFAULT NULL,
  MODIFY COLUMN `tanggal_tanggapan_ormas` TIMESTAMP NULL DEFAULT NULL;

-- 4. Tambah index gabungan untuk pencarian pengadu berulang
--    (bukan unique, bukan primary — satu pengadu boleh punya banyak baris)
ALTER TABLE `pengaduan`
  ADD INDEX `idx_pengadu_berulang` (`nama_pengadu`, `no_hp_pengadu`);

-- 5. Drop tabel pengaduan_history (sudah tidak dibutuhkan)
DROP TABLE IF EXISTS `pengaduan_history`;
