import 'dart:async';

import 'package:flutter/material.dart';

import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
import 'package:prueba_application/src/helpers/configuration_helper.dart';
import 'package:prueba_application/src/helpers/text_helper.dart';
import 'package:prueba_application/src/presentation/screen/home_page.dart';

import '../providers/login_provider.dart';

class LoginPage extends StatefulWidget {
  static const routeName = '/login';
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late Size size;

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<LoginProvider>(context);

    size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        backgroundColor: OpColor.backgroundColor,
        body: Stack(
          children: [
            Positioned.fill(
              child: SvgPicture.asset(
                'assets/vector/fondo.svg',
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(
              width: double.infinity,
              height: double.infinity,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 174,
                    height: 77,
                    child: SvgPicture.asset(
                      'assets/vector/Logotipo.svg',
                    ),
                  ),
                  Consumer<LoginProvider>(builder: (context, value, child) {
                    if (value.status == TourLogin.success) {
                      Fluttertoast.showToast(
                        msg: 'Inicio de sesión correcto',
                        toastLength: Toast.LENGTH_SHORT,
                        gravity: ToastGravity.BOTTOM,
                        backgroundColor: Colors.green,
                        textColor: Colors.white,
                      );
                      Timer(const Duration(seconds: 2), () {
                        Navigator.pushReplacementNamed(
                            context, HomePage.routeName);
                      });
                    } else  if(value.status == TourLogin.error){
                      Fluttertoast.showToast(
                        msg: 'Error en su seleccion',
                        toastLength: Toast.LENGTH_SHORT,
                        gravity: ToastGravity.BOTTOM,
                        backgroundColor: OpColor.colorProgressIndicator,
                        textColor: Colors.white,
                      );
                    }
                    return Column(
                      children: [
                        buttonSocialNetwork(
                            icon: 'assets/vector/movil.svg',
                            title: 'Accede con Tu Movil',
                            onPressed: () {}),
                        buttonSocialNetwork(
                            icon: 'assets/vector/gmail.svg',
                            title: 'Accede con Google',
                            onPressed: () {
                              provider.logInwithGoogle();
                            }),
                        buttonSocialNetwork(
                            icon: 'assets/vector/facebook.svg',
                            title: 'Accede con facebook',
                            onPressed: () {})
                      ],
                    );
                  })
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buttonSocialNetwork(
      {required String icon,
      required String title,
      required Function()? onPressed}) {
    return Container(
        margin: const EdgeInsets.only(bottom: 10),
        width: size.width * 0.7,
        child: OutlinedButton.icon(
            icon: Padding(
              padding: const EdgeInsets.only(left: 20.0),
              child: SvgPicture.asset(
                icon,
                width: 24,
                height: 24,
              ),
            ),
            onPressed: onPressed,
            style: OutlinedButton.styleFrom(
              padding: const EdgeInsets.all(10),
              side: BorderSide(
                color: Colors.black.withOpacity(0.1),
                width: 1,
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.0),
              ),
            ),
            label: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const SizedBox(width: 21),
                Text(
                  title,
                  style: getStyle(fontSize: 14),
                ),
              ],
            )));
  }
}
