import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:go_router/go_router.dart';
import '../clients/clients_view_model.dart';
import '../pets/pets_view_model.dart';
import '../services/services_view_model.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('PetsPlace Walker Pro'),
      ),
      body: Consumer3<ClientsViewModel, PetsViewModel, ServicesViewModel>(
        builder: (context, clientsVM, petsVM, servicesVM, child) {
          final totalClients = clientsVM.clients.length;
          final totalPets = petsVM.pets.length;
          final totalServices = servicesVM.services.length;

          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const Text(
                  'Overview',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    _StatCard(title: 'Clients', count: totalClients.toString(), color: Colors.blue),
                    _StatCard(title: 'Pets', count: totalPets.toString(), color: Colors.orange),
                    _StatCard(title: 'Services', count: totalServices.toString(), color: Colors.green),
                  ],
                ),
                const SizedBox(height: 32),
                const Text(
                  'Quick Actions',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 16),
                Wrap(
                  spacing: 16,
                  runSpacing: 16,
                  alignment: WrapAlignment.center,
                  children: [
                    ElevatedButton.icon(
                      onPressed: () => context.push('/clients/add'),
                      icon: const Icon(Icons.person_add),
                      label: const Text('New Client'),
                    ),
                    ElevatedButton.icon(
                      onPressed: () => context.push('/pets/add'),
                      icon: const Icon(Icons.pets),
                      label: const Text('New Pet'),
                    ),
                    ElevatedButton.icon(
                      onPressed: () => context.push('/services/add'),
                      icon: const Icon(Icons.add_task),
                      label: const Text('New Service'),
                    ),
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

class _StatCard extends StatelessWidget {
  final String title;
  final String count;
  final Color color;

  const _StatCard({required this.title, required this.count, required this.color});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: color.withOpacity(0.1),
      elevation: 0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 32),
        child: Column(
          children: [
            Text(
              count,
              style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: color),
            ),
            const SizedBox(height: 8),
            Text(title, style: TextStyle(fontWeight: FontWeight.w500)),
          ],
        ),
      ),
    );
  }
}
