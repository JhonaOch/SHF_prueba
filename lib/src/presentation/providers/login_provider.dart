import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../../data/services/tour_services.dart';

enum TourLogin { initial, loading, success, error }

class LoginProvider with ChangeNotifier {
  final TourService _service = TourService();
  TourLogin _status = TourLogin.initial;

  User? _user;

  void logInwithGoogle() async {
    final UserCredential? userCredential = await _service.signInWithGoogle();
    if (userCredential != null) {
      _user = userCredential.user;
      _status = TourLogin.loading;
      notifyListeners();
      if (user != null) {
        _status = TourLogin.success;
        notifyListeners();
      } else {
        _status = TourLogin.error;
        notifyListeners();
      }
    } else {
      _status = TourLogin.error;
      notifyListeners();
    }
  }

  get status => _status;
  User? get user => _user;
}
