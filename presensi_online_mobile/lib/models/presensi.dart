class Presensi {
  int id;
  String tanggalPresensi;
  String tanggalAbsen = '';
  String jam = '';
  int status;
  int idJadwalMahasiswa;
  int idPresensi;
  String jamMulai;
  String jamAkhir;
  String kodePresensi;
  int idJadwal;

  Presensi(
      {this.id,
      this.tanggalPresensi,
      this.tanggalAbsen,
      this.jam,
      this.status,
      this.idJadwalMahasiswa,
      this.idPresensi,
      this.jamMulai,
      this.jamAkhir,
      this.kodePresensi,
      this.idJadwal});

  Presensi.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    tanggalPresensi = json['tanggal_presensi'];
    tanggalAbsen = json['tanggal_absen'];
    jam = json['jam'];
    status = json['status'];
    idJadwalMahasiswa = json['id_jadwal_mahasiswa'];
    idPresensi = json['id_presensi'];
    jamMulai = json['jam_mulai'];
    jamAkhir = json['jam_akhir'];
    kodePresensi = json['kode_presensi'];
    idJadwal = json['id_jadwal'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['tanggal_presensi'] = this.tanggalPresensi;
    data['tanggal_absen'] = this.tanggalAbsen;
    data['jam'] = this.jam;
    data['status'] = this.status;
    data['id_jadwal_mahasiswa'] = this.idJadwalMahasiswa;
    data['id_presensi'] = this.idPresensi;
    data['jam_mulai'] = this.jamMulai;
    data['jam_akhir'] = this.jamAkhir;
    data['kode_presensi'] = this.kodePresensi;
    data['id_jadwal'] = this.idJadwal;
    return data;
  }
}
