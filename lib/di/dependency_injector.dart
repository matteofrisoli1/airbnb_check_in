import 'package:airbnb_checkin/cubits/auth/auth_cubit.dart';
import 'package:airbnb_checkin/repositories/auth_repository.dart';
import 'package:airbnb_checkin/services/auth_service.dart';
import 'package:airbnb_checkin/services/keychain_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import 'package:pine/di/dependency_injector_helper.dart';

part 'blocs.dart';
part 'repositories.dart';
part 'providers.dart';

class DependencyInjector extends StatelessWidget {
  final Widget child;

  const DependencyInjector({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return DependencyInjectorHelper(
      providers: _providers,
      repositories: _repositories,
      blocs: _blocs,
      child: child,
    );
  }
}
