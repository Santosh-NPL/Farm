import 'package:flutter/material.dart';
import 'package:flutter/services.dart'; // Import the services library
import '../app_color.dart';

class InputFiles extends StatefulWidget {
  const InputFiles({
    Key? key,
    required this.label,
    this.obscureText = false,
    this.suffix,
    this.inputType = TextInputType.text, // Default input type is TextInputType.text
  }) : super(key: key);

  final String label;
  final bool obscureText;
  final Widget? suffix;
  final TextInputType inputType;

  @override
  _InputFilesState createState() => _InputFilesState();
}

class _InputFilesState extends State<InputFiles> {
  bool _isPasswordVisible = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.label,
          style: TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w400,
            color: AppColor.primaryColor,
          ),
        ),
        SizedBox(
          height: 5,
        ),
        TextField(
          obscureText: widget.obscureText && !_isPasswordVisible,
          keyboardType: widget.inputType,
          inputFormatters: widget.inputType == TextInputType.number
              ? [FilteringTextInputFormatter.digitsOnly]
              : null, // Only allow digits for number input
          decoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 10),
            suffixIcon: widget.obscureText
                ? GestureDetector(
              onTap: () {
                setState(() {
                  _isPasswordVisible = !_isPasswordVisible;
                });
              },
              child: Icon(
                _isPasswordVisible ? Icons.visibility : Icons.visibility_off,
                color: AppColor.primaryColor,
              ),
            )
                : widget.suffix,
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: AppColor.primaryColor),
            ),
            border: OutlineInputBorder(
              borderSide: BorderSide(color: AppColor.primaryColor),
            ),
          ),
        ),
        SizedBox(
          height: 10,
        ),
      ],
    );
  }
}
