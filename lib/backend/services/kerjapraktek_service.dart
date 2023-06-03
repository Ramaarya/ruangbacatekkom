import 'dart:convert';
import 'package:http/http.dart' as http;

import '../models/kerjapraktek_model.dart';

class KerjaPraktekService {
  List<KerjaPraktek> listKp = [];
  final url = 'https://ibrangoding.my.id/api/kp/';

  Future getDataKerjaPraktek() async {
    try {
      final responseKerjaPraktek = await http.get(Uri.parse(url));

      if (responseKerjaPraktek.statusCode == 200) {
        var jsonBody = json.decode(responseKerjaPraktek.body)['data']['data'];
        for (var datas in jsonBody) {
          listKp.add(KerjaPraktek(
            idKp: datas['id_kp'],
            name: datas['name'],
            nim: datas['nim'],
            tahun: datas['tahun'],
            judul: datas['judul'],
            abstrak: datas['abstrak'],
            fileUrl: datas['file_url'],
            namaBidang: datas['bidang']['nama_bidang'],
            dosen: datas['dosen']['nama_dosen'],
          ));
        }
        return listKp;
      }
    } catch (e) {
      rethrow;
    }
  }

  //Search data
  Future searchKP(String word) async {
    try {
      final searchDataSkripsi =
          await http.get(Uri.parse("https://ibrangoding.my.id/api/kp?q=$word"));
      if (searchDataSkripsi.statusCode == 200) {
        var jsonBody = json.decode(searchDataSkripsi.body)['data']['data'];
        for (var datas in jsonBody) {
          listKp.add(KerjaPraktek(
            idKp: datas['id_kp'],
            name: datas['name'],
            nim: datas['nim'],
            tahun: datas['tahun'],
            judul: datas['judul'],
            abstrak: datas['abstrak'],
            fileUrl: datas['file_url'],
            namaBidang: datas['bidang']['nama_bidang'],
            dosen: datas['dosen']['nama_dosen'],
          ));
        }
        return listKp;
      }
    } catch (e) {
      rethrow;
    }
  }
}
