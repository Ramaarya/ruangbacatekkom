import 'package:flutter/material.dart';
import '../../../backend/models/kerjapraktek_model.dart';
import '../../../backend/services/kerjapraktek_service.dart';
import '../../screens/detail_repository.dart';
import 'components/list_card.dart';

// ignore: must_be_immutable
class KerjaPraktekPage extends StatefulWidget {
  const KerjaPraktekPage({super.key});

  @override
  State<KerjaPraktekPage> createState() => _KerjaPraktekPageState();
}

class _KerjaPraktekPageState extends State<KerjaPraktekPage> {
  List<KerjaPraktek> listKp = [];
  KerjaPraktekService kerjaPraktekService = KerjaPraktekService();

  @override
  void initState() {
    kerjaPraktekService.getDataKerjaPraktek().then((value) {
      setState(() {
        listKp = value;
      });
    });
    super.initState();
  }

  TextEditingController searchKPText = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double widhtScreen = MediaQuery.of(context).size.width;
    double heightScreen = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Data Kerja Praktek',
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
                controller: searchKPText,
                decoration: const InputDecoration(
                  prefixIcon: Icon(Icons.search),
                  border: InputBorder.none,
                  hintText: 'Cari berdasarkan judul, pembuat, dll',
                ),
                onSubmitted: (value) {
                  setState(() {
                    listKp.clear();
                    kerjaPraktekService.searchKP(value).then((value) {
                      setState(() {
                        listKp = value;
                      });
                    });
                  });
                },
              ),
            ),
            listKp.isNotEmpty
                ? ListView.builder(
                    shrinkWrap: true,
                    itemCount: listKp.length,
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                            return DetailData(
                              judul: listKp[index].judul,
                              mahasiswa: listKp[index].name,
                              pembimbing: listKp[index].dosen,
                              tahun: listKp[index].tahun,
                              bidang: listKp[index].namaBidang,
                              koleksi: 'Skripsi',
                              abstrak: listKp[index].abstrak,
                              file: listKp[index].fileUrl,
                              skripsi: false,
                            );
                          }));
                        },
                        child: ListCard(
                          judul: listKp[index].judul,
                          mahasiswa: listKp[index].name,
                          nim: listKp[index].nim,
                          tahun: listKp[index].tahun,
                          bidang: listKp[index].namaBidang,
                          logo: 'assets/icons/coding.png',
                        ),
                      );
                    },
                  )
                : SizedBox(
                    height: heightScreen * 3 / 5,
                    child: const Center(
                      child: CircularProgressIndicator(
                        color: Color(0xff4EA8DE),
                      ),
                    ),
                  )
          ],
        ),
      ),
    );
  }
}
