import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'app.dart';
import 'data/models/client_model.dart';
import 'data/models/pet_model.dart';
import 'data/models/service_model.dart';
import 'data/local/demo_data.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize Hive
  await Hive.initFlutter();

  // Register Adapters
  Hive.registerAdapter(ClientModelAdapter());
  Hive.registerAdapter(PetModelAdapter());
  Hive.registerAdapter(ServiceModelAdapter());

  // Open Boxes
  await Hive.openBox<ClientModel>('clientsBox');
  await Hive.openBox<PetModel>('petsBox');
  await Hive.openBox<ServiceModel>('servicesBox');

  // Insert demo data if empty
  await DemoData.initDemoData();

  runApp(const PetsPlaceApp());
}
