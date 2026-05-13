import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import '../../data/models/service_model.dart';

class ServicesViewModel extends ChangeNotifier {
  final Box<ServiceModel> _servicesBox = Hive.box<ServiceModel>('servicesBox');

  List<ServiceModel> get services => _servicesBox.values.toList();

  List<ServiceModel> getServicesForDate(DateTime date) {
    return _servicesBox.values.where((s) =>
      s.data.year == date.year &&
      s.data.month == date.month &&
      s.data.day == date.day
    ).toList();
  }

  void addService(ServiceModel service) {
    _servicesBox.put(service.id, service);
    notifyListeners();
  }

  void updateService(ServiceModel service) {
    service.save();
    notifyListeners();
  }

  void deleteService(String id) {
    _servicesBox.delete(id);
    notifyListeners();
  }
}
