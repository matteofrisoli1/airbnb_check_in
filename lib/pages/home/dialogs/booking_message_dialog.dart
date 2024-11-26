import 'package:flutter/material.dart';

class BookingMessageDialog extends StatelessWidget {
  final String title;
  final String message;

  const BookingMessageDialog({super.key, required this.title, required this.message});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(title),
      content: Text(message),
      actions: [
        TextButton(
          onPressed: Navigator.of(context).maybePop,
          child: const Text('Ok'),
        ),
      ],
    );
  }
}
