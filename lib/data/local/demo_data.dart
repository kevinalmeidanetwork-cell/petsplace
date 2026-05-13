import 'package:hive_flutter/hive_flutter.dart';
import '../models/client_model.dart';
import '../models/pet_model.dart';
import '../models/service_model.dart';
import '../../core/utils/id_generator.dart';

class DemoData {
  static Future<void> initDemoData() async {
    final clientsBox = Hive.box<ClientModel>('clientsBox');
    final petsBox = Hive.box<PetModel>('petsBox');
    final servicesBox = Hive.box<ServiceModel>('servicesBox');

    if (clientsBox.isEmpty) {
      // Create Clients
      final c1 = ClientModel(
        id: IdGenerator.generateId(),
        nome: 'Ana',
        apelido: 'Martins',
        telefone: '912345678',
        dataCriacao: DateTime.now(),
      );
      final c2 = ClientModel(
        id: IdGenerator.generateId(),
        nome: 'João',
        apelido: 'Ferreira',
        dataCriacao: DateTime.now(),
      );
      final c3 = ClientModel(
        id: IdGenerator.generateId(),
        nome: 'Sofia',
        apelido: 'Almeida',
        dataCriacao: DateTime.now(),
      );
      final c4 = ClientModel(
        id: IdGenerator.generateId(),
        nome: 'Miguel',
        apelido: 'Costa',
        dataCriacao: DateTime.now(),
      );

      clientsBox.putAll({c1.id: c1, c2.id: c2, c3.id: c3, c4.id: c4});

      // Create Pets
      final p1 = PetModel(
        id: IdGenerator.generateId(),
        clientId: c1.id,
        nome: 'Luna',
        especie: 'Cão',
        raca: 'Labrador',
      );
      final p2 = PetModel(
        id: IdGenerator.generateId(),
        clientId: c2.id,
        nome: 'Max',
        especie: 'Cão',
        raca: 'Golden Retriever',
      );
      final p3 = PetModel(
        id: IdGenerator.generateId(),
        clientId: c3.id,
        nome: 'Simba',
        especie: 'Cão',
        raca: 'Bulldog Francês',
      );
      final p4 = PetModel(
        id: IdGenerator.generateId(),
        clientId: c4.id,
        nome: 'Kira',
        especie: 'Cão',
        raca: 'Pastor Alemão',
      );
      final p5 = PetModel(
        id: IdGenerator.generateId(),
        clientId: c1.id,
        nome: 'Toby',
        especie: 'Cão',
        raca: 'Beagle',
      );
      final p6 = PetModel(
        id: IdGenerator.generateId(),
        clientId: c2.id,
        nome: 'Mel',
        especie: 'Cão',
        raca: 'Caniche',
      );

      petsBox.putAll({
        p1.id: p1,
        p2.id: p2,
        p3.id: p3,
        p4.id: p4,
        p5.id: p5,
        p6.id: p6,
      });

      // Create Services
      final s1 = ServiceModel(
        id: IdGenerator.generateId(),
        serviceType: 'Dog Walking',
        clientId: c1.id,
        petIds: [p1.id],
        data: DateTime.now(),
        preco: 15.0,
        createdAt: DateTime.now(),
        updatedAt: DateTime.now(),
        estado: 'agendado'
      );
      final s2 = ServiceModel(
        id: IdGenerator.generateId(),
        serviceType: 'Boarding',
        clientId: c2.id,
        petIds: [p2.id],
        data: DateTime.now().add(const Duration(days: 2)),
        preco: 50.0,
        createdAt: DateTime.now(),
        updatedAt: DateTime.now(),
      );

      servicesBox.putAll({s1.id: s1, s2.id: s2});
    }
  }
}
