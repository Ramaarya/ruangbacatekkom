class UserModel {
  int? nim;
  String? nama;
  String? token;

  UserModel({
    required this.nim,
    required this.nama,
    required this.token,
  });

  UserModel.fromJson(Map<String, dynamic> json) {
    nim = json['nim'];
    nama = json['nama'];
    token = json['token'];
  }

  Map<String, dynamic> toJson() {
    return {
      'nim': nim,
      'nama': nama,
      'token': token,
    };
  }
}
