import 'package:flutter/material.dart';
import 'components/news_container.dart';

import '../../../backend/services/berita_service.dart';
import '../../../backend/models/berita_models.dart';

class NewsPage extends StatefulWidget {
  const NewsPage({super.key});

  @override
  State<NewsPage> createState() => _NewsPageState();
}

class _NewsPageState extends State<NewsPage> {
  List<Berita> listBerita = [];
  BeritaService beritaService = BeritaService();

  final List<String> categories = [
    'Info Lomba',
    'Info Magang',
    'Research News',
    'Meditekkom',
  ];

  List<String> selectedBerita = [];

  @override
  void initState() {
    beritaService.getDataBerita().then((value) {
      setState(() {
        listBerita = value;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;

    final filterBerita = listBerita.where((berita) {
      return selectedBerita.isEmpty || selectedBerita.contains(berita.category);
    }).toList();

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Berita',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // filter categori berita......................................
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: categories
                        .map((category) => Padding(
                              padding: const EdgeInsets.only(right: 10),
                              child: FilterChip(
                                elevation: 2,
                                checkmarkColor: Colors.blue,
                                selectedColor:
                                    const Color.fromRGBO(80, 156, 244, 0.15),
                                label: Text(category),
                                selected: selectedBerita.contains(category),
                                onSelected: (value) {
                                  setState(() {
                                    if (value) {
                                      selectedBerita.add(category);
                                    } else {
                                      selectedBerita.remove(category);
                                    }
                                  });
                                },
                              ),
                            ))
                        .toList()),
              ),
            ),
            verifyWidget(filterBerita, screenHeight)
          ],
        ),
      ),
    );
  }

  Widget verifyWidget(List<Berita> listBerita, double screenHeight) {
    if (listBerita.isNotEmpty) {
      return ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          // item count dari filter data bukan list data original APi
          itemCount: listBerita.length,
          itemBuilder: (context, index) {
            final berita = listBerita[index];
            return NewsContainer(
              coverGambar: berita.coverGambar,
              judul: berita.judul,
              waktuPosting: berita.waktuPost,
              kategori: berita.category,
              deskripsi: berita.deskripsi,
              dataImage: berita.galeri,
            );
          });
    } else if (listBerita.isEmpty) {
      return Center(
        child: Padding(
          padding: EdgeInsets.only(top: screenHeight / 3),
          child: const CircularProgressIndicator(),
        ),
      );
    } else {
      return Center(
        child: Padding(
          padding: EdgeInsets.only(top: screenHeight / 3),
          child: const CircularProgressIndicator(),
        ),
      );
    }
  }
}
