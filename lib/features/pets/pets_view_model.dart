import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import '../../data/models/pet_model.dart';
import '../../core/utils/id_generator.dart';

class PetsViewModel extends ChangeNotifier {
  final Box<PetModel> _petsBox = Hive.box<PetModel>('petsBox');

  List<PetModel> get pets => _petsBox.values.toList();

  List<PetModel> getPetsForClient(String clientId) {
    return _petsBox.values.where((pet) => pet.clientId == clientId).toList();
  }

  void addPet(PetModel pet) {
    _petsBox.put(pet.id, pet);
    notifyListeners();
  }

  void updatePet(PetModel pet) {
    pet.save();
    notifyListeners();
  }

  void deletePet(String id) {
    _petsBox.delete(id);
    notifyListeners();
  }

  PetModel? getPet(String id) {
    return _petsBox.get(id);
  }
}
