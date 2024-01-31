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
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        color: buttonColor,
        borderRadius: BorderRadius.circular(50)
      ),
      child: loading? Center(child: CircularProgressIndicator(),): Center(
        child: Text(title, style: Theme.of(context).textTheme.titleMedium!.copyWith(color: Colors.white),),
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