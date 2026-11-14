-- =====================================================
-- Tabel Utility untuk menyimpan pilihan-pilihan dinamis
-- =====================================================

CREATE TABLE IF NOT EXISTS `utility` (
    `utility_id` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
    `kategori` VARCHAR(100) NOT NULL COMMENT 'Kategori utility, misal: bidang_ormas',
    `nilai` VARCHAR(255) NOT NULL COMMENT 'Nilai/nama pilihan',
    `urutan` INT(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'Urutan tampil',
    `aktif` TINYINT(1) NOT NULL DEFAULT 1 COMMENT '1=aktif, 0=nonaktif',
    `created_at` DATETIME DEFAULT NULL,
    `updated_at` DATETIME DEFAULT NULL,
    `deleted_at` DATETIME DEFAULT NULL,
    PRIMARY KEY (`utility_id`),
    KEY `idx_kategori` (`kategori`),
    KEY `idx_kategori_aktif` (`kategori`, `aktif`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- =====================================================
-- Insert data bidang ormas (20 bidang)
-- =====================================================

INSERT INTO `utility` (`kategori`, `nilai`, `urutan`, `aktif`, `created_at`) VALUES
('bidang_ormas', 'Agama', 1, 1, NOW()),
('bidang_ormas', 'Sosial & Kemanusiaan', 2, 1, NOW()),
('bidang_ormas', 'Pendidikan', 3, 1, NOW()),
('bidang_ormas', 'Kepemudaan & Kemahasiswaan', 4, 1, NOW()),
('bidang_ormas', 'Perempuan & Keluarga', 5, 1, NOW()),
('bidang_ormas', 'Profesi & Keahlian', 6, 1, NOW()),
('bidang_ormas', 'Ekonomi & Koperasi', 7, 1, NOW()),
('bidang_ormas', 'Budaya & Seni', 8, 1, NOW()),
('bidang_ormas', 'Lingkungan Hidup', 9, 1, NOW()),
('bidang_ormas', 'Hukum & HAM', 10, 1, NOW()),
('bidang_ormas', 'Kesehatan', 11, 1, NOW()),
('bidang_ormas', 'Pertahanan & Bela Negara', 12, 1, NOW()),
('bidang_ormas', 'Olahraga', 13, 1, NOW()),
('bidang_ormas', 'Teknologi & Informasi', 14, 1, NOW()),
('bidang_ormas', 'Pertanian & Nelayan', 15, 1, NOW()),
('bidang_ormas', 'Perlindungan Anak', 16, 1, NOW()),
('bidang_ormas', 'Veteran & Pejuang', 17, 1, NOW()),
('bidang_ormas', 'Kedaerahan & Kesukuan', 18, 1, NOW()),
('bidang_ormas', 'Pariwisata', 19, 1, NOW()),
('bidang_ormas', 'Pangan & Gizi', 20, 1, NOW());
