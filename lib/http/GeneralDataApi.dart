

import 'ErrorData.dart';

class GeneralDataApi<T>{

  T? data;
  ErrorData? error;
  int? status;
  String? success;
  String? message;

  GeneralDataApi.fromJson({required Map<String, dynamic> map, required Function(Map<String, dynamic> map) renderData}){
    data = map["data"]   != null? renderData(map["data"])          :null;
    error = map["error"] != null? ErrorData.fromJson(map["error"]) :null;
    success = map["success"] != null? map["success"]:null;
    message = map["message"] != null? map["message"] :null;
    status = map["status"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['data'] = data;
    data['success'] = success;
    data['message'] = message;
    data['error'] = error;
    return data;
  }

}
