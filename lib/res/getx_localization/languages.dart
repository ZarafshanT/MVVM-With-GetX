import 'package:get/get_navigation/src/root/internacionalization.dart';

class Languages extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        'en_US': {
          'internet_exception':
              "we are unable to show results\n please check your data\nconnection.",
          'general_exception':
              "we are unable to process your request\n please try again",
          'login': 'Log_in',
          'email_hint': 'Email',
          'pasword_hint': 'Pasword',
          'welcome_back': 'Welcome\nBack',
          'login': 'Login'
        },
        'ur_PK': {'email_hint': ' افشاںزر'},
      };
}
