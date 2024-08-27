import 'package:awesome_dio_interceptor/awesome_dio_interceptor.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:location/location.dart';
import 'package:shared_preferences/shared_preferences.dart';

@module
abstract class CoreModule {
  Dio dio() {
    final dio = Dio()..interceptors.add(AwesomeDioInterceptor());
    return dio;
  }

  Future<SharedPreferences> preferences() {
    return SharedPreferences.getInstance();
  }

  Future<Location> location() async {
    final location = Location();
    // Perform any asynchronous setup or initialization if needed
    return location;
  }
}
