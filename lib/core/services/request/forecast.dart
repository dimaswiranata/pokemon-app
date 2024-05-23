import 'package:nexus_app/core/index.dart';

class ForecastRequest {
  String path = '/forecast.json';

  Future<dynamic> getForecast({Map<String, dynamic>? urlParams}) async {
    String parsedParams = Common.parseUrlParams(urlParams);
    String fullPath = path + parsedParams;
    Map<String, dynamic>? response;
    await APIServices().fetchData(fullPath).then((res) {
      if (res.statusCode == 200) {
        response = res.data;
      } else {
        throw Exception('Failed to load product');
      }
    });
    return response;
  }
}
