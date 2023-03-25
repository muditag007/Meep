// ignore_for_file: non_constant_identifier_names, depend_on_referenced_packages, unused_import, unused_local_variable

import 'package:meep/models/user.dart';
import "package:http/http.dart" as http;

class ApiServices {
  static String base_url = "https://meep-nine.vercel.app/";

  void getInfo(HomePage user) {
    Uri requestUri = Uri.parse(base_url);
    http.post(requestUri, body: user.image);
  }
}
