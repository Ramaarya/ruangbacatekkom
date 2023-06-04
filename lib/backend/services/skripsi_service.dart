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
        // ini list nya sengaja ditambahin buat ngakalin kalau ga nemu query
        // developernya dah pusing mikirin caranya gimana. masih cupu soalnya
        listSkripsi.add(Skripsi(
          idSkripsi: 0,
          name: '0',
          nim: '0',
          tahun: 0,
          judul: '0',
          abstrak: '0',
          fileUrl: '0',
          namaBidang: '0',
          dosen1: '0',
          dosen2: '0',
        ));
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
        // ini juga buat ngakalin, selamat berjuang kalau mau melanjutkan ini app
        listSkripsi.add(Skripsi(
          idSkripsi: 0,
          name: '0',
          nim: '0',
          tahun: 0,
          judul: '0',
          abstrak: '0',
          fileUrl: '0',
          namaBidang: '0',
          dosen1: '0',
          dosen2: '0',
        ));
        return listSkripsi;
      }
    } catch (e) {
      rethrow;
    }
  }
}
