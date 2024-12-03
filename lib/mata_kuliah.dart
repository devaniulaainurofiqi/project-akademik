class MataKuliah {
  String kode;
  String nama;
  int sks;

  MataKuliah(this.kode, this.nama, this.sks);

  // Method untuk menampilkan informasi mata kuliah
  void tampilkanInfo() {
    print('Kode: $kode | Nama: $nama | SKS: $sks');
  }
}
