import 'package:dio/dio.dart';
import 'package:nexus_app/core/index.dart';

class PokemonRequest {
  String path = '/pokemon';
  String eggGroupPath = '/egg-group';
  String genderPath = '/gender';
  String typePath = '/type';

  Future<dynamic> getPokemon({Map<String, dynamic>? urlParams, String urlPath = ''}) async {
    String parsedParams = Common.parseUrlParams(urlParams);
    String fullPath = path + urlPath + parsedParams;
    Map<String, dynamic>? response;

    try {
      final res = await APIServices().fetchData(fullPath);

      response = res.data;
    } on DioException catch (e) {
      print('Dio error: $e');
      return {};
    } catch (e) {
      return {};
    }

    return response;
  }

  Future<dynamic> getPokemonEggGroup({Map<String, dynamic>? urlParams, String urlPath = ''}) async {
    String parsedParams = Common.parseUrlParams(urlParams);
    String fullPath = eggGroupPath + urlPath + parsedParams;
    Map<String, dynamic>? response;
    try {
      final res = await APIServices().fetchData(fullPath);

      response = res.data;
    } on DioException catch (e) {
      print('Dio error: $e');
      return {};
    } catch (e) {
      return {};
    }
    return response;
  }

  Future<dynamic> getPokemonGender({Map<String, dynamic>? urlParams, String urlPath = ''}) async {
    String parsedParams = Common.parseUrlParams(urlParams);
    String fullPath = genderPath + urlPath + parsedParams;
    Map<String, dynamic>? response;
    try {
      final res = await APIServices().fetchData(fullPath);

      response = res.data;
    } on DioException catch (e) {
      print('Dio error: $e');
      return {};
    } catch (e) {
      return {};
    }
    return response;
  }

  Future<dynamic> getPokemonType({Map<String, dynamic>? urlParams, String urlPath = ''}) async {
    String parsedParams = Common.parseUrlParams(urlParams);
    String fullPath = typePath + urlPath + parsedParams;
    Map<String, dynamic>? response;
    try {
      final res = await APIServices().fetchData(fullPath);

      response = res.data;
    } on DioException catch (e) {
      print('Dio error: $e');
      return {};
    } catch (e) {
      return {};
    }
    return response;
  }
}
