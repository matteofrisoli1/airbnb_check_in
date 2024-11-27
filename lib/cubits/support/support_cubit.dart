import 'package:hydrated_bloc/hydrated_bloc.dart';

class SupportCubit extends HydratedCubit<List<String>> {
  static const _messageKey = 'messages';

  SupportCubit() : super([]);

  @override
  List<String>? fromJson(Map<String, dynamic> json) {
    return json[_messageKey];
  }

  @override
  Map<String, dynamic>? toJson(List<String> state) {
    return {_messageKey: state};
  }

  void sendMessage(String message) {
    final newState = [...state, message];
    emit(newState);
  }
}
