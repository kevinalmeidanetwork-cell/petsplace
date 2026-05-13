import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:go_router/go_router.dart';
import '../../data/models/service_model.dart';
import '../../core/utils/id_generator.dart';
import 'services_view_model.dart';
import '../clients/clients_view_model.dart';
import '../pets/pets_view_model.dart';

class AddServiceScreen extends StatefulWidget {
  const AddServiceScreen({Key? key}) : super(key: key);

  @override
  State<AddServiceScreen> createState() => _AddServiceScreenState();
}

class _AddServiceScreenState extends State<AddServiceScreen> {
  final _formKey = GlobalKey<FormState>();
  String? _selectedClientId;
  String? _selectedPetId;
  String _selectedServiceType = 'Dog Walking';
  final _precoController = TextEditingController(text: '15.0');
  DateTime _selectedDate = DateTime.now();

  final List<String> _serviceTypes = [
    'Dog Walking',
    'Boarding',
    'Pet Sitting',
    'Daycare',
    'Transport',
    'Extra'
  ];

  @override
  void dispose() {
    _precoController.dispose();
    super.dispose();
  }

  void _save() {
    if (_formKey.currentState!.validate() && _selectedClientId != null && _selectedPetId != null) {
      final viewModel = Provider.of<ServicesViewModel>(context, listen: false);

      final newService = ServiceModel(
        id: IdGenerator.generateId(),
        serviceType: _selectedServiceType,
        clientId: _selectedClientId!,
        petIds: [_selectedPetId!],
        data: _selectedDate,
        preco: double.tryParse(_precoController.text) ?? 0.0,
        createdAt: DateTime.now(),
        updatedAt: DateTime.now(),
      );

      viewModel.addService(newService);
      context.pop();
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please select client and pet')),
      );
    }
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final clients = Provider.of<ClientsViewModel>(context).clients;
    final petsViewModel = Provider.of<PetsViewModel>(context);

    // Filter pets based on selected client
    final availablePets = _selectedClientId != null
        ? petsViewModel.getPetsForClient(_selectedClientId!)
        : [];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Service'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
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
                    _selectedPetId = null; // Reset pet when client changes
                  });
                },
                validator: (value) => value == null ? 'Obrigatório' : null,
              ),
              DropdownButtonFormField<String>(
                value: _selectedPetId,
                decoration: const InputDecoration(labelText: 'Pet'),
                items: availablePets.map((pet) {
                  return DropdownMenuItem(
                    value: pet.id,
                    child: Text(pet.nome),
                  );
                }).toList(),
                onChanged: (val) {
                  setState(() {
                    _selectedPetId = val;
                  });
                },
                validator: (value) => value == null ? 'Obrigatório' : null,
              ),
              DropdownButtonFormField<String>(
                value: _selectedServiceType,
                decoration: const InputDecoration(labelText: 'Service Type'),
                items: _serviceTypes.map((type) {
                  return DropdownMenuItem(
                    value: type,
                    child: Text(type),
                  );
                }).toList(),
                onChanged: (val) {
                  setState(() {
                    _selectedServiceType = val!;
                  });
                },
              ),
              Row(
                children: [
                  Expanded(
                    child: Text(
                      "Date: ${_selectedDate.toLocal()}".split(' ')[0],
                      style: const TextStyle(fontSize: 16),
                    ),
                  ),
                  TextButton(
                    onPressed: () => _selectDate(context),
                    child: const Text('Select Date'),
                  ),
                ],
              ),
              TextFormField(
                controller: _precoController,
                decoration: const InputDecoration(labelText: 'Preço (€)'),
                keyboardType: TextInputType.number,
                validator: (value) => value!.isEmpty ? 'Obrigatório' : null,
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
