import 'package:get/get.dart';
import 'dart:convert' show json;
import 'package:http/http.dart' as http;
import 'package:meep/models/home_model.dart';
import 'package:meep/models/user_model.dart';
import 'package:meep/utils/login_controller.dart';
import 'package:riverpod/riverpod.dart';

import '../models/agenda_model.dart';

class ApiServicesProfile {
  // LoginController controller = LoginController();
  final controller = Get.put(LoginController());
  String endpoint = 'https://meep-nine.vercel.app/profile';
  Future<User> getInfo() async {
    Map<String, Map> json1 = {
      'token': {
        'displayName': controller.googleAccount.value?.displayName,
        'photoUrl': controller.googleAccount.value?.photoUrl,
        'id': controller.googleAccount.value?.id,
        'email': controller.googleAccount.value?.email,
        'serverAuthCode': controller.googleAccount.value?.serverAuthCode,
      }
    };
    print(json1);

    final response = await http.post(
      Uri.parse(endpoint),
      body: json.encode(json1),
      headers: {"Content-Type": "application/json"},
    );
    print("hereeee");
    print(response.body);
    print("kidhar");
    if (response.statusCode == 200) {
      final profile = json.decode(response.body);
      print(profile);
      final mapping = User.fromJson(profile);
      print(mapping);
      return mapping;
    } else {
      throw Exception(response.reasonPhrase);
    }
  }
}

final userProvider =
    Provider<ApiServicesProfile>((ref) => ApiServicesProfile());

class ApiServicesHome {
  final controller = Get.put(LoginController());
  String endpoint = 'https://meep-nine.vercel.app/home';
  Future<HomePage> getInfo() async {
    Map<String, Map> json1 = {
      'token': {
        'displayName': controller.googleAccount.value?.displayName,
        'photoUrl': controller.googleAccount.value?.photoUrl,
        'id': controller.googleAccount.value?.id,
        'email': controller.googleAccount.value?.email,
        'serverAuthCode': controller.googleAccount.value?.serverAuthCode,
      }
    };

    final response = await http.post(
      Uri.parse(endpoint),
      body: json.encode(json1),
      headers: {"Content-Type": "application/json"},
    );
    if (response.statusCode == 200) {
      final profile = json.decode(response.body);
      final mapping = HomePage.fromJson(profile);
      return mapping;
    } else {
      throw Exception(response.reasonPhrase);
    }
  }
}

final homeProvider = Provider<ApiServicesHome>((ref) => ApiServicesHome());

class ApiServicesAgenda {
  final meetId;
  final controller = Get.put(LoginController());

  ApiServicesAgenda({required this.meetId});
  Future<AgendaModel> getInfo() async {
    Map<String, Map> json1 = {
      'token': {
        'displayName': controller.googleAccount.value?.displayName,
        'photoUrl': controller.googleAccount.value?.photoUrl,
        'id': controller.googleAccount.value?.id,
        'email': controller.googleAccount.value?.email,
        'serverAuthCode': controller.googleAccount.value?.serverAuthCode,
      }
    };

    String endpoint = 'https://meep-nine.vercel.app/agendas/details/${meetId}';

    final response = await http.post(
      Uri.parse(endpoint),
      body: json.encode(json1),
      headers: {"Content-Type": "application/json"},
    );
    if (response.statusCode == 200) {
      final profile = json.decode(response.body);
      final mapping = AgendaModel.fromJson(profile);
      return mapping;
    } else {
      throw Exception(response.reasonPhrase);
    }
  }
}

final agendaProvider =
    Provider.family<ApiServicesAgenda,dynamic>((ref,id) => ApiServicesAgenda(meetId:id));
