class ValidateService {
  String? isEmptyField(String value) {
    if (value.isEmpty) {
      return 'Required';
    }
    return null;
  }

  String? validatePrice(String value) {
    String pattern = r'^\d+(?:\.\d{1,2})?$';
    RegExp regExp = RegExp(pattern);
    String? isEmpty = isEmptyField(value);

    if (isEmpty != null) {
      return isEmpty;
    } else if (!regExp.hasMatch(value)) {
      return "Invalid price";
    }
    return null;
  }
}
