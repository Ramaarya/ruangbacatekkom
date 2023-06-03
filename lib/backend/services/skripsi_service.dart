import 'dart:convert';
import 'package:http/http.dart' as http;

import '../models/skripsi_model.dart';

class SkripsiService {
  List<Skripsi> listSkripsi = [];
  final urlSkripsi = 'https://ibrangoding.my.id/api/skripsi/';

  Future getDataSkripsi() async {
    try {
      final responseSkripsi = await http.get(Uri.parse(urlSkripsi));

      if (responseSkripsi.statusCode == 200) {
        var jsonBody = json.decode(responseSkripsi.body)['data']['data'];
        for (var datas in jsonBody) {
          listSkripsi.add(
            Skripsi(
              idSkripsi: datas['id_skripsi'],
              name: datas['name'],
              nim: datas['nim'],
              tahun: datas['tahun'],
              judul: datas['judul'],
              abstrak: datas['abstrak'],
              fileUrl: datas['file_url'],
              namaBidang: datas['bidang']['nama_bidang'],
              dosen1: datas['dosen']['nama_dosen'],
              dosen2: datas['dosen2']['nama_dosen'],
            ),
          );
        }

        return listSkripsi;
      }
    } catch (e) {
      rethrow;
    }
  }

  //Search data
  Future searchSkripsi(String word) async {
    try {
      final searchDataSkripsi = await http
          .get(Uri.parse("https://ibrangoding.my.id/api/skripsi?q=$word"));
      if (searchDataSkripsi.statusCode == 200) {
        var jsonBody = json.decode(searchDataSkripsi.body)['data']['data'];
        for (var datas in jsonBody) {
          listSkripsi.add(
            Skripsi(
              idSkripsi: datas['id_skripsi'],
              name: datas['name'],
              nim: datas['nim'],
              tahun: datas['tahun'],
              judul: datas['judul'],
              abstrak: datas['abstrak'],
              fileUrl: datas['file_url'],
              namaBidang: datas['bidang']['nama_bidang'],
              dosen1: datas['dosen']['nama_dosen'],
              dosen2: datas['dosen2']['nama_dosen'],
            ),
          );
        }
        return listSkripsi;
      } else {
        return listSkripsi;
      }
    } catch (e) {
      rethrow;
    }
  }
}
