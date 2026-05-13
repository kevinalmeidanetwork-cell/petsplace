import 'package:flutter/material.dart';
import '../../data/models/client_model.dart';
import 'package:provider/provider.dart';
import '../pets/pets_view_model.dart';
import '../services/services_view_model.dart';

class ClientDetailScreen extends StatelessWidget {
  final ClientModel client;
  const ClientDetailScreen({Key? key, required this.client}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('${client.nome} ${client.apelido}')),
      body: Consumer2<PetsViewModel, ServicesViewModel>(
        builder: (context, petsVM, servicesVM, child) {
          final clientPets = petsVM.getPetsForClient(client.id);
          final clientServices = servicesVM.services.where((s) => s.clientId == client.id).toList();

          return ListView(
            padding: const EdgeInsets.all(16.0),
            children: [
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text('Contact Info', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                      const SizedBox(height: 8),
                      Text('Phone: ${client.telefone ?? "N/A"}'),
                      Text('Email: ${client.email ?? "N/A"}'),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 16),
              const Text('Pets', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              ...clientPets.map((p) => ListTile(
                leading: const Icon(Icons.pets),
                title: Text(p.nome),
                subtitle: Text(p.raca ?? p.especie),
              )).toList(),
              const SizedBox(height: 16),
              const Text('Service History', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              ...clientServices.map((s) => ListTile(
                leading: const Icon(Icons.history),
                title: Text(s.serviceType),
                subtitle: Text(s.data.toLocal().toString().split(' ')[0]),
                trailing: Text('€${s.preco}'),
              )).toList(),
            ],
          );
        }
      ),
    );
  }
}
