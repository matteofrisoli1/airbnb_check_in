import 'package:airbnb_checkin/widget/custom_body.dart';
import 'package:flutter/material.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomBody(
          child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.symmetric(horizontal: 32.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
              'assets/images/logo.png',
              width: 56,
              height: 56,
            ),
            const SizedBox(height: 16),
            Text(
              'Benvenuto in',
              style: TextStyle(
                fontWeight: FontWeight.w600,
                color: Colors.grey.shade500,
                fontSize: 22,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              'Airbnb check-in',
              style: TextStyle(
                fontWeight: FontWeight.w600,
                color: Colors.grey.shade900,
                fontSize: 22,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              'Da quest\'app puoi gestire il check in e la tua permanenza negli Airbnb che hai prenotato.',
              style: TextStyle(
                fontSize: 14,
                color: Colors.grey.shade600,
              ),
            ),
            const SizedBox(height: 48),
            Card(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                    child: TextField(
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                        hintText: 'Il tuo indirizzo email',
                        label: const Text('Email'),
                      ),
                    ),
                  ),
                  const Divider(),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                    child: TextField(
                      obscureText: true,
                      decoration: InputDecoration(
                        hintText: 'La tua password',
                        label: const Text('Password'),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),
            Container(
              width: double.maxFinite,
              child: ElevatedButton(
                onPressed: () {},
                child: const Text('Accedi'),
              ),
            )
          ],
        ),
      )),
    );
  }
}
