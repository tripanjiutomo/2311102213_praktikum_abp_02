<?php
// 1. Menggunakan Array Asosiasi untuk menyimpan data mahasiswa
$data_mahasiswa = [
    [
        "nama" => "Tri",
        "nim" => "2311102213",
        "tugas" => 98,
        "uts" => 79,
        "uas" => 100
    ],
    [
        "nama" => "Panji",
        "nim" => "2311102213",
        "tugas" => 80,
        "uts" => 75,
        "uas" => 50
    ],
    [
        "nama" => "Rizky",
        "nim" => "2311102213",
        "tugas" => 82,
        "uts" => 98,
        "uas" => 85
    ],
    [
        "nama" => "Ridho",
        "nim" => "2311102213",
        "tugas" => 45,
        "uts" => 30,
        "uas" => 28
    ],
    [
        "nama" => "Anas",
        "nim" => "2311102213",
        "tugas" => 68,
        "uts" => 62,
        "uas" => 75
    ]
];

// 2. Function & Operator Aritmatika untuk menghitung nilai akhir
function hitungNilaiAkhir($tugas, $uts, $uas) {
    return ($tugas * 0.30) + ($uts * 0.35) + ($uas * 0.35);
}

// 3. Menggunakan if/else untuk menentukan grade
function tentukanGrade($nilai_akhir) {
    if ($nilai_akhir >= 85) {
        return "A";
    } elseif ($nilai_akhir >= 75) {
        return "B";
    } elseif ($nilai_akhir >= 65) {
        return "C";
    } elseif ($nilai_akhir >= 55) {
        return "D";
    } else {
        return "E";
    }
}

// 4. Menggunakan operator perbandingan untuk menentukan kelulusan
function tentukanStatus($grade) {
    if ($grade === "E") {
        return "Tidak Lulus";
    } else {
        return "Lulus";
    }
}

// Variabel untuk perhitungan rata-rata dan nilai tertinggi
$total_nilai_kelas = 0;
$nilai_tertinggi = 0;
$mahasiswa_tertinggi = "";
?>

<!DOCTYPE html>
<html lang="id">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Sistem Penilaian Mahasiswa</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f8f9fa;
            margin: 0;
            padding: 40px;
            color: #333;
        }
        .container {
            max-width: 1000px;
            margin: 0 auto;
            background-color: #fff;
            padding: 30px;
            border-radius: 8px;
            box-shadow: 0 2px 10px rgba(0,0,0,0.05);
        }
        .header-title {
            text-align: center;
            margin-bottom: 5px;
            color: #2c3e50;
        }
        .header-subtitle {
            text-align: center;
            color: #7f8c8d;
            font-size: 14px;
            margin-bottom: 30px;
        }
        table {
            width: 100%;
            border-collapse: collapse;
            margin-bottom: 20px;
        }
        th, td {
            padding: 12px 15px;
            text-align: center;
            border-bottom: 1px solid #ddd;
        }
        th {
            background-color: #4a90e2;
            color: white;
            font-weight: 600;
        }
        tr:hover {
            background-color: #f1f1f1;
        }
        td.nama-kiri {
            text-align: left;
        }
        .text-lulus {
            color: #27ae60;
            font-weight: bold;
        }
        .text-gagal {
            color: #c0392b;
            font-weight: bold;
        }
        .summary-box {
            display: flex;
            justify-content: space-between;
            border: 1px solid #ddd;
            padding: 15px 20px;
            background-color: #fff;
            border-radius: 4px;
            font-size: 14px;
        }
    </style>
</head>
<body>

<div class="container">
    <h2 class="header-title">Sistem Penilaian Mahasiswa Hood Research Departement</h2>
    <p class="header-subtitle">Tugas Pertemuan 3 &mdash; PHP</p>

    <table>
        <thead>
            <tr>
                <th>No</th>
                <th>Nama</th>
                <th>NIM</th>
                <th>Tugas</th>
                <th>UTS</th>
                <th>UAS</th>
                <th>Nilai Akhir</th>
                <th>Grade</th>
                <th>Status</th>
            </tr>
        </thead>
        <tbody>
            <?php
            // 5. Menggunakan Loop untuk menampilkan seluruh data
            $no = 1;
            foreach ($data_mahasiswa as $mhs) {
                // Proses Perhitungan
                $nilai_akhir = hitungNilaiAkhir($mhs['tugas'], $mhs['uts'], $mhs['uas']);
                $grade = tentukanGrade($nilai_akhir);
                $status = tentukanStatus($grade);
                
                // Menambahkan ke total kelas untuk rata-rata
                $total_nilai_kelas += $nilai_akhir;

                // Cek nilai tertinggi
                if ($nilai_akhir > $nilai_tertinggi) {
                    $nilai_tertinggi = $nilai_akhir;
                    $mahasiswa_tertinggi = $mhs['nama'];
                }

                // Styling text status kelulusan
                $class_status = ($status === "Lulus") ? "text-lulus" : "text-gagal";

                echo "<tr>";
                echo "<td>{$no}</td>";
                echo "<td class='nama-kiri'>{$mhs['nama']}</td>";
                echo "<td>{$mhs['nim']}</td>";
                echo "<td>{$mhs['tugas']}</td>";
                echo "<td>{$mhs['uts']}</td>";
                echo "<td>{$mhs['uas']}</td>";
                echo "<td><b>{$nilai_akhir}</b></td>";
                echo "<td>{$grade}</td>";
                echo "<td class='{$class_status}'>{$status}</td>";
                echo "</tr>";
                
                $no++;
            }
            
            // Perhitungan Rata-rata
            $rata_rata_kelas = $total_nilai_kelas / count($data_mahasiswa);
            ?>
        </tbody>
    </table>

    <div class="summary-box">
        <div>Rata-rata Kelas: <b><?= number_format($rata_rata_kelas, 2) ?></b></div>
        <div>Nilai Tertinggi: <b><?= $nilai_tertinggi ?></b> (<?= $mahasiswa_tertinggi ?>)</div>
        <div>Rumus: <b>Tugas&times;30% + UTS&times;35% + UAS&times;35%</b></div>
    </div>
</div>

</body>
</html>