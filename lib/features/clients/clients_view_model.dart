import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import '../../data/models/client_model.dart';
import '../../core/utils/id_generator.dart';

class ClientsViewModel extends ChangeNotifier {
  final Box<ClientModel> _clientsBox = Hive.box<ClientModel>('clientsBox');

  List<ClientModel> get clients => _clientsBox.values.toList();

  void addClient(ClientModel client) {
    _clientsBox.put(client.id, client);
    notifyListeners();
  }

  void updateClient(ClientModel client) {
    client.save();
    notifyListeners();
  }

  void deleteClient(String id) {
    _clientsBox.delete(id);
    notifyListeners();
  }

  ClientModel? getClient(String id) {
    return _clientsBox.get(id);
  }
}
