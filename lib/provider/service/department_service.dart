import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:neversitup_app/config/baseApi/base_api.dart';
import 'package:neversitup_app/model/department_carousel.dart';
import 'package:neversitup_app/model/department_product.dart';
import 'package:riverpod/riverpod.dart';

final streamRepositoryProvider =
    StreamProvider<List<DepartmentCarousel>>((ref) {
  return StreamRepositoryProvider().getAllDepartment();
});

class StreamRepositoryProvider {
  Stream<List<DepartmentCarousel>> getAllDepartment() async* {
    try {
      String userUrl = "${BaseApi.baseUrl}departments";
      Map<String, String> headers = {
        'Content-Type': 'application/json',
      };

      final response = await Dio().get(
        userUrl,
        options: Options(
          headers: headers,
          followRedirects: false,
          validateStatus: (int? status) {
            // print("StatusCode $status");
            return status != null;
            // return status != null && status >= 200 && status < 300;
          },
        ),
      );

      // print('Body 1 ${response.data}');

      if (response.statusCode == 200) {
        print("Response Department => ${response.data}");
        final dataFromJson =
            departmentCarouselFromJson(json.encode(response.data));
        yield dataFromJson;
      }
    } catch (e) {
      print("Error Log => $e");
      rethrow;
    }
  }
}

final futureRepositoryProvider =
    FutureProvider.family<List<DepartmentProduct>, String>((ref, filter) async {
  return FutureRepositoryProvider().getAllDepartmentProduct(filter);
});

class FutureRepositoryProvider {
  Future<List<DepartmentProduct>> getAllDepartmentProduct(
      String departmentId) async {
    try {
      String userUrl = "${BaseApi.baseUrl}departments/${departmentId}/products";
      Map<String, String> headers = {
        'Content-Type': 'application/json',
      };

      final response = await Dio().get(
        userUrl,
        options: Options(
          headers: headers,
          followRedirects: false,
          validateStatus: (int? status) {
            // print("StatusCode $status");
            return status != null;
            // return status != null && status >= 200 && status < 300;
          },
        ),
      );

      // print('Body 1 ${response.data}');

      if (response.statusCode == 200) {
        print("Response Department Product => ${response.data}");
        final dataFromJson =
            departmentProductFromJson(json.encode(response.data));
        return dataFromJson;
      } else {
        return [];
      }
    } catch (e) {
      rethrow;
    }
  }
}
