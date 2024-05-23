import 'package:nexus_app/core/index.dart';

class ProductRequest {
  String path = 'products';

  Future<dynamic> getProduct({Map<String, dynamic>? urlParams}) async {
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

  Future<dynamic> searchProduct({Map<String, dynamic>? urlParams}) async {
    String parsedParams = Common.parseUrlParams(urlParams);
    String fullPath = '$path/search$parsedParams';
    Map<String, dynamic>? response;
    await APIServices().fetchData(fullPath).then((res) {
      if (res.statusCode == 200) {
        response = res.data;
      } else {
        throw Exception('Failed to search product');
      }
    });
    return response;
  }

  Future<dynamic> getProductDets({int? id}) async {
    String fullPath = '$path/$id';
    Map<String, dynamic>? response;
    await APIServices().fetchData(fullPath).then((res) {
      if (res.statusCode == 200) {
        response = res.data;
      } else {
        throw Exception('Failed to load product detail');
      }
    });
    return response;
  }

  Future<dynamic> addProduct({Map<String, dynamic>? body}) async {
    String fullPath = '$path/add';
    Map<String, dynamic>? response;
    await APIServices().postData(fullPath, body: body).then((res) {
      if (res.statusCode == 200) {
        response = res.data;
      } else {
        throw Exception('Failed to add this product');
      }
    });
    return response;
  }
}
