import 'package:tui_lib/validation/validation.dart';

class ValidateSurfer {
  static const int emailMaxLength = 500;
  static const int emailMinLength = 5;
  static const int firstNameMaxLength = 300;
  static const int firstNameMinLength = 1;
  static const int lastNameMaxLength = 300;
  static const int lastNameMinLength = 1;
  static const int passwordMinLength = 6;
  static const int phoneMaxLength = 20;
  static const int phoneMinLength = 1;

  static bool allFields({
    required String email,
    required String firstName,
    required String lastName,
    required String password,
    required String phone,
  }) {
    if (ValidateSurfer.email(email).isNotValid ||
        ValidateSurfer.firstName(firstName).isNotValid ||
        ValidateSurfer.lastName(lastName).isNotValid ||
        ValidateSurfer.password(password).isNotValid ||
        ValidateSurfer.phone(phone).isNotValid) {
      return false;
    }
    return true;
  }

  static Validation email(String value) {
    var validation = Validation();
    if (value.length > emailMaxLength) {
      validation.setError('Email must be under $emailMaxLength characters');
    }
    if (value.length < emailMinLength) {
      validation.setError('Email must be at least $emailMinLength characters');
    }
    return validation;
  }

  static Validation firstName(String value) {
    var validation = Validation();
    if (value.length > firstNameMaxLength) {
      validation
          .setError('First name must be under $firstNameMaxLength characters');
    }
    if (value.length < firstNameMinLength) {
      validation.setError(
          'First name must be at least $firstNameMinLength characters');
    }
    return validation;
  }

  static Validation lastName(String value) {
    var validation = Validation();
    if (value.length > lastNameMaxLength) {
      validation
          .setError('Last name must be under $lastNameMaxLength characters');
    }
    if (value.length < lastNameMinLength) {
      validation
          .setError('Last name must be at least $lastNameMinLength characters');
    }
    return validation;
  }

  static Validation password(String value) {
    var validation = Validation();
    if (value.length < passwordMinLength) {
      validation
          .setError('Password must be at least $passwordMinLength characters');
    }
    return validation;
  }

  static Validation phone(String value) {
    var validation = Validation();
    if (value.length > phoneMaxLength) {
      validation
          .setError('First name must be under $phoneMaxLength characters');
    }
    if (value.length < phoneMinLength) {
      validation
          .setError('First name must be at least $phoneMinLength characters');
    }
    return validation;
  }
}
