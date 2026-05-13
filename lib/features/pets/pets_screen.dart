import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:go_router/go_router.dart';
import 'pets_view_model.dart';
import '../clients/clients_view_model.dart';

class PetsScreen extends StatelessWidget {
  const PetsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pets'),
      ),
      body: Consumer2<PetsViewModel, ClientsViewModel>(
        builder: (context, petsViewModel, clientsViewModel, child) {
          final pets = petsViewModel.pets;

          if (pets.isEmpty) {
            return const Center(child: Text('No pets found. Add one!'));
          }

          return ListView.builder(
            itemCount: pets.length,
            itemBuilder: (context, index) {
              final pet = pets[index];
              final client = clientsViewModel.getClient(pet.clientId);
              final clientName = client != null ? '${client.nome} ${client.apelido}' : 'Unknown Client';

              return ListTile(
                title: Text('${pet.nome} (${pet.raca ?? pet.especie})'),
                subtitle: Text('Owner: $clientName'),
                onTap: () {
                  context.push('/pets/detail', extra: pet);
                },
                trailing: IconButton(
                  icon: const Icon(Icons.delete, color: Colors.red),
                  onPressed: () {
                    petsViewModel.deletePet(pet.id);
                  },
                ),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.push('/pets/add');
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
