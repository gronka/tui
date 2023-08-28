class Validation {
  bool isValid = true;
  String message = '';

  bool get isNotValid {
    return !this.isValid;
  }

  void setError(String msg) {
    this.isValid = false;
    this.message = msg;
  }

  String? get asValidator {
    if (this.message == '') {
      return null;
    }
    return this.message;
  }
}
