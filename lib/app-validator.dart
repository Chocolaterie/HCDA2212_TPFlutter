import 'package:email_validator/email_validator.dart';

class AppValidator {

  static String? validateEmail(String? value) {
    if (value == null || value.isEmpty){
      return "L'email ne doit pas être vide";
    }

    if (!EmailValidator.validate(value)){
      return "Le format de l'email est incorrect";
    }

    return null;
  }

  static String? validatePassword(String? value){
    if (value == null || value.isEmpty){
      return "Le mot de passe doit être renseigné";
    }

    if (value.length < 4){
      return "Le mot de passe est trop court";
    }

    return null;
  }
}