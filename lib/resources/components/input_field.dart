import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../app_color.dart';

class InputFiles extends StatefulWidget {
  const InputFiles({
    Key? key,
    required this.label,
    this.prefixText,
    this.obscureText = false,
    this.suffix,
    this.inputType = TextInputType.text,
    this.showPrefix = false,
    this.controller,
    this.validator,
  }) : super(key: key);

  final String label;
  final String? prefixText;
  final bool obscureText;
  final Widget? suffix;
  final TextInputType inputType;
  final bool showPrefix;
  final TextEditingController? controller;
  final String? Function(String?)? validator; // Adjusted the type of validator

  @override
  _InputFilesState createState() => _InputFilesState();
}

class _InputFilesState extends State<InputFiles> {
  bool _isPasswordVisible = false;

  String? _validate(String? value) {
    if (widget.validator != null) {
      return widget.validator!(value);
    }
    return null;
  }

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
          controller: widget.controller,
          style: TextStyle(fontSize: 18),
          obscureText: widget.obscureText && !_isPasswordVisible,
          keyboardType: widget.inputType,
          inputFormatters: widget.inputType == TextInputType.number
              ? [FilteringTextInputFormatter.digitsOnly]
              : null,
          onChanged: (value) {
            _validate(value); // Call the validator function when the text changes
            setState(() {}); // Trigger a rebuild to display error messages
          },
          decoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 10),
            errorText: _validate(widget.controller?.text),
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
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            )
                : null,
          ),
        ),
        SizedBox(
          height: 10,
        ),
      ],
    );
  }
}
