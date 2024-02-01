import 'package:farm/resources/app_color.dart';
import 'package:flutter/material.dart';

class RoundButton extends StatelessWidget {

  const RoundButton({
    Key? key,
    this.buttonColor = AppColor.primaryColor,
    this.textColor = AppColor.white,
    required this.title,
    required this.onPress,
    this.width = 60,
    this.height = 50,
    this.loading = false
  }): super(key: key);

  final bool loading;
  final String title;
  final double height, width;
  final VoidCallback onPress;
  final Color textColor, buttonColor;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: onPress,
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
          child: loading? Center(child: CircularProgressIndicator(),): Text(
            title,
            style: TextStyle(fontSize: 16),
          ),
        ),
      ),
    );
  }
}


// MaterialButton(
// minWidth: double.infinity,
// height: 60,
// onPressed: (){},
// color: AppColor.primaryColor,
// elevation: 0,
// shape: RoundedRectangleBorder(
// borderRadius: BorderRadius.circular(50)
// ),
// child: Text(
// 'login'.tr, style: TextStyle(
// fontWeight: FontWeight.w600,
// fontSize: 18,
// color: AppColor.white,
// ),
// ),
// ),