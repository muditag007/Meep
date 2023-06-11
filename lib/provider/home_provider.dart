import 'package:meep/models/home_model.dart';
import 'package:meep/services/services.dart';
import 'package:riverpod/riverpod.dart';

final homeDataProvider = FutureProvider<HomePage>((ref) async {
  return ref.watch(homeProvider).getInfo();
});

// final homeDataProvider=StreamProvider<Future<HomePage>>((ref) async* {
//   final socket = await Socket.connect('my-api', 4242);
//   ref.onDispose(socket.close);

//   yield ref.watch(homeProvider).getInfo();
// });

// final homeDataProvider1 = StreamProvider<HomePage>((ref) async* {
//   yield* Stream.periodic(Duration(milliseconds: 100), (_) {
//     return ref.watch(homeProvider).getInfo();
//   });
// });
