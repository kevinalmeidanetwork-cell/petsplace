import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:go_router/go_router.dart';
import '../../data/models/pet_model.dart';
import '../../core/utils/id_generator.dart';
import 'pets_view_model.dart';
import '../clients/clients_view_model.dart';

class AddEditPetScreen extends StatefulWidget {
  final PetModel? pet;
  const AddEditPetScreen({Key? key, this.pet}) : super(key: key);

  @override
  State<AddEditPetScreen> createState() => _AddEditPetScreenState();
}

class _AddEditPetScreenState extends State<AddEditPetScreen> {
  final _formKey = GlobalKey<FormState>();
  late TextEditingController _nomeController;
  late TextEditingController _racaController;
  String? _selectedClientId;

  @override
  void initState() {
    super.initState();
    _nomeController = TextEditingController(text: widget.pet?.nome ?? '');
    _racaController = TextEditingController(text: widget.pet?.raca ?? '');
    _selectedClientId = widget.pet?.clientId;
  }

  @override
  void dispose() {
    _nomeController.dispose();
    _racaController.dispose();
    super.dispose();
  }

  void _save() {
    if (_formKey.currentState!.validate() && _selectedClientId != null) {
      final viewModel = Provider.of<PetsViewModel>(context, listen: false);

      if (widget.pet == null) {
        final newPet = PetModel(
          id: IdGenerator.generateId(),
          clientId: _selectedClientId!,
          nome: _nomeController.text,
          especie: 'Cão', // Default for now
          raca: _racaController.text,
        );
        viewModel.addPet(newPet);
      } else {
        widget.pet!.clientId = _selectedClientId!;
        widget.pet!.nome = _nomeController.text;
        widget.pet!.raca = _racaController.text;
        viewModel.updatePet(widget.pet!);
      }
      context.pop();
    } else if (_selectedClientId == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please select a client')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final clients = Provider.of<ClientsViewModel>(context).clients;

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.pet == null ? 'Add Pet' : 'Edit Pet'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              DropdownButtonFormField<String>(
                value: _selectedClientId,
                decoration: const InputDecoration(labelText: 'Client'),
                items: clients.map((client) {
                  return DropdownMenuItem(
                    value: client.id,
                    child: Text('${client.nome} ${client.apelido}'),
                  );
                }).toList(),
                onChanged: (val) {
                  setState(() {
                    _selectedClientId = val;
                  });
                },
                validator: (value) => value == null ? 'Obrigatório' : null,
              ),
              TextFormField(
                controller: _nomeController,
                decoration: const InputDecoration(labelText: 'Nome'),
                validator: (value) => value!.isEmpty ? 'Obrigatório' : null,
              ),
              TextFormField(
                controller: _racaController,
                decoration: const InputDecoration(labelText: 'Raça'),
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
