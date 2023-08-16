// import 'package:pagination/dynamic/network.dart';
// import 'package:pagination/model/character_summary.dart';


// class DynamicRepository {
//
//   @override
//   Future<List<CharacterSummary>> fetchList(int pageKey, int pageSize) async {
//     var dio = DioUtil.getInstance();
//     final String apiUrl = ('https://www.breakingbadapi.com/api/' + 'characters/');
//
//     final response = await dio?.get(apiUrl);
//     print(response?.data);
//     if (response?.statusCode == 200) {
//       // var list = (response?.data as List).map((x) => MyModel.fromJson(x)).toList();
//       return (response?.data as List)
//           .map((x) => CharacterSummary.fromJson(x))
//           .toList();
//
//
//     } else {
//       throw Exception("Failed to Load Data");
//     }
//   }
// }
