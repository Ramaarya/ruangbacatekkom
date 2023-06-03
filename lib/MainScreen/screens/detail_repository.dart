import 'package:flutter/material.dart';
import 'package:rbc_kp/MainScreen/screens/webview.dart';
import '../../constant.dart';

// ignore: must_be_immutable
class DetailData extends StatelessWidget {
  //Constructor
  DetailData({
    super.key,
    required this.judul,
    required this.mahasiswa,
    required this.pembimbing,
    this.pembimbing2,
    required this.tahun,
    required this.bidang,
    required this.koleksi,
    required this.abstrak,
    required this.file,
    required this.skripsi,
  });

  //Properti
  String judul;
  String mahasiswa;
  String pembimbing;
  String? pembimbing2;
  String abstrak;
  String file;
  String bidang;
  String koleksi;
  int tahun;
  bool skripsi;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          iconTheme: const IconThemeData(color: Colors.black),
          title: const Text(
            'Details',
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
          centerTitle: true,
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(
            vertical: defaultPadding / 2,
            horizontal: defaultPadding,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                judul,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: defaultPadding / 2),
              Text(
                'Oleh : $mahasiswa',
              ),
              SizedBox(height: defaultPadding / 2),
              Text(
                'Tahun : $tahun',
              ),
              SizedBox(height: defaultPadding / 2),
              Text(
                'Dosen Pembimbing 1 : $pembimbing',
                overflow: TextOverflow.ellipsis,
              ),
              SizedBox(height: defaultPadding / 2),
              Text(
                'Bidang : $bidang',
              ),
              SizedBox(height: defaultPadding / 2),
              Text(
                'Koleksi : $koleksi',
              ),
              SizedBox(height: defaultPadding / 2),
              const TabBar(
                tabs: [
                  Tab(
                    child: Text(
                      'File',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Tab(
                    child: Text(
                      'Abstrak',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  )
                ],
              ),
              Expanded(
                child: TabBarView(
                  children: [
                    // tab file
                    Container(
                      margin:
                          EdgeInsets.symmetric(vertical: defaultPadding / 2),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Image.asset('assets/icons/pdf_icon.png'),
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.all(10),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        judul,
                                        overflow: TextOverflow.ellipsis,
                                        maxLines: 1,
                                        style: const TextStyle(
                                          color: Colors.black,
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      const Text('PDF File')
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Center(
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.green,
                              ),
                              onPressed: () {
                                Navigator.push(context, MaterialPageRoute(
                                  builder: (context) {
                                    return WebviewPage(title: judul, url: file);
                                  },
                                ));
                              },
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: const [
                                  Icon(Icons.file_open_outlined),
                                  SizedBox(width: 10),
                                  Text('Open')
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.symmetric(vertical: 10),
                      child: Text(abstrak),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
