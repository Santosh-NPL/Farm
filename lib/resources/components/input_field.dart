import 'package:flutter/material.dart';
import 'package:flutter/services.dart'; // Import the services library
import '../app_color.dart';

class InputFiles extends StatefulWidget {
  const InputFiles({
    Key? key,
    required this.label,
    this.prefixText,
    this.obscureText = false,
    this.suffix,
    this.inputType = TextInputType.text,
    this.showPrefix = false, // Added a showPrefix parameter with a default value
  }) : super(key: key);

  final String label;
  final String? prefixText;
  final bool obscureText;
  final Widget? suffix;
  final TextInputType inputType;
  final bool showPrefix; // Added showPrefix parameter

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
          style: TextStyle(fontSize: 18),
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
                _isPasswordVisible
                    ? Icons.visibility
                    : Icons.visibility_off,
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
            prefix: widget.showPrefix
                ? Padding(
              padding: EdgeInsets.symmetric(horizontal: 8),
              child: Text(
                widget.prefixText ?? '',
                style:
                TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            )
                : null, // Show prefix only if showPrefix is true
          ),
        ),
        SizedBox(
          height: 10,
        ),
      ],
    );
  }
}
