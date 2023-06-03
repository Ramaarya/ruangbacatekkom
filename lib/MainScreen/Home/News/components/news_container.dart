import 'package:flutter/material.dart';
import 'category_icon.dart';

import '../detail_news.dart';

// ignore: must_be_immutable
class NewsContainer extends StatelessWidget {
  NewsContainer({
    Key? key,
    required this.coverGambar,
    required this.judul,
    required this.deskripsi,
    required this.waktuPosting,
    required this.kategori,
    required this.dataImage,
  }) : super(key: key);

  String coverGambar;
  String judul;
  String waktuPosting;
  String kategori;
  String deskripsi;
  List dataImage;

  @override
  Widget build(BuildContext context) {
    double widthScreen = MediaQuery.of(context).size.width;

    return InkWell(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (ctx) {
          return DetailNewsScreen(
            judul: judul,
            deskripsi: deskripsi,
            kategori: kategori,
            dataImage: dataImage,
            tanggal: waktuPosting,
          );
        }));
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
        child: Row(
          children: [
            Flexible(
              flex: 1,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: SizedBox(
                  width: widthScreen / 4,
                  height: widthScreen / 4,
                  child: Image.network(
                    "https://ibrangoding.my.id/storage/postingan/cover_gambar/$coverGambar",
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            Flexible(
              flex: 3,
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      waktuPosting,
                      style: const TextStyle(
                        color: Colors.grey,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      judul,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.left,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 10),
                    CategoryIcon(
                      category: kategori,
                      colorsBG: const Color.fromRGBO(80, 156, 244, 0.15),
                      textColors: Colors.blue,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
