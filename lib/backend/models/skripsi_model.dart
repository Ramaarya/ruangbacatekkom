class Skripsi {
  int idSkripsi;
  String name;
  String nim;
  int tahun;
  String judul;
  String abstrak;
  String fileUrl;
  String namaBidang;
  String dosen1;
  String dosen2;

  Skripsi({
    required this.idSkripsi,
    required this.name,
    required this.nim,
    required this.tahun,
    required this.judul,
    required this.abstrak,
    required this.fileUrl,
    required this.namaBidang,
    required this.dosen1,
    required this.dosen2,
  });

  factory Skripsi.fromJson(Map<String, dynamic> json) {
    return Skripsi(
      idSkripsi: json['id_skripsi'],
      name: json['name'],
      nim: json['nim'],
      tahun: json['tahun'],
      judul: json['judul'],
      abstrak: json['abstrak'],
      fileUrl: json['file_url'],
      namaBidang: json['nama_bidang'],
      dosen1: json['dosen1'],
      dosen2: json['dosen2'],
    );
  }
}
