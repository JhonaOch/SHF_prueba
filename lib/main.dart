import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:prueba_application/src/helpers/configuration_helper.dart';
import 'package:prueba_application/src/presentation/providers/login_provider.dart';
import 'package:prueba_application/src/presentation/providers/tour_provider.dart';
import 'package:prueba_application/src/routes/routes.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<ToursProvider>(
          create: (context) => ToursProvider(),
        ),
        ChangeNotifierProvider<LoginProvider>(
          create: (context) => LoginProvider(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: OpColor.backgroundColor),
          useMaterial3: true,
        ),
        initialRoute: '/login',
        routes: appRoutes,
      ),
    );
  }
}
