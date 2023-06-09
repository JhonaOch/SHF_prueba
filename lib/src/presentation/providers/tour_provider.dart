import 'package:flutter/material.dart';
import 'package:prueba_application/src/data/services/tour_services.dart';
import 'package:prueba_application/src/domain/models/tours_model.dart';

enum TourStatus { initial, loading, success, error }

class ToursProvider with ChangeNotifier {
  final TourService _service = TourService();
  TourStatus _status = TourStatus.initial;

  List<Tours> _tours = [];
  void getAllTours() async {
    final data = await _service.getTours();
    _status = TourStatus.loading;
    notifyListeners();
    if (data != null) {
      _tours = data;
      _status = TourStatus.success;
      notifyListeners();
    } else {
      _status = TourStatus.error;
      notifyListeners();
    }
  }

  List<Tours> get tours => _tours;
  get status => _status;
}
