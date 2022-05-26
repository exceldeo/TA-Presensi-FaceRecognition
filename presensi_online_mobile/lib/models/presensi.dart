class Presensi {
  String tanggalAbsen = '';
  String tanggalPresensi;
  String jamMulai;
  String jamAkhir;
  String jam = '';
  int status;

  Presensi(
      {this.tanggalAbsen,
      this.tanggalPresensi,
      this.jamMulai,
      this.jamAkhir,
      this.jam,
      this.status});

  Presensi.fromJson(Map<String, dynamic> json) {
    tanggalAbsen = json['tanggal_absen'];
    tanggalPresensi = json['tanggal_presensi'];
    jamMulai = json['jam_mulai'];
    jamAkhir = json['jam_akhir'];
    jam = json['jam'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['tanggal_absen'] = this.tanggalAbsen;
    data['tanggal_presensi'] = this.tanggalPresensi;
    data['jam_mulai'] = this.jamMulai;
    data['jam_akhir'] = this.jamAkhir;
    data['jam'] = this.jam;
    data['status'] = this.status;
    return data;
  }
}
