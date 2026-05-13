import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:go_router/go_router.dart';
import 'clients_view_model.dart';

class ClientsScreen extends StatelessWidget {
  const ClientsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Clients'),
      ),
      body: Consumer<ClientsViewModel>(
        builder: (context, viewModel, child) {
          final clients = viewModel.clients;

          if (clients.isEmpty) {
            return const Center(child: Text('No clients found. Add one!'));
          }

          return ListView.builder(
            itemCount: clients.length,
            itemBuilder: (context, index) {
              final client = clients[index];
              return ListTile(
                title: Text('${client.nome} ${client.apelido}'),
                subtitle: Text(client.telefone ?? 'No phone'),
                onTap: () {
                  context.push('/clients/detail', extra: client);
                },
                trailing: IconButton(
                  icon: const Icon(Icons.delete, color: Colors.red),
                  onPressed: () {
                    viewModel.deleteClient(client.id);
                  },
                ),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.push('/clients/add');
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
