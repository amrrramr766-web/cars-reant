import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:car_rent/core/class/states_request.dart';
import 'package:car_rent/core/functions/check_internet.dart';
import 'package:car_rent/core/class/icrud.dart';
import 'dio_factory.dart';

class Crud implements IHttpGet, IHttpPost {
  final Dio _dio = DioFactory.create();

  @override
  Future<Either<StatusRequest, dynamic>> postData(
    String linkurl,
    Map<String, dynamic>? data, {
    Map<String, dynamic>? queryParameters,
  }) async {
    if (!await checkInternet()) {
      return const Left(StatusRequest.offlinefailure);
    }

    try {
      final response = await _dio.post(
        linkurl,
        data: data,
        queryParameters: queryParameters,
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        return Right(response.data);
      }

      return const Left(StatusRequest.serverfailure);
    } on DioException catch (e) {
      return Left(_mapDioErrorToStatus(e));
    } catch (_) {
      return const Left(StatusRequest.serverfailure);
    }
  }

  @override
  Future<Either<StatusRequest, dynamic>> getData(String linkurl) async {
    if (!await checkInternet()) {
      return const Left(StatusRequest.offlinefailure);
    }

    try {
      final response = await _dio.get(linkurl);

      if (response.statusCode == 200) {
        return Right(response.data);
      }

      return const Left(StatusRequest.serverfailure);
    } on DioException catch (e) {
      return Left(_mapDioErrorToStatus(e));
    } catch (_) {
      return const Left(StatusRequest.serverfailure);
    }
  }

  StatusRequest _mapDioErrorToStatus(DioException e) {
    switch (e.type) {
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.sendTimeout:
      case DioExceptionType.receiveTimeout:
        return StatusRequest.timeout;

      case DioExceptionType.badResponse:
        switch (e.response?.statusCode) {
          case 401:
            return StatusRequest.unauthorized;
          case 404:
            return StatusRequest.notfound;
          default:
            return StatusRequest.serverfailure;
        }

      case DioExceptionType.connectionError:
        return StatusRequest.offlinefailure;

      default:
        return StatusRequest.serverfailure;
    }
  }
}
