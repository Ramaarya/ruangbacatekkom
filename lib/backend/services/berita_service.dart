import 'dart:convert';
import 'package:http/http.dart' as http;

import '../models/berita_models.dart';

class BeritaService {
  List<Berita> listBerita = [];
  final url = "https://ibrangoding.my.id/api/post";

  Future getDataBerita() async {
    try {
      final responseBerita = await http.get(Uri.parse(url));

      if (responseBerita.statusCode == 200) {
        var jsonBody = json.decode(responseBerita.body)['data']['data'];
        for (var datas in jsonBody) {
          listBerita.add(Berita(
            idPosting: datas['id_posting'],
            judul: datas['judul'],
            deskripsi: datas['deskripsi'],
            idCategory: datas['category_id'],
            coverGambar: datas['cover_gambar'],
            waktuPost: datas['waktu_posting'],
            category: datas['category']['name_category'],
            galeri: datas['galleries'],
          ));
        }
        return listBerita;
      }
    } catch (e) {
      rethrow;
    }
  }
}
