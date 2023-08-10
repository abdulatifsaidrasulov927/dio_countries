// import 'package:dio/dio.dart';
// import 'package:dio_countries/data/model/data_model.dart';

// class DioClient {
//   final Dio _dio = Dio();
//   //https://easyenglishuzb.free.mockoapp.net/countries

//   Future<DataModel?> getUser({required String id}) async {
//     DataModel? user;
//     try {
//       Response userData =
//           await _dio.get('https://easyenglishuzb.free.mockoapp.net/countries');
//       print('User Info: ${userData.data}');
//       user = DataModel.fromJson(userData.data);
//     } on DioError catch (e) {
//       if (e.response != null) {
//         print('Dio error!');
//         print('STATUS: ${e.response?.statusCode}');
//         print('DATA: ${e.response?.data}');
//         print('HEADERS: ${e.response?.headers}');
//       } else {
//         print('Error sending request!');
//         print(e.message);
//       }
//     }
//     return user;
//   }
// }

// import 'dart:io';

// import 'package:dio/dio.dart';

// class MyRepository {
//   Future<List<CountriesModel>> getDynamicFields() async {
//     var dio = Dio();
//     try {
//       Response response =
//           await dio.get("https://dynamic-view-api.free.mockoapp.net/views");

//       if (response.statusCode == HttpStatus.ok) {
//         print(response.data);
//         return (response.data["dynamic_views"] as List?)
//                 ?.map((e) => CountriesModel.fromJson(e))
//                 .toList() ??
//             [];
//       }
//       return [];
//     } catch (error) {
//       print(error);
//       throw MyCustomFieldsError(errorText: error.toString());
//     }
//   }
// }

// class MyCustomFieldsError implements Exception {
//   final String errorText;
//   MyCustomFieldsError({required this.errorText});
// }
// import 'dart:io';

// import 'package:dio/dio.dart';
// import 'package:dio_countries/data/model/countries_model.dart';

// class MyRepository {
//   Future<List<CountriesModel>> getDynamicFields() async {
//     var dio = Dio();
//     try {
//       Response response =
//           await dio.get("https://easyenglishuzb.free.mockoapp.net/countries");

//       if (response.statusCode == HttpStatus.ok) {
//         print(response.data);
//         return (response.data["countries"] as List?)
//                 ?.map((e) => CountriesModel.fromJson(e))
//                 .toList() ??
//             [];
//       }
//       return [];
//     } catch (error) {
//       print(error);
//       throw MyCustomFieldsError(errorText: error.toString());
//     }
//   }
// }

// class MyCustomFieldsError implements Exception {
//   final String errorText;
//   MyCustomFieldsError({required this.errorText});
// }
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:dio_countries/data/universal_data.dart';

class MyRepository {
  Future<UniversalData> getDynamicFields() async {
    var dio = Dio();
    try {
      Response response =
          await dio.get("https://easyenglishuzb.free.mockoapp.net/countries");
      if (response.statusCode == HttpStatus.ok) {
        print(response.data);
        return UniversalData(data: response.data, error: '');
      }
      return UniversalData(data: response.data, error: '');
    } catch (error) {
      print('kirdi');
      print(error);
      throw MyCustomFieldsError(errorText: error.toString());
    }
  }

  // Future<UniversalResponse> addProduct(CountriesModel countriesModel) async {
  //   Uri url = Uri.parse('$baseUrl/products');
  //   try {
  //     final response = await http.post(
  //       url,
  //       body: jsonEncode(countriesModel.toJson()),
  //     );
  //     if (response.statusCode == 200) {
  //       return UniversalResponse(
  //         data: CountriesModel.fromJson(jsonDecode(response.body)),
  //       );
  //     }
  //     return UniversalResponse(error: 'Error: Status code not equal to 200');
  //   } catch (e) {
  //     return UniversalResponse(error: e.toString());
  //   }
  // }
}

class MyCustomFieldsError implements Exception {
  final String errorText;
  MyCustomFieldsError({required this.errorText});
}
