class AppExceptions implements Exception{
  final _message;
  final _prefix;


  AppExceptions([this._message, this._prefix]);

  String toString(){

    return '$_prefix$_message';
  }
}


class InternetException extends AppExceptions{
  InternetException([String? message]) : super(message, 'No Internet');
}


class RequestTimeOut extends AppExceptions{
  RequestTimeOut([String? message]) : super(message, 'Request Time Out');
}

class ServerException extends AppExceptions{
  ServerException([String? message]) : super(message, 'Internal Server Error');
}

class BadRequest extends AppExceptions{
  BadRequest([String? message]) : super(message, 'Bad Request ');
}

class UnAuthorize extends AppExceptions{
  UnAuthorize([String? message]) : super(message, 'Unauthorized ');
}

class PaymentRequired extends AppExceptions{
  PaymentRequired([String? message]) : super(message, 'Payment Required ');
}

class Forbidden extends AppExceptions{
  Forbidden([String? message]) : super(message, 'Forbidden ');
}
class NotFound extends AppExceptions{
  NotFound([String? message]) : super(message, 'Not Found ');
}

class RequestTimeout extends AppExceptions{
  RequestTimeout([String? message]) : super(message, 'Not Found ');
}

class InternalServerError extends AppExceptions{
  InternalServerError([String? message]) : super(message, 'Internal Server Error ');
}

class NotImplemented extends AppExceptions{
  NotImplemented([String? message]) : super(message, 'Not Implemented ');
}

class BadGateway extends AppExceptions{
  BadGateway([String? message]) : super(message, 'Bad Gateway ');
}

class ServiceUnavailable extends AppExceptions{
  ServiceUnavailable([String? message]) : super(message, 'Service Unavailable ');
}
class GatewayTimeout extends AppExceptions{
  GatewayTimeout([String? message]) : super(message, 'Gateway Timeout ');
}
class FetchDataError extends AppExceptions{
  FetchDataError([String? message]) : super(message, 'Fetch data error:  ');
}
class Conflict extends AppExceptions{
  Conflict([String? message]) : super(message, 'Conflict:  ');
}

class UnProcessableEntity extends AppExceptions{
  UnProcessableEntity([String? message]) : super(message, 'UnProcessable Entity:  ');
}