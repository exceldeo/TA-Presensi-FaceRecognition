class Jadwal {
  int idJadwal;
  int id;
  String hari;
  String jamMulai;
  String jamAkhir;
  int tahunAjaran;
  int semester;
  int idKelas;
  int idMatakuliah;
  String idDosen;
  String nip;
  String namaDosen;
  String password;
  String email;
  String departement;
  String role;
  String kodeMatakuliah;
  String namaMatakuliah;
  String namaKelas;
  String lokasiKelas;
  int idJadwalMahasiswa;

  Jadwal(
      {this.idJadwal,
      this.id,
      this.hari,
      this.jamMulai,
      this.jamAkhir,
      this.tahunAjaran,
      this.semester,
      this.idKelas,
      this.idMatakuliah,
      this.idDosen,
      this.nip,
      this.namaDosen,
      this.password,
      this.email,
      this.departement,
      this.role,
      this.kodeMatakuliah,
      this.namaMatakuliah,
      this.namaKelas,
      this.lokasiKelas,
      this.idJadwalMahasiswa});

  Jadwal.fromJson(Map<String, dynamic> json) {
    idJadwal = json['id_jadwal'];
    id = json['id'];
    hari = json['hari'];
    jamMulai = json['jam_mulai'];
    jamAkhir = json['jam_akhir'];
    tahunAjaran = json['tahun_ajaran'];
    semester = json['semester'];
    idKelas = json['id_kelas'];
    idMatakuliah = json['id_matakuliah'];
    idDosen = json['id_dosen'];
    nip = json['nip'];
    namaDosen = json['nama_dosen'];
    password = json['password'];
    email = json['email'];
    departement = json['departement'];
    role = json['role'];
    kodeMatakuliah = json['kode_matakuliah'];
    namaMatakuliah = json['nama_matakuliah'];
    namaKelas = json['nama_kelas'];
    lokasiKelas = json['lokasi_kelas'];
    idJadwalMahasiswa = json['id_jadwal_mahasiswa'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id_jadwal'] = this.idJadwal;
    data['id'] = this.id;
    data['hari'] = this.hari;
    data['jam_mulai'] = this.jamMulai;
    data['jam_akhir'] = this.jamAkhir;
    data['tahun_ajaran'] = this.tahunAjaran;
    data['semester'] = this.semester;
    data['id_kelas'] = this.idKelas;
    data['id_matakuliah'] = this.idMatakuliah;
    data['id_dosen'] = this.idDosen;
    data['nip'] = this.nip;
    data['nama_dosen'] = this.namaDosen;
    data['password'] = this.password;
    data['email'] = this.email;
    data['departement'] = this.departement;
    data['role'] = this.role;
    data['kode_matakuliah'] = this.kodeMatakuliah;
    data['nama_matakuliah'] = this.namaMatakuliah;
    data['nama_kelas'] = this.namaKelas;
    data['lokasi_kelas'] = this.lokasiKelas;
    data['id_jadwal_mahasiswa'] = this.idJadwalMahasiswa;
    return data;
  }
}
