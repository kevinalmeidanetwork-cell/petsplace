import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:go_router/go_router.dart';
import '../../data/models/client_model.dart';
import '../../core/utils/id_generator.dart';
import 'clients_view_model.dart';

class AddEditClientScreen extends StatefulWidget {
  final ClientModel? client;
  const AddEditClientScreen({Key? key, this.client}) : super(key: key);

  @override
  State<AddEditClientScreen> createState() => _AddEditClientScreenState();
}

class _AddEditClientScreenState extends State<AddEditClientScreen> {
  final _formKey = GlobalKey<FormState>();
  late TextEditingController _nomeController;
  late TextEditingController _apelidoController;
  late TextEditingController _telefoneController;

  @override
  void initState() {
    super.initState();
    _nomeController = TextEditingController(text: widget.client?.nome ?? '');
    _apelidoController = TextEditingController(text: widget.client?.apelido ?? '');
    _telefoneController = TextEditingController(text: widget.client?.telefone ?? '');
  }

  @override
  void dispose() {
    _nomeController.dispose();
    _apelidoController.dispose();
    _telefoneController.dispose();
    super.dispose();
  }

  void _save() {
    if (_formKey.currentState!.validate()) {
      final viewModel = Provider.of<ClientsViewModel>(context, listen: false);

      if (widget.client == null) {
        final newClient = ClientModel(
          id: IdGenerator.generateId(),
          nome: _nomeController.text,
          apelido: _apelidoController.text,
          telefone: _telefoneController.text,
          dataCriacao: DateTime.now(),
        );
        viewModel.addClient(newClient);
      } else {
        widget.client!.nome = _nomeController.text;
        widget.client!.apelido = _apelidoController.text;
        widget.client!.telefone = _telefoneController.text;
        viewModel.updateClient(widget.client!);
      }
      context.pop();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.client == null ? 'Add Client' : 'Edit Client'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: _nomeController,
                decoration: const InputDecoration(labelText: 'Nome'),
                validator: (value) => value!.isEmpty ? 'Obrigatório' : null,
              ),
              TextFormField(
                controller: _apelidoController,
                decoration: const InputDecoration(labelText: 'Apelido'),
                validator: (value) => value!.isEmpty ? 'Obrigatório' : null,
              ),
              TextFormField(
                controller: _telefoneController,
                decoration: const InputDecoration(labelText: 'Telefone'),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: _save,
                child: const Text('Save'),
              )
            ],
          ),
        ),
      ),
    );
  }
}
