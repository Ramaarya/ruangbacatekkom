import 'package:flutter/material.dart';

class TentangAplikasi extends StatelessWidget {
  const TentangAplikasi({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tentang Aplikasi'),
        centerTitle: true,
        elevation: 0.0,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 20),
          child: Column(
            children: [
              Container(
                width: 120,
                height: 120,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.grey,
                      blurRadius: 8,
                      offset: Offset(4, 8),
                    ),
                  ],
                ),
                child: Image.asset(
                  'assets/icons/logo_rbc.png',
                  scale: 1.3,
                ),
              ),
              const SizedBox(height: 40),
              const Text(
                'Aplikasi Ruang Baca adalah aplikasi yang digunakan untuk mengakses dokumen seperti laporan skripsi dan laporan kerja praktik serta informasi tentang kegiatan riset dan teknologi pada lingkungan jurusan teknik komputer. Aplikasi ini merupakan alternatif dari versi web Ruang Baca. Aplikasi ini dibuat untuk kegiatan kerja praktik yang dilakukan pada Departemen Teknik Komputer.',
                textAlign: TextAlign.justify,
              )
            ],
          ),
        ),
      ),
    );
  }
}
