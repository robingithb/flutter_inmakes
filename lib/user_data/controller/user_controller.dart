import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:my_first_app/user_data/model/user.dart';

class UserController extends GetxController {
  var isLoading = true.obs;
  var users = <User>[].obs;

  @override
  void onInit() {
    super.onInit();
    fetchData();
  }

  void fetchData() async {
    try {
      isLoading(true);
      var response = await http
          .get(Uri.parse("https://jsonplaceholder.typicode.com/users"));
      if (response.statusCode == 200) {
        var data = json.decode(response.body) as List;
        users.value = data
            .map((e) => User(id: e['id'], name: e['name'], email: e['email']))
            .toList();
      } else {
        throw Exception("failed to load users");
      }
    } finally {
      isLoading(false);
    }
  }
}
