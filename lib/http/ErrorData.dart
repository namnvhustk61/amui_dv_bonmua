
class ErrorData{

  int? status;
  String? timestamp;
  String? message;
  String? error;
  String? path;

  ErrorData.fromJson(Map<String, dynamic> map){
    status = map["status"];
    timestamp = map["timestamp"];
    message = map["message"];
    error = map["error"];
    path = map["path"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = status;
    data['timestamp'] = timestamp;
    data['message'] = message;
    data['error'] = error;
    data['path'] = path;
    return data;
  }

}
