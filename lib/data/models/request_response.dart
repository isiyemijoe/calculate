class RequestRes {
  dynamic response;
  ErrorRes? error;

  RequestRes({this.response, this.error});
}

class ErrorRes {
  String message;

  ErrorRes({required this.message});
}
