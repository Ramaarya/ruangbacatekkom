import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../constant.dart';
import '../../backend/provider/auth_provider.dart';

//Component
import '../Home/navbar.dart';
import 'components/textfield.dart';

// ignore_for_file: use_build_context_synchronously

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController nimController =
      TextEditingController(text: ''.toString());
  TextEditingController passwordController = TextEditingController(text: '');

  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    double widthScreen = MediaQuery.of(context).size.width;
    double widthScreenPadding = widthScreen - widthScreen / 5;

    AuthProvider authProvider = Provider.of<AuthProvider>(context);

    handleLogin() async {
      setState(() {
        isLoading = true;
        // keyboard auto close
        FocusManager.instance.primaryFocus?.unfocus();
      });

      if (await authProvider.login(
        nim: int.parse(nimController.text),
        password: passwordController.text,
      )) {
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (ctx) {
          return const HomeScreen();
        }));
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            backgroundColor: Color(0xffDB3029),
            content: Text(
              'Nim atau Kata Sandi Salah',
              textAlign: TextAlign.center,
            ),
          ),
        );
        setState(() {
          isLoading = false;
        });
      }
    }

    return Scaffold(
      body: SafeArea(
          child: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Image.asset('assets/icons/logo_rbc.png'),
              const SizedBox(height: 50),
              const Text(
                'Masuk Menggunakan Akun Anda',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
              SizedBox(height: defaultPadding / 2),
              // NIM Field...................................................................
              TextFieldLogin(
                widthScreenPadding: widthScreenPadding,
                textController: nimController,
                textInputType: TextInputType.number,
                obsecureText: false,
                hintLabel: "NIM / NIP",
              ),
              // Kata sandi field...........................................................
              TextFieldLogin(
                widthScreenPadding: widthScreenPadding,
                textController: passwordController,
                textInputType: TextInputType.text,
                obsecureText: true,
                hintLabel: "Password",
              ),
              // Login Button
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: OutlinedButton(
                  onPressed: handleLogin,
                  style: OutlinedButton.styleFrom(
                    fixedSize: Size(widthScreenPadding, 40),
                    foregroundColor: Colors.white,
                    backgroundColor: const Color(0xff4EA8DE),
                  ),
                  child: Center(
                    child:
                        isLoading ? const Text('Loading') : const Text('Masuk'),
                  ),
                ),
              ),
              const Text('Ada masalah ?  hubungi admin RBC')
            ],
          ),
        ),
      )),
    );
  }
}
