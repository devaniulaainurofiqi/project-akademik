// File: bin/akademik_main.dart
import '../lib/mahasiswa.dart';
import '../lib/mata_kuliah.dart';
import '../lib/krs.dart';
import '../lib/nilai.dart';
import 'dart:io';

void main() {
  // Inisialisasi data
  Mahasiswa mahasiswa = Mahasiswa('2024001', 'Budi Santoso', 4);
  KRS krs = KRS();
  Transkrip transkrip = Transkrip();

  // Daftar mata kuliah
  List<MataKuliah> daftarMataKuliah = [
    MataKuliah('MK001', 'Matematika', 3),
    MataKuliah('MK002', 'Pemrograman', 4),
    MataKuliah('MK003', 'Jaringan', 3),
  ];

  // Loop menu utama
  while (true) {
    print('\n' + '=' * 40);
    print('=== Sistem Akademik ===');
    print('=' * 40);
    print('1. Tampilkan Data Mahasiswa');
    print('2. Tampilkan Daftar Mata Kuliah');
    print('3. Tambah Mata Kuliah ke KRS');
    print('4. Tampilkan KRS');
    print('5. Input Nilai Mata Kuliah');
    print('6. Tampilkan Transkrip Nilai');
    print('7. Keluar');
    stdout.write('Pilih menu (1-7): ');
    String? input = stdin.readLineSync();

    switch (input) {
      case '1':
        print('\n' + '=' * 40);
        print('=== Data Mahasiswa ===');
        print('=' * 40);
        mahasiswa.tampilkanInfo();
        break;
      case '2':
        print('\n' + '=' * 40);
        print('=== Daftar Mata Kuliah ===');
        print('=' * 40);
        for (var mataKuliah in daftarMataKuliah) {
          mataKuliah.tampilkanInfo();
        }
        break;
      case '3':
        print('\n' + '=' * 40);
        print('=== Tambah Mata Kuliah ke KRS ===');
        print('=' * 40);
        stdout.write('Masukkan kode mata kuliah: ');
        String? kode = stdin.readLineSync();

        var mataKuliah = daftarMataKuliah.firstWhere(
          (mk) => mk.kode.toLowerCase() == kode?.toLowerCase(),
          orElse: () => MataKuliah('', 'Tidak Ditemukan', 0),
        );

        if (mataKuliah.kode.isNotEmpty) {
          krs.tambahMataKuliah(mataKuliah);
        } else {
          print('Mata kuliah tidak ditemukan.');
        }
        break;
      case '4':
        print('\n' + '=' * 40);
        print('=== Kartu Rencana Studi ===');
        print('=' * 40);
        krs.tampilkanKRS();
        break;
      case '5':
        print('\n' + '=' * 40);
        print('=== Input Nilai Mata Kuliah ===');
        print('=' * 40);
        stdout.write('Masukkan kode mata kuliah: ');
        String? kode = stdin.readLineSync();

        var mataKuliah = krs.daftarMataKuliah.firstWhere(
          (mk) => mk.kode.toLowerCase() == kode?.toLowerCase(),
          orElse: () => MataKuliah('', 'Tidak Ditemukan', 0),
        );

        if (mataKuliah.kode.isNotEmpty) {
          stdout.write('Masukkan nilai (0-100): ');
          String? nilaiInput = stdin.readLineSync();
          double? nilai = double.tryParse(nilaiInput ?? '');

          if (nilai != null && nilai >= 0 && nilai <= 100) {
            transkrip.tambahNilai(Nilai(mataKuliah, nilai));
          } else {
            print('Nilai tidak valid.');
          }
        } else {
          print('Mata kuliah tidak ditemukan di KRS.');
        }
        break;
      case '6':
        print('\n' + '=' * 40);
        print('=== Transkrip Nilai ===');
        print('=' * 40);
        transkrip.tampilkanTranskrip();
        break;
      case '7':
        print('Keluar dari sistem.');
        return;
      default:
        print('Pilihan tidak valid.');
    }
  }
}
