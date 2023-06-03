import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:flutter/services.dart';

import '../../../backend/models/user_models.dart';
import '../../../backend/provider/auth_provider.dart';
import 'package:provider/provider.dart';

import 'components/website_container.dart';
import '../../screens/qr_scanner.dart';

class IndexPage extends StatefulWidget {
  const IndexPage({super.key});

  @override
  State<IndexPage> createState() => _IndexPageState();
}

class _IndexPageState extends State<IndexPage> {
  List _website = [];

  Future<void> webData() async {
    final String response =
        await rootBundle.loadString('assets/other/website_link.json');
    final data = json.decode(response);
    setState(() {
      _website = data['website'];
    });
  }

  @override
  void initState() {
    webData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double widthScreen = MediaQuery.of(context).size.width;

    AuthProvider authProvider = Provider.of<AuthProvider>(context);

    UserModel user = authProvider.user;

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                // Username mahasiswa dari akun...........................................
                ' Halo, ${user.nama}',
                overflow: TextOverflow.ellipsis,
                style:
                    const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: Container(
                  width: widthScreen,
                  decoration: BoxDecoration(
                    color: const Color(0xff4EA8DE),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Flexible(
                          flex: 3,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                'Scan QR Code Ruang RBC',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              const Text(
                                'Arahkan Smartphone anda ke QR Code pada KTM Pengunjung',
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              ElevatedButton(
                                onPressed: () {
                                  // qrscanner page ----------------
                                  Navigator.push(context, MaterialPageRoute(
                                    builder: (context) {
                                      return const QRScannerPage();
                                    },
                                  ));
                                },
                                style: ElevatedButton.styleFrom(
                                  elevation: 0,
                                  backgroundColor: Colors.white,
                                  foregroundColor: const Color(0xff4EA8DE),
                                  shape: RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.circular(20.0)),
                                ),
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: const [
                                    Text(
                                      'Scan QR',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                    SizedBox(width: 10),
                                    Icon(Icons.qr_code)
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                        Flexible(
                          flex: 1,
                          child: Image.asset(
                            'assets/icons/phone.png',
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              ListView.separated(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: _website.length,
                  itemBuilder: (context, index) {
                    return WebsiteContainer(
                      webIcon: _website[index]["webIcon"],
                      webTitle: _website[index]["webTitle"],
                      link: _website[index]["link_web"],
                    );
                  },
                  separatorBuilder: (context, index) {
                    return const SizedBox(height: 20);
                  })
            ],
          ),
        ),
      ),
    );
  }
}
