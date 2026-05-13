import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

import '../features/clients/clients_view_model.dart';
import '../features/pets/pets_view_model.dart';
import '../features/services/services_view_model.dart';

class AppProviders {
  static List<SingleChildWidget> get providers {
    return [
      ChangeNotifierProvider(create: (_) => ClientsViewModel()),
      ChangeNotifierProvider(create: (_) => PetsViewModel()),
      ChangeNotifierProvider(create: (_) => ServicesViewModel()),
    ];
  }
}
