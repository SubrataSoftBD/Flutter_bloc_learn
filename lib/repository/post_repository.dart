import 'dart:io';

import 'package:flutter_bloc_tutorial/model/data_list_model.dart';
import 'package:http/http.dart' as http;

class PostRepository {
  Future<List<DataListModel>> fetchData() async {
    try {
      final response = await http.get(
        Uri.parse('https://fakestoreapi.com/products'),
      );
      print("Status Code: ${response.statusCode}");

      if (response.statusCode == 200) {
        // ✅ এখন এখানে লিস্ট আসবে
        final List<DataListModel> body = dataListModelFromJson(response.body);

        print("Total Products: ${body.length}");
        return body;
      } else {
        throw Exception("Failed to fetch data. Code: ${response.statusCode}");
      }
    } on SocketException {
      throw Exception('No Internet Connection');
    } catch (e) {
      throw Exception("Something went wrong: $e");
    }
  }
}

// class PostRepository {
//   Future<List<DataListModel>> fetchData() async {
//     try {
//       final response = await http.get(
//         Uri.parse('https://jsonplaceholder.typicode.com/comments'),
//       );
//       print(response.statusCode);
//       if (response.statusCode == 200) {
//         final body = dataListModelFromJson(response.toString());
//         print(body);
//         return [];
//       }
//     } on SocketException {
//       throw Exception('Error while fetching data');
//     }
//     throw Exception('Something went wrong');
//   }
// }
