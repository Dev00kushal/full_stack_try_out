class AppExceptions implements Exception {
  final String? message;
  final String? prefix;

  AppExceptions([this.message, this.prefix]);
  @override
  String toString() {
    return "$prefix$message";
  }
}

// Expection while fetching the data
class FetchDataException extends AppExceptions {
  FetchDataException([String? message])
      : super(message, "Error During Communication: ");
}

// Expection while Invilaid request
class BadRequestException extends AppExceptions {
  BadRequestException([String? message]) : super(message, "Invalid Request: ");
}

// Expection while Unauthorised request
class UnauthorisedException extends AppExceptions {
  UnauthorisedException([String? message]) : super(message, "Unauthorised: ");
}

// Expection while Invalid input
class InvalidInputException extends AppExceptions {
  InvalidInputException([String? message]) : super(message, "Invalid Input: ");
}
