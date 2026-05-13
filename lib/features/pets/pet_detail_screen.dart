import 'package:flutter/material.dart';
import '../../data/models/pet_model.dart';
import 'package:provider/provider.dart';
import '../clients/clients_view_model.dart';
import '../services/services_view_model.dart';

class PetDetailScreen extends StatelessWidget {
  final PetModel pet;
  const PetDetailScreen({Key? key, required this.pet}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(pet.nome)),
      body: Consumer2<ClientsViewModel, ServicesViewModel>(
        builder: (context, clientsVM, servicesVM, child) {
          final owner = clientsVM.getClient(pet.clientId);
          final ownerName = owner != null ? '${owner.nome} ${owner.apelido}' : 'Unknown';
          final petServices = servicesVM.services.where((s) => s.petIds.contains(pet.id)).toList();

          return ListView(
            padding: const EdgeInsets.all(16.0),
            children: [
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text('Pet Info', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                      const SizedBox(height: 8),
                      Text('Species: ${pet.especie}'),
                      Text('Breed: ${pet.raca ?? "N/A"}'),
                      Text('Owner: $ownerName'),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 16),
              const Text('Service History', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              ...petServices.map((s) => ListTile(
                leading: const Icon(Icons.history),
                title: Text(s.serviceType),
                subtitle: Text(s.data.toLocal().toString().split(' ')[0]),
              )).toList(),
            ],
          );
        }
      ),
    );
  }
}
