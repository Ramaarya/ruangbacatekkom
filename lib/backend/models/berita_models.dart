class Berita {
  int idPosting;
  String judul;
  String deskripsi;
  int idCategory;
  String coverGambar;
  String waktuPost;
  String category;

  // var galeri;

  List galeri;

  Berita({
    required this.idPosting,
    required this.judul,
    required this.deskripsi,
    required this.idCategory,
    required this.coverGambar,
    required this.waktuPost,
    required this.category,
    required this.galeri,
  });

  factory Berita.fromJson(Map<String, dynamic> json) {
    return Berita(
      idPosting: json['id_posting'],
      judul: json['judul'],
      deskripsi: json['deskripsi'],
      idCategory: json['category_id'],
      coverGambar: json['cover_gambar'],
      waktuPost: json['waktu_posting'],
      category: json['category'],
      galeri: json['galleries'],
    );
  }
}
