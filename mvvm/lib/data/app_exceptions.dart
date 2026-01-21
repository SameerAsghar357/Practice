class AppExceptions implements Exception {
  String? message;
  String? prefix;

  AppExceptions([this.message, this.prefix]);

  @override
  String toString() {
    return '$prefix$message';
  }
}

class FetchDataException extends AppExceptions {
  FetchDataException([String? message])
    : super(message, 'Error while communicating with server: ');
}

class BadNetworkException extends AppExceptions {
  BadNetworkException([String? message])
    : super(message, 'Bad Internet Connection: ');
}

class UnauthorisedException extends AppExceptions {
  UnauthorisedException([String? message])
    : super(message, 'UnAuthorised Exception Error: ');
}

class InvalidInputException extends AppExceptions {
  InvalidInputException([String? message])
    : super(message, 'Invalid Input Error: ');
}
