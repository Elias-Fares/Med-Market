class CustomResponse {
  int _statusCode;
  bool _success;
  List<String>? _msg;
  dynamic _object;


  CustomResponse(this._statusCode, this._object,this._msg,this._success);

  dynamic get object => _object;

  set object(dynamic value) {
    _object = value;
  }

  bool get success => _success;

  set success(bool value) {
    _success = value;
  }

  int get statusCode => _statusCode;

  set statusCode(int value) {
    _statusCode = value;
  }

  List<String> get msg => _msg??[''];

  set msg(List<String> value) {
    _msg = value;
  }
}