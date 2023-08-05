import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class GrenadeButton extends StatelessWidget {
  final String text;
  final bool isActive;
  final VoidCallback onPressed;

  GrenadeButton({
    required this.text,
    required this.isActive,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all<Color>(
          isActive ? Colors.amber : Colors.grey[300]!,
        ),
        elevation: MaterialStateProperty.all<double>(
          isActive ? 0 : 5,
        ),
        overlayColor: MaterialStateProperty.resolveWith<Color?>(
              (states) {
            if (states.contains(MaterialState.pressed)) {
              return Colors.white.withOpacity(0.2);
            }
            return null;
          },
        ),
      ),
      child: Text(text),
    );
  }
}

Widget buildBottomNavigationBar({
  required bool showSmoke,
  required bool showFlash,
  required bool showMolotov,
  required Function() onSmokePressed,
  required Function() onFlashPressed,
  required Function() onMolotovPressed,
}) {
  return BottomAppBar(
    color: Colors.black,
    child: Container(
      decoration: const BoxDecoration(
        color: Colors.transparent,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          GrenadeButton(
            text: 'Smoke',
            isActive: showSmoke,
            onPressed: onSmokePressed,
          ),
          GrenadeButton(
            text: 'Flash',
            isActive: showFlash,
            onPressed: onFlashPressed,
          ),
          GrenadeButton(
            text: 'Molotov',
            isActive: showMolotov,
            onPressed: onMolotovPressed,
          ),
        ],
      ),
    ),
  );
}