import 'package:farm/resources/app_color.dart';
import 'package:flutter/material.dart';

class DatePickerWidget extends StatefulWidget {
  final String label;
  final Function(DateTime)? onDateSelected;

  const DatePickerWidget({Key? key, required this.label, this.onDateSelected}) : super(key: key);

  @override
  _DatePickerWidgetState createState() => _DatePickerWidgetState();
}

class _DatePickerWidgetState extends State<DatePickerWidget> {
  DateTime _selectedDate = DateTime.now();

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate,
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );

    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;
      });

      if (widget.onDateSelected != null) {
        widget.onDateSelected!(_selectedDate);
      }
    }
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
            color: AppColor.primaryColor, // Adjust color as needed
          ),
        ),
        SizedBox(height: 5),
        Row(
          children: [
            Expanded(
              child: GestureDetector(
                onTap: () => _selectDate(context),
                child: AbsorbPointer(
                  child: TextField(
                    controller: TextEditingController(
                      text: "${_selectedDate.day}/${_selectedDate.month}/${_selectedDate.year}",
                    ),
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 10),
                      suffixIcon: Icon(Icons.calendar_today, color: Colors.blue), // Adjust color as needed
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.blue), // Adjust color as needed
                      ),
                      border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.blue), // Adjust color as needed
                      ),
                    ),
                  ),
                ),
              ),
            ),

          ],
        ),
        SizedBox(
          height: 10,
        ),
      ],
    );
  }
}
