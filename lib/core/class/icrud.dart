import 'package:car_rent/core/class/states_request.dart';
import 'package:dartz/dartz.dart';

abstract class IHttpGet {
  Future<Either<StatusRequest, dynamic>> getData(String url);
}

abstract class IHttpPost {
  Future<Either<StatusRequest, dynamic>> postData(
    String url,
    Map<String, dynamic> body,
  );
}

abstract class ICrud extends IHttpGet implements IHttpPost {}
