import 'package:flutter/cupertino.dart';

class MyButton extends StatelessWidget {
  final color;
  final textColor;
  final String buttonText;
  final buttonTaped;

  const MyButton({
    super.key,
    this.color,
    this.textColor,
    required this.buttonText,
    this.buttonTaped,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: buttonTaped,
      child: Padding(
        padding: const EdgeInsets.only(
          left: 12,
          right: 8,
          top: 8,
          bottom: 8,
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Container(
            color: color,
            child: Center(
              child: Text(
                buttonText,
                style: TextStyle(
                  color: textColor,
                  fontSize: 20,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
