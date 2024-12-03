class Mahasiswa {
  String nim;
  String nama;
  int semester;

  Mahasiswa(this.nim, this.nama, this.semester);

  // Method untuk menampilkan informasi mahasiswa
  void tampilkanInfo() {
    print('NIM: $nim | Nama: $nama | Semester: $semester');
  }
}
