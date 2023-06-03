class KerjaPraktek {
  int idKp;
  String name;
  String nim;
  int tahun;
  String judul;
  String abstrak;
  String fileUrl;
  String namaBidang;
  String dosen;

  KerjaPraktek({
    required this.idKp,
    required this.name,
    required this.nim,
    required this.tahun,
    required this.judul,
    required this.abstrak,
    required this.fileUrl,
    required this.namaBidang,
    required this.dosen,
  });

  factory KerjaPraktek.fromJson(Map<String, dynamic> json) {
    return KerjaPraktek(
      idKp: json['id_kp'],
      name: json['name'],
      nim: json['nim'],
      tahun: json['tahun'],
      judul: json['judul'],
      abstrak: json['abstrak'],
      fileUrl: json['file_url'],
      namaBidang: json['nama_bidang'],
      dosen: json['nama_dosen'],
    );
  }
}
