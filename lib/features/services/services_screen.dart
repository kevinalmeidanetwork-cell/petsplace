import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'services_view_model.dart';
import '../clients/clients_view_model.dart';

class ServicesScreen extends StatelessWidget {
  const ServicesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Services'),
      ),
      body: Consumer2<ServicesViewModel, ClientsViewModel>(
        builder: (context, servicesViewModel, clientsViewModel, child) {
          final services = servicesViewModel.services;

          if (services.isEmpty) {
            return const Center(child: Text('No services found. Add one!'));
          }

          // Sort by date descending
          services.sort((a, b) => b.data.compareTo(a.data));

          return ListView.builder(
            itemCount: services.length,
            itemBuilder: (context, index) {
              final service = services[index];
              final client = clientsViewModel.getClient(service.clientId);
              final clientName = client != null ? '${client.nome} ${client.apelido}' : 'Unknown Client';
              final dateFormat = DateFormat('dd/MM/yyyy');

              return ListTile(
                title: Text('${service.serviceType} - ${dateFormat.format(service.data)}'),
                subtitle: Text('Client: $clientName \nPrice: €${service.preco}'),
                isThreeLine: true,
                onTap: () {
                  context.push('/services/detail', extra: service);
                },
                trailing: IconButton(
                  icon: const Icon(Icons.delete, color: Colors.red),
                  onPressed: () {
                    servicesViewModel.deleteService(service.id);
                  },
                ),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.push('/services/add');
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
