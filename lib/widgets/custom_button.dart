import 'package:flutter/material.dart';

enum CustomButtonStyle { primary, secondary, danger, outline }

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;
  final CustomButtonStyle style;

  const CustomButton({Key? key, required this.text, this.onPressed, this.style = CustomButtonStyle.primary}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Semantics(
      button: true,
      label: text,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: style == CustomButtonStyle.danger ? Colors.redAccent : Theme.of(context).primaryColor,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        ),
        onPressed: onPressed ?? () {},
        child: Text(text, style: const TextStyle(color: Colors.white)),
      ),
    );
  }
}
