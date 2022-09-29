
import 'package:get/get.dart';

class LanguageTranslations extends Translations{
  @override
  // TODO: implement keys
  Map<String, Map<String, String>> get keys => {
    'en_US': {
          "createYourAccount": "Create your account",
          "otpVarification":"OTP Verification",
          "phoneNumber":"Phone number",
          "language":"Language",
          "chanagelanguage":"Chanage Language",
          "addressbook":"Address Book"
      },
    'ar_OM': {
          "createYourAccount": "التسجيل",
          "otpVarification":"تآكيد رمز التفعيل",
          "phoneNumber":"رقم النقال",
          "language":"لغة",
          "chanagelanguage":"تغيير اللغة",
          "addressbook":"دفتر العناوين"
    },
  };
}