import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../features/dashboard/dashboard_screen.dart';
import '../features/clients/clients_screen.dart';
import '../features/clients/add_edit_client_screen.dart';
import '../features/clients/client_detail_screen.dart';
import '../features/pets/pets_screen.dart';
import '../features/pets/add_edit_pet_screen.dart';
import '../features/pets/pet_detail_screen.dart';
import '../features/services/services_screen.dart';
import '../features/services/add_service_screen.dart';
import '../features/services/service_detail_screen.dart';
import '../data/models/client_model.dart';
import '../data/models/pet_model.dart';
import '../data/models/service_model.dart';

final GlobalKey<NavigatorState> _rootNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'root');
final GlobalKey<NavigatorState> _shellNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'shell');

class AppRouter {
  static final GoRouter router = GoRouter(
    navigatorKey: _rootNavigatorKey,
    initialLocation: '/dashboard',
    routes: <RouteBase>[
      ShellRoute(
        navigatorKey: _shellNavigatorKey,
        builder: (BuildContext context, GoRouterState state, Widget child) {
          return ScaffoldWithNavBar(child: child);
        },
        routes: <RouteBase>[
          GoRoute(
            path: '/dashboard',
            builder: (BuildContext context, GoRouterState state) => const DashboardScreen(),
          ),
          GoRoute(
            path: '/clients',
            builder: (BuildContext context, GoRouterState state) => const ClientsScreen(),
            routes: [
              GoRoute(
                path: 'add',
                parentNavigatorKey: _rootNavigatorKey,
                builder: (BuildContext context, GoRouterState state) => const AddEditClientScreen(),
              ),
              GoRoute(
                path: 'detail',
                parentNavigatorKey: _rootNavigatorKey,
                builder: (BuildContext context, GoRouterState state) {
                  final client = state.extra as ClientModel;
                  return ClientDetailScreen(client: client);
                },
              ),
            ]
          ),
          GoRoute(
            path: '/pets',
            builder: (BuildContext context, GoRouterState state) => const PetsScreen(),
            routes: [
              GoRoute(
                path: 'add',
                parentNavigatorKey: _rootNavigatorKey,
                builder: (BuildContext context, GoRouterState state) => const AddEditPetScreen(),
              ),
              GoRoute(
                path: 'detail',
                parentNavigatorKey: _rootNavigatorKey,
                builder: (BuildContext context, GoRouterState state) {
                  final pet = state.extra as PetModel;
                  return PetDetailScreen(pet: pet);
                },
              ),
            ]
          ),
          GoRoute(
            path: '/services',
            builder: (BuildContext context, GoRouterState state) => const ServicesScreen(),
            routes: [
              GoRoute(
                path: 'add',
                parentNavigatorKey: _rootNavigatorKey,
                builder: (BuildContext context, GoRouterState state) => const AddServiceScreen(),
              ),
              GoRoute(
                path: 'detail',
                parentNavigatorKey: _rootNavigatorKey,
                builder: (BuildContext context, GoRouterState state) {
                  final service = state.extra as ServiceModel;
                  return ServiceDetailScreen(service: service);
                },
              ),
            ]
          ),
        ],
      ),
    ],
  );
}

class ScaffoldWithNavBar extends StatelessWidget {
  const ScaffoldWithNavBar({
    required this.child,
    Key? key,
  }) : super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: child,
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.dashboard),
            label: 'Dashboard',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.people),
            label: 'Clients',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.pets),
            label: 'Pets',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.design_services),
            label: 'Services',
          ),
        ],
        currentIndex: _calculateSelectedIndex(context),
        onTap: (int idx) => _onItemTapped(idx, context),
      ),
    );
  }

  static int _calculateSelectedIndex(BuildContext context) {
    final String location = GoRouterState.of(context).uri.toString();
    if (location.startsWith('/dashboard')) {
      return 0;
    }
    if (location.startsWith('/clients')) {
      return 1;
    }
    if (location.startsWith('/pets')) {
      return 2;
    }
    if (location.startsWith('/services')) {
      return 3;
    }
    return 0;
  }

  void _onItemTapped(int index, BuildContext context) {
    switch (index) {
      case 0:
        GoRouter.of(context).go('/dashboard');
        break;
      case 1:
        GoRouter.of(context).go('/clients');
        break;
      case 2:
        GoRouter.of(context).go('/pets');
        break;
      case 3:
        GoRouter.of(context).go('/services');
        break;
    }
  }
}
