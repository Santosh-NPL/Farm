import 'package:farm/resources/app_color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class GeneralExceptionWidget extends StatelessWidget {
  final VoidCallback onPress;
  const GeneralExceptionWidget({Key? key, required this.onPress}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.signal_wifi_off,
            size: 50,
            color: AppColor.primaryColor,
          ),
          SizedBox(height: 16),
          Text(
            'internet_exception'.tr,
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 8),
          Text(
            'no_internet_message'.tr,
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 16),
          ),
          SizedBox(height: 16),
          ElevatedButton(
            onPressed: onPress,
            child: Text('retry'.tr),
          ),
        ],
      ),
    );
  }
}
