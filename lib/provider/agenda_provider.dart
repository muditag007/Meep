import 'package:meep/models/agenda_model.dart';
import 'package:meep/models/user_model.dart';
import 'package:meep/services/services.dart';
import 'package:riverpod/riverpod.dart';

final agendaDataProvider = FutureProvider.family<AgendaModel,dynamic>((ref,id) async {
  return ref.watch(agendaProvider(id)).getInfo();
});
