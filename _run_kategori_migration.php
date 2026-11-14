<?php
// Script sementara untuk menjalankan migration kategori_pengaduan
$conn = new mysqli('localhost', 'root', '', 'db_sidomas', 3306);
if ($conn->connect_error) {
    die('GAGAL KONEKSI: ' . $conn->connect_error);
}

$sql = "ALTER TABLE `pengaduan` ADD COLUMN `kategori_pengaduan` VARCHAR(100) NULL DEFAULT NULL AFTER `isi_pengaduan`";
if ($conn->query($sql)) {
    echo "SUKSES: kolom kategori_pengaduan berhasil ditambahkan.\n";
} else {
    echo "ERROR: " . $conn->error . "\n";
}

$conn->close();
