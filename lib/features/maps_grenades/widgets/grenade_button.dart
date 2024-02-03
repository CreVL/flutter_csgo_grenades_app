import 'package:csgo_grenades/theme/app_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class GrenadeButton extends StatelessWidget {
  final String text;
  final bool isActive;
  final VoidCallback onPressed;

  const GrenadeButton({
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
          isActive ? AppColors.yellowColor : AppColors.grayViewColor,
        ),
        elevation: MaterialStateProperty.all<double>(
          isActive ? 0 : 5,
        ),
        overlayColor: MaterialStateProperty.resolveWith<Color?>(
          (states) {
            if (states.contains(MaterialState.pressed)) {
              return AppColors.whiteColor.withOpacity(0.2);
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
  required bool isSmokeActive,
  required bool isFlashActive,
  required bool isMolotovActive,
  required Function() onSmokePressed,
  required Function() onFlashPressed,
  required Function() onMolotovPressed,
}) {
  return BottomAppBar(
    color: AppColors.blackColor,
    child: Container(
      decoration: const BoxDecoration(
        color: Colors.transparent,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          GrenadeButton(
            text: 'Smoke',
            isActive: isSmokeActive,
            onPressed: onSmokePressed,
          ),
          GrenadeButton(
            text: 'Flash',
            isActive: isFlashActive,
            onPressed: onFlashPressed,
          ),
          GrenadeButton(
            text: 'Molotov',
            isActive: isMolotovActive,
            onPressed: onMolotovPressed,
          ),
        ],
      ),
    ),
  );
}
