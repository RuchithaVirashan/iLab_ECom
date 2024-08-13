class ValidateService {
  String? isEmptyField(String value) {
    if (value.isEmpty) {
      return 'Required';
    }
    return null;
  }

  String? validatePhoneNumber(String value) {
    String pattern = r'^\d{10}$';
    RegExp regExp = RegExp(pattern);

    if (value.isEmpty) {
      return 'Please enter a mobile number';
    } else if (value.length != 10) {
      return 'Telephone number should be 10 characters long';
    } else if (!regExp.hasMatch(value)) {
      return 'Invalid mobile number';
    }
    return null;
  }
}
