import 'package:tui_lib/validation/validation.dart';

class ValidateChallenge {
  static const int addressMaxLength = 300;
  static const int addressMinLength = 1;
  static const int cityMaxLength = 100;
  static const int cityMinLength = 1;
  static const int countryMaxLength = 100;
  static const int countryMinLength = 0;
  static const int postalMaxLength = 10;
  static const int postalMinLength = 5;
  static const int stateMaxLength = 50;
  static const int stateMinLength = 1;
  static const int street1MaxLength = 100;
  static const int street1MinLength = 1;
  static const int street2MaxLength = 100;
  static const int street2MinLength = 0;
  static const int notesMaxLength = 500;
  static const int notesMinLength = 0;

  static bool allFields({
    required String address,
    required String city,
    required String country,
    required String postal,
    required String state,
    required String street1,
    required String street2,
    required String notes,
  }) {
    if (ValidateChallenge.address(address).isNotValid ||
        ValidateChallenge.city(city).isNotValid ||
        ValidateChallenge.country(city).isNotValid ||
        ValidateChallenge.postal(postal).isNotValid ||
        ValidateChallenge.state(state).isNotValid ||
        ValidateChallenge.street1(state).isNotValid ||
        ValidateChallenge.street2(state).isNotValid ||
        ValidateChallenge.notes(notes).isNotValid) {
      return false;
    }
    return true;
  }

  static Validation address(String value) {
    var validation = Validation();
    if (value.length > addressMaxLength) {
      validation.setError('Address must be under $addressMaxLength characters');
    }
    if (value.length < addressMinLength) {
      validation
          .setError('Address must be at least $addressMinLength characters');
    }
    return validation;
  }

  static Validation city(String value) {
    var validation = Validation();
    if (value.length > cityMaxLength) {
      validation.setError('City must be under $cityMaxLength characters');
    }
    if (value.length < cityMinLength) {
      validation.setError('City must be at least $cityMinLength characters');
    }
    return validation;
  }

  static Validation country(String value) {
    var validation = Validation();
    if (value.length > countryMaxLength) {
      validation.setError('Country must be under $countryMaxLength characters');
    }
    if (value.length < countryMinLength) {
      validation
          .setError('Country must be at least $countryMinLength characters');
    }
    return validation;
  }

  static Validation postal(String value) {
    var validation = Validation();
    if (value.length > postalMaxLength) {
      validation
          .setError('Postal code must be under $postalMaxLength characters');
    }
    if (value.length < postalMinLength) {
      validation
          .setError('Postal code must be at least $postalMinLength characters');
    }
    return validation;
  }

  static Validation state(String value) {
    var validation = Validation();
    if (value.length > stateMaxLength) {
      validation.setError('State must be under $stateMaxLength characters');
    }
    if (value.length < stateMinLength) {
      validation.setError('State must be at least $stateMinLength characters');
    }
    return validation;
  }

  static Validation street1(String value) {
    var validation = Validation();
    if (value.length > street1MaxLength) {
      validation
          .setError('Street Line 1 must be under $street1MaxLength characters');
    }
    if (value.length < street1MinLength) {
      validation.setError(
          'Street Line 1 must be at least $street1MinLength characters');
    }
    return validation;
  }

  static Validation street2(String value) {
    var validation = Validation();
    if (value.length > street2MaxLength) {
      validation
          .setError('Street Line 2 must be under $street2MaxLength characters');
    }
    if (value.length < street2MinLength) {
      validation.setError(
          'Street Line 2 must be at least $street2MinLength characters');
    }
    return validation;
  }

  static Validation notes(String value) {
    var validation = Validation();
    if (value.length > notesMaxLength) {
      validation.setError('Notes must be under $notesMaxLength characters');
    }
    if (value.length < notesMinLength) {
      validation.setError('Notes must be at least $notesMinLength characters');
    }
    return validation;
  }
}
