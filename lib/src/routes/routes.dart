import 'package:prueba_application/src/presentation/screen/details_tour_page.dart';
import 'package:prueba_application/src/presentation/screen/home_page.dart';
import 'package:prueba_application/src/presentation/screen/login_page.dart';

final appRoutes = {
  LoginPage.routeName: (_) => const LoginPage(),
  HomePage.routeName: (_) => const HomePage(),
  DetailsTourPage.routeName: (_) => const DetailsTourPage(),
};
