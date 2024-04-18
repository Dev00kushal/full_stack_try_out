import 'package:blog_application/data/response/status.dart';

class ApiResponse<T> {
  Status? status;
  T? data;
  String? message;

  ApiResponse(this.status, this.data, this.message);

// await garda data loading huncha
  ApiResponse.loading() : status = Status.loading;

// sucess huda sucess huncha
  ApiResponse.completed() : status = Status.success;

// error auda cheii status error hune vayo
  ApiResponse.error() : status = Status.error;

// yesle ta just print garxa
  @override
  String toString() {
    return "Status : $status \n Message : $message \n Data : $data";
  }
}
