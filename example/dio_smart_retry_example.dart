import 'package:dio_smart_retry/dio_smart_retry.dart';
import 'package:dio/dio.dart';
import 'package:dio_smart_retry/src/http_status_codes.dart';

void main() async {
  final dio = Dio();

  // Add the interceptor
  dio.interceptors.add(RetryInterceptor(
    dio: dio,
    logPrint: print, // specify log function (optional)
    retries: 3, // retry count (optional)
    retryDelays: const [ // set delays between retries (optional)
      Duration(seconds: 1), // wait 1 sec before first retry
      Duration(seconds: 2), // wait 2 sec before second retry
      Duration(seconds: 3), // wait 3 sec before third retry
    ],
  ));

  /// Sending a failing request for 3 times with a 1s, then 2s, then 3s interval
  await dio.get('https://mock.codes/$status500InternalServerError');
}
