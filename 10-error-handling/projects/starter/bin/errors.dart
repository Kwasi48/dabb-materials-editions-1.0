void main() {
  const password = 'password1234';
  try {
    validatePassword(password);
    print('Passwors is valid');
  } on ShortPasswordException catch (e) {
    print(e.message);
  } on NoLowercaseException catch (e) {
    print(e.message);
  } on NoUppercaseException catch (e) {
    print(e.message);
  } on NoNumberException catch (e) {
    print(e.message);
  }
}

//Defining Exceptions
class ShortPasswordException implements Exception {
  ShortPasswordException(this.message);
  final String message;
}

class NoUppercaseException implements Exception {
  NoUppercaseException(this.message);
  final String message;
}

class NoLowercaseException implements Exception {
  NoLowercaseException(this.message);
  final String message;
}

class NoNumberException implements Exception {
  NoNumberException(this.message);
  final String message;
}

void validateLowercase(String password) {
  final lowercase = RegExp(r'{a-z}');
  if (!password.contains(lowercase)) {
    throw NoLowercaseException('Password must have a lowercase letter!');
  }
}

void validateUppercase(String password) {
  final uppercase = RegExp(r'{A-Z}');
  if (!password.contains(password)) {
    throw NoUppercaseException('Password must have an uppercase letter');
  }
}

void validateNumber(String password) {
  final number = RegExp(r'{0-9}');
  if (!password.contains(number)) {
    throw NoNumberException('Password must have a number');
  }
}

void validateLength(String password) {
  final goodLength = RegExp(r'{12}');
  if (!password.contains(goodLength)) {
    throw ShortPasswordException('Password must be at least 12 characters!');
  }
}

void validatePassword(String password) {
  validateLength(password);
  validateLowercase(password);
  validateUppercase(password);
}
