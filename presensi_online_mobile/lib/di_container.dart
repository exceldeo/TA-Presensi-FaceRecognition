import 'package:data_connection_checker/data_connection_checker.dart';
import 'package:dio/dio.dart';
import 'package:presensi_online_mobile/data/datasource/remote/dio/dio_client.dart';
import 'package:presensi_online_mobile/data/datasource/remote/dio/logging_interceptor.dart';
import 'package:presensi_online_mobile/data/repository/user_repo.dart';
import 'package:presensi_online_mobile/helper/network_info.dart';
import 'package:presensi_online_mobile/provider/user_provider.dart';
import 'package:presensi_online_mobile/utility/app_constants.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

final sl = GetIt.instance;

Future<void> init() async {
  // Core
  sl.registerLazySingleton(() => NetworkInfo(sl()));
  sl.registerLazySingleton(
      () => DioClient(AppConstants.BASE_URL, sl(), loggingInterceptor: sl()));

  // Repository
  sl.registerLazySingleton(() => UserRepo());

  // Provider
  sl.registerFactory(() => UserProvider(userRepo: sl()));

  // External
  final sharedPreferences = await SharedPreferences.getInstance();
  sl.registerLazySingleton(() => sharedPreferences);
  sl.registerLazySingleton(() => Dio());
  sl.registerLazySingleton(() => LoggingInterceptor());
  sl.registerLazySingleton(() => DataConnectionChecker());
}
