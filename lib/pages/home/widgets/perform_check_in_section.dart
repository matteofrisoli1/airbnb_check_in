import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';

class PerformCheckInSection extends StatelessWidget {
  final TextEditingController pinController;
  final ValueChanged<String>? onCheckIn;

  const PerformCheckInSection({super.key, required this.pinController, required this.onCheckIn});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 16, bottom: 36),
          child: Text(
            'Inserisci il pin-code che dovresti aver ricevuto dall\'host per procedere con la procedura di check-in.',
            style: TextStyle(
              color: Colors.grey.shade600,
              fontSize: 14,
            ),
          ),
        ),
        Center(
          child: Pinput(
            length: 4,
            controller: pinController,
            defaultPinTheme: PinTheme(
              width: 64,
              height: 64,
              textStyle: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w500,
                color: Colors.grey.shade500,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12.0),
                border: Border.all(
                  color: Colors.grey.shade500,
                ),
              ),
            ),
            focusedPinTheme: PinTheme(
              width: 64,
              height: 64,
              textStyle: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w500,
                color: Colors.grey.shade900,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12.0),
                border: Border.all(
                  color: Colors.grey.shade900,
                ),
              ),
            ),
            separatorBuilder: (_) => const SizedBox(width: 16),
            validator: (code) {
              return code?.length == 4 ? null : 'Inserisci un pin valido';
            },
          ),
        ),
        const SizedBox(height: 24),
        SizedBox(
          width: double.maxFinite,
          child: ElevatedButton(
            onPressed: () => _performCheckIn(context),
            child: const Text('Check-In'),
          ),
        )
      ],
    );
  }

  void _performCheckIn(BuildContext context) {
    final pinCode = pinController.text;
    if (pinCode.length == 4) {
      onCheckIn?.call(pinCode);
    }
  }
}
