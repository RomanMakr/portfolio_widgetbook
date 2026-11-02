import 'package:flutter/material.dart';

import '../design/theme.dart';

class AccentButton extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;
  final IconData? icon;
  const AccentButton({
    super.key,
    required this.text,
    this.onPressed,
    this.icon,
  });

  @override
  Widget build(BuildContext context) => DecoratedBox(
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(8),
      gradient: onPressed == null
          ? null
          : const LinearGradient(
              colors: [Color(0xFFA300FF), Color(0xFF7900F5)],
            ),
      boxShadow: onPressed == null
          ? []
          : const [
              BoxShadow(
                color: Color(0x389600FF),
                blurRadius: 22,
                offset: Offset(0, 5),
              ),
            ],
    ),
    child: ElevatedButton.icon(
      iconAlignment: icon == null ? IconAlignment.end : IconAlignment.start,
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.transparent,
        shadowColor: Colors.transparent,
        disabledBackgroundColor: Palette.panel2,
      ),
      onPressed: onPressed,
      icon: Icon(icon ?? Icons.arrow_forward, size: 17),
      label: Text(text),
    ),
  );
}
