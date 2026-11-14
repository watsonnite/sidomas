<?php
// Migration script — jalankan sekali saja
try {
    $pdo = new PDO('mysql:host=localhost;port=3306;dbname=db_sidomas', 'root', '');
    $pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

    // 1) Tambah kolom skor_prioritas
    try {
        $pdo->exec('ALTER TABLE pengaduan ADD COLUMN skor_prioritas INT NOT NULL DEFAULT 0 AFTER status');
        echo "ALTER TABLE pengaduan: OK\n";
    } catch (Exception $e) {
        echo "ALTER TABLE pengaduan: " . $e->getMessage() . "\n";
    }

    // 2) Buat tabel pengaduan_history
    $pdo->exec("CREATE TABLE IF NOT EXISTS pengaduan_history (
        history_id INT(11) UNSIGNED NOT NULL AUTO_INCREMENT,
        pengaduan_id INT(11) UNSIGNED NOT NULL,
        status_lama VARCHAR(20) NULL DEFAULT NULL,
        status_baru VARCHAR(20) NOT NULL,
        keterangan TEXT NULL DEFAULT NULL,
        diubah_oleh VARCHAR(100) NOT NULL DEFAULT 'sistem',
        created_at DATETIME NULL DEFAULT NULL,
        PRIMARY KEY (history_id),
        KEY idx_pengaduan_id (pengaduan_id)
    ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci");
    echo "CREATE TABLE pengaduan_history: OK\n";

    echo "\nMigration selesai!\n";
} catch (Exception $e) {
    echo "ERROR: " . $e->getMessage() . "\n";
}
