import 'package:flutter/material.dart';

class ButtonCreated extends StatefulWidget {
  const ButtonCreated({super.key, required this.buttonText, required this.onPress,});

  final String buttonText;
  final VoidCallback onPress;
  @override
  State<ButtonCreated> createState() => _ButtonCreatedState();
}

class _ButtonCreatedState extends State<ButtonCreated> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () {
          widget.onPress();
        },
        style: ButtonStyle(
          foregroundColor:
          MaterialStateProperty.all<Color>(Colors.white),
          backgroundColor:
          MaterialStateProperty.all<Color>(Colors.purple),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(24.0),
            ),
          ),
        ),
        child: Padding(
          padding: EdgeInsets.all(14.0),
          child: Text(
            widget.buttonText,
            style: TextStyle(fontSize: 16),
          ),
        ),
      ),
    );
  }
}
