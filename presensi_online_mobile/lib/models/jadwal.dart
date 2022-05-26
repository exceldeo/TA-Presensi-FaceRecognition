class Jadwal {
  int idJadwal;
  String hari;
  String jamMulai;
  String jamAkhir;
  int idKelas;
  int idMatakuliah;
  String nip;
  String namaDosen;
  String kodeMatakuliah;
  String namaMatakuliah;
  String namaKelas;
  String lokasiKelas;
  int idJadwalMahasiswa;

  Jadwal(
      {this.idJadwal,
      this.hari,
      this.jamMulai,
      this.jamAkhir,
      this.idKelas,
      this.idMatakuliah,
      this.nip,
      this.namaDosen,
      this.kodeMatakuliah,
      this.namaMatakuliah,
      this.namaKelas,
      this.lokasiKelas,
      this.idJadwalMahasiswa});

  Jadwal.fromJson(Map<String, dynamic> json) {
    idJadwal = json['id_jadwal'];
    hari = json['hari'];
    jamMulai = json['jam_mulai'];
    jamAkhir = json['jam_akhir'];
    idKelas = json['id_kelas'];
    idMatakuliah = json['id_matakuliah'];
    nip = json['nip'];
    namaDosen = json['nama_dosen'];
    kodeMatakuliah = json['kode_matakuliah'];
    namaMatakuliah = json['nama_matakuliah'];
    namaKelas = json['nama_kelas'];
    lokasiKelas = json['lokasi_kelas'];
    idJadwalMahasiswa = json['id_jadwal_mahasiswa'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id_jadwal'] = this.idJadwal;
    data['hari'] = this.hari;
    data['jam_mulai'] = this.jamMulai;
    data['jam_akhir'] = this.jamAkhir;
    data['id_kelas'] = this.idKelas;
    data['id_matakuliah'] = this.idMatakuliah;
    data['nip'] = this.nip;
    data['nama_dosen'] = this.namaDosen;
    data['kode_matakuliah'] = this.kodeMatakuliah;
    data['nama_matakuliah'] = this.namaMatakuliah;
    data['nama_kelas'] = this.namaKelas;
    data['lokasi_kelas'] = this.lokasiKelas;
    data['id_jadwal_mahasiswa'] = this.idJadwalMahasiswa;
    return data;
  }
}
