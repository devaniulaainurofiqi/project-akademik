import 'mata_kuliah.dart';

class KRS {
  List<MataKuliah> daftarMataKuliah = [];

  // Method untuk menambahkan mata kuliah ke KRS
  void tambahMataKuliah(MataKuliah mataKuliah) {
    daftarMataKuliah.add(mataKuliah);
    print('${mataKuliah.nama} berhasil ditambahkan ke KRS.');
  }

  // Method untuk menampilkan daftar mata kuliah dalam KRS
  void tampilkanKRS() {
    if (daftarMataKuliah.isEmpty) {
      print('KRS kosong. Belum ada mata kuliah yang diambil.');
      return;
    }

    print('--- Kartu Rencana Studi ---');
    for (var mataKuliah in daftarMataKuliah) {
      mataKuliah.tampilkanInfo();
    }
  }
}
