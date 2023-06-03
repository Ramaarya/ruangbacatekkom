import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rbc_kp/MainScreen/screens/tentang_aplikasi.dart';

import '../../../backend/models/user_models.dart';
import '../../../backend/provider/auth_provider.dart';
import '../../Login/login_screen.dart';

class SettingPage extends StatelessWidget {
  const SettingPage({super.key});

  @override
  Widget build(BuildContext context) {
    AuthProvider authProvider = Provider.of<AuthProvider>(context);

    UserModel user = authProvider.user;

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Pengaturan',
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
        // padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                'Akun',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
            ),
            const SizedBox(height: 20),
            ListTile(
              leading: const Icon(
                Icons.account_circle_outlined,
                size: 35,
              ),
              title: Text(
                '${user.nama}',
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Text(
                '${user.nim}',
                overflow: TextOverflow.ellipsis,
              ),
              trailing: ElevatedButton(
                onPressed: () {
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (ctx) {
                    return const LoginPage();
                  }));
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xffDB3029),
                  elevation: 0,
                ),
                child: const Text('Logout'),
              ),
            ),
            const Divider(thickness: 4),
            // Section Lainnya..........................................................
            const SizedBox(height: 10),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                'Lainnya',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
            ),
            const SizedBox(height: 20),
            const ListTile(
              leading: Icon(
                Icons.verified_user_outlined,
                size: 35,
              ),
              title: Text('Versi Aplikasi'),
              subtitle: Text('1.0.0'),
            ),
            ListTile(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(
                  builder: (context) {
                    return const TentangAplikasi();
                  },
                ));
              },
              leading: const Icon(
                Icons.info_outline_rounded,
                size: 35,
              ),
              title: const Text('Tentang Aplikasi'),
            ),
          ],
        ),
      ),
    );
  }
}
