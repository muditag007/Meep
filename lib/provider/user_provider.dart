import 'package:meep/models/user_model.dart';
import 'package:meep/services/services.dart';
import 'package:riverpod/riverpod.dart';

final userDataProvider = FutureProvider<User>((ref) async {
  return ref.watch(userProvider).getInfo();
});
