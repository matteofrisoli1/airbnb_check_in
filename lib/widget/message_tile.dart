import 'package:airbnb_checkin/cubits/auth/auth_cubit.dart';
import 'package:airbnb_checkin/models/my_user/my_user.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MessageTile extends StatelessWidget {
  final String message;

  const MessageTile({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: BlocSelector<AuthCubit, AuthState, MyUser?>(
        selector: (state) => switch (state) {
          AuthenticatedAuthState(:final user) => user,
          _ => null,
        },
        builder: (context, user) {
          return ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.network(
              user!.imageUrl!,
              width: 32.0,
              height: 32.0,
              fit: BoxFit.cover,
            ),
          );
        },
      ),
      title: Text(
        message,
        style: TextStyle(
          fontSize: 14,
          color: Colors.grey.shade600,
        ),
      ),
    );
  }
}
