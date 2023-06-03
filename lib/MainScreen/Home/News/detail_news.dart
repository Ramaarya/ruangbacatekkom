import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

import 'components/back_button.dart';
import 'components/category_icon.dart';

// ignore: must_be_immutable
class DetailNewsScreen extends StatelessWidget {
  DetailNewsScreen({
    super.key,
    required this.deskripsi,
    required this.judul,
    required this.kategori,
    required this.dataImage,
    required this.tanggal,
  });

  List dataImage = [];

  final List<String> imgList = [];

  void getData() {
    for (var element in dataImage) {
      imgList.add(element['file_url']);
    }
  }

  String judul;
  String deskripsi;
  String kategori;
  String tanggal;

  @override
  Widget build(BuildContext context) {
    double widthScreen = MediaQuery.of(context).size.width;

    getData();

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Stack(
                children: [
                  CarouselSlider(
                    options: CarouselOptions(
                      initialPage: 0,
                      aspectRatio: 1 / 1,
                      enableInfiniteScroll: false,
                    ),
                    items: imgList
                        .map((item) => Container(
                              padding: const EdgeInsets.all(5),
                              child: Center(
                                child: Image.network(
                                  item,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ))
                        .toList(),
                  ),
                  const BackButtonCustom()
                ],
              ),
              Container(
                width: widthScreen,
                padding:
                    const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(15),
                  ),
                  color: Color(0xff4EA8DE),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Expanded(
                          // judul postingan
                          flex: 3,
                          child: Text(
                            judul,
                            style: const TextStyle(
                              fontSize: 20,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                            textAlign: TextAlign.left,
                          ),
                        ),
                        Flexible(
                          flex: 2,
                          child: Center(
                            child: CategoryIcon(
                              category: kategori,
                              colorsBG: const Color.fromARGB(37, 228, 250, 250),
                              textColors: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    Text(
                      tanggal,
                      style: const TextStyle(
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 20),
                    const Text(
                      'Deskripsi',
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 15),
                    Text(
                      deskripsi,
                      textAlign: TextAlign.justify,
                      style: const TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
