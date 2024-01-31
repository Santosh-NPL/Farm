import 'package:get/get_navigation/src/root/internacionalization.dart';

class Languages extends Translations{

  @override

  Map<String, Map<String, String>> get keys => {




    'en_US' : {
      'Farm' : 'Cow Farm',
      'email_hint' : 'Enter Email',
      'internet_exception' : 'No Internet Connection',
      'general_exception' : 'No Internet Connection',
      'no_internet_message': 'Please check your internet connection and try again.',
      'general_message': 'Please check your internet connection and try again.',


      //buttons
      'retry' : 'Retry',
    },






    'np_NPL' : {
      'farm' : 'फार्म',
      'email_hint' : 'इमेल प्रविष्ट गर्नुहोस्',
      'internet_exception' : 'इन्टरनेट जडान छैन',
      'general_exception' : 'पूरा गर्न सकिदैन ।',

      'no_internet_message': 'कृपया तपाईँको इन्टरनेट जडान जाँच गर्नुहोस् र पुन: प्रयास गर्नुहोस् ।',
      'general_message': 'सर्भर त्रुटिका कारण कार्य पूरा हुन सकेन । ',



      //button
      'retry' : 'पुन: प्रयास गर्नुहोस्',
    }






  };

}