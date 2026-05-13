import 'package:flutter/material.dart';
import '../../data/models/service_model.dart';
import 'package:provider/provider.dart';
import '../clients/clients_view_model.dart';
import '../pets/pets_view_model.dart';

class ServiceDetailScreen extends StatelessWidget {
  final ServiceModel service;
  const ServiceDetailScreen({Key? key, required this.service}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Service Details')),
      body: Consumer2<ClientsViewModel, PetsViewModel>(
        builder: (context, clientsVM, petsVM, child) {
          final client = clientsVM.getClient(service.clientId);
          final clientName = client != null ? '${client.nome} ${client.apelido}' : 'Unknown';

          final pets = service.petIds.map((id) => petsVM.getPet(id)).whereType<PetModel>().toList();

          return ListView(
            padding: const EdgeInsets.all(16.0),
            children: [
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(service.serviceType, style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
                      const SizedBox(height: 16),
                      Text('Date: ${service.data.toLocal().toString().split(' ')[0]}'),
                      Text('Client: $clientName'),
                      Text('Price: €${service.preco}'),
                      Text('Status: ${service.estado}'),
                      Text('Payment: ${service.pagamento}'),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 16),
              const Text('Pets Included', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              ...pets.map((p) => ListTile(
                leading: const Icon(Icons.pets),
                title: Text(p.nome),
                subtitle: Text(p.raca ?? p.especie),
              )).toList(),
            ],
          );
        }
      ),
    );
  }
}
