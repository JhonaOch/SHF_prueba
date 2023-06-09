import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../../domain/models/tours_model.dart';

class TourService {
  TourService()
      : _dio = Dio(
          BaseOptions(
            baseUrl: 'https://staging-api-app.citix.com.co/dev/',
          ),
        );

  final Dio _dio;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();

  Future<List<Tours>?> getTours() async {
    try {
      final response = await _dio.get('tours');
      if (response.statusCode == 200) {
        final data = response.data;
        if (data is List) {
          return data.map<Tours>((item) => Tours.fromJson(item)).toList();
        } else {
          throw Exception('Invalid data format');
        }
      } else {
        return null;
      }
    } catch (_) {
      rethrow;
    }
  }

  Future<UserCredential?> signInWithGoogle() async {
    // Solicitar la autenticación de Google
    final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
    // Obtener las credenciales de autenticación de Google
    if (googleUser != null) {
      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;
      // Crear una credencial de inicio de sesión de Google
      final OAuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );
      // Iniciar sesión en Firebase con las credenciales de Google
      final UserCredential userCredential =
          await _auth.signInWithCredential(credential);
      // Retornar el resultado del inicio de sesión
      return userCredential;
    } else {
      return null;
    }
  }
}
