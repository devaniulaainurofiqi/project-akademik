import 'mata_kuliah.dart';

class Nilai {
  MataKuliah mataKuliah;
  double nilai;
  late String nilaiHuruf;
  late double nilaiIPK;

  Nilai(this.mataKuliah, this.nilai) {
    nilaiHuruf = konversiNilaiKeHuruf(nilai);
    nilaiIPK = konversiNilaiKeIPK(nilaiHuruf);
  }

  // Method untuk mengkonversi nilai numerik ke nilai huruf
  String konversiNilaiKeHuruf(double nilaiAngka) {
    if (nilaiAngka >= 80) {
      return 'A';
    } else if (nilaiAngka >= 70) {
      return 'B';
    } else if (nilaiAngka >= 60) {
      return 'C';
    } else if (nilaiAngka >= 40) {
      return 'D';
    } else if (nilaiAngka >= 20) {
      return 'E';
    } else {
      return 'F';
    }
  }

  // Method untuk mengkonversi nilai huruf ke IPK
  double konversiNilaiKeIPK(String nilaiHuruf) {
    switch (nilaiHuruf) {
      case 'A':
        return 4.0;
      case 'B':
        return 3.5;
      case 'C':
        return 3.0;
      case 'D':
        return 2.0;
      case 'E':
        return 1.0;
      default:
        return 0.0;
    }
  }

  // Method untuk menampilkan informasi nilai
  void tampilkanNilai() {
    print(
        'Mata Kuliah: ${mataKuliah.nama} | SKS: ${mataKuliah.sks} | Nilai: $nilai | Huruf: $nilaiHuruf | IPK: $nilaiIPK');
  }
}

// Class untuk mengelola daftar nilai dan menghitung IPK
class Transkrip {
  List<Nilai> daftarNilai = [];

  // Method untuk menambahkan nilai ke dalam transkrip
  void tambahNilai(Nilai nilai) {
    daftarNilai.add(nilai);
    print('Nilai untuk ${nilai.mataKuliah.nama} berhasil ditambahkan.');
  }

  // Method untuk menghitung IPK
  double hitungIPK() {
    if (daftarNilai.isEmpty) {
      print('Belum ada nilai. IPK tidak dapat dihitung.');
      return 0.0;
    }

    double totalNilaiXSKS = 0.0;
    int totalSKS = 0;

    for (var nilai in daftarNilai) {
      totalNilaiXSKS += nilai.nilaiIPK * nilai.mataKuliah.sks;
      totalSKS += nilai.mataKuliah.sks;
    }

    return totalSKS > 0 ? totalNilaiXSKS / totalSKS : 0.0;
  }

  // Method untuk menampilkan transkrip nilai
  void tampilkanTranskrip() {
    if (daftarNilai.isEmpty) {
      print('Belum ada nilai yang tersedia.');
      return;
    }

    print('--- Transkrip Nilai ---');
    for (var nilai in daftarNilai) {
      nilai.tampilkanNilai();
    }

    double ipk = hitungIPK();
    print('--- IPK: ${ipk.toStringAsFixed(2)} ---');
  }
}
