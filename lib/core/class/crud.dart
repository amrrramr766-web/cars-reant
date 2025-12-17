import 'dart:convert';
import 'dart:io';
import 'package:car_rent/core/class/icrud.dart';
import 'package:car_rent/core/class/states_request.dart';
import 'package:car_rent/core/functions/check_internet.dart';
import 'package:dartz/dartz.dart';
import 'package:http/io_client.dart';

class Crud implements IHttpGet, IHttpPost {
  @override
  Future<Either<StatusRequest, dynamic>> postData(
    String linkurl,
    Map<String, dynamic> data,
  ) async {
    if (await checkInternet()) {
      try {
        print('📤 [Crud] Sending POST request to: $linkurl');
        print('📦 [Crud] Request body: ${jsonEncode(data)}');

        HttpClient httpClient = HttpClient()
          ..badCertificateCallback =
              (X509Certificate cert, String host, int port) => true;
        IOClient ioClient = IOClient(httpClient);

        var response = await ioClient.post(
          Uri.parse(linkurl),
          headers: {'Content-Type': 'application/json'},
          body: jsonEncode(data),
        );

        print('📥 [Crud] Response status: ${response.statusCode}');
        print('📥 [Crud] Response body: ${response.body}');

        if (response.statusCode == 200 || response.statusCode == 201) {
          return Right(jsonDecode(response.body));
        } else {
          print('❌ [Crud] Server returned error: ${response.statusCode}');
          return const Left(StatusRequest.serverfailure);
        }
      } catch (e) {
        print("💥 [Crud] Exception in postData: $e");
        return const Left(StatusRequest.serverfailure);
      }
    } else {
      print("📵 [Crud] No internet connection");
      return const Left(StatusRequest.offlinefailure);
    }
  }

  @override
  Future<Either<StatusRequest, dynamic>> getData(String linkurl) async {
    if (await checkInternet()) {
      try {
        HttpClient httpClient = HttpClient()
          ..badCertificateCallback =
              (X509Certificate cert, String host, int port) => true;

        IOClient ioClient = IOClient(httpClient);

        var uri = Uri.parse(linkurl);
        var response = await ioClient.get(
          uri,
          headers: {'Content-Type': 'application/json'},
        );

        if (response.statusCode == 200 || response.statusCode == 201) {
          final responsebody = jsonDecode(response.body);
          return Right(responsebody);
        } else {
          return const Left(StatusRequest.serverfailure);
        }
      } catch (e) {
        print("💥 [Crud] Exception in getData: $e");
        return const Left(StatusRequest.serverfailure);
      }
    } else {
      return const Left(StatusRequest.offlinefailure);
    }
  }
}
