import 'package:flutter/material.dart';
import '../../../backend/models/skripsi_model.dart';
import '../../../backend/services/skripsi_service.dart';

import 'components/list_card.dart';
import '../../screens/detail_repository.dart';

// ignore: must_be_immutable
class SkripsiPage extends StatefulWidget {
  const SkripsiPage({super.key});

  @override
  State<SkripsiPage> createState() => _SkripsiPageState();
}

class _SkripsiPageState extends State<SkripsiPage> {
  List<Skripsi> listSkripsi = [];
  List<Skripsi> all = [];
  SkripsiService skripsiService = SkripsiService();

  // // Initial Selected Value
  // String dropdownvalue = 'Semua';

  // // List of items in our dropdown menu
  // var items = [
  //   'Semua',
  //   'RPL',
  //   'Jaringan',
  //   'Embedded',
  //   'Multimedia',
  // ];

  @override
  void initState() {
    skripsiService.getDataSkripsi().then(
      (value) {
        setState(() {
          listSkripsi = value;
          all = value;
        });
      },
    );
    super.initState();
  }

  TextEditingController searchSkripsiText = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double widhtScreen = MediaQuery.of(context).size.width;
    double heightScreen = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Data Skripsi',
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
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Container(
              width: widhtScreen,
              height: 40,
              margin: const EdgeInsets.symmetric(horizontal: 25),
              decoration: const BoxDecoration(
                color: Color.fromARGB(255, 223, 223, 223),
                borderRadius: BorderRadius.all(
                  Radius.circular(25),
                ),
              ),
              child: TextField(
                controller: searchSkripsiText,
                decoration: const InputDecoration(
                  prefixIcon: Icon(Icons.search),
                  border: InputBorder.none,
                  hintText: 'Cari berdasarkan judul, pembuat, dll',
                ),
                onSubmitted: (value) {
                  setState(() {
                    listSkripsi.clear();
                    skripsiService.searchSkripsi(value).then((value) {
                      setState(() {
                        listSkripsi = value;
                      });
                    });
                  });
                },
              ),
            ),
            // FITUR INI MASIH DALAM PENGEMBANGAN UNTUK FILTER KATEGORI BIDANG=======================================
            // Padding(
            //   padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
            //   child: DropdownButton(
            //     value: dropdownvalue,
            //     icon: const Icon(Icons.keyboard_arrow_down),
            //     // Array list of items
            //     items: items.map((String items) {
            //       return DropdownMenuItem(
            //         value: items,
            //         child: Text(items),
            //       );
            //     }).toList(),
            //     onChanged: (String? newValue) {
            //       setState(() {
            //         dropdownvalue = newValue!;
            //         if (listSkripsi.isNotEmpty) {
            //           setState(() {
            //             listSkripsi = listSkripsi
            //                 .where((element) =>
            //                     element.namaBidang.contains(dropdownvalue))
            //                 .toList();
            //           });
            //         }
            //         if (dropdownvalue == "Semua") {
            //           setState(() {
            //             listSkripsi = all;
            //           });
            //         }
            //       });
            //     },
            //   ),
            // ),
            verifiedWidget(listSkripsi, heightScreen),
          ],
        ),
      ),
    );
  }

  Widget verifiedWidget(List<Skripsi> listSkripsi, double heightScreen) {
    if (listSkripsi.isNotEmpty) {
      if (listSkripsi.length == 1) {
        return SizedBox(
          height: heightScreen * 4 / 5 - 100,
          child: const Center(
            child: Text(
              'Data tidak ditemukan',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
        );
      } else {
        return ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: listSkripsi.length - 1,
          itemBuilder: (context, indexs) {
            int index = indexs + 1;
            return InkWell(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return DetailData(
                    judul: listSkripsi[index].judul,
                    mahasiswa: listSkripsi[index].name,
                    pembimbing: listSkripsi[index].dosen1,
                    tahun: listSkripsi[index].tahun,
                    bidang: listSkripsi[index].namaBidang,
                    koleksi: 'Skripsi',
                    abstrak: listSkripsi[index].abstrak,
                    file: listSkripsi[index].fileUrl,
                    skripsi: true,
                  );
                }));
              },
              child: ListCard(
                judul: listSkripsi[index].judul,
                mahasiswa: listSkripsi[index].name,
                nim: listSkripsi[index].nim,
                tahun: listSkripsi[index].tahun,
                bidang: listSkripsi[index].namaBidang,
                logo: 'assets/icons/skripsi.png',
              ),
            );
          },
        );
      }
    } else {
      return SizedBox(
        height: heightScreen * 3 / 5,
        child: const Center(
          child: CircularProgressIndicator(
            color: Color(0xff4EA8DE),
          ),
        ),
      );
    }
  }
}
